# ---
#
# Aula 05 - Encerramento
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
# 23/04/2020
# ---
#
# Material de Apoio:
# Ggplot Website: https://ggplot2.tidyverse.org/index.html
# Dplyr Cheat Sheet: https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
#

## PREAMBULO -------------------------------------------------------------------


## Apply:
# Uma forma de substituir os famosos "loops"

### 1) Apply
# Apply recebe:
## Input: Data Frame ou Matriz, ou Objeto
## Output: Vetor ou lista
### Função: apply(x, margin, fun)
# x: Matriz ou Data Frame
# margin: Vamos fazer a operação em qual sentido?
## 1: Linhas
## 2: Colunas
# fun: função

m1 <- matrix(1:10, nrow = 5, ncol = 6)
m1

apply(m1, 2, sum)
apply(m1, 1, sum)



### 2) lapply:
# Indicado para operações que retornem para gente uma lista de objetos com o mesmo
# comprimento da original
## lapply(x, fun)
# x: Vetor, objeto, Data Frame
# fun: função

x <- 1:10
x

t <- lapply(x, sum)

# Acessando elementos da lista
t[1]
# Errado: t[1, 1] - Num. de Dimensões


### 3) sapply:
# Mesma coisa do lapply, mas retorna um VETOR ou uma MATRIZ
x <- 1:10
x
t <- sapply(x, sum)


### 4) tapply:
# Aplica uma função em cada variável de um data frame (em cada coluna de uma matriz):
# A diferença é que a função conta com o equivalente do 
# group_by do dplyr
## tapply(x, indice, fun)
# x: objeto
# indice: por qual variável iremos agrupar;
# fun: função

library(dplyr)

iris %>%
  group_by(Species) %>%
  summarise(media = mean(Sepal.Width))

tapply(iris$Sepal.Width, iris$Species, mean)




### Exemplo:
# O meu objetivo seria filtrar a UF para o Pará e construir um novo banco de dados 
# a partir das categorias de CLASSE e DATA com as seguintes variáveis: 
## Data; 
## Desmatamento consolidado; 
## Desmatamento recente;
## Floresta Primária;
## Outros. 
# Na célula de cada variável desse banco eu queria saber a 
# frequência do número de FOCOS nas variáveis do banco por DATA.


db <- read.csv(file.choose())


# 1a Olhada no Banco:
dim(db)
str(db)
summary(db)
names(db)

## Identificamos:
### class: Character
### data: nome da variável

# 1o Passo:
## Vamos FILTRAR o banco de dados, pegando apenas a UF do Para
## Aproveitaremos para RENOMEAR a variável data, para um nome mais amigável:
db_n <- db %>%
  filter(uf == "para") %>%
  rename(data = ï..date)

## Agora vamos arrumar a classe da variável Class:
db_n$class <- as.factor(db_n$class)


## Verificando:
summary(db_n)


###### ###### 1o Jeito ###### ###### 
## Usando o que aprendemos com Dplyr ##
###### ###### ###### ###### ###### 

# 2o Passo:
## Transformar o Banco

### 2.1) Vamos criar um Banco de Dados com as Variáveis Que vamos Usar:
## unique(x)
data <- unique(db_n$data)
desm_cons <- NA
desm_rec <- NA
flores <- NA
outros <- NA

## Criando o banco:
db_dplyr <- data.frame(data, desm_cons, desm_rec, flores, outros)
db_dplyr  

### 2.2) Preencher o Banco usando funções que aprendemos:
#### arrange()
#### filter()
#### select()
#### rename(

#### 2.2.1) Variável Data:
## Reorganizar a Variável Data para ficar de maneira CRESCENTE:
db_dplyr <- db_dplyr %>%
  arrange(data)

#### 2.2.2) Variável Desmatamento Consolidado:
## Filtrar o banco db_n pela classe "Desmatamento Consolidado" E
## Reorganizar os dados de acordo com a variável data de maneira CRESCENTE (para que tenha a
## mesma ordem das datas) E
## SELECIONAR apenas os valores da variável FOCUSES
db_dplyr$desm_cons <- db_n %>% 
  filter(class == "Desmatamento Consolidado") %>% 
  arrange(data) %>%
  select(focuses) %>%
  rename(desm_cons = focuses)

#### 2.2.3) Variável Desmatamento Recente:
## Filtrar o Banco db_n pela classe "Desmatamento Recente" E
## Reorganizar os dados de acordo com a variável data de maneira CRESCENTE (para que tenha a
## mesma ordem das datas) E
## SELECIONAR apenas os valores da variável FOCUSES
db_dplyr$desm_rec <- db_n %>%
  filter(class == "Desmatamento Recente") %>%
  arrange(data) %>%
  select(focuses) %>%
  rename(desm_rec = focuses)

#### 2.2.4) Variável Floresta:
## Filtrar o Banco db_n pela classe "Floresta" E
## Reorganizar os dados de acordo com a variável data de maneira CRESCENTE (para que tenha a
## mesma ordem das datas) E
## SELECIONAR apenas os valores da variável FOCUSES
db_dplyr$flores <- db_n %>%
  filter(class == "Floresta") %>%
  arrange(data) %>%
  select(focuses) %>%
  rename(flores = focuses)

#### 2.2.4) Variável Outros:
## Filtrar o Banco db_n pela classe "Outros" E
## Reorganizar os dados de acordo com a variável data de maneira CRESCENTE (para que tenha a
## mesma ordem das datas) E
## SELECIONAR apenas os valores da variável FOCUSES
db_dplyr$outros <- db_n %>%
  filter(class == "Outros") %>%
  arrange(data) %>%
  select(focuses) %>%
  rename(outros = focuses)


db_dplyr



###### ###### 2o Jeito ###### ###### 
## Usando o que aprendemos do Apply ##
###### ###### ###### ###### ###### 

db_n

## Funções que precisamos saber:
### list() - Lista
### rownames() - Nome das Linhas
### nrow() - Numero de Linhas

# Função tapply(x, indice, fun):

db_apply <- tapply(db_n$focuses, list(db_n$data, db_n$class), sum) %>%
  data.frame()

db_apply$data <- rownames(db_apply)
rownames(db_apply) <- 1:nrow(db_apply)

db_apply
