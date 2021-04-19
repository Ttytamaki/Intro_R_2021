# Aula 01 - Conhecendo o R
# Introdução ao R - Oficina de Métodos 2021 Capes Procad Amazônia
#
# ---
#
# Professores:
# Eduardo Ryô Tamaki
# e-mail: eduardo.rtamaki@gmail.com
# Virgílio Mendes
# e-mail: virgilioebm@gmail.com
#
# Monitores:
# Matheus Ferreira
# e-mail: ferreira.dcp@gmail.com

# Depois do # é comentário!!



# operacoes matematicas

3 + 3 # soma

5 - 2 # subtracao

5 * 9 # multiplicacao

9 / 3 # divisao

5 %% 2 # tirar resto da divisao

# sinais de atribuicao

x <- 5 # atribuindo a X o valor 5
x

y <- 2 # atribuindo a Y o valor 2
y

# o R é key sensitive
X # erro porque nao ha X maiusculo salvo no enviroment



# operacoes com objetos

x + y # soma de objetos

z <- x + y
z

t = x + y
t


#  = é diferente de igualdade
# igualdade ==

x == 3 # teste de igualdade

# characteres
w <- "5"
w

frase <- "Oi, meu nome é Virgilio!"
frase

# tirar a classe
class(frase)

class(x)

# vetores

# vetor é um conjunto de elementos
# c() concatenar

q = c(6, 8, 2, 16) # criando um vetor q
q

p = c(2, 34, 15, 1)
p

p - q # operações com vetores

# 
pop_mund = c(2525779, 3026003, 3691173, 4449049, 5320817, 6916183)

pop_mund

# idexação
pop_inicial = c(2525779, 3026003, 3691173)
pop_inicial

pop_secund = c(4449049, 5320817, 6916183)
pop_secund

# indexação de vetores
pop_final = c(pop_inicial, pop_secund, 6916183)
pop_final


# Limpando o ambiente de trabalho
rm(list = ls())

# ls() lista tudo que está no envirolment
# list função para listar
# rm() função para remover


# Data frame

nome = c("Virgilio", "Eduardo", "Matheus")

idade = c(18, 24, 17)

altura = c(1.70, 1.90, 1.65)

# criar um data frame a partir dos vetores
banco = data.frame(nome, idade, altura, stringsAsFactors = T)
banco

class(banco)

# Tirar dúvidas

# pedir ajuda
?rm

?data.frame

?class


ls()


