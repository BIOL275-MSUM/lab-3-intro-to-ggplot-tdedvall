
# load packages -----------------------------------------------------------

library(tidyverse)

# Bird orders data ------------------------------------------------------

library(auk)                          # load the auk package
birds <- ebird_taxonomy %>%           # start with the ebird_taxonomy data
  as_tibble() %>%                     # tibbles print better in the console
  filter(category == "species")       # remove non-species taxa

birds

distinct(birds, order)

count(birds, family_common)

ggplot(data = birds)

ggplot(data = birds) +
  geom_bar(mapping = aes(x = order))

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)))

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B")

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B") +
  labs(x = "Order", y = "Frequency (number of birds)")

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B", 
           width = .8) +
  labs(x = "Order", y = "Frequency (number of birds)") +
  scale_y_continuous(limits = c(0, 7000), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  )


# spermatophore mass --------------------------------------------------------

firefly_data <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv")

firefly_data                  

ggplot(data = firefly_data)

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass))

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass), binwidth = 0.02)

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass), binwidth = 0.02,
                 boundary = 0, closed = "left")

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass), binwidth = 0.02,
                 boundary = 0, closed = "left")

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass), binwidth = 0.02,
                 boundary = 0, closed = "left", 
                 fill = "#C5351B", color = "black") +
  labs(x = "Spermatophore Mass (Mg)", y = "Frequency (number of fireflies)") +
  
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1))
  )

