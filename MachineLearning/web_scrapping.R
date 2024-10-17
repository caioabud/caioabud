library(rvest)
library(dplyr)
library(ggplot2)


url <- "https://www.bbc.com/portuguese/articles/c2dp5r8xn77o"

html <- read_html(url)
html

texto <- html|>
  html_elements("p.bbc-hhl7in")|>
  html_text2()


titulo <- html |> 
  html_elements("h1")|>
  html_text2()


paste (c("a", "b"), collapse = " ")

texto <- paste(texto, collapse = " ")

noticias <- data.frame(titulo, texto)


url_base <- "https://www.bbc.com/portuguese/topics/cr50y580rjxt"

html_base <- read_html(url_base)


links <- html_base |> 
  
  html_elements("ul.bbc-k6wdzo")|>
  html_elements("li")|>
  html_elements("a")|>
  html_attr("href")  


titulos <- c()
textos <- c()

for (j in 1: length(links)) {
  
  url <- links[j]
  
  html <- read_html(url)

  titulos[j] <-  html|>
    html_elements("h1")|>
    html_text2()
  
  
  texto <-  html|>
    html_elements("p.bbc-hhl7in")|>
    html_text2()
    textos[j] <- paste(texto, collapse = " ")
}

textos[8]

noticias <- data.frame(titulos, textos)

noticias <- noticias |> 
            mutate(categoria = rep("ciência", times = 24))


### Extraindo palavras.

install.packages("tidytext")
library(tidytext)


noticias[1,]|>
  unnest_tokens(output = "word", input = "textos" )|>
  select(word)|>
  count(word, sort = TRUE)|>
  top_n(10)

  
### Retirando stopwords

install.packages("stopwords")
library(stopwords)

stopwords("pt")

stopwords_pt <- data.frame(word = stopwords("pt") )  

noticias[1,]|>
  unnest_tokens(output = "word", input = "textos" )|>
  select(word)|>
  anti_join(stopwords_pt)|>
  count(word, sort = TRUE)|>
  top_n(10)|>
  mutate(word = reorder(word, n))|>

  
  ggplot(aes(y = word, x = n))+
  geom_col()



