rm(list = ls())
library(readxl)
library(ggplot2)
library(sjPlot)

d <- read_excel("raw data anonymized.xlsx")
mod.prod <- lm(log(Post_Prod+1) ~ InitialSpacing*RelearnSpacing*scale(LABJT), data = d)
summary(mod.prod)
plot_model(mod.prod, type = "pred", terms = c("LABJT", "InitialSpacing", "RelearnSpacing")) + theme_bw() + ggtitle("RelearnSpacing")
ggsave("Post_Prod.png", dpi = 500, width = 10, height = 8)

mod.rec <- lm(Post_Rec ~ InitialSpacing*RelearnSpacing*scale(LABJT), data = d)
summary(mod.rec)
plot_model(mod.rec, type = "pred", terms = c("LABJT", "InitialSpacing", "RelearnSpacing")) + theme_bw() + ggtitle("RelearnSpacing")
ggsave("Post_Rec.png", dpi = 500, width = 10, height = 8)

mod.trial <- lm(TrialCount_Ses2 ~ InitialSpacing*RelearnSpacing*scale(LABJT), data = d)
summary(mod.trial)
plot_model(mod.trial, type = "pred", terms = c("LABJT", "InitialSpacing", "RelearnSpacing")) + theme_bw() + ggtitle("RelearnSpacing")

ggsave("Post_Trial.png", dpi = 500, width = 10, height = 8)
