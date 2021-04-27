# ---
#
# Aula 01 - Conhecendo o R
# Introdução ao R - 2021
# Equalitas Jr.
# ---
#
# Professores:
# Eduardo Ryô Tamaki
# e-mail: eduardo.rtamaki@gmail.com
# Virgílio Mendes
# e-mail: virgilioebm@gmail.com
#
#
# ---
# 19/04/2021
# ---


# soma
5 + 2
# subtração
41 - 6
# divisão
5 / 2
# multiplicação
6 * 3
# resto
5 %% 2

# sinal de atribuição
x <- 1
t = 14

# soma com atribuição
y <- 5 + 2
# subtração com atribuição
z <- 41 - 6

# = é atribuição !!!! Não é igualdade
## == é igualdade
1 == 2

t == 14

# O R é key sensitive
Z

# Textos
k = "Meu nome é Virgílio"
# Tomem cuidado com o tipo de informação que está sendo trabalhada
k/2


# Vetores
vetor = c(1, 2, 3, 4, 5, 6)

# indexação
teste = c(k, t, x, y, z)

# função c() para concatenar

# dia não existe no meu environment
teste = c(k, t, x, y, z, dia)

# chama o primeiro elemento
teste[1]

# tira a classe
class(teste)


# igualdade para objetos e vetores
is.numeric(vetor)
is.character(k)


# limpa todo o enviroment
# rm()   função para remover
# list   declara como lista
# ls()   lista todos os objetos do environment
rm(list = ls())

# Help
?rm
# ou um F1 em cima da função desejada

# Manipulação de texto
nome = "Eduardo"
sobrenome = "Tamaki"

nome
sobrenome

# concatenar vetores depois de converter em 
# caracteres
paste(nome, sobrenome)

# Construindo frases

x1 = "Eu"
x2 = "gosto"
x3 = "de"
x4 = "café!"

# atribuindo caracteres em um objeto
obj1 = paste(x1, x2, x3, x4)
obj1

# transforma tudo em maiuscula
toupper(obj1)
# transforma tudo em minusculo
tolower(obj1)

# busca padroes textuais
grep("gosto", obj1)
grep("odeio", obj1)

# substituição de padrões
gsub("gosto", "odeio", obj1)
gsub("de", "DE", obj1)
gsub(" ", ",", obj1)

# Matrizes

# Linhas e Colunas
A = matrix(data = 1:16, nrow = 4, ncol = 4)

A


#  [linha , coluna]
# A[linha , coluna ]
A[1, 1]

# Atribuindo o valor 2
# ao elemento da matrix A, linha 2, coluna 3
A[2, 3] = 2
# pedindo para o R retornar o valor desse elemento
A[2, 3]
A


# Nomeando as linhas e colunas das matrizes
dimnames(A) = list(row_names = c("1", "2", "3", "4"),
                   col_names = c("1", "2", "3", "4"))
A

?matrix





