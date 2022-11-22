# install.packages("dados")
# install.packages("remotes")
# remotes::install_github("cienciadedatos/dados")


# Bibliotecas -------------------------------------------------------------


library(nycflights13)
library(dados)
library(ggplot2)
library(dplyr)


# -------------------------------------------------------------------------


# Lendo a base de dados ---------------------------------------------------


dados <- clima
View(dados)

# -------------------------------------------------------------------------


# Analise descritiva de dados -------------------------------------------------------

unique(dados$origem)

# Os dados do nosso dataframe foram coletado em 3 aeroportos diferentes.
#  "EWR" "JFK" "LGA"

# Posso verificar a temperatura média em cada aeroporto

EWR <- mean(dados[dados$origem == "EWR",]$temperatura, na.rm = T)
JFK <- mean(dados[dados$origem == "JFK",]$temperatura, na.rm = T)
LGA <- mean(dados[dados$origem == "LGA",]$temperatura, na.rm = T)

# A temperatura média entre os aeroportos varia de entre 54 a 55 graus.

summary(dados)

## aeroportos em que o ponto de condesação maior que a média que é 41.44 no mes de março

table(dados[dados$ponto_condensacao > 41.44 & dados$mes == 3 & dados$dia == 11,]$origem)

# EWR JFK LGA
# 13  13  10


# OS dados dessa tabela são todos referentes ao ano de 2013, então podemos excluir a coluna de ano.
dados = dados[,-2]
# -------------------------------------------------------------------------


# Consultas

# Verificando apenas os dados do dia 04/02/2013:

data <- dados[dados$dia == 4 & dados$mes == 2,]
data[data$origem == "EWR" & data$ponto_condensacao > 10,]



# Classificando os periodos do dia ----------------------------------------
periodo <- NULL
for(i in 1:length(dados$hora)){
  if(dados$hora[i] >= 0 & dados$hora[i] <6){
    periodo[i] = "Madrugada"
  } else if(dados$hora[i] >= 6 & dados$hora[i] <12){
    periodo[i] = "Manhã"
  } else if(dados$hora[i] >= 12 & dados$hora[i] <18){
    periodo[i] = "Tarde"
  }else {periodo[i] = "Noite"}
}

unique(periodo)
table(periodo)

dados <- data.frame(dados,periodo)

# Eu posso verificar qual foi a maior temperatura no periodo da manha do dia 04/02


data <- dados[dados$dia == 4 & dados$mes == 2,]
manha <- data[data$periodo == 'Manhã',]
max(manha$temperatura)
mean(manha$ponto_condensacao)
table(manha$origem)
min(manha$umidade)


# -------------------------------------------------------------------------



