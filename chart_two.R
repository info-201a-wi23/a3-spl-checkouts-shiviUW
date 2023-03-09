library("dplyr")
library("ggplot2")

spl_data <- read.csv("/Users/shivanshshekhar/Downloads/2017-2023-10-Checkouts-SPL-Data.csv")

usageClass_analysis <- spl_data %>% group_by(UsageClass, CheckoutYear) %>%  summarize(Number_of_Checkouts = sum(Checkouts))
chart_two <- ggplot(data = usageClass_analysis) +
  geom_line(mapping = aes(x = CheckoutYear, y = Number_of_Checkouts, color = UsageClass)) +
    labs(title = "Comparison Between Digital and Physical Checked Out Materials", x = "Year", y = "Number of Checkouts", fill = "Type of Media", subtitle = "Seattle Public Library from 2017 - 2023")
chart_two <- chart_two + theme(plot.title = element_text(hjust = 0.5))
chart_two <- chart_two + theme(plot.subtitle = element_text(hjust = 0.5))
chart_two

