
---

## 🧾 Project Overview

This project focuses on building a complete data analysis pipeline using multiple tools.  
The workflow begins with **data cleaning in Excel and Power Query**, followed by **SQL-based data modeling and analytics**, and ends with a fully interactive **Power BI dashboard** for business insights.

The dashboard helps stakeholders understand revenue trends, customer value, product-level performance, and operational patterns—supporting data-driven decision-making.

---

## 🔧 Tools & Technologies

| Tool | Usage |
|------|--------|
| **Microsoft Excel** | Data cleaning, preprocessing, validations |
| **Power Query** | Transformations, missing value handling, data type corrections |
| **MySQL** | Relational modeling, joins, aggregates, analytical queries |
| **Power BI** | Dashboard development, slicers, KPIs, insights visualization |
| **DAX** | Measures for revenue, profit margin, calculated KPIs |
| **GitHub** | Version control & project hosting |

---

## 🔄 Workflow & Methodology

### **1. Data Cleaning (Excel + Power Query)**
- Removed duplicates and fixed missing values  
- Standardized date/time formats  
- Created profit categories (High, Medium, Low)  
- Cleaned customer names using region-based logic  
- Converted text/number fields for consistency  

### **2. SQL Data Modeling**
- Created database: `project1`  
- Defined **Primary Keys** and **Foreign Keys**  
- Built a relational model across Customers, Orders, and Products  

### **3. SQL Analytics**
Business questions answered:  
- What is overall revenue, profit, and order volume?  
- Which regions & categories perform best?  
- Monthly/Hourly revenue trends  
- Who are the top customers?  
- Which products have low profit margins?  

(Queries included below.)

### **4. Dashboard Development (Power BI)**
- KPIs: Revenue, Profit, Orders, Units Sold, Profit Margin  
- Revenue/Profit by Category  
- Revenue/Orders by Region  
- Time-Series (Month/Hour)  
- Customer segment insights  
- DAX-powered interactive filters  

### **5. Insights + Business Recommendations**
Based on SQL + Power BI findings (see below).

---

## 📚 Dataset Summary

The dataset consists of **5,000+ rows** across three tables:

### **Customers Table**
- CustomerID  
- CustomerName  
- Segment (Regular, Premium, Wholesale)  
- Region (North, South, East, West)

### **Orders Table**
- OrderID  
- CustomerID  
- ProductID  
- OrderDate (With hour)  
- Revenue  
- Profit  
- Quantity  
- Profit Category  

### **Products Table**
- ProductID  
- ProductName  
- Category (Electronics, Office, Furniture, etc.)  
- UnitPrice  
