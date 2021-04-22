# ---
#
# Aula 04 - Ggplot: Parte 1
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
# 22/04/2020
# ---
#
# Material de Apoio:
# Ggplot Website: https://ggplot2.tidyverse.org/index.html
# Dplyr Cheat Sheet: https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
#

## PREAMBULO -------------------------------------------------------------------

## Ggplot2

## Limpando nosso Environment
rm(list = ls())


## Carregando o Ggplot2
library(ggplot2)


## Função Base do Ggplot2:
ggplot()

# ggplot(data, aes()):
## data - Dados
## aes() - Mapeamento dos Dados, Aesthetics;
### Servir para indicar ao R o que vai estar no eixo x, y, cores e etc.
## Logo, a estrutura basica fica como:
ggplot(data, aes(x = X, y = Y))

names(iris)

ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length))

# 1a camada:
### geom_ : significa a geometria, ou o tipo de gráfico que vamos criar




############################
### Gráfico de Dispersão ###
############################
# Util para demonstrar a relação entre duas variáveis CONTINUAS;
## Mas pode ser usado para uma variável continua e uma categórica,
## ou até mesmo duas categóricas


geom_point()

# aes() pode vir tanto na base (ggplot) quanto na primeira camada, geom_:
ggplot(iris) + 
  geom_point(aes(x = Sepal.Width, y = Sepal.Length))


ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length)) + 
  geom_point()


## 1 Cont. e 1 Categórica:
ggplot(iris) + 
  geom_point(aes(x = Species, y = Sepal.Length))




## Tamanho e Formato:
### Size: numerico
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length)) +
  geom_point(size = 4)

### Shape: numerico
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length)) +
  geom_point(size = 3, shape = 25)

### Bubblechart: Tamanho de acordo com 1 variável:
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, size = Sepal.Length)) +
  geom_point()


## Cor e Preenchimento:
### col: string
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length)) +
  geom_point(size = 3, shape = 19, col = "red")

#### Em shapes que podem ser preenchidas, col vai apenas mudar o contorno:
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length)) +
  geom_point(size = 3, shape = 25, col = "red")

### fill: string
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length)) +
  geom_point(size = 3, shape = 25, col = "red", fill = "black")


### Cor e Formato por Categoria:
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, col = Species)) +
  geom_point(size = 3, shape = 19)

ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, shape = Species, col = Species)) +
  geom_point(size = 3)

# Pode ser tanto no AES da função base, quanto no AES da 1a camada:
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length)) +
  geom_point(aes(shape = Species, col = Species), size = 3)


# Outras Camadas:
## Dar Título ao Gráfico:
### ggtitle()
### labs()

## ggtitle(x): x - String, titulo
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length,
                 col = Species, shape = Species)) +
  geom_point(size = 2) +
  ggtitle("Gráfico de Dispersão")

## labs(...):
### title - Titulo
### subtitle - Subtitulo
### x - Eixo X
### y - Eixo y 
### caption - Legenda

ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length,
                 col = Species, shape = Species)) +
  geom_point(size = 2) +
  labs(title = "Gráfico de Dispersão",
       subtitle = "Aula Ggplot2",
       x = "Largura da Sepala",
       y = "Comprimento da Sepala", 
       caption = "Iris. Intro. R - 2021")


# Outras Camadas:
## Salvar o Gráfico:
### ggsave(nome, height, width, dpi)
#### nome: nome do arquivo que vai ser salvo
##### !: Sempre com a extensão (.jpg ou .png)
#### height: altura da imagem - Num
#### width: largura da imagem - Num
#### dpi: qualidade da imagem (Dots per Inch) - Num (300 ou 600)
  

ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length,
                 col = Species, shape = Species)) +
  geom_point(size = 2) +
  labs(title = "Gráfico de Dispersão",
       subtitle = "Aula Ggplot2",
       x = "Largura da Sepala",
       y = "Comprimento da Sepala", 
       caption = "Iris. Intro. R - 2021") +
  ggsave("grafico1.png", height = 5, width = 5, dpi = 600)



###################################
### Boxplot | Gráfico de Caixas ###
###################################
# Distribuição de uma variável contínua.
## Ele nos mostra 5 estatisticas descritivas: Minimo, Maximo, 1o e 3o quartil,
## e mediana.

# 1a camada:
## geom_boxplot()

ggplot(iris, aes(x = Species, y = Sepal.Width)) +
  geom_boxplot()

### Orientação muda de acordo com o EIXO:
ggplot(iris, aes(x = Sepal.Width, y = Species )) +
  geom_boxplot()


## Cor e Preenchimento:
ggplot(iris, aes(x = Species, y = Sepal.Width)) +
  geom_boxplot(col = "#ff33cc", fill = "pink")


## Cor e Preenchimento de acordo com Categoria:
### Col e Fill no aes()
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot()


ggplot(iris, aes(x = Species, y = Sepal.Width, col = Species)) +
  geom_boxplot()


## Colorir os Outliers de outra cor:
### outlier.colour = x : x - String
### outlier.shape = y : y - Numero
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot(outlier.colour = "red", outlier.shape = 19)

### Não mostrar NA:
#### outlier.shape = NA
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot(outlier.shape = NA)



## Outras Camadas:
### geom_jitter:
#### Vai "plotar" os pontos dos dados
## geom_jitter(width = x)
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot(outlier.shape = NA) + geom_jitter(width = 0.25)

ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot(outlier.shape = NA) + geom_jitter(width = 0.25, col = "violet")



## Finalizando o Boxplot:
### 2 camadas: Labels e Salvar
ggplot(iris, aes(x = Species, y = Sepal.Width)) +
  geom_boxplot(outlier.colour = "red") + 
  labs(title = "Boxplot",
       subtitle = "Aula Ggplot2",
       x = "Tipos de Planta", 
       y = "Largura da Sepala",
       caption = "Iris. Intro. R 2021") + 
  ggsave("boxplot.png", height = 5, width = 5, dpi = 600)






