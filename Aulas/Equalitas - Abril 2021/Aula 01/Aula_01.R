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
# 26/04/2021
# ---
#
# Material de Apoio:
# Link das aulas: https://github.com/Ttytamaki/Intro_R_2021
#

# TOPICOS:

#         - Ambiente do RStudio
#              * Funções
#                  * Recursos do RStudio (ferramentas, etc)
# 
#         - Operações Básicas
#         - Objetos (classe e tipos de dados)
#         - Matriz
#         - Data frames

## PREAMBULO -----------------------------------------------------------

# Limpando nosso ambiente:
rm(list = ls())

##----------------------------------------------------------------------

# Duvidas --------------------------------------------------------------

??função

# Clicar na tecla F1 quando o cursor estiver na palavra

# Para dúvidas, consultar a comunidade: https://stackoverflow.com/



# operações básicas ----------------------------------------------------

5 + 7 # soma
5 - 2 # subtração
5 * 2 # multiplicação
5 / 2 # divisão
5 %% 2 # resto da divisão


# sinais de atribuição -------------------------------------------------

# sinal de atribuição
x <- 5
x

y = 5
y

# atribuindo ao objeto X o valor 1
x <- 1
x

# atribuindo ao objeto y o valor 2
y = 2
y

# atribuindo a z o resultado da subtração
z = 40 - 30
z
Z # Mostrar que é Case sensitive

# soma de objetos
x + y
2 * z

# atribuindo a um objeto ob1 o resultado da divisão
ob1 = z / y
ob1


# Character
k <- "Oi, Meu nome é Virgilio"
k/2 # Mostrar que não podemos fazer operações com Strings

# operações com objetos
x + y 
x * y
x / y


# Vetores --------------------------------------------------------------

# Vetores

x = c(6, 8, 10, 3) # comnado c() cria um vetor - função concatenar
y = c(4, 6, 3, 5) 

# operações com vetores devem ter vetores com o mesmo nunero de elementos
x + y # operações com vetores
x - y
x * y
x / y
z <- x + y + 10

# Vetores representam um conjunto de informação que é armazenado em uma ordem específica. Utilizamos
# a função “c()”, que significa “concatenar”, para criar um vetor com multiplos valores, com virgulas os
# separando.

# Por exemplo: Empresas Juniores em Belo Horizonte
ejs <- c(25, 30, 18, 23, 15, 19, 27)

ejs


# A função c() também pode ser usada para concatenar VETORES
ejs_first <- c(25, 30, 18)
ejs_second <- c(23, 15, 19)
ejs_all <- c(ejs_first, ejs_second, 27)
ejs_all

# Classe ---------------------------------------------------------------

# comando para saber a classe do dado/vetor/conjunto
class(x)
# x é classe numeric = números que assumem casas decimais


# Character ------------------------------------------------------------

# dados do tipo character (texto)
nome = "Virgilio"
sobrenome = "Mendes"

# chamando o objeto
nome
sobrenome
# chamando a classe do objeto nome
class(nome)


# Manipulando Texto ----------------------------------------------------

# funções básicas para manipulação de texto

# paste mostra objeto no console
paste(nome, sobrenome)

p1 = "Eu"
p2 = "gosto"
p3 = "de"
p4 = "café"

paste(p1, p2, p3, p4)

# usando paste e separador com ,
paste(p1, p2, p3, p4, sep = ",")


frase = paste(p1, p2, p3, p4) # criando objeto da frase a partir do paste
tolower(frase) # todos os caracteres em minusculo
toupper(frase) # todos os caracteres em maiusculo
frase

grep("não!", frase) # função de buscar padrões de texto
grep("gosto", frase)
grep("escola", frase) # busca padrões textuais  
grep("café", frase) # busca padrões textuais


gsub("gosto", "odeio", frase) # substituição de caracteres
gsub("de", "DE", frase) # função de substituição de caracteres (substituição de "de" por "DE")

# estas são estruturas unidimencionais, vetores, 
# que conjuntos de dados de apenas uma dimensão

# Matrizes -------------------------------------------------------------

# Linhas e colunas - Estruturas de dados bidimensionais

# Matrizes e bancos de dados
A = matrix(data = 1:16, nrow = 4, ncol = 4)
A # criando matrix 4 por 4 (numeros de 1 a 16)

# Linhas 
# representação [1,]
# Colunas 
# representação [,1]
A[2,4]


# Data Frames (Extra) --------------------------------------------------

# Data frames

nome = c("Virgilio", "Eduardo", "Guilherme")
idade = c(52, 24, 29)
altura = c(1.71, 1.76, 1.78)

banco = data.frame(nome, idade, altura)
?data.frame

class(banco$nome) # Tira classe da variavel

View(banco) # Visualiza df
banco

names(banco)

names(banco) <- c("Alunos", "Idade", "Altura")

names(banco)

# Indexing:
banco[1]
banco(1)

banco[1,1]

# Extraindo TODAS as linhas (ou observações) de uma determinada coluna:
banco[, 1]
banco[, "Alunos"]

# Extraindo um número X de linhas e TODAS as colunas:
banco[c(1, 2, 3), ]
banco[1:2, ]
banco[c(1,4), ]

# Extraindo um número X de linhas de UMA coluna específica:
banco[c(1:3), "Idade"]


# Quando queremos extrair informações de uma coluna (ou variável) específica:

seq(from = 1, to = 5, by = 2)
seq(1, 5, 2)

seq(to = 5,  by = 2, from = 0)
seq(5, 2, 0)
?seq

seq(5, length.out = 10)


banco$Alunos

banco$Idade[seq(from = 1, to = 4, by = 2)]
banco$Idade[1:3]



# Limpar Enviroment ----------------------------------------------------

# remove o objeto x do enviroment
rm(x)


# removem todos os objetos do enviroment
rm(list = ls())

rm(list = ls(all=T))

# help para função remove (rm)
?rm

options(scipen = 999) # tira notação científica


# Fim ------------------------------------------------------------------




