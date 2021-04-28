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
# 26/04/2021
#


# Operações

# soma
5 + 2
# subtração
6 - 1
# multiplicação
9 * 4
# divisão
6 / 3
# resto da divisão 
6 %% 3
5 %% 2


# Sinais de atribuição

x <- 5
y <- 100 - 98

z = 7

# Atribuição pode ser feita de 2 formas:
# com o sinal de <-
# com o sinal de =

# Então = (sinal de atribuição) é DIFERENTE de 
# IGUALDADE (==)
x == y

# R é key sensitive
X
# x MAUISCULO é DIFERENTE do x MINUSCULO

# atribuir informações textuais
 
texto = " "

nome = "Eduardo"

sobrenome = "Tamaki"

# Operações com objetos
# Observação: tem que ser NUMÉRICO!
x * y
5 * 2

# Executar
# Ctrl + Enter
# Alt + Enter

# Vetores

# É um conjunto de objetos

# Função concatenar
objeto = c(1, 2, 3, 4, 5)
objeto
objeto1 = c(1, 2, 3, "Eu", 4)
objeto1

# c() cria um vetor

# criando um vetor a partir dos objetos
tropeiro = c(x, y, z)

tropeiro1 = c(x, "y, z")
tropeiro1


# Manipulação de texto

# ""
nome
sobrenome

# classe 
class(nome)
class(objeto)

# retornar em texto
nome_completo = paste(nome, sobrenome)
nome_completo

#  Funções de manipulação de texto
# transforma em maiusculo
toupper(nome_completo)
# transforma em minusculo
tolower(nome_completo)
# busca padrões textuais
grep("Eduardo", nome_completo)
# Retorna posição do elemento que tem o padrão textual
nome1 = c("Virgilio", "Eduardo", "Natalia")
grep("i", nome1)
# Retorna as posições dos elementos que contem o padrão textual "i"
# no meu VETOR nome1

# substitui o caracter
gsub("a", "EEEEE", nome_completo)


# Matriz

# Linhas e Colunas

A = matrix(1:16, nrow = 4, ncol = 4)

A

# [linha, coluna]
# acessa elemento
A[1, 1]
# acessar linha
A[2, ]
# acessar coluna
A[ , 3]

# Representação [linha, coluna]




# Limpa o environment

# rm() : função para remover
# list : transforma em lista
# ls() : lista tudo o que está no environment

# Help
?rm()


rm(list = ls())






