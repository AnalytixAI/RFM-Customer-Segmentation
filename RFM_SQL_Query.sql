USE Projects;

SELECT TOP 10 * FROM GlobalOrders1;

SELECT COUNT(DISTINCT [Customer_ID]) AS Unique_Customers
FROM GlobalOrders1;

SELECT 
  SUM(CASE WHEN [Customer_ID] IS NULL THEN 1 ELSE 0 END) AS Null_CustomerID,
  SUM(CASE WHEN [Order_ID] IS NULL THEN 1 ELSE 0 END) AS Null_OrderID,
  SUM(CASE WHEN [Order_Date] IS NULL THEN 1 ELSE 0 END) AS Null_OrderDate,
  SUM(CASE WHEN Sales IS NULL OR Sales <= 0 THEN 1 ELSE 0 END) AS Invalid_Sales
FROM GlobalOrders1;

CREATE VIEW vw_CleanOrders AS
SELECT 
  Customer_ID AS CustomerID,
  Order_ID AS OrderID,
  CAST(Order_Date AS DATE) AS OrderDate,
  CAST(Sales AS DECIMAL(10,2)) AS Sales
FROM GlobalOrders1
WHERE 
  Customer_ID IS NOT NULL AND 
  Order_ID IS NOT NULL AND 
  Order_Date IS NOT NULL AND 
  Sales > 0;

SELECT MAX(OrderDate) AS LatestOrderDate FROM vw_CleanOrders;


--now, calculate R F M for each customers

WITH CustomerRFM AS (
    SELECT 
        CustomerID,
        DATEDIFF(DAY, MAX(OrderDate), '2017-12-30') AS Recency,  -- Recency: Days since last order
        COUNT(DISTINCT OrderID) AS Frequency,                    -- Frequency: Unique order count
        SUM(Sales) AS Monetary                                   -- Monetary: Total sales
    FROM vw_CleanOrders
    GROUP BY CustomerID
),

RFM_Scored AS (
    SELECT 
        CustomerID,
        Recency,
        Frequency,
        Monetary,
        NTILE(5) OVER (ORDER BY Recency ASC) AS R_Score,        -- Lower recency = better
        NTILE(5) OVER (ORDER BY Frequency DESC) AS F_Score,     -- Higher frequency = better
        NTILE(5) OVER (ORDER BY Monetary DESC) AS M_Score       -- Higher monetary = better
    FROM CustomerRFM
)
SELECT 
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    R_Score,
    F_Score,
    M_Score,
    CAST(R_Score AS VARCHAR) + CAST(F_Score AS VARCHAR) + CAST(M_Score AS VARCHAR) AS RFM_Segment,
    CASE 
        WHEN R_Score >= 4 AND F_Score >= 4 AND M_Score >= 4 THEN 'Platinum'
        WHEN R_Score >= 3 AND F_Score >= 3 AND M_Score >= 3 THEN 'Gold'
        WHEN R_Score >= 2 AND F_Score >= 2 AND M_Score >= 2 THEN 'Silver'
        ELSE 'Bronze'
    END AS Segment_Label
FROM RFM_Scored
ORDER BY RFM_Segment DESC;
