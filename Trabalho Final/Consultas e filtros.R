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


# Limpando os dados -------------------------------------------------------


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

# Usando a base de clima, e considerando que as colunas "dia", "mes" e "ano"
# compõem a data de registro do clima, escreva um código que devolva apenas os dados do dia 04/02/2013:

data <- dados[dados$dia == 4 & dados$mes == 2,]
data[data$origem == "EWR" & data$ponto_condensacao > 10,]
