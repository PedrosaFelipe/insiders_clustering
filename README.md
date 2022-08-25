# Programa Fidelidade


## A short description of the project

Project that aims to select the best buyers from a chain of stores in order to create a loyalty program.

#### This project was made by Felipe S. Pedrosa.

![how-to-build-customer-loyalty](https://user-images.githubusercontent.com/55566708/154312721-f6e2375b-3979-4e67-9441-9b95b99b5818.png)


# 1. Business Problem!

The company All in One Place is a Multibrand Outlet company, that is, it sells several second-line products from brands at a lower price, through an e-commerce. Based on this perception, the marketing time will launch a loyalty program for the best customers of the base, called Insiders. But time does not have an advanced knowledge in data analysis to elect program participants.
As a result for this project, you are expected to deliver a list of people eligible to participate in the Insiders program, along with a report answering the following questions:

1. Who are the people eligible to participate in the Insiders program?
1. How many customers will be part of the group?
1. What are the main characteristics of these customers?
1. What percentage of revenue contribution comes from Insiders?
1. What is the billing expectation of this group for the coming months?
1. What are the conditions for a person to be eligible for Insiders?
1. What are the conditions for a person to be removed from Insiders?
1. What is the guarantee that the Insiders program is better than the rest of the base?
1. What actions can the marketing team take to increase revenue? 


# 2. Business Assumptions.

In just over 1 year of operation, the marketing team realized that some customers from its base buy more expensive products, with high frequency and end up contributing a significant portion of the company's revenue.
You are part of the All In One Place team of data scientists, who need to determine who are eligible customers to participate in Insiders. In possession of this list, the Marketing team will carry out a sequence of personalized and exclusive actions for the group, in order to increase revenue and purchase frequency.


# 3. Solution Strategy

My strategy to solve this challenge was the IoT method which means:


**Input**

1. Business Problem:

 - Find the most valuable customers to join the Champions program;


2. Dataset

 - Ecommerce sales data for the period of one year (Nov 2016 to Dec 2017).



**Output**

1. A dashboard with customers segmentation with those who will join the Champions program;


2. Report with the anserws for the business questions


**Tasks**

**Who are the eligible people to participate in the Champions program?**
 - What does being eligible mean? 
 - What is a high-value customers for the company? 
 - We assumed that a high-value customers are those with good Lifetime Value (LTV).


**How many customers will be part of the loyalty group?**
 - After find the Champions Cluster count how many customers are in the Champions group.
 - Evaluete the percentage of the Champions customers from the total base.


**What are the main characteristics of these customers?**
 - After find the Champions Cluster describe the Champions customers in terms of avarage purchase characteristics.


**What is the percentage of revenue contribution that comes from the Champions?**
 - After find the Champions Cluster determine its gross revenue contribution and the total gross revenue for all clusters.


**What are the conditions for a person to be eligible for Champions?**
 - Define the periodicity of the model (1 month, 3 months...). 
 - Customer "performance" is close to the average of the Champions cluster.
 - Define performance metric.


**What are the conditions for a person to be removed from Champions?**
 - Define the periodicity of the model (1 month, 3 months...) -- The person must be dissimilar to a person in the group.


**What are the guarantees that the Champions program is better than the rest of the base?**

 - A/B Test

**What actions can the marketing team take to increase sales?**

 - Discount;
 - Purchase preference;
 - Free shipping;
 - Invites to visit the company, etc.


**Project Cycle**


The main ideia here is to add value to the business as soon as possible in each cycle of the project.
 
![crisp_DS](https://user-images.githubusercontent.com/55566708/186556435-033c32b2-9140-46f8-ba27-a8cde7e0d63c.jpg)


In possession of the groups, where a sale transaction took place, which took place between November 2016 and December 2017, we thought of grouping data with the premise of each representation line that the reference pro is the amount spent in the company in favor of the frequency of purchase, how many products in total you have purchased or any other variable.

 **Step 01. Data description**

When evaluating the dataset, the first situation of attention was that 135080 customers had an empty customer_id out of a total of 541909 customers. To get around the loss of a large number of buyers, it was made that each empty element was added the maximum number of customer_id valid plus 1, thus filling all the missing ones but putting a bias that each person not correctly filled in the database has bought only once. Finally, with the result not being satisfactory, they were just permanently excluded, reducing the number of data but without the imposed bias, greatly improving the grouping.

**Step 02. Data filtering:**

As many of the unit prices were set to 0, we put as a filtering all purchase values above 0.04 cents, in addition to excluding several stock_codes where the code was not the purchase or return code of the products.

**Step 03. Feature Engineering:**

We created some new columns to help the model, these being the gross_revenue, recency( Day from last purchase), quantity of purchased, Quantity total of items purchased , Quantity of products purchased, Avg Ticket Value, Frequency Purchase, Numbers of Returns.

**Step 04. Exploratory data analysis**

- An analysis to validate business hypotheses, combat business guesswork, check each feature by itself and the relationship among them.


- We are looking for features with high variance so it can give us a better explanation of the phenomenon.


- Explore the Embedding Spaces to check how the data is distributed in those different spaces, the goal here is to choose the best for clustering the customers.

```
    # reduzer dimensionality
    reducer = umap.UMAP(random_state = 42, n_components = i)
    embedding = reducer.fit_transform(df_leaf)

    
    if i == 2:
        components_list1.append(embedding)
        # embedding
        df_tree_1['embedding_x'] = embedding[:,0]
        df_tree_1['embedding_y'] = embedding[:,1]
```

**Step 05. Hyperparameter fine tunning** 

- Test different Machine Learning models and select the one with the best performance. Then, choose the best values for each parameter of the selected ML model.


**Step 07. Machine learning modelling**

- Create the final Machine Learning model and measure its performance.

**Step 09. Convert model performance to business values**


**Cluster Analysis:**

- Analyse clusters after Machine Learning modelling.
- Test business hypotheses and answer business questions.


**Step 10. Deploy model to production**

- Plan deployment architecture and implement it

# 4. Top 3 Data Insights


1. The Champions cluster has a gross revenue volume of **53.86%** over total gross revenue volume.
 
![avg_gross_revenue_cluster_02](https://user-images.githubusercontent.com/55566708/186557944-ffb3ac22-e9fe-4440-94be-405ddd671b98.png)

2. The Champions cluster has a product purchase volume of **33.05%** of the total product volume.

![avg_qty_products_by_cluster_02](https://user-images.githubusercontent.com/55566708/186557978-7c013c60-dd6a-4e76-bec4-be69e66c06f6.png)

3. The Champions customers have average purchase returns above the overall average. **Over 808.36%**


# 5. Machine Learning Model Applied

- Gaussian Mixture Model
- KNN for comparisson

# 6. Machine Learning Modelo Performance

The whole bussiness solutions was made following the architecture bellow and as a result a dashboard with important bussiness parameters.



**Deploy Infrastructure**

 ![cloud_deployment_pa05](https://user-images.githubusercontent.com/55566708/186558277-c2a08043-4a3f-40b9-840d-089fe80b8601.png)

**Metabase**

 ![metabase_champions03](https://user-images.githubusercontent.com/55566708/186558343-5c84b058-16ee-450a-b3e3-0c5ddc1b4306.png)


# 7. Conclusions

To sum up, having a loyalty group is of great importance as the Champions customers contribute to a large part of the company's revenue. And the customer segmentation helps a lot the bussiness strategy to increase the company's gross revenue.


However, clustering problems are complex since there's no straightforward direct to form choices once we have no target variable, as was the case in supervised ML problems.


Clustering problems require us to form choices intensely based on commerce understanding, much more than in supervised ML problems. As well as it requires much more data exploration together with the business team to breakdown the insights.

# 9. Lessons Learned

Multiple knowledge was acquired during the execution of this end-to-end unsupervised Data Science project, such as:


- Convert high-dimensional data to low-dimensional data with Embedding Spaces for better clustering.


- How plan a data pipeline and use the AWS solutions (S3, EC2 and RDS) to create a more robust solution for the company.


- Schedule the execution of the model in a jupyter notebook with cronjob and papermill in EC2.


- How to create dashboard using Metabase and host it on Heroku cloud.


- Add value to the bussines as soon as possible during the first cycles of the project.


- Focus on the business solution in order to not get lost on different tools to be used throughout the project

# 10. Next Steps to Improve

- Create new features to improve model performance;


- Create and test more embedding spaces with larger dimensions and check the model performance with it;


- Test different ML models for segmentation;


- Do A/B test to comprove if the clusters segmentation are performing well;


- Gather more business hypotheses and validate them with data.


- Ask the business team with the first dashboard provided is enough to solve their problems;


- Improve the model in production with better and modern tools;


- Put the dashboard in production (Heroku)


- Create a streamlit app to upload the new data;


- Improve the code to make it cleaner and more efficient.

**References:**

- Dataset High Value Customers Segmentation from [Kaggle](https://www.kaggle.com/vik2012kvs/high-value-customers-identification)

- Blog [Seja um Data Scientist](https://www.comunidadedatascience.com/como-criar-um-programa-de-fidelidade-para-empresa/)

- [UMAP Dimension Reduction](https://www.youtube.com/watch?v=eN0wFzBA4Sc&ab_channel=StatQuestwithJoshStarmer)


# LICENSE

# All Rights Reserved - Comunidade DS 2021
