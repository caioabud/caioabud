### 1.a

cancer_teste <- read.csv("teste_cancer.txt", sep = ";")
cancer_treinamento <- read.csv("treinamento_cancer.txt", sep = ";")

cancer_teste$diagnosis <- as.factor(cancer_teste$diagnosis)

cancer_treinamento$diagnosis <- as.factor(cancer_treinamento$diagnosis)

summary(cancer_treinamento)


svm_linear <-  svm(formula = diagnosis ~.,
                   data = cancer_treinamento,
                   kernel = "linear",
                   cost = 1)

previsao_svm_linear <- predict(svm_linear, newdata = cancer_teste)
acuracia_linear <- mean(previsao_svm_linear == cancer_teste$diagnosis) ## 0.90

### 1.b

library(randomForest)

floresta <- randomForest(diagnosis ~ ., 
                         data = cancer_treinamento, 
                         ntree = 50, 
                         mtry = 3, 
                         importance = TRUE)

previsao_floresta <- predict(floresta, newdata = cancer_teste, type = "class")
acuracia <- mean(previsao_floresta == cancer_teste$diagnosis) ##0.89


### 1.c
### sensibilidade
confusionMatrix(data = previsao_svm_linear, reference = cancer_teste$diagnosis, positive = "M")
### Para o modelo svm a probabilidade é 0,80

confusionMatrix(data = previsao_floresta, reference = cancer_teste$diagnosis, positive = "M")
### Para o modelo da floresta a probabilidade é 0,70

### 1.d 
### especificidade
### para o modelo svm a probabilidade é 0,93
### para o modelo da floresta a probabilidade é 0,96

###1.e

###Pos Pred Value
### Para o modelo svm a probabilidade é 0,83
### para o modelo da floresta a probabilidade é 0,88

### 1.f
### neg pred Value
### Para o modelo svm a probabilidade é 0,92
### Para o modelo da floresta a probabilidade é 0,89

### 1.g

### Pela acurácia e sensibilidade o modelo svm ganha, porém para prever se o tumor
### é maligno considerando casos em que o paciente tem ou não cancer o modelo de floresta é melhor,
### toda via para prever tumores benignos considerando todos os caso, o modelo de svm é melhor.

### 2
library(dplyr)
musicas <- read.csv("musicas.txt", sep = ";")
summary(musicas)

musicas$artista <- as.factor(musicas$artista)

musicas <- musicas |> 
  select(danceability, energy, loudness, speechiness, acousticness,instrumentalness, artista)


dados_pradonizados <- musicas[,-c(7,8)]
  
  
  
modelo_kmeans <- kmeans(x = dados_pradonizados, centers = 5, nstart = 100 )
modelo_kmeans$cluster

musicas$cluster_k3 <- as.factor(modelo_kmeans$cluster)

library(ggplot2)

ggplot(data = musicas, aes(x = cluster_k3, fill = artista))+
  geom_bar()

### O Gráfico com 5 categorias , categoriza bem as musicas do pato fu sendo está predominante
### nas categorias 1 e 2, na categoria 3 observamos a presença apenas de músicas da banda
### pato fu e Racionais MCs. já na categoria 4 observamos a presença das musicas das 3 bandas.
### na categoria 5 observamos presença apenas de musicas de racionais MCs e Cartola.


### Analisando o gráficos pode se dizer que talvez exista uma variavel que pode descrever bem as
### musicas da banda pato fu. Podemos dizer também que pode existir outra varivel que descreve bem
### as musicas da banda Racionais Mcs e Cartola.

