# Sales Performance Analysis Dashboard
## Project Overview
This project was built to address a common challenge faced by many operational businesses having large amounts of transactional sales data but very little structured insight into what the numbers actually mean for decision making.
The company generated significant sales activity across various industrial and rope related products, yet most performance monitoring relied on manual spreadsheet reviews, operational memory, and conversational discussions rather than structured reporting. As the number of transactions increased, answering simple business questions became increasingly difficult.
Questions such as:
Which products are actually driving the most revenue?
Which customers contribute the most business value?
Are high volume customers also the highest revenue customers?
How does sales performance change over time?
Is the business becoming overly dependent on a small number of products or customers?
became difficult to answer quickly using manual records alone.
To solve this problem, I built a multi page analytical dashboard using Excel, PostgreSQL, and Power BI to transform raw transactional sales records into a structured reporting system that supports clearer operational visibility and faster business insight.
An interesting aspect of this project was that the reporting needed to work for non technical stakeholders, many of whom preferred simplified explanations and conversational discussions rather than technical reporting language. Because of this, I focused heavily on clarity, usability, and storytelling, ensuring the dashboard could support real operational conversations rather than simply display complex visuals.
The final result was an interactive business intelligence dashboard designed to help the company monitor performance, understand customer behavior, and identify product driven revenue patterns more effectively.

# Business Problem
Despite generating over ₦265 million in recorded sales revenue, the business lacked a structured reporting system capable of turning operational data into actionable insights.
Sales records existed, but performance analysis often required manually reviewing multiple spreadsheets and transaction logs. This made it difficult to consistently monitor trends, understand revenue drivers, or identify customer contribution patterns.
Without a centralized reporting system, questions about product performance, customer value, and revenue concentration required time consuming manual reviews.
Another important consideration was that the dashboard needed to remain accessible for non technical stakeholders. The goal was not to build a highly complex reporting system, but rather to create a tool that made business performance easier to understand and discuss during everyday operational decision making.
This project focused on transforming raw sales data into a clear, structured, and interactive reporting system capable of improving performance monitoring and supporting more informed business decisions.


# Tools & Technologies
This project used a three stage analytics workflow where each tool played a specific role in transforming raw operational data into business insight.

## Excel – Data Cleaning & Preparation
Excel was used to inspect and clean the raw dataset before analysis. Because the original records were maintained for operational tracking rather than analytics, the dataset required careful preparation.
Tasks included:
Standardizing inconsistent product names
Resolving customer name variations
Cleaning quantity and pricing fields
Correcting date formatting issues
Reviewing missing or incomplete entries
Excel allowed for quick inspection of the data and manual validation of business context before moving into a more structured analytical environment.

## PostgreSQL – Data Querying & Transformation
After cleaning, the dataset was imported into PostgreSQL to create a more structured and reproducible analytical workflow.
SQL was used to:
Aggregate sales by product and customer
Calculate revenue contributions
Analyze quantity and pricing patterns
Generate structured reporting views for Power BI
Using SQL ensured that the analysis could be reproduced and validated using clear query logic rather than relying solely on spreadsheet calculations.

## Power BI – Dashboard Visualization
Power BI served as the final reporting layer where the insights were transformed into an interactive dashboard.
The dashboard was designed with three analytical sections:
Executive Overview
Product Analysis
Customer Analysis
Interactive elements such as slicers, KPI cards, trend charts, bar charts, treemaps, and scatter plots allowed users to explore sales performance and identify patterns more easily during operational discussions.

# Analytical Workflow
The analysis began with reviewing the raw operational records in Excel to understand how transactions, products, and customer purchases were documented. Cleaning the dataset required more than correcting formatting issues; it also required understanding the business context behind how the records were maintained.
Once the dataset was properly prepared, I moved the analysis into PostgreSQL to create a structured analytical workflow. SQL allowed me to organize the data into meaningful aggregations such as product performance, customer contribution, and revenue trends over time.
Rather than placing all insights on a single page, I structured the dashboard into focused analytical sections so each page could answer a specific category of business questions.
The design process itself was highly iterative. I continuously refined visual hierarchy, layout spacing, navigation flow, and chart selection to ensure the dashboard remained clear and easy to navigate. Instead of prioritizing complexity, I focused on choosing visuals that communicated insights naturally during business discussions.
Through this process, several important patterns began to emerge, particularly around product revenue concentration and differences between high volume and high value customer relationships.

# Dashboard Structure
The dashboard was organized into three analytical sections to support different levels of business insight.
## Executive Overview
This page provides a high level view of overall business performance, including:
Total sales revenue (₦265M+)
Monthly revenue trends
Product category contribution
Top customer performance
The goal of this page was to allow decision makers to quickly understand how the business was performing at a glance.

## Product Analysis
This section explores how individual products contribute to both sales activity and revenue generation.
The analysis revealed that products with the highest sales quantity were not always the strongest revenue drivers. This distinction helped highlight the difference between operational activity and financial impact across the product portfolio.

## Customer Analysis
The customer analysis page focuses on purchasing behavior and revenue contribution patterns.
One notable insight was that high purchase volume did not always correspond with the highest revenue contribution. For example, F.E Energy generated the highest quantity of sales transactions, while Peter Warri contributed the highest overall revenue.
This revealed meaningful differences between volume driven customers and value driven customers, which can influence how the business approaches customer relationships and sales strategy.

# Key Insights
Several important patterns emerged during the analysis.
First, revenue performance was heavily concentrated around rope related product categories. These products consistently dominated overall sales contribution throughout the reporting period, highlighting the strength of the company’s core product segment.
Second, the analysis revealed a clear distinction between sales volume and revenue value. Some customers generated large purchase quantities but contributed less overall revenue, while others generated stronger financial impact despite lower transaction volume. 
The monthly revenue trend revealed highly uneven business performance across the reporting period, with multiple periods of decline and recovery rather than steady growth. Revenue dropped significantly during March and again in June–July before recovering strongly in the final quarter, where October recorded the highest monthly revenue at approximately ₦51 million. This pattern suggested fluctuating operational activity and highlighted the importance of consistent monthly performance monitoring.

# Business Recommendations
Based on the analysis, several recommendations emerged as I worked through the analysis. One of the strongest operational patterns I noticed was how heavily overall business performance depended on a relatively small number of products and customers. Rope related products consistently dominated both sales activity and revenue contribution throughout the reporting period, which clearly demonstrated the strength of the company’s core product line. At the same time, it also highlighted a potential concentration risk. If too much of the business depends on a narrow segment of products, changes in pricing, supply availability, or market demand could have a much larger impact on overall performance than expected. Because of this, I believe the business could benefit from gradually strengthening visibility into lower performing product categories and identifying areas with growth potential outside the dominant rope segment. Diversifying product contribution over time could help create a more balanced and resilient sales structure. 
The second recommendation is to analyze lower performing customers who contributed minimal revenue or showed limited purchasing activity across the reporting period. Rather than viewing these customers simply as low performers, I think they represent an opportunity for deeper investigation. Some may have untapped growth potential, inconsistent purchasing behavior, or product interests that are not being fully understood by the business. 
I would recommend analyzing whether these lower contributing customers: Purchase only specific categories, buy seasonally, respond differently to pricing, require different relationship engagement strategies or have gradually reduced purchasing activity over time. Understanding why certain customers remain low value could help the business improve retention strategies, identify overlooked opportunities, or decide where operational effort should be prioritized more efficiently. 

# Data Limitations
One important limitation of this project was that the dataset depended on the available documented sales records, not the complete historical activity of the business. During the analysis, I noticed that some periods, especially earlier months in 2024, were either missing or not consistently documented. Because of this, I treated the dashboard as an analysis of the available recorded sales data rather than a complete representation of every transaction the business may have carried out during the full period. Rather than estimating missing values, the analysis focuses on accurately representing the recorded data while acknowledging these limitations.


# Final Reflection
This was my first structured analytics project applied to an environment I was already familiar with, focusing on converting operational sales records into a usable reporting system that supports clearer business decision making. Many of the most useful insights from this project came not from complex techniques, but from organizing the data in a way that made relationships and patterns easier to recognize.
Ultimately, the project reinforced an important idea: businesses often already possess valuable data, but its strategic value only becomes visible once the information is structured, analyzed, and communicated clearly.


