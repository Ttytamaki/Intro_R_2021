# ---
#
# Aula 02 - Data frames
# Introdução ao R
#
# ---
#
# Professores:
# Eduardo Ryô Tamaki
# e-mail: eduardo.rtamaki@gmail.com
# Virgílio Mendes
# e-mail: virgilioebm@gmail.com
#
# ---
# 20/04/2021
# ---
#
# Material de Apoio:
# Link das aulas: https://github.com/Ttytamaki/Intro_R_2021
#

# limpa environment
rm(list = ls())

# Data frames
nome = c("Virgilio", "Eduardo", "Hugo") 
nome
idade = c(42, 16, 25)
idade
altura = c(1.71, 1.80, 1.60)
altura

# Decimais no R são .


# Criação do data frame a partir dos vetores
#data.frame()
banco = data.frame(nome, idade, altura)

# banco[linha, coluna]
banco[1, ]
banco[ , 3]

# classe
class(banco$nome)

# o operador $ acessa as variaveis do data frame

# Indexing

banco(1) # forma errada!

# formas diferentes
banco[1]
banco[,1]

# Extrair informações de uma coluna
banco[,1]
banco[, "idade"]

# extrair um número de linhas e todas as colunas
banco[c(1,2) , 3]

## --------------------------


rm(list = ls())

# Instala os pacotes 
# install.packages("dplyr")

library(readxl) # lê arquivos excel
library(questionr) # funções para surveys
library(dplyr) # gramatica para manipulação de dados
library(foreign) # Lê formatos de SPSS e Stata
library(writexl) # exportar dados em excel
library(readr) # exportar dados em diferentes formatos

# Bancos de dados inatos do R
?iris
?Titanic
datasets::Titanic

# pegar o diretorio
getwd()
# setar o diretorio
setwd("C:/Users/Virgilio/Desktop/Intro_R_2021/Aulas/Equalitas - Abril 2021/Aula 02")

setwd("C:\\Users\\Virgilio\\Desktop\\Intro_R_2021\\Aulas\\Equalitas - Abril 2021\\Aula 02")

# importação do banco
# carrega banco em formato CSV com separador ","
bd = read.csv("dados_eleicao.csv")
bd1 = read_csv("dados_eleicao.csv")

# salvar o banco de dados em .CSV com separador ","
write.csv(bd, "meu_banco1.csv")
# salvar o banco de dados em .CSV com separador ";"
write.csv2(bd, "meu_banco2.csv")


# carrega banco em formato CSV com separador ";"
bd2 = read.csv2("meu_banco2.csv")
bd3 = read_csv2("meu_banco2.csv")

# salvar o banco em excel
write_xlsx(bd, "meu_banco3.xlsx")

# ler dado em excel
bd4 = read_excel("meu_banco3.xlsx")

# RDS
# salva o banco em RDS
saveRDS(bd, "meu_banco.rds")

# carregar o banco em RDS
bd5 = readRDS("meu_banco.rds")

# Estatisticas descritivas

# variaveis
names(bd)

# dimensoes
dim(bd)

# retorna os 6 primeiros casos
head(bd)

# retorna os 6 ultimos casos
tail(bd)

bd[c(1,2,3,4,5,6) , ]
bd[c(10:20) , ]

# classe do banco de dados
class(bd)
# classe de variavel
class(bd$SIGLA_UF)

# resumo
summary(bd$TOTAL_VOTOS)

# estrutura 
str(bd)

# na.rm ele não considera valores missing na estatistica

# max
max(bd$TOTAL_VOTOS, na.rm = T)

# min
min(bd$TOTAL_VOTOS, na.rm = T)

# desvio padrão
sd(bd$TOTAL_VOTOS, na.rm = T)

# media
mean(bd$TOTAL_VOTOS, na.rm = T)

# mediana
median(bd$TOTAL_VOTOS, na.rm = TRUE)

# valores lógicos
# T
# TRUE
# F
# FALSE

# tabelas

# pacote questionr
# freq
freq(bd$SIGLA_UF)

# table cruzada
table(bd$SIGLA_PARTIDO, bd$ANO_ELEICAO)



# tabela de proporção
t1 = table(bd$SIGLA_PARTIDO, bd$ANO_ELEICAO)
prop.table(t1) * 100

t2 = prop.table(table(bd$SIGLA_PARTIDO, bd$ANO_ELEICAO)) * 100

# ajustar as casas decimais
# round(objeto, num de casa decimais) 
round(prop.table(table(bd$SIGLA_PARTIDO, bd$ANO_ELEICAO)) * 100, 2)

round(t2, 2)

# class
class(t2)

# classe "table" não exporta com as funções que vimos hoje
# para isso convertemos a classe do objeto
t2 = as.data.frame(t2)

# salva a tabela convertida
write.csv(t2, "tabela1.csv") # ","
write.csv2(t2, "tabela2.csv") # ";"
write_xlsx(t2, "tabela3.xlsx") # excel






