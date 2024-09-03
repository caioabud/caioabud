#Questão 1

k = 0
i = 13
soma = 0
  
while(k < i){
    k = k+1 
    soma = soma + k
  }

print(soma)

#Questão 2

n = 11
f <- c(0,1)

  while (TRUE) {
    proximo <- tail(f,1) + tail(f,2)[1]
    if( proximo > n){
      break
    } 
    f <- c(f, proximo)
  }

if(n %in% f){
  print("o número está na sequência")
  
}else{
  print("o número não está na sequência")
}

#Questão 3

faturamento <- sample(x = 100:10000, size = 30, replace = FALSE) #Simulando um vetor de faturamento de tamanho 30
faturamento <- na.omit(faturamento) # retirando dados faltantes se existirem.
 
 menor_v <- function(faturamento){
    return(min(faturamento))
  }
  maior_v <- function(faturamento){
    return(max(faturamento))
  }
menor_v(faturamento)
maior_v(faturamento)


  acima_media <- function(faturamento){
    dias_acima <- sum(faturamento > mean(faturamento))
    return(dias_acima)
    
    
}
acima_media(faturamento)      

#Questão 4

fat <- c(SP = 6783643,RJ = 3667866,MG = 2922988,ES = 2716548,Outros = 198495)

total_fat <- sum(fat)

percentual <-((fat/total_fat)*100)
percentual

sum(percentual)

#Questão 5

string <- "target"
inverte_string <- function(string){
  
  return(paste(rev(strsplit(string, NULL)[[1]]), collapse = ""))
}
inverte_string(string)
  
  
  
  






