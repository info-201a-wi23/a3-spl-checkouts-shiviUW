library("dplyr")
library("ggplot2")
library(scales)

spl_data <- read.csv("/Users/shivanshshekhar/Downloads/2017-2023-10-Checkouts-SPL-Data.csv")
books <- c("BOOK", "EBOOK")
most_popular_books <- spl_data %>% filter(MaterialType %in% books) %>% group_by(Title, UsageClass) %>% summarise(Number_of_Checkouts = sum(Checkouts))
most_popular_books <- most_popular_books[order(most_popular_books$Number_of_Checkouts, decreasing = TRUE), ]

top_5 <-  head(most_popular_books, 5)
chart_three <- ggplot(data = top_5) +
  geom_col(mapping = aes(x = Title, y = Number_of_Checkouts, fill = UsageClass)) +
    labs(title = "Most Checked out Digital/Physical Books", x = "Book Title", y = "Number of Checkouts", fill = "Book Type", subtitle = "Seattle Public Library (2017-2023)") +
      scale_y_continuous(labels = label_number_si()) +
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5), plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5))
chart_three
