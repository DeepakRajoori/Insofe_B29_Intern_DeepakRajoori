---
title: "Waveform Dataset"
author: "Deepak Rajoori"
date: "4 September 2017"
output: html_document
---

```{r Set Working Directory}
setwd("F:/Project")
```

```{r Read Waveform Data}
waveform_data <- read.csv("waveform-+noise.csv", header = TRUE, sep = ",")
```

```{r Structure and Summary of the data}
str(waveform_data)
summary(waveform_data)
```

#Since each instance is a set of wave noises that are recorded are all numeric, the data should be Normalized in order to get better results

```{r Data Normalization by using min-max normalization function}
#We are using general normalization function because all the noises in the dataset are with mean = 0 and variance = 1

normalize <- function(x)
  (
    return((x-min(x))/(max(x)-min(x)))
  )
```


```{r Create a normalized waveform dataset}
waveform_n <- as.data.frame(lapply(waveform_data,normalize))
print(waveform_n)
```

#Create another normalization dataset by using z-score standardization
```{r Z-score Standardized Dataset}
waveform_nz <- as.data.frame(scale(waveform_data))
print(waveform_nz)
```
#Create Train and Test Datasets
```{r Train and test datasets}
library(caret)
traindata_waveform <- createDataPartition()
```
