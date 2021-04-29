# ---
#
# Aula 04 - Ggplot: Parte 2
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
# 29/04/2020
# ---
#
# Material de Apoio:
# Ggplot Website: https://ggplot2.tidyverse.org/index.html
# Dplyr Cheat Sheet: https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
#

## PREAMBULO -------------------------------------------------------------------

# Conteúdo:
# Histograma
# Densidade
# Linha
# Personalisar posição de titulos 
# Tema (cor e estilo)
# Legenda
# Facets
# Plots conjuntos (gridExtra)

## -----------------------------------------------------------------------------

## Ggplot2

## Limpando nosso Environment
rm(list = ls())


## Carregando o Ggplot2
library(ggplot2)

#install.packages("gridExtra")
library(gridExtra)

?iris
?swiss

iris = iris
## -----------------------------------------------------------------------------

# Histograma

# Uso: distribuição de frequências
# Distribuição dos casos segundo a frequencia

# Passo 1:
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram() # Apenas variavel X

ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram(bins = 10) # bins limita a quantidade de colunas

# Passo 2:
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram(bins = 10, col = "white") + # col muda cor da borda
  labs(title = "Histograma para IRIS", # Inclui titulo dos eixos
       subtitle = "Aula 04 - Parte 2",
       x = "Largura da Sépala",
       y = "Frequência", 
       caption = "Curso R/2021")

# Passo 3:
# HTML colour: https://htmlcolorcodes.com/

ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram(bins = 10, col = "#DC7633") + # col muda cor da borda
  labs(title = "Histograma para IRIS", # Inclui titulo dos eixos
       subtitle = "Aula 04 - Parte 2",
       x = "Largura da Sépala",
       y = "Frequência", 
       caption = "Curso R/2021") +
  theme_minimal() + # ajusta o tema
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5)) # centraliza o subtitulo

# Salvar
ggsave("plot_histograma.png", height = 8, width = 10, dpi = 600)

## -----------------------------------------------------------------------------

# Densidade
# Gráfico para var numéricas contínuas, tira densidade 
# não tem eixo Y, amostra

# Passo 1:
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_density()

# Passo 2:
ggplot(data = iris, aes(x = Sepal.Width, fill = Species)) + # fill qualifica as categorias
  geom_density(alpha = .5) # gradiente da cor

# Passo 3:
ggplot(data = iris, aes(x = Sepal.Width, fill = Species)) +
  geom_density(alpha = .5) + # gradiente da cor
  labs(title = "Gráfico de densidade",
       subtitle = "Aula 04 - Parte 2",
       x = "Largura da Sépala",
       y = "Densidade", 
       caption = "Curso R/2021", 
       fill = "Espécies") +
  theme_minimal() + # ajusta o tema
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5), # centraliza o subtitulo
        legend.position = "bottom") # altera a posição da legenda


# Salvar
ggsave("plot_densidade.png", height = 8, width = 10, dpi = 600)

## -----------------------------------------------------------------------------

# Gafico de linha

# Uso: Series temporais, longitudinal data
# Banco especifico

# Daily air quality measurements in New York, May to September 1973.
?airquality

datasets::airquality
# Temperatura
# Dia
# Em um determinado mês

# Base: Tratando
## Selecionando os casos longitudinais
bd = airquality %>% filter(Month == "6")

# Passo 1:
ggplot(bd, aes(x = Day, y = Temp)) + # precisa de parametro Y
  geom_line()

# Passo 2:
ggplot(bd, aes(x = Day, y = Temp)) +
  geom_line(size = .6, # tamanho
            col = "blue", # borda cor
            linetype = "dashed")  # tipo de linha

# Passo 3:
ggplot(bd, aes(x = Day, y = Temp)) +
  geom_line(size = .6, col = "blue", linetype = "dashed") +
  labs(title = "Gráfico de Linha | Por Mês",
       subtitle = "Aula 04 - Parte 2",
       x = "Dia",
       y = "Temperatura", 
       caption = "Curso R/2021") +
  theme_minimal() + # ajusta o tema
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5), # centraliza o subtitulo
        legend.position = "bottom") # altera a posição da legenda

## Complementar:
# Plot alternativo para varias facetas::
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_line(size = .6, col = "blue", linetype = "dashed") +
  labs(title = "Gráfico de Linha | Altenativo",
       subtitle = "Aula 04 - Parte 2",
       x = "Dia",
       y = "Temperatura", 
       caption = "Curso R/2021") +
  theme_minimal() + # ajusta o tema
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5), # centraliza o subtitulo
        legend.position = "bottom") + # altera a posição da legenda
  facet_wrap(~Month) # faceta o grafico por um variavel


## -----------------------------------------------------------------------------

# Plotar mais de um gráfico simultaneamente
library(gridExtra)


g1 = ggplot(bd, aes(x = Day, y = Temp)) +
  geom_line(size = .6, col = "blue", linetype = "dashed") +
  labs(title = "Gráfico de Linha | Por Mês",
       subtitle = "Aula 04 - Parte 2",
       x = "Dia",
       y = "Temperatura", 
       caption = "Curso R/2021") +
  theme_minimal() + # ajusta o tema
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5), # centraliza o subtitulo
        legend.position = "bottom") # altera a posição da legenda

g1

g2 = ggplot(data = iris, aes(x = Sepal.Width, fill = Species)) +
  geom_density(alpha = .5) + # gradiente da cor
  labs(title = "Gráfico de densidade",
       subtitle = "Aula 04 - Parte 2",
       x = "Largura da Sépala",
       y = "Densidade", 
       caption = "Curso R/2021", 
       fill = "Espécies") +
  theme_minimal() + # ajusta o tema
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5), # centraliza o subtitulo
        legend.position = "bottom") # altera a posição da legenda

g2

# coloca os dois graficos juntos
grid.arrange(g1, g2) 

# Salvar os dois graficos 
g_final = grid.arrange(g1, g2)

ggsave("grafico_final.png", g_final, height = 8, width = 10)

## -----------------------------------------------------------------------------
# Fim!