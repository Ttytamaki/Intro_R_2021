

# Aula 02 - Data frames
# 09/02/2021


# criando um objeto
x <- 5
x
# criando um vetor
y <- c(1, 2, 3, 4)
y
# criando um data frame

nome = c("Virgilio", "Eduardo", "Laura", "Romulo")

idade = c(18, 24, 20, 21)

altura = c(1.71, 1.76, 1.60, 1.75)

banco = data.frame(nome, idade, altura, stringsAsFactors = F)

# FALSE é a mesma coisa que F
# TRUE é a mesma coisa que T

# Visualizar o objeto
View(banco)


# Idexing
banco


# objeto[linha, coluna]

banco[,1] #  primeira coluna

banco[1,] # primeira linha


# indexando elementos 1 e 3 da primeira coluna
banco[c(1, 3), 1]


# Matrix

?matrix

# cria uma matrix QUADRADA de 1 a 16, sendo preenchida
# por coluna
X <- matrix(data = 1:16, nrow = 4, ncol = 4)
X

# cria uma matrix pelas linha
Y <- matrix(1:16, 4, 4, byrow = T)
Y

# = sinal de atribuição
# == teste lógico


# objeto[linha, coluna]
Y[4,2]
Y[ ,4]

# Limpando o ambiente
rm(list = ls())


# --------------------------------------------------------


# mostra o diretorio de trabalho do r
getwd()

# seta o diretório de trabalho do R
setwd("C:/Users/Virgilio/Desktop/Intro_R_2021/Aulas/Aula 02")

# carregar os pacotes
library(readxl) # leitura de bancos de dados .xlsx
library(readr) # leitura de arquivos .csv
library(foreign) # leitura de arquivos .Sav e .Dta
library(writexl) # salvar arquivos em excel

# importa arquivos com separador ,
bd = read.csv("dados_eleicao.csv")

# importa arquivos com separador ;
bd1 = read.csv2("dados_eleicao.csv") 
#importa errado o dados_eleicao.csv


# Salvar bancos de dados:
# csv separado por ;
write.csv2(bd, "meu_banco.csv")
write_csv2(bd, "meu_banco2.csv")

# csv separado por ,
write.csv(bd, "meu_banco3.csv")
write_csv(bd, "meu_banco3.csv")

# excel
write_xlsx(bd, "banco_excel.xlsx")

# RDS
saveRDS(bd, "banco_virgilio.rds") # r base 

write_rds(bd, "banco_virgilio1.rds") # função do readr

# importar banco em .xlsx
banco = read_excel("banco_excel.xlsx")
banco

View(banco)

# importar banco em .rds
banco1 = readRDS("banco_virgilio.rds")


# ---------------------------------------------------

# Limpar o environment
rm(list = ls())

# Estatísticas descritivas
# install.packages("questionr")
library(questionr) # processamento de Surveys 

# pede ajuda
?iris

# nomeando o bd
bd = iris

# nomes das variaveis
names(bd)

# dimensões do banco
dim(bd)

# mostra os 6 primeiros casos
head(bd)

# mostra os 6 ultimos casos 
tail(bd)

# mostra os casos das linhas 10 a 15
# considerando todas as colunas
bd[10:15,]

# classe da variavel
class(bd$Species)

class(bd$Sepal.Length)

# estrutura do banco
str(bd)
# estrutura para varaivel
str(bd$Species)

# resume as informações
summary(bd)
# resume dados para uma variavel
summary(bd$Sepal.Length)

# média
mean(bd$Sepal.Length)

# média com pesos
#weighted.mean()

# mediana
median(bd$Petal.Length)

# valor máximo
max(bd$Petal.Length)

# valor mínimo
min(bd$Sepal.Length)

# desvio padrão
sd(bd$Sepal.Width, na.rm = TRUE)

# Pacote QuestionR
# frequencia de uma variavel
freq(bd$Species)

# descreve a variavel e o banco
describe(bd$Sepal.Length)

# valores únicos
unique(bd$Species)

vetor = c("Oi", " Oi", "oi", "Oi ", "Oi", "Oi", "Oi")

vetor

unique(vetor)

# substitui valores pela posição
bd[1, 1] <- 8

# sustitui valores que respeitam uma condição
bd$Petal.Width[bd$Sepal.Width == 0.2] <- 100


