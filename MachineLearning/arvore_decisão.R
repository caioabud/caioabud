library("palmerpenguins")
library("ggplot2")
library("dplyr")

dados <- na.omit(penguins)

n <- round(0.8*nrow(dados))

indice_treinamento <- sample(1:nrow(dados), size = n, replace = FALSE)

treinamento <- dados[indice_treinamento,]
teste <- dados[-indice_treinamento,]


ggplot(data = treinamento, aes(x= body_mass_g, y = bill_length_mm, col= species))+
         geom_point()+
          facet_wrap(~sex)  


treinamento |>
  filter(sex == "female")|>
  ggplot(aes(x= body_mass_g, y= bill_length_mm, color = species))+
   geom_point()+
   geom_vline(xintercept = 4000)+
   geom_hline(yintercept = 42)

treinamento |>
  filter(sex == "male")|>
  ggplot(aes(x= body_mass_g, y= bill_length_mm, color = species))+
  geom_point()+
  geom_vline(xintercept = 4800)+
  geom_hline(yintercept = 48)

classifica <- c()

for(k in 1:nrow(teste)){
  if(teste$sex[k] == "female"){
    if(teste$body_mass_g[k] > 4000){
      classifica[k] <- "Gentoo"
    }else {
      if(teste$bill_length_mm[k]<42){
        classifica[k] <- "Adelie"
      }else{
        classifica[k] <- "Chinstrap"
      }
    }
  }else{
    if(teste$body_mass_g[k] > 4800){
      classifica[k] <- "Gentoo"
    }else{
      if(teste$bill_length_mm[k]<48){
        classifica[k] <- "Adelie"
      }else{
        classifica[k] <- "Chinstrap"
      }
    }

  }
}

  classifica
  mean(classifica == teste$species)
