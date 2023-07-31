# Alzheimers-Mental-Health-and-Healthy-Aging-Project

**Objectives:** 
  
  Understanding any relationships that exist with the prevalence of mental health issues is an important tool for medical professionals when assessing and diagnosing patients. This study attempted to analyze if race and age had any effects on the frequency of mental health issues in older adults. I expect the data to reflect that Black Americans show a larger frequency of mental health issues, as they are the most marginalized minority group in America. I also expect to find that older patients suffer more from mental health issues than younger patients due to stressors which are associated with aging, such as the decline of functional ability. I was motivated to study this topic through my experiences as a research assistant for an Alzheimer’s Disease (AD) early detection lab. A massive focus in AD research is concerned with establishing causal links between several risk factors, such as obesity, depression, heart health, lifestyle, and mental health. As such, understanding these variables and how they relate to aging populations can provide more context to understanding chronic diseases such as AD. 

**Research Questions:** 
  Research Question 1 – Does the mean frequency of older adult people who suffer from a mental health issue differ based on race of the patient?
  Research Question 2 – Does the mean frequency of older adult people who suffer from a mental health issue differ based on age of the patient?

**Data Collection:**
  This study analyzed a sample of 168 random and independent patient survey responses from a dataset which compiled results from numerous surveys on Alzheimer’s Disease (AD) and healthy aging carried out by the Behavioral Risk Factor Surveillance System (BRFSS). 
  The data I compiled was from a larger dataset comprising over 46,000 datapoints describing different numeric response variables which related to healthy aging. The two explanatory variables I decided to analyze were race and age. Race data was not available for every data point, however, every entry came with an age group. After accounting for the points which included a race group and choosing the percentage of older adults who suffer from a mental health issue as my response variable, I was left with a dataset of 168 points.  No transformations were needed for the numeric response variable as the data was already normally distributed.

**Measures:**
	The numeric response variable being measured in this study was the mean frequency of older adults, measured in percents (%), who are experiencing a mental health issue. Both explanatory variables were categorical. The first variable specified which racial category an older adult identified as among three groups: Black (non-hispanic), White (non-hispanic), or Hispanic. The second variable specified which age group an older adult belonged to: ages 50 – 59 years or 60 years and older.

**Analysis Method:**
	Utilizing RStudio, a programming software for statistical computing, a multi – factor ANOVA test with an interaction term between the two explanatory variables, age and race, was used to analyze the dataset.

**Interpretation:** 
	While controlling for race, the mean frequency of mental illness in older adults significantly differs between the age group of the older adult (F = 22.103, df = (1, 162), p = 5.496e-06< 0.05). Also, while controlling for age, the mean frequency of mental illness in older adults did not significantly differ between the race of the older adult (F = 2.215, df = (2, 162), p = 0.112> 0.05). Race and age did not have a significant interaction on the mean frequency of mental illness in older adults (F = 2.438, df = (2, 162), p = 0.091> 0.05). A post – hoc analysis was performed on the only significant factor, age of the older adult. Older adults from ages 50 – 59 years experienced, on average, higher frequencies of mental health issues than older adults who were 65 years and older (p< 0.0001).  

**Assumptions:** 
  1.)	 This was a random sample carried out by the BRFFS through randomized telephone surveys to various people across the United States.
  2.)	 The sample had independent observations as there were no relationships between each individual survey carried out by the BRFSS.
  3.)	 While the two different age groups were normally distributed, when looking at the Race/Ethnicity factor, the “White, non – Hispanic” group was not normally distributed. No transformations could produce a normal distribution for the “White, non – Hispanic” group, and so the sample data failed the normality assumption for each group within each factor. Normality can be assessed visually through a box plot of the explanatory and response variables.   
  4.)	 This data fails Levene’s test of equal variances for both factors. It was found that the three race groups within the race factor had significantly different variances from each other (p=0.003). Furthermore, it was also found that the two age groups within the Age category also had significantly different variances from each other (p=0.034).

**Limitations:**
  •	The BRFSS conducts telephone surveys to gather their data. As such, all people who do not have telephones or are in institutions that do not allow the use of a telephone cannot be represented in this study. Furthermore, these survey responses are self – reported and cannot be confirmed by a healthcare provider. 
  •	Both factors, Race and Age, failed the normality and equal variances assumption. This is another limitation to be considered when drawing conclusions from this study.
  •	One confounding variable in this study could be whether the older adult is suffering from a chronic illness or not. As people age, the symptoms from chronic illnesses typically worsen, which could result in a higher frequency of adults who could self – report mental health issues.


