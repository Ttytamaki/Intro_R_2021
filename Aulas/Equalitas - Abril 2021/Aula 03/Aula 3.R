# ---
#
# Aula 03 - Dplyr
# Equalitas - Introdução ao R 2021
#
# ---
#
# Professores:
# Eduardo Ryô Tamaki
# e-mail: eduardo.rtamaki@gmail.com
#
# Virgílio Mendes
# e-mail: virgilioebm@gmail.com

# ---
# 21/04/2020
# ---
#
# Material de Apoio:
# Dplyr Website: https://dplyr.tidyverse.org/
# Dplyr Cheat Sheet: https://rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
#

## PREAMBULO -------------------------------------------------------------------



# Limpar o Environment:
rm(list = ls())

# Carregar o pacote Dplyr
library(dplyr)


# Se você não está usando um PROJETO
## Help: ?setwd()
?setwd()

"C:\Users\Dutt\Desktop\IntroR"

# Para definir um diretório: 
## \\
"C:\\Users\\Dutt\\Desktop\\IntroR"
## /
"C:/Users/Dutt/Desktop/IntroR"

setwd("C:\\Users\\Dutt\\Desktop\\IntroR")

# Forma Alternativa:
## setwd() + argumento: choose.dir()
setwd(choose.dir())

# Para ver qual nosso diretório:
getwd()



##----------------------

# Como Lidar com NAs


## Iris: É um banco de dados três espécies de Iris (planta), classificadas de acordo com quatro variáveis: largura e comprimento da sépala, e largura e comprimento da pétala

# Names:
## NOMES das colunas do nosso Banco de Dados;
### names(x): x - Objeto
names(iris)

# Dim:
## dim(x): x - Objeto
### Dimensões do nosso objeto (Num. de linhas e colunas)
?dim()
dim(iris)

# str:
## str(x): x - Objeto
### Estrutura do nosso objeto (Um "resumão")
?str
str(iris)

# summary:
## summary(x): x - Objeto
### Resumo do nosso objeto
summary(iris)




## Iris2
# Para importar um banco ".csv":
## read.csv - Separador for ","
## read.csv2 - Separador for ";"

iris2 <- read.csv("iris2.csv")
# Sempre lembrar de colocar a extensão do arquivo:
## .csv, .xlsx ...

# Forma mais manual:
## read.csv(file.choose()): file.choose() - Abrir uma janela para seleção manual
# iris2 <- read.csv(file.choose())

dim(iris)
dim(iris2)

# View:
## View(x): x - Objeto; View é com "V" Maiusculo;
View(iris2)
### !: View vai abrir o banco de dados, se o seu banco de dados for muito extenso,
### pode-se ter problemas;



# Character e Factor:
## character - "palavra"
## factor - categórica
str(iris)
summary(iris)


str(iris2)
summary(iris2)


## Transformar a variável Species em categoria:
## as.factor(x): 

as.numeric()
as.character()
as.factor()

as.factor(iris2$Species)


iris2$Species <- as.factor(iris2$Species)

# class:
class(iris2$Species)
summary(iris2)



# Identificar se temos NAs ou não:
## is.na(x): x - Objeto
## Output: TRUE ou FALSE
is.na(iris2)

## sum(x): x - Input
### Soma o que a gente fornece

## sum() + is.na()
### sum(is.na(x)): x - Objeto
sum(is.na(iris2))


## Argumento: na.rm
## na.rm : na remove 
### TRUE/T (verdadeiro) 
### FALSE/F (falso)
# na.rm = T

mean(iris2$Sepal.Length, na.rm = T)


## na.exclude()
### na.exclude(x): x - Objeto
## Excluir NAs
## ! - Row Wise

na.exclude(iris2)

summary(iris2)


iris3 <- na.exclude(iris2)
summary(iris3)

iris2 <- iris2
iris3 <- na.exclude(iris2)


# Limpar nosso Environment:
rm(list = ls())


###---------------------


# Dplyr:

## Banco de dados: iris


# 1) Glimpse e Arrange:
## Glimpse - Olhada de relance;
# glimpse(x): x - Objeto
glimpse(iris)


### dbl <double>: números reais;
### int <integer>: números inteiros;
### fct <factor>: categóricas;
### chr <character>: caracteres;
### tibble: Data frame



## Arrange - Arranjar
# arrange(x, y):
## x - Objeto;
## y - Coluna que vai servir de base;
### Default: Crescente
arrange(iris, Sepal.Width)

### Para ficar Descrescente:
## desc()
arrange(iris, desc(Sepal.Width))


# 2) Select e Filter:
## Select - Seleciona;
# select(x, y):
## x - Objeto, Banco de Dados;
## y - Quais variáveis queremos selecionar;
select(iris, Species, Sepal.Width)

bd <- select(iris, Species, Sepal.Width)

bd
names(bd)
glimpse(bd)

# "c()"
select(iris, c(Species, Sepal.Width))


# Deletar ao invés de Selecionar:

select(iris, -Species, Sepal.Width)
select(iris, -Species, -Sepal.Width)

bd_n <- select(iris, -c(Species, Sepal.Width))

dim(bd_n)
names(bd_n)

## Ordem do Select Importa:
bd <- select(iris, c(Sepal.Width, Species))


## Filter - Filtra;

### Mais dois Operadores Lógicos:
# & - AND ou "E"
# | - OR ou "OU"
# ! - Negação
## filter(x, y):
### x - Objeto, Nosso Banco de Dados de onde vamos Tirar as informações;
### y - As condições, ou "como vamos filtrar";

filter(iris, Species == "versicolor")
filter(iris, Sepal.Length > 5)

# COMBINAR:

filter(iris, Species == "versicolor" & Sepal.Length > 5)
filter(iris, Species == "versicolor" | Species == "setosa")

filter(iris, ! Species == "versicolor")
filter(iris, !(Species == "versicolor" & Sepal.Length > 5))
filter(iris, !(Species == "versicolor" | Sepal.Length > 5))


bd_n2 <- filter(iris, Species == "versicolor")
bd_n2


## Podemos também combinar as duas funções (select e filter)
### Por exemplo: Imagine que estamos estudando as pétalas do tipo versicolor,
### e queremos filtrar o banco para obtermos APENAS as obs. que são do tipo 
### versicolor e que que possuem um comprimento de petala MAIOR que 4.3;
### Além disso, só nos interessam as varíaveis Species, Petal.Length e Petal.Width;
# NÂO ESTAMOS ESTUDANDO AS SEPALAS, APENAS PETALAS

nome_qualquer <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)
nome_qualquer <- select(nome_qualquer, c(Petal.Length, Petal.Width, Species))
nome_qualquer





# 3) Rename e Mutate
## Rename - Renomear
### Renomear colunas (ou variáveis) de um Data Frame (Banco de Dados)
## rename(x, y):
### x - Objeto, nosso Banco de Dados
### y - Variável que queremos renomear:
#### y -> nome_novo = nome_antigo
rename(iris, largura_sepala = Sepal.Width)

# Renomear mais que uma variável:
rename(iris, c(largura_sepala = Sepal.Width, 
               tipo = Species))


## Mutate - Mudar/Transformar
### Usa Mutate para criar novas variáveis;
## mutate(x, y):
### x -> Objeto, o Banco de Dados
### y -> Variável que queremos criar:
#### y -> nome_nova_variavel = operação
mutate(iris, Sepala = Sepal.Width + Sepal.Length)
mutate(iris, sepala = mean(Sepal.Width + Sepal.Length))

# rowMeans(x):
## x -> Variáveis que eu quero tirar a média;
mutate(iris, sepala = rowMeans(select(iris, Sepal.Width,  Sepal.Length)))


######

## Pipe %>%
## Pipeline (Encanamento ou Canal)
### Pipe (%>%) faz com que o objeto da esquerda seja o primeiro argumento,
### ou o objeto ao que
### o que está na direita será aplicado sobre:

### Tudo que está na direita, vai ser aplicado sobre o que está na esquerda;

sum(1:10)

1:10 %>% sum()


# Código Original:
nome_qualquer <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)

# Com pipe %>%:
nome_qualquer <- iris %>%
  filter(Species == "versicolor" & Petal.Length > 4.3)


# Código Original:
rename(iris, largura_sepala = Sepal.Width)

# Com Pipe %>%:
nome_qualquer2 <- iris %>%
  rename(largura_sepala = Sepal.Width)



### A função principal do operador %>%, além de facilitar a escrita do código,
## é torna-lo mais fácil de ler, por exemplo:

# Código Original:
nome_qualquer <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)
nome_qualquer <- select(nome_qualquer, c(Petal.Length, Petal.Width, Species))

# Com Pipe %>%:











######

## Split, Apply e Combine:
### Dividir, aplicar uma função, e depois juntar:
### No Dplyr, esse processo é representado pelas funções "group_by()" e 
### "summarise()".
### No entanto, antes vamos aprender o que essas funções fazem:


### group_by()
## group_by(x):
### x -> A(s) variável(is) que queremos "agrupar"
View(iris %>%
  group_by(Species))


View(iris)


### summarise()
## resumir os dados em uma unica linha
## summarise(x, y):
### x - Banco de dados;
### y - O que queremos fazer;

iris %>%
  summarise(avg = mean(Sepal.Length))

mean(iris$Sepal.Length)


# n()
iris %>%
  summarise(cont = n())



## Juntando os dois:

iris %>%
  group_by(Species) %>%
  summarise(avg_petala = mean(c(Petal.Length, Petal.Width)))

iris %>% 
  group_by(Species, Petal.Width) %>%
  summarise(cont = n()) 



#### SE DER TEMPO


## Frequencia
iris %>%
  group_by(Species) %>%
  summarise(n = n()) %>%
  mutate(freq = n / sum(n))



iris %>%
  group_by(Species) %>%
  summarise(n = n()) %>%
  mutate(perc = round(prop.table(n)*100, 0))





View(iris %>%
       rowwise() %>%
       mutate(Sepala = mean(c(Sepal.Width, Sepal.Length))))



## Verbo Auxiliar:
# case_when()

?case_when()

iris %>%
  mutate(Setosa = case_when(
    Species == "setosa" ~ "Setosa",
    TRUE ~ "Outros"
  ))


iris2 <- read.csv("iris2.csv")

iris2 %>%
  mutate(Setosa = case_when(
    Species == "setosa" ~ "SETOSA",
    is.na(Species) ~ NA_character_,
    TRUE ~ "OUTROS"
  ))

# is.na()
# NA_character_ : NAs Character
# NA_real_ : NAs numérico


