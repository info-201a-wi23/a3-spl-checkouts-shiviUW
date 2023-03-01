library("dplyr")

spl_data <- read.csv("/Users/shivanshshekhar/Downloads/2017-2023-10-Checkouts-SPL-Data.csv")
data_2020 <- spl_data %>% filter(CheckoutYear == 2020)

# 1. Diff. between digital and physical checkouts in 2020

total_digital_2020 <- data_2020 %>% filter(UsageClass == "Digital") %>% summarize(digital_sum = sum(Checkouts)) %>% pull(digital_sum)
total_physical_2020 <- data_2020 %>% filter(UsageClass == "Physical") %>% summarize(physical_sum = sum(Checkouts)) %>% pull(physical_sum)
difference_2020 <- total_digital_2020 - total_physical_2020

total_digital_2017 <- spl_data %>% filter(CheckoutYear == 2017) %>% filter(UsageClass == "Digital") %>% summarize(digital_sum_17 = sum(Checkouts)) %>% pull(digital_sum_17)
total_physical_2017 <- spl_data %>% filter(CheckoutYear == 2017) %>% filter(UsageClass == "Physical") %>% summarize(physical_sum_17 = sum(Checkouts)) %>% pull(physical_sum_17)
difference_2017 <- total_digital_2017 - total_physical_2017

# 2. The month with most and least checkouts in 2020.

monthly_checkout <- data_2020 %>% group_by(CheckoutMonth) %>% summarise(Total_Checkouts = sum(Checkouts))
monthly_checkout <- monthly_checkout[order(monthly_checkout$Total_Checkouts, decreasing = TRUE), ]

max_month <- head(monthly_checkout$CheckoutMonth, 1)
min_month <- tail(monthly_checkout$CheckoutMonth, 1)

# 3. Top Two Types of Media that were checked out

media_type_checkout <- data_2020 %>% group_by(MaterialType) %>% summarise(Total_Checkouts = sum(Checkouts))
media_type_checkout <- media_type_checkout[order(media_type_checkout$Total_Checkouts, decreasing = TRUE), ]

first_media <- head(media_type_checkout$MaterialType, 1)
second_media <- media_type_checkout$MaterialType[2]

#4. Most Checked Out Title During 2020

most_titles <- data_2020 %>% group_by(Title) %>% mutate(Total_Checkouts = sum(Checkouts))
most_titles <- most_titles[order(most_titles$Total_Checkouts, decreasing = TRUE), ]
top_title <- most_titles$Title[1]
top_title_type <- most_titles$MaterialType[1]

#5. Most Checked Out Given Creator During 2020

most_creators <- data_2020 %>% group_by(Creator) %>% summarise(Total_Checkouts = sum(Checkouts))
most_creators <- most_creators[order(most_creators$Total_Checkouts, decreasing = TRUE), ]
top_creator <- most_creators$Creator[2]
