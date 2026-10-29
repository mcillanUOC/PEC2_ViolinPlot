# Library
library(ggplot2)

# Load data
data <- read.csv("bedtime_screentime_sleep_debt.csv")
data$occupation_type <- factor(
  data$occupation_type, levels = c(
    "Healthcare / Shift Worker", 
    "Student", 
    "Remote Tech", 
    "Freelance / Creative",
    "Corporate 9-to-5"
    )
  )

# Violin plot
ggplot(data, aes(x = occupation_type, y = total_sleep_hours, fill = occupation_type)) +
  geom_violin(trim = FALSE, alpha = 0.7) +
  geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) +
  coord_cartesian(ylim = c(0, 12)) +
  labs(
    x = "Tipo de ocupación",
    y = "Horas totales de sueño"
  ) +
  theme_minimal() +
  theme(legend.position = "none")
