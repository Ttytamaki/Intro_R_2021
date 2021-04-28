# Aula 02: Data frames 
#
# Eduardo Ryô Tamaki
# e-mail: eduardo.rtamaki@gmail.com
# Virgílio Mendes
# e-mail: virgilioebm@gmail.com
#
# ---
# 27/04/2021
# ---
#
# Material de Apoio:
# Link das aulas: https://github.com/Ttytamaki/Intro_R_2021
#

# Limpar environment
# rm() : remove
# list
# ls() :  lista tudo o que esta environment
rm(list = ls())

# Help
?rm()

# Data frames

nome = c("Virgilio", "Eduardo", "Natália")


idade = c(30, 15 , 18)


altura = c(1.90, 1.75, 1.64)


banco = data.frame(nome, idade, altura)

banco

# Função para visualizar o data frame
# V maiúsculo
View(banco)

# Classe do objeto
class(banco)

# retorna nomes das variaveis
names(banco)

# Indexing
# [linha, coluna]
banco(1, 2) # forma errada

banco[1, 2] # forma correta

# Extrair todas as linhas (ou observações)
banco[, 1]

banco[, "nome"]

# Extrair um num. X linhas TODAS as colunas
banco[c("Virgilio", "Eduardo") , 1] # jeito errado

banco[c(1, 2) , 1] # jeito certo

# [linha, coluna]

# Extraindo a posição do nome entre aspas na coluna 1 do data frame
grep("Virgilio", banco[,1])

# operador dollar: $ 
banco$nome
banco$idade

# Limpa o environment
rm(list = ls())

# Importando bancos de dados

# retorna o diretorio que o R está trabalhando
getwd()

# setar o diretorio em uma pasta 
# essa:
#setwd("C:/Users/Virgilio/Desktop/Intro_R_2021/Aulas/Equalitas - Abril 2021/Aula 02")
# ou essa:
#setwd("C:\\Users\\Virgilio\\Desktop\\Intro_R_2021\\Aulas\\Equalitas - Abril 2021\\Aula 02")


# Instalação de pacotes

# install.packages("readxl")
# install.packages("foreign")
# install.packages("writexl")
# install.packages("readr")


# carregar pacotes
library(readxl) #  Read Excel Files
library(foreign) # Leitura de arquivos (ex: SPSS, dta - Stata)
library(writexl) # Exporta em Excel
library(readr) # Write Data frame in different formats

# Bancos de dados

# bancos de dados inatos
?datasets
datasets::iris

# importação de bancos

# .csv

# importa o banco na extensão .csv separado por ","
bd = read.csv("dados_eleicao.csv")


# salvar o banco bd em extensão .csv separado por ","
write.csv(bd, "banco2.csv")

# salvar o banco bd em extensão .csv separado por ";"
write.csv2(bd, "banco1.csv")

# importa o banco na extensão .csv separado por ";"
bd1 = read.csv2("banco1.csv")

# salvar um banco em excel
write_xlsx(bd, "banco3.xlsx")

# .xlsx
bd2 = read_xlsx("banco3.xlsx")


# Estatisticas descritivas

# mostra os nomes das variaveis
names(bd)

# dimensões do banco
dim(bd)

# mostra os 6 primeiros casos
head(bd)

# mostra os 6 ultimos casos
tail(bd)

# casos de 10 a 20
bd[c(10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20), ]

bd[10:20, c(1, 2)]

# tira a classe da variavel
class(bd)
class(bd$TOTAL_VOTOS)
class(bd$SIGLA_UF)

# resumo das variaveis
summary(bd)
summary(bd$NOME_CANDIDATO)

# estrura do banco
str(bd)

# tirar NA
bd = na.omit(bd)

# media de uma variavel
mean(bd$TOTAL_VOTOS)

mean(bd$TOTAL_VOTOS, na.rm = TRUE)

# mediana
median(bd$TOTAL_VOTOS, na.rm = TRUE)

# desvio padrao
sd(bd$TOTAL_VOTOS, na.rm = TRUE)

# minimo
min(bd$TOTAL_VOTOS)

# maximo
max(bd$TOTAL_VOTOS)


# Fim


bd$TOTAL_VOTOS[bd$TOTAL_VOTOS == "Virgilio"] <- "Estudante"

