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
# 30/04/2020
# ---
#
# Material de Apoio:
# Ggplot Website: https://ggplot2.tidyverse.org/index.html
# Dplyr Cheat Sheet: https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
#

## PREAMBLE --------------------------------------------------------------------

# limpa environment:
rm(list = ls())


## PARTE 1 ---------------------------------------------------------------------


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
  select(focuses)

#### 2.2.3) Variável Desmatamento Recente:
## Filtrar o Banco db_n pela classe "Desmatamento Recente" E
## Reorganizar os dados de acordo com a variável data de maneira CRESCENTE (para que tenha a
## mesma ordem das datas) E
## SELECIONAR apenas os valores da variável FOCUSES
db_dplyr$desm_rec <- db_n %>%
  filter(class == "Desmatamento Recente") %>%
  arrange(data) %>%
  select(focuses)

#### 2.2.4) Variável Floresta:
## Filtrar o Banco db_n pela classe "Floresta" E
## Reorganizar os dados de acordo com a variável data de maneira CRESCENTE (para que tenha a
## mesma ordem das datas) E
## SELECIONAR apenas os valores da variável FOCUSES
db_dplyr$flores <- db_n %>%
  filter(class == "Floresta") %>%
  arrange(data) %>%
  select(focuses)

#### 2.2.4) Variável Outros:
## Filtrar o Banco db_n pela classe "Outros" E
## Reorganizar os dados de acordo com a variável data de maneira CRESCENTE (para que tenha a
## mesma ordem das datas) E
## SELECIONAR apenas os valores da variável FOCUSES
db_dplyr$outros <- db_n %>%
  filter(class == "Outros") %>%
  arrange(data) %>%
  select(focuses)


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

## PARTE 2 ---------------------------------------------------------------------

# Tabelas ----------------------------------------------------------------------

# Se os pacotes necessários não estiverem instalados, faça a instalação
if (! "readr" %in% installed.packages()) install.packages("readr")
if (! "writexl" %in% installed.packages()) install.packages("writexl")

# carrega pacotes
library(readr) # exporta em .csv e .txt
library(writexl) # exporta em excel


# comando para tirar tabelas de frequencia e proporção
table(iris$Species)

# Cruzamentos de variaveis
t1 = table(iris$Sepal.Width, iris$Species) # tabela de numeros absolutos

# para calcular percentual
prop.table(t1)*100 
# ou 
prop.table(table(iris$Sepal.Width, iris$Species))*100

# para calcular 100% fechando na linha, 
# usamos o parâmetro margin = 1
t2 = prop.table(t1, margin = 1)*100

# para limitar em 2 casas decimais depois da virgula usamos
# a função round(): primeiro termo é a tabela ou a informação que deve ser
# arredondada e o segundo termo a quantidade de casas decimais depois da virgula
t3 = round(prop.table(t1, margin = 1)*100, 2) # o numero 2 é a quant. de casas dec.

# por defaul t3 é formato "table"
# para exportar temos que converter em dataframe
class(t3)

t3 = as.data.frame(t3)

class(t3)

# Salvando a tabela em Excel
write_xlsx(t3 , "tabela_1.xlsx")
# Salvando a tabela em .CSV com separador ","
write_csv(t3 , "tabela_2.csv")
# Salvando a tabela em .CSV com separador ";"
write_csv2(t3 , "tabela_3.csv")

# Gráficos ---------------------------------------------------------------------

# Se os pacotes necessários não estiverem instalados, faça a instalação
if (! "ggplot2" %in% installed.packages()) install.packages("ggplot2")
if (! "gridExtra" %in% installed.packages()) install.packages("gridExtra")

# carrega pacotes
library(ggplot2)
library(dplyr)
library(gridExtra)

# Caso tenham limpado o banco origirnal, executar:
db = read.csv("incendios_ativos.csv")
# ou o seguinte codigo:
db <- read.csv(file.choose())

# Passos:
# Tipos de desmatamento ao longo dos anos no Pará:
# Gráfico de Barras e de Linhas
#
# Elementos novos do Ggplot2:
# Facets
# Paleta de cores
# Geom_col (barras)
# Geometrias conjugadas (point + line)

# Antes de criar as visualizações vamos processar os dados:
db_final = db %>% filter(uf == "para") %>% 
  rename(date = `ï..date`,
         classe = class) # renomear variavel class

View(db_final)

# Primeiro gráfico:


## Paleta de cores
# https://www.color-hex.com/color-palettes/
paleta <- c( "#0D50D8", "#C70039", "#5DADE2", "#2ca25f", "#e34a33")

## -----------------------------------------------------------------------------
# Grafico de serie historica (linha)

# passo 1: Base
ggplot(db_final, aes(x = date, y = focuses, group = classe)) + 
  geom_line() 


# passo 2: Elementos já aprendidos
ggplot(db_final, aes(x = date, y = focuses, group = classe)) + 
  geom_line(size = 2, aes(color = factor(classe))) +
  theme_minimal() +
  labs(title = "Número de Incêndio | Por mês", subtitle = "No Pará",
       y = 'Focos de incêndio', x ='Data',
       caption = "Fonte: Intro. R - 2021") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5))

# passo 3: Customizando textos e legenda
ggplot(db_final, aes(x = date, y = focuses, group = classe)) + 
  geom_line(size = 2, aes(color = factor(classe))) +
  theme_minimal() +
  labs(title = "Número de Incêndio | Por mês", subtitle = "No Pará",
       y = 'Focos de incêndio', x ='Data',
       caption = "Fonte: Intro. R - 2021") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5)) +
  # customiza eixo y
  theme(axis.title.y = element_text(size = 15), 
        axis.text.y = element_text( size = 15)) +
  # customiza eixo x
  theme(axis.title.x = element_text(size = 15),
        axis.text.x = element_text(size = 12, angle = 45, vjust = .5)) +
  # Customiza titulo e subtitulo
  theme(plot.title = element_text(size = 20),
        plot.subtitle = element_text(size = 20)) +
  # Customiza a legenda 
  theme(legend.position = "bottom", 
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, color = "black")) +
  # paleta de cor
  scale_color_manual(values = paleta, name = "Situação")

# passo 4: Incluindo outra geometria
ggplot(db_final, aes(x = date, y = focuses, group = classe)) + 
  geom_point(size = 4, aes(color = factor(classe))) +
  geom_line(size = 2, aes(color = factor(classe))) +
  theme_minimal() +
  labs(title = "Número de Incêndio | Por mês", subtitle = "No Pará",
       y = 'Focos de incêndio', x ='Data',
       caption = "Fonte: Intro. R - 2021") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5)) +
  # customiza eixo y
  theme(axis.title.y = element_text(size = 15), 
        axis.text.y = element_text( size = 15)) +
  # customiza eixo x
  theme(axis.title.x = element_text(size = 15),
        axis.text.x = element_text(size = 12, angle = 45, vjust = .5)) +
  # Customiza titulo e subtitulo
  theme(plot.title = element_text(size = 20),
        plot.subtitle = element_text(size = 20)) +
  # Customiza a legenda 
  theme(legend.position = "bottom", 
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, color = "black")) +
  # paleta de cor
  scale_color_manual(values = paleta, name = "Situação")

# passo 5: Salva
#ggsave("aula05_linha_1.png", height = 8, width = 12, dpi = 300)



## -----------------------------------------------------------------------------
# Grafico de barras


# passo 1: Base - Geom_col != Geom_bar
ggplot(db_final, aes(x = date, y = focuses)) +
  geom_col() 

# passo 2: Diferença do preenchimento das barras
ggplot(db_final, aes(x = date, y = focuses, fill = classe)) +
  geom_col()

ggplot(db_final, aes(x = date, y = focuses, fill = classe)) +
  geom_col(position = "fill")

ggplot(db_final, aes(x = date, y = focuses, fill = classe)) +
  geom_col(position = "dodge")

# passo 3: Customizando textos e legenda
ggplot(db_final, aes(x = date, y = focuses, fill = classe)) +
  geom_col() +
  theme_minimal() +
  labs(title = "Número de Incêndio | Por mês",
       subtitle = "No Pará",
       x = "Data", y = "Focos de incêndio",
       caption = "Fonte: Intro. R - 2021") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5)) +
  # customiza eixo y
  theme(axis.title.y = element_text(size = 15), 
        axis.text.y = element_text( size = 15)) +
  # customiza eixo x
  theme(axis.title.x = element_text(size = 15),
        axis.text.x = element_text(size = 12, angle = 45, vjust = .5)) +
  # Customiza titulo e subtitulo
  theme(plot.title = element_text(size = 20),
        plot.subtitle = element_text(size = 20)) +
  # Customiza a legenda 
  theme(legend.position = "bottom", 
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, color = "black")) +
  # paleta de cor a função aqui é outra
  scale_fill_manual(values = paleta, name = "Situação")

# passo 4: Incluindo as facets
ggplot(db_final, aes(x = date, y = focuses, fill = classe)) +
  geom_col() +
  theme_minimal() +
  labs(title = "Número de Incêndio | Por mês",
       subtitle = "No Pará",
       x = "Data", y = "Focos de incêndio",
       caption = "Fonte: Intro. R - 2021") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5)) +
  # customiza eixo y
  theme(axis.title.y = element_text(size = 15), 
        axis.text.y = element_text( size = 15)) +
  # customiza eixo x
  theme(axis.title.x = element_text(size = 15),
        axis.text.x = element_text(size = 12, angle = 45, vjust = .5)) +
  # Customiza titulo e subtitulo
  theme(plot.title = element_text(size = 20),
        plot.subtitle = element_text(size = 20)) +
  # Customiza a legenda 
  theme(legend.position = "none") +
  # paleta de cor a função aqui é outra
  scale_fill_manual(values = paleta) +
  facet_wrap(~classe)
# com o facet eu posso tirar a legenda!!!!

# passo 5: Salva
#ggsave("aula05_barras_1.png", height = 8, width = 12, dpi = 300)


## -----------------------------------------------------------------------------

### Para Salvar 2 gráficos na mesma imagem:

# Grafico de barras
g1 = ggplot(db_final, aes(x = date, y = focuses, fill = classe)) +
  geom_col() +
  theme_minimal() +
  labs(title = "Número de Incêndio | Por mês",
       subtitle = "No Pará",
       x = "Data", y = "Focos de incêndio") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5)) +
  # customiza eixo y
  theme(axis.title.y = element_text(size = 15), 
        axis.text.y = element_text( size = 15)) +
  # customiza eixo x
  theme(axis.title.x = element_text(size = 15),
        axis.text.x = element_text(size = 12, angle = 45, vjust = .5)) +
  # Customiza titulo e subtitulo
  theme(plot.title = element_text(size = 20),
        plot.subtitle = element_text(size = 20)) +
  # Customiza a legenda 
  theme(legend.position = "none") +
  # paleta de cor a função aqui é outra
  scale_fill_manual(values = paleta) +
  facet_wrap(~classe)


# Grafico de linha

g2 = ggplot(db_final, aes(x = date, y = focuses, group = classe)) + 
  geom_point(size = 4, aes(color = factor(classe))) +
  geom_line(size = 2, aes(color = factor(classe))) +
  theme_minimal() +
  labs(y = 'Focos de incêndio', x ='Data',
       caption = "Fonte: Intro. R - 2021") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5)) +
  # customiza eixo y
  theme(axis.title.y = element_text(size = 15), 
        axis.text.y = element_text( size = 15)) +
  # customiza eixo x
  theme(axis.title.x = element_text(size = 15),
        axis.text.x = element_text(size = 12, angle = 45, vjust = .5)) +
  # Customiza titulo e subtitulo
  theme(plot.title = element_text(size = 20),
        plot.subtitle = element_text(size = 20)) +
  # Customiza a legenda 
  theme(legend.position = "bottom", 
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, color = "black")) +
  # paleta de cor
  scale_color_manual(values = paleta, name = "Situação")

# cria objeto para armazenar os graficos
plot_duplo = grid.arrange(g1, g2)

# salva 
#ggsave("aula5_plot_duplo.png", plot_duplo, height = 8, width = 12, dpi = 300)





## FIM -------------------------------------------------------------------------



