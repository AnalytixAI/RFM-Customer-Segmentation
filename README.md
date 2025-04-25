# 📊 RFM-Customer-Segmentation

![Status](https://img.shields.io/badge/status-completed-brightgreen)
![Power BI](https://img.shields.io/badge/tool-Power%20BI-yellow)
![SQL](https://img.shields.io/badge/SQL-Window%20Functions-blue)
![License](https://img.shields.io/github/license/your-username/RFM-Customer-Segmentation)

## 🧠 Project Overview

This project implements **RFM (Recency, Frequency, Monetary) Customer Segmentation** using **SQL and Power BI**, designed for advanced analytics and business decision-making. The dataset used is the **Global Superstore** dataset from Kaggle.

The objective is to classify customers into segments such as *Platinum, Gold, Silver,* and *Bronze* based on purchasing behavior to enhance **targeted marketing, retention strategies, and profitability analysis**.

---

## 🎯 Objectives

- Calculate **Recency, Frequency, and Monetary** metrics using SQL
- Apply **dynamic scoring** using advanced SQL window functions (`NTILE`)
- Generate **segmentation labels** using CASE logic
- Visualize customer segments using **interactive Power BI dashboards**
- Align analysis with **MBA-level business strategy use cases**

---

## 🧰 Tools & Technologies

| Tool        | Purpose                               |
|-------------|----------------------------------------|
| SQL Server  | RFM metric computation & segmentation |
| Power BI    | Dashboard design and visual storytelling |
| Kaggle      | Global Superstore dataset source       |

---

## 📁 Folder Structure

RFM-Customer-Segmentation/ │ ├── PowerBI/ # Power BI .pbix file ├── SQL/ # SQL script for dynamic RFM logic ├── Report/ # Academic report (PDF) ├── Images/ # Screenshots of dashboard ├── README.md # Project documentation └── LICENSE # Open-source license (MIT)

---

## 🧮 Methodology

### 1. **RFM Calculation (via SQL)**
- **Recency**: Days since last purchase per customer
- **Frequency**: Number of unique purchases
- **Monetary**: Total spending

### 2. **Scoring Mechanism**
- Used `NTILE(5)` to assign dynamic percentiles for R, F, M
- Lower recency = better score, higher frequency/monetary = better

### 3. **Customer Segmentation**
- Created 3-digit RFM segment codes
- Mapped segment codes to 4 tiers:
  - `Platinum`: Top RFM scores
  - `Gold`: Above average
  - `Silver`: Mid-tier customers
  - `Bronze`: Low value or inactive customers

---

## 📊 Key Visualizations

- RFM Distribution by Segment
- R vs M scatter plot (colored by segment)
- Segment-wise Revenue Contribution
- Top Customers by Frequency & Sales

*(See screenshots in `/Images` or explore `.pbix` file in `/PowerBI`)*

---

## 📈 Business Impact

This segmentation enables:
- Data-driven **target marketing**
- Better **resource allocation** in CRM
- Enhanced **customer lifetime value (CLV)** strategies
- Strategic focus on **retention vs acquisition**

---

## 📚 Academic Context

- Applied SQL for analytics
- Behavioral segmentation
- Business intelligence (BI) tools
- Data-driven decision making

---

## 📥 Dataset

- **Source**: [Global Superstore - Kaggle](https://www.kaggle.com/datasets/fatihilhan/global-superstore-dataset)
- Format: `.csv`, converted and cleaned into SQL Server

---

## 📜 License

This project is licensed under the MIT License. See [`LICENSE`](./LICENSE) for more details.
