Lab 3 Report
================
Tyler Edvall
2021-02-02

Instructions for this lab report can be found on [Your assignment
section of Lab Assignment 3 Introduction to
ggplot2](https://biol275-msum.github.io/introduction-to-ggplot2.html#your-assignment)
on the lab website.

## Fireflies

> A. Insert an R code chunk and create a graph depicting the frequency
> distribution of the 35 mass measurements. It should have legible text
> and appropriate axis labels.

# spermatophore mass ——————————————————–

firefly\_data \<-
read\_csv(“<https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv>”)

firefly\_data

ggplot(data = firefly\_data)

ggplot(data = firefly\_data) + geom\_histogram(mapping = aes(x =
spermatophoreMass))

ggplot(data = firefly\_data) + geom\_histogram(mapping = aes(x =
spermatophoreMass), binwidth = 0.02)

ggplot(data = firefly\_data) + geom\_histogram(mapping = aes(x =
spermatophoreMass), binwidth = 0.02, boundary = 0, closed = “left”)

ggplot(data = firefly\_data) + geom\_histogram(mapping = aes(x =
spermatophoreMass), binwidth = 0.02, boundary = 0, closed = “left”)

ggplot(data = firefly\_data) + geom\_histogram(mapping = aes(x =
spermatophoreMass), binwidth = 0.02, boundary = 0, closed = “left”, fill
= “\#C5351B”, color = “black”) + labs(x = “Spermatophore Mass (Mg)”, y =
“Frequency (number of fireflies)”) +

theme( axis.title = element\_text(face = “bold”), axis.text =
element\_text(color = “black”, size = rel(1)) )

> B. What type of graph did you choose in part (A)? Why?

We chose a histogram to plot the firefly data. The reason is because the
firefly data is numerical and a histogram is the best way to show this
type of data.

> C. Describe the shape of the frequency distribution. What are its main
> features?

The shape of the frequency distribution is skewed to the left. There is
a noticeable outlier to the right of the graph.

> D. What term would be used to describe the largest measurement in the
> frequency distribution? You can refer to the lecture slides, your
> notes, or the textbook.

The mode.

## Bird orders

I read the data using the code provided by the instructor. The dataset
is from the auk package and was originally named ebird\_taxonomy. I
converted it to a tibble, removed non-species taxa, and named the new
dataset birds.

library(auk) \# load the auk package birds \<- ebird\_taxonomy %\>% \#
start with the ebird\_taxonomy data as\_tibble() %\>% \# tibbles print
better in the console filter(category == “species”) \# remove
non-species taxa

> E. How many bird species are in the new birds dataset? How did you
> find out?

There are 10721 bird species. I figured this out by looking under the
observation tab and seeing the number of observations.

> H. How many orders are there? You can get this right by counting on
> the graph, but you will only get full points if you use some code to
> figure it out.

41 different orders.

``` (r)
nrow(distinct(birds, species))
```

> F. Insert an R code chunk and create a graph depicting the
> distribution of orders in the birds dataset. Sort the orders with the
> most frequent on the left. It should have legible text and appropriate
> axis labels.

# Bird orders data ——————————————————

library(auk) \# load the auk package birds \<- ebird\_taxonomy %\>% \#
start with the ebird\_taxonomy data as\_tibble() %\>% \# tibbles print
better in the console filter(category == “species”) \# remove
non-species taxa

birds

distinct(birds, order)

count(birds, family\_common)

ggplot(data = birds)

ggplot(data = birds) + geom\_bar(mapping = aes(x = order))

ggplot(data = birds) + geom\_bar(mapping = aes(x = fct\_infreq(order)))

ggplot(data = birds) + geom\_bar(mapping = aes(x = fct\_infreq(order)),
fill = “\#C5351B”)

ggplot(data = birds) + geom\_bar(mapping = aes(x = fct\_infreq(order)),
fill = “\#C5351B”) + labs(x = “Order”, y = “Frequency (number of
birds)”)

ggplot(data = birds) + geom\_bar(mapping = aes(x = fct\_infreq(order)),
fill = “\#C5351B”, width = .8) + labs(x = “Order”, y = “Frequency
(number of birds)”) + scale\_y\_continuous(limits = c(0, 7000), expand =
expansion(mult = 0)) + theme\_classic(base\_size = 12) + theme(
axis.title = element\_text(face = “bold”), axis.text =
element\_text(color = “black”, size = rel(1)), axis.text.x =
element\_text(angle = 45, hjust = 1), axis.ticks.x = element\_blank() )

> G. What kind of graph did you create? Why?

Bar graph, since the bird data was categorical. That would be the best
way to display the data.

## Links to peer review

I reviewed Kelsey Leach’s lab report at this URL:
<https://github.com/BIOL275-MSUM/lab-3-intro-to-ggplot-kelseyaleach>

Kelsey Leach reviewed my lab report at this URL:
<https://github.com/BIOL275-MSUM/lab-3-intro-to-ggplot-tdedvall.git>

## Session Info

Here is my session information:

``` r
sessioninfo::session_info()
```

    ## - Session info ---------------------------------------------------------------
    ##  setting  value                       
    ##  version  R version 3.6.3 (2020-02-29)
    ##  os       Windows 10 x64              
    ##  system   x86_64, mingw32             
    ##  ui       RTerm                       
    ##  language (EN)                        
    ##  collate  English_United States.1252  
    ##  ctype    English_United States.1252  
    ##  tz       America/Chicago             
    ##  date     2021-02-02                  
    ## 
    ## - Packages -------------------------------------------------------------------
    ##  package     * version date       lib source        
    ##  assertthat    0.2.1   2019-03-21 [1] CRAN (R 3.6.3)
    ##  cli           2.2.0   2020-11-20 [1] CRAN (R 3.6.3)
    ##  crayon        1.3.4   2017-09-16 [1] CRAN (R 3.6.3)
    ##  digest        0.6.27  2020-10-24 [1] CRAN (R 3.6.3)
    ##  evaluate      0.14    2019-05-28 [1] CRAN (R 3.6.3)
    ##  fansi         0.4.1   2020-01-08 [1] CRAN (R 3.6.3)
    ##  glue          1.4.2   2020-08-27 [1] CRAN (R 3.6.3)
    ##  htmltools     0.5.0   2020-06-16 [1] CRAN (R 3.6.3)
    ##  knitr         1.30    2020-09-22 [1] CRAN (R 3.6.3)
    ##  magrittr      2.0.1   2020-11-17 [1] CRAN (R 3.6.3)
    ##  rlang         0.4.10  2020-12-30 [1] CRAN (R 3.6.3)
    ##  rmarkdown     2.6     2020-12-14 [1] CRAN (R 3.6.3)
    ##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.6.3)
    ##  stringi       1.5.3   2020-09-09 [1] CRAN (R 3.6.3)
    ##  stringr       1.4.0   2019-02-10 [1] CRAN (R 3.6.3)
    ##  withr         2.3.0   2020-09-22 [1] CRAN (R 3.6.3)
    ##  xfun          0.20    2021-01-06 [1] CRAN (R 3.6.3)
    ##  yaml          2.2.1   2020-02-01 [1] CRAN (R 3.6.3)
    ## 
    ## [1] C:/Users/Tyler/Documents/R/win-library/3.6
    ## [2] C:/Program Files/R/R-3.6.3/library
