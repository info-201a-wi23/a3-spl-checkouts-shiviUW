library("dplyr")
library("ggplot2")

spl_data <- read.csv("/Users/shivanshshekhar/Downloads/2017-2023-10-Checkouts-SPL-Data.csv")
materialType_analysis <- spl_data %>% filter(CheckoutYear < 2023) %>% group_by(MaterialType) %>%  summarize(Number_of_Checkouts = sum(Checkouts))
materialType_analysis <- materialType_analysis[order(materialType_analysis$Number_of_Checkouts, decreasing = TRUE), ]
max_categories <- head(materialType_analysis$MaterialType, 4)

max_categories_data <- spl_data %>% filter(CheckoutYear < 2023) %>% group_by(MaterialType, CheckoutYear) %>% summarize(Number_of_Checkouts = sum(Checkouts)) %>% filter(MaterialType %in% max_categories)

chart_one <- ggplot(data = max_categories_data) +
  geom_line(mapping = aes(x = CheckoutYear, y = Number_of_Checkouts, color = MaterialType)) +
    labs(title = "Comparsion of the Most Checked Out Materials from 2017-2022", x = "Year", y = "Number of Checkouts", color = "Material")
chart_one <- chart_one + theme(plot.title = element_text(hjust = 0.5))
chart_one
