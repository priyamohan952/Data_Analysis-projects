#!/usr/bin/env python
# coding: utf-8

# In[4]:


import numpy as np
import pandas as pd


# In[6]:


import matplotlib.pyplot as plt
import seaborn as sns
get_ipython().run_line_magic('matplotlib', 'inline')


# In[7]:


import os
os.getcwd()


# In[10]:


df = pd.read_csv("911.csv")


# In[11]:


df.info()


# In[12]:


df.head()


# In[18]:


#top 10 zipcodes for 911 calls
df['zip'].value_counts().head(10)


# In[17]:


#top 5 townships (twp) for 911 calls
df['twp'].value_counts().head()


# In[20]:


# no. of unique title codes
len(df['title'].unique())


# In[22]:


#create new features
# cretae a Reasons column in title column
df['Reason'] = df['title'].apply(lambda title : title.split(':')[0])
df.head()


# In[23]:


df['Reason'].unique()


# In[24]:


# the most common reason for 911 calls
df['Reason'].value_counts().head()


# In[26]:


# countplot of 911 calls made by Reason
sns.countplot(x= 'Reason', data = df, palette = 'viridis')


# In[29]:


# datatype of the object in timestamp variable
df.info()
type(df['timeStamp'].iloc[0])


# In[30]:


# change the datatype of timeStamp column from string to DateTime object
df['timeStamp'] = pd.to_datetime(df['timeStamp'])


# In[31]:


# datatype of the object in timestamp variable to check if the datatype of timeStamp changed to datetime
df.info()
type(df['timeStamp'].iloc[0])


# In[71]:


# get attributes such as hour, month and day of week from timeStamp 
time = df['timeStamp'].iloc[0]
time.hour


# In[72]:


df['hour'] = df['timeStamp'].apply(lambda time : time.hour)


# In[73]:


df['hour'].head()


# In[74]:


df['month'] = df['timeStamp'].apply(lambda time : time.month)


# In[75]:


df['month'].head()


# In[76]:


df['day of week'] = df['timeStamp'].apply(lambda time : time.dayofweek)
df['day of week'].tail()


# In[77]:


df.head()


# In[78]:


# map actual string names to the days of the week
dmap = {1: 'Monday', 2: 'Tuesday', 3: 'Wednesday', 4: 'Thursday', 5: 'Friday', 6: 'Saturday', 7: 'Sunday' }


# In[79]:


df['day of week'] = df['day of week'].map(dmap)


# In[80]:


df['day of week'].head()


# In[81]:


# create counterplot of the day of week attribute with the hue based off of the Reason column
sns.countplot(x = 'day of week', data = df)


# In[82]:


sns.countplot(x = 'day of week', data = df, hue = "Reason")


# In[88]:


# map month values to the names
dmonth = {1:'Jan', 2: 'Feb', 3: 'March', 4: 'April', 5: 'May', 6: 'June', 7: 'July', 8: 'Aug', 9: 'Sept', 10: 'Oct', 11: 'Nov', 12: 'Dec'}


# In[99]:


df['month1'] = df['month'].map(dmonth)


# In[104]:


# goup the calls by month
byMonth = df.groupby(df['month']).count()


# In[105]:


byMonth


# In[92]:


# simple plot to show the no. of calls per month
byMonth['lat'].plot()


# In[95]:


sns.lmplot(x = 'month', y = 'twp', data = byMonth.reset_index())


# In[ ]:




