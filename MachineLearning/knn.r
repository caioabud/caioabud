### PINGUIM ###
dados<- read.csv("pinguim.csv", header = TRUE)
str(dados)
unique(dados$species)
table(dados$species)
table(dados$island)
barplot(table(dados$island))
plot(x = dados$culmen_length_mm, y= dados$culmen_depth_mm, pch=11, "p")


adelie <- dados[dados$species== "Adelie",]
chinstrap <- dados[dados$species== "Chinstrap",]
gentoo <- dados[dados$species== "Gentoo",]

plot(x = dados$culmen_length_mm, y= dados$culmen_depth_mm, pch=11, "n")
points(x = adelie$culmen_length_mm, y= adelie$culmen_depth_mm, pch = 10, col= "red")
points(x = chinstrap$culmen_length_mm, y= chinstrap$culmen_depth_mm, pch = 3, col= "pink")
points(x = gentoo$culmen_length_mm, y= gentoo$culmen_depth_mm, pch = 2, col= "blue")
boxplot(adelie$culmen_length_mm, chinstrap$culmen_length_mm, gentoo$culmen_length_mm)

n <- round(nrow(dados)*0.8)

dados <- dados[sample(nrow(dados)),]

treinamento <- dados[1:n,]
teste <- dados[-(1:n), ]


previsao <- c()
for (j in 1:nrow(teste)) {
  distancias <- c()
  for (k in 1:nrow(treinamento)) {
    distancias[k] <- sqrt(sum((teste[j, c(3,4,5)] - treinamento[k, c(3,4,5)])**2))
  }
  previsao[j] <- treinamento$species[order(distancias)[1]]
}
previsao == teste$species
mean(previsao== teste$species)
plot(x= dados$flipper_length_mm, y=dados$body_mass_g)





