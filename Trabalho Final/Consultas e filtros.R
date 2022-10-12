# install.packages("dados")
# install.packages("remotes")
# remotes::install_github("cienciadedatos/dados")

library(nycflights13)
library(dados)
library(ggplot2)
library(dplyr)

# Lendo a base de dados

dados <- clima
View(dados)

# Consultas

# 1. Usando a base de clima, e considerando que as colunas "dia", "mes" e "ano"
# compõem a data de registro do clima, escreva um código que devolva apenas os dados do dia 04/02/2013:

data <- dados[dados$dia == 4 & dados$mes == 2,]
data[data$origem == "EWR" & data$ponto_condensacao > 10,]
