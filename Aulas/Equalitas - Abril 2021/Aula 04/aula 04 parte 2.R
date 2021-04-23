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

#install.packages("gridExtra")
library(gridExtra)

?iris
?swiss

iris = iris

# Histograma

names(iris)

ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram(bins = 10, col = "white") + # col muda cor da borda
  labs(title = "Histograma para IRIS",
       subtitle = "Aula 04 - Parte 2",
       x = "Largura da Sépala",
       y = "Frequência", 
       caption = "Curso R/2021") +
  theme_minimal() + # ajusta o tema
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5)) # centraliza o subtitulo


# Densidade

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



ggsave("plot3.png", height = 8, width = 10, dpi = 600)


# Gafico de linha

?swiss

# Educação
# Examination

ggplot(swiss, aes(x = Examination, y = Education)) +
  geom_line(size = .6, col = "blue", linetype = "dashed") +
  labs(title = "Gráfico de Linha",
       subtitle = "Aula 04 - Parte 2",
       x = "Exames",
       y = "Educação", 
       caption = "Curso R/2021") +
  theme_minimal() + # ajusta o tema
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5), # centraliza o subtitulo
        legend.position = "bottom") # altera a posição da legenda

# Plotar mais de um gráfico simultaneamente
library(gridExtra)


g1 = ggplot(swiss, aes(x = Examination, y = Education)) +
  geom_line(size = .6, col = "blue", linetype = "dashed") +
  labs(title = "Gráfico de Linha",
       subtitle = "Aula 04 - Parte 2",
       x = "Exames",
       y = "Educação", 
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

g_final = arrangeGrob(g1, g2, nrow = 2)

ggsave("grafico_final.png", g_final, height = 8, width = 10)

# Jeito 2
g_final = grid.arrange(g1, g2)

ggsave("grafico_final1.png", g_final, height = 8, width = 10)