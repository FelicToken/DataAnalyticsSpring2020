Level:__4000__ Please mention the Level(4000 or 6000) that you are registered for this course
1. Abstract and Introduction (2%) Describe your motivation, initial hypothesis/ idea that you wanted to investigate, and if applicable any prior work, interest in the topic (like an intro for a paper, with references), Min. 1/2 page. 

Life expectancy is an estimate of the expected average number of years of life (or a person's age at death) for individuals who were born into a particular population. Shifts in life expectancy are often used to describe trends in mortality. When I first took a look at the data about life expectancy, I noticed that there are countries that showed life expectancy is only 10 years old, and there are countries that showed the estimated life expectancy is over 80 years old. I want to use this database as a major database to develop models.

For this project I want to develop a model and do data analytics about the Life Expectancy and other factors that will affect life expectancy.This project previously is a data science group project. However, our group member has no experience in data analytics. Therefore, The main focus of our project last semester was data visualization which basically shows the change of global life expectancy in this decade. This semester I took the dataset from the previous project and took it a step further. I am going to do both data analytics and data visualization. 

This semester I will combine life expectancy dataset with other datasets from WHO such as vaccination coverage, alcohol consumption and economic growth. I want to predict if there is any relation between life expectancy and living area (countries, region and environment), for example is there any region that has higher life expectancy than other regions? If high vaccination coverage indicates higher life expectancy, and whether life expectancy is rising during this decade.  These are initial hypotheses that I want to develop a model to investigate.

2.2. Data Description (3%). Describe how you determined which datasets you used in this project, the criteria, source, data and information- types in detail, associated documentation and any other supporting materials. Min. 1/2 page text (+graphics if applicable)

First, I decided to use the life expectancy dataset published by WHO as the main dataset. The main dataset used is ‘Life expectancy and Healthy life expectance.csv’, the dataset contains life expectancy for over 180 major countries from 2000 to 2016.The dataset contained data including country name, year, region, and gender. All the attributes in this dataset are important and going to used in the model that I want to develop.Since this dataset has estimate about life expectancy for both sex, female, and male, I can make model for female and male life expectancy separately to find out if female and male have different life expectancy even in the same country. The region attribute in this dataset will allow me to do clustering to find out any countries or regions that have higher life expectancy.

I also want to investigate what will influence the life expectancy, therefore I went to find if there any other dataset published from WHO may have connection with life expectancy. There are several vaccinations that we need to get during our life, and some of them will be taken several days after birth. These vaccinations will protect babies from getting some of the diseases that usually are killer diseases for babies. Therefore, I want to combine the vaccination coverage of certain diseases with the life expectancy at birth to find out if  there are relations between life expectancy at birth and vaccination coverage. I can also combine the same dataset with the life expectancy at age 60 to find out if there is still a relation between these two attributes. The dataset I found has several subdatasets.  Each dataset contains the vaccination coverage as a percentage for a certain type of vaccination. I also found a dataset that shows Current health expenditure (CHE) as percentage of gross domestic product(GDP) which can be related with life expectancy. I am going to combine these dataset with life expectancy to create a new dataframe and then do data cleaning again before developing the model, since there seems to be a lot of NULL data in the vaccination coverage dataset. 

All datasets came from the same source which is WHO. All the metadata documentation is listed in the dataset and all the data are collected by the same source with the same criteria.

3. Analysis (5%) Explore the statistical aspects of your datasets. Perform any transformations, interpolations, smoothing, cleaning, etc. required on the data, to begin to explore your hypothesis/ questions. Analyze the distributions; provide summaries of the relevant statistics and plots of any fits you made. Discuss and specify or estimate possible sources of error, uncertainty or bias in the data you used (or did not use). Min. 2 pages text + graphics. 

I use filter and is.na function to do the data cleaning.  I use filters to filter out some unreasonable data such as for life expectancy, life expectancy must be larger than 0, and for vaccination coverage as percentage, valid data should be in the range of 0 to 100. Since the data set is really large which contains at least over 180 countries and the data from 2000 to 2016, I need to make sure there is no Null or N/A in my data. While I am doing data cleaning and trying to combine two datasets into one dataframe to do further analytics, I get an error message. When I went back to the Life expectancy dataset, I found that one country called Rwanda has two numbers in one column. Since I did not know which number I should take and every data from this country has the same problem, I decided to filter out this country. Instead of introducing uncertainty which will cause bias in my data, I chose to not include Rwanda in my dataset.


Rwanda with chuck of error in the data 
 I did some EDA to life expectancy dataset to find out distribution and summary. I used a filter to find out life expectancy made at 2000 for females and male separately. I also selected life expectancy made in 2016 for female and male separately.  I chose 2000 and 2016 to draw histograms because the earliest year in the dataset is 2000 and the latest year in the dataset is 2016.



Life expectancy at 2000 for female
Life expectancy at 2000 for male




Summary about life expectancy at 2000 for female
Summary about life expectancy at 2000 for male

we can see that at 2000, male have lower minimal life expectancy and females have larger life expectancy when we look at mean, median and maximum in the summary. In the histogram, both female and male have a gap in the distribution. There are a bunch of countries that have life expectancy around 20 and a bunch of countries that have life expectancy from 40 to even over 80, but there are almost no  countries that have life expectancy around 30. 

I also made a similar filter to find data at 2016 to see that after 16 years past if there is any change of the distribution of the global life expectancy. The result shows below:




Life expectancy at 2016 for female
Life expectancy at 2016 for male


Summary about life expectancy at 2016 for female


Summary about life expectancy at 2016 for male
Compare the distribution of life expectancy for female and male at 2016 with the distribution of life expectancy for female and male at 2000, The minimal life expectancy raised for 2 over 16 years of development while maximal life expectancy did not change too many. The gap of frequency of life expectancy around 30 gets larger for these 16 years. 

I use na.omit function to remove the row that contains NA for these datasets: Pol3 vaccination coverage, DTP3 coverage, and CHE as percentage of GDP. Since rows with na cannot be used to develop models to find out relation between these datasets and life expectancy dataset. I use histogram to find out the distribution for all three datasets mentioned above with data at year 2000 and year at 2016 which is the nearest and furthest data in life expectancy. 



CHE as percentage of GDP at 2000
CHE as percentage of GDP at 2016



Pol3 vaccination coverage at 2000
Pol3 vaccination coverage at 2016




DTP3 vaccination coverage at 2000
TP3 vaccination coverage at 2016


4. Model Development and Application of model(s) (12%) What types of models you used to describe the data (regression, classification, clustering, etc.), patterns/ trends you found, visual approaches that helped you choose models, and or variables (type/ number) in the model, other parameter choices or settings for the models (e.g. distance metrics, kernels, etc.). Apply the models to assess model performance (i.e. predict). Discuss the confidence in your results including any statistical measures. Discuss how you validated your models and performed any optimization (give details). Min. 6 pages text + graphics. 
I first took the life expectancy dataset as the main dataset, and combined it with DTP3 vaccination coverage, Pol3 vaccination coverage, and CHE(current health expenditure) as percentage of GDP. I want to develop a model to find out if there are any significant elements that influence the estimate of life expectancy, vaccination coverage in that country and current health expenditure as percentage of GDP in the country. I built a regression model to try to find out significant elements. I took the life expectancy for both sexes from life expectancy, vaccination coverage as percentage from DTP3 vaccination coverage and Pol3 vaccination coverage and current health expenditure as percentage of GDP from CHE dataset. I use the data for both sexes from the life expectancy dataset because life expectancy dataset is the only dataset that introduces sexs as an attribute while other dataset do not mention the data is collected only from female or male.  I try to build both a linear regression model and multivariate regression model for data at 2016 and 2000. 



Summary for multivariate regression model at 2016
Q-Q plot for multivariate model



Summary for multivariate regression model at 2000
Q-Q plot for multivariate model
Since it seems that none of the attributes that I included in have a significant influence on the estimate of life expectancy, I try to build a linear regression model for each attributes.The summaries and results show below. 


Summary for linear regression model at 2016 for CHE attribute


Summary for linear regression model at 2016 for DTP3 coverage attribute


Summary for linear regression model at 2016 for Pol3 coverage attribute
According to the linear regression models shown above, it seems that Pol3 coverage and DTP3 vaccination coverage may have some influence on the estimation of life expectancy while CHE may have little impact on the prediction of life length.All the models made above were using data at year 2016. I also developed the same model for data in 2000.


Summary for linear regression model at 2000 for CHE attribute


Summary for linear regression model at 2000 for Pol3 coverage attribute


Summary for linear regression model at 2000 for DTP3 coverage attribute
The regression model built according to the data collected in 2000 has a similar conclusion that CHE as percentage of GDP does not affect life expectancy in that country. 

I use k -mean clustering model to apply on both life expectancy data about females and that about males.  This model used only data from the life expectancy dataset after data cleaning. I want to use  k-mean clustering to find out if countries in the same region have similar life expectancy and if there is a certain country or region (cluster) that has a longer life expectancy. The design of the model is the same for female data and male data. Since k means clustering can not do iteration on the categorical data especially data that is in text form. Therefore, I blind the region and country attributes in both the female dataset and male dataset.  



Table about female life expectancy region and clustering 


Table about male life expectancy region and clustering 
 I used ggplot to use year as x axis and life expectancy as y axis and set the color to clustering. As a result, the plot will show the whole life expectancy distribution in 6 different colors. 


Female clustering model


Male clustering model
 5. Conclusions and Discussion (3%) Describe your conclusions; interpret the results, predictions you made, the models and their characteristics, and a give summary of what changed as you went through the project (data, analysis, model choices, etc.), what you would do next, or do differently in a subsequent exploration. Min. 1 page text + graphics (optional). References – websites, papers, packages, data refs, etc. should be included at the end. Include your R scripts! (e.g. in a zip file) and also include the Github URL that contains the code. There is no specific citation format, just be consistent. 

