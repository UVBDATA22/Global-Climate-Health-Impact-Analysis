### 🌍 Climate & Health Data Analysis Project

---

### 🚀 Project Overview

This project explores the impact of climate change on human health using real-world data.  

It combines SQL, Python, and Power BI to uncover patterns like:

- **🌡️ Rising temperatures** → Heat-related illnesses  
- **🌫️ Air pollution** → Respiratory diseases  
- **🌪️ Extreme weather** → Disease risks   
- **💰 Economic inequality** → Healthcare access  

---

### 📂 Project Structure

  📦 Climate-Health-Analysis
   ┣ 📊 Climate_and_Health_Analysis.pbix
   ┣ 🐍 Climate_and_Health.ipynb
   ┣ 🧾 Climate_and_Health.sql
   ┣ 📁 Climate_and_Health_Clean_File.csv
   ┣ 📁 Row_Climate_and_Health.csv
   ┗ 📄 README.md
   

---

### 🛠️ Tools & Technologies Used

- **SQL (PostgreSQL)** – Data analysis & querying  
- **Python (Pandas, Matplotlib/Seaborn)** – Data cleaning & exploration  
- **Power BI** – Data visualization & dashboard creation  
- **Excel/CSV** – Data storage  

---

### 🔍 Key Analysis & Queries

The SQL analysis includes:

- Region-wise heat-related illnesses  
- Respiratory disease trends  
- Top affected countries  
- Impact of PM2.5 on health  
- Extreme weather vs disease risk  
- Economic inequality & healthcare access  

**Example query:**

```sql
SELECT
    region,
    ROUND(SUM(heat_related_illnesses)::numeric, 2) AS total_heat_illnesses
FROM climate
GROUP BY region
ORDER BY total_heat_illnesses DESC;
```
---

### 📊 Key Insights
**🌡️ Temperature vs Health**
Increase in temperature directly increases heat-related illnesses
**🌫️ Pollution Impact**
High PM2.5 levels = High respiratory disease rates
**🌪️ Extreme Weather**
Strong correlation with vector-borne disease risk
**💰 Economic Factors**
Low-income countries suffer more due to:
Poor healthcare access
Higher vulnerability

---

### 📈 Power BI Dashboard Features
Interactive filters by region, country, year
Visual comparison of:
Temperature vs illnesses
Pollution vs respiratory diseases
Economic status vs healthcare access
KPI cards for quick insights

---

### 🚀 How to Run This Project
1️⃣ SQL Analysis
Import dataset into PostgreSQL
Run queries from Climate_and_Health.sql
2️⃣ Python Notebook
Open Climate_and_Health.ipynb
Run all cells for data cleaning & EDA
3️⃣ Power BI
Open .pbix file
Refresh dataset if needed

---

### 📌 Business Use Cases
Public health policy planning
Climate risk assessment
Healthcare resource allocation
Environmental impact analysis

---

### 📚 Learning Outcomes
Advanced SQL (CTE, Window Functions, Aggregations)
Data storytelling with Power BI
Real-world data analysis workflow
Connecting climate data with health outcomes

---

### 🤝 Contribution
Feel free to fork this repo, raise issues, or suggest improvements!
