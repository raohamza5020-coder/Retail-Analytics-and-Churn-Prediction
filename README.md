# 🛒 Retail Analytics & Customer Churn Prediction

An end-to-end Data Analytics and Data Science portfolio project demonstrating skills in **Python, SQL, Power BI, and Machine Learning**. Using the UCI Online Retail dataset, this project processes over 500,000 transaction records, extracts business insights, builds interactive dashboards, and predicts customer churn to improve retention.

---

## 📌 Project Overview

This project simulates the full workflow of a Data Analyst / Data Scientist in a real business environment:

1. **Data Cleaning & EDA (Python):** Handled missing values, negative quantities (returns), and cancellations to prepare a robust dataset.
2. **Business Analysis (SQL):** Wrote 10 production-quality SQL queries using Window Functions and CTEs to answer critical business questions.
3. **Visualization (Power BI):** Built a 3-page interactive dashboard with a Star Schema data model and DAX time-intelligence.
4. **Machine Learning (Python):** Built a Random Forest model to predict customer churn using RFM analysis, addressing data leakage to create a realistic baseline model.

---

## 📊 Dataset

- **Source:** [UCI Machine Learning Repository - Online Retail Dataset](https://archive.ics.uci.edu/ml/datasets/online+retail)
- **Description:** Transactions from a UK-based online retail store between 2010 and 2011.
- **Original Rows:** 541,909
- **Cleaned Rows:** 391,283 (27.8% removed due to missing IDs, cancellations, and duplicates)

---

## 🛠️ Technologies Used

- **Programming:** Python (Pandas, NumPy, Scikit-Learn, Matplotlib, Seaborn)
- **Database:** MySQL
- **Visualization:** Power BI, DAX
- **Version Control:** Git, GitHub

---

## 📂 Project Structure

```text
Retail-Analytics-and-Churn-Prediction/
│
├── data/
│   ├── raw_sales.csv                  # Original raw dataset
│   └── cleaned_sales.csv              # Cleaned dataset after preprocessing
│
├── python/
│   ├── 01_data_cleaning.ipynb         # Data cleaning & EDA notebook
│   ├── 02_churn_model.ipynb           # Machine learning churn model
│   ├── revenue_by_country.png         # EDA visualization
│   ├── monthly_trend.png              # EDA visualization
│   ├── top_products.png               # EDA visualization
│   └── churn_feature_importance.png   # ML feature importance chart
│
├── sql/
│   └── business_queries.sql           # 10 SQL business queries
│
├── powerbi/
│   ├── Retail_Dashboard.pbix          # Interactive Power BI file


│   └── dashboard_screenshot.png       # Dashboard preview
│
└── README.md


 Key Insights (Python & SQL)
Geographic Concentration: The United Kingdom generates ~92% of total revenue (£7.24M). Interestingly, the Netherlands generates £283K from just 9 customers (B2B wholesale pattern).

Extreme Customer Value: The top customer has a lifetime value of £279,138 — 138× the average customer (£2,017). Retaining VIPs is critical.

Strong Seasonality: Revenue nearly triples from February (£442K) to November (£1.14M), indicating a massive Q4 holiday surge.

Pareto Principle in Action: Only 20% of customers (865) are loyal (6+ orders). Meanwhile, 35% (1,505) are one-time buyers, presenting a major re-engagement opportunity.


SQL Business Analysis
Located in sql/business_queries.sql. Contains 10 queries covering:

Revenue aggregation and Average Order Value (AOV).

Customer segmentation using CASE statements.

Monthly running totals using Window Functions (SUM() OVER()).

Top product per country using CTEs (WITH) and ROW_NUMBER().

Built a 3-page interactive dashboard modeling the data into a Star Schema (Fact and Dimension tables) with a dedicated Date table.

Pages:

Executive Summary — 4 KPI cards, monthly trend line chart, top 10 countries bar chart, year slicer.

Product Analysis — Top products by revenue (bar chart), by quantity (treemap), performance table.

Customer Analysis — KPI cards, customers by country, top customers matrix, country slicer.

Skills Demonstrated: Star Schema modeling, DAX (Time Intelligence, CALCULATE), interactive UI design.

Machine Learning (Churn Prediction)
Located in python/02_churn_model.ipynb.

Problem Type: Binary Classification

Algorithm: Random Forest Classifier

Features: Frequency and Monetary Value

Target Variable: Churn (defined as no purchase in the last 90 days)

Model Accuracy: 65.74%

🧠 Overcoming Data Leakage
During the initial modeling phase, the model achieved an unrealistic 100% accuracy. I diagnosed this as Data Leakage because the "Recency" feature was used to define the churn target variable.

By removing "Recency" from the feature set (X), I forced the model to predict churn based on historical buying behavior (Frequency and Monetary value). This resulted in a robust, realistic baseline accuracy of 65.74%, which can be safely deployed in a business environment without cheating.

 Author
[MUHAMMAD HAMZA NADEEM]
Data Analyst | Python, SQL, Power BI & Excel

📧 Email: [raohamza5020@gmail.com]

🔗 LinkedIn: [www.linkedin.com/in/raohamza-analytics]

💻 GitHub: github.com/raohamza5020-coder
