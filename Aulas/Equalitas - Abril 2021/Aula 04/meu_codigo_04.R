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
# Histograma - OK
# Densidade - OK
# Linha - 
# Personalisar posição de titulos - OK
# Tema (cor e estilo)
# Legenda
# Facets
# Plots conjuntos (gridExtra)

## -----------------------------------------------------------------------------

## Carregando o Ggplot2
library(ggplot2)
#install.packages("gridExtra")
library(gridExtra)

## -----------------------------------------------------------------------------

# Histogramas

# Distribuição dos casos segundo a frequência
# Variaveis numericas

# Passo 1:
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram()

# Passo 2:
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram(bins = 10,
                 col = "white") # col: cor da borda

# Passo 3:
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram(bins = 10, # bins: limita a quantidade de colunas no plot
                 col = "white") + # col: cor da borda
  labs(title = "Histograma para IRIS",
       subtitle = "Aula 04 - Parte 2", 
       x = "Largura da Sépala",
       y = "Frequência", 
       caption = "Turma R - 2021") 

# Passo 3: 
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram(bins = 10, # bins: limita a quantidade de colunas no plot
                 col = "white") + # col: cor da borda
  labs(title = "Histograma para IRIS",
       subtitle = "Aula 04 - Parte 2", 
       x = "Largura da Sépala",
       y = "Frequência", 
       caption = "Turma R - 2021") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5)) # centraliza o subtitulo

# Salvar
ggsave("plot_histograma.png", height = 8, width = 10, dpi = 300)

## -----------------------------------------------------------------------------

# Densidade
# Variaveis continuas 
# Não tem eixo Y

# Passo 1:
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_density()

# Passo 2:
ggplot(data = iris, aes(x = Sepal.Width, fill = Species)) + # fill: qualificar as categorias
  geom_density(alpha = 0.5) + # alpha: gradiente de cor
  labs(title = "Densidade da Largura da Sépala",
       subtitle = "Aula 04 - Parte 2", 
       x = "Largura da Sépala",
       y = "Densidade", 
       caption = "Turma R - 2021") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5)) # centraliza o subtitulo

# Passo 3:
ggplot(data = iris, aes(x = Sepal.Width, fill = Species)) + # fill: qualificar as categorias
  geom_density(alpha = 0.5) + # alpha: gradiente de cor
  labs(title = "Densidade da Largura da Sépala",
       subtitle = "Aula 04 - Parte 2", 
       x = "Largura da Sépala",
       y = "Densidade", 
       caption = "Turma R - 2021",
       fill = "Espécies") + # Titulo da legenda determinado pelo FILL
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5),# centraliza o subtitulo
        axis.title.y = element_text(vjust = 0.5, angle = 0), # ajusta eixo y
        legend.position = "bottom")  # posiciona legenda


# Salvar
ggsave("plot_densidade.png", height = 8, width = 10, dpi = 300)


## -----------------------------------------------------------------------------

# Grafico de linha

?airquality
# Daily air quality measurements in New York, May to September 1973.
# Dia
# Temperatura

library(dplyr)

bd = airquality %>% filter(Month == 6)

# Passo 1:
ggplot(bd, aes(x = Day, y = Temp)) +
  geom_line(size = .6, # expessura da linha
            linetype = "dashed", # tipo de linha
            col = "blue") + # cor da linha
  labs(title = "Temperatura diária no mês de Junho | Em NY",
       subtitle = "Aula 04 - Parte 2", 
       x = "Dia",
       y = "Temperatura (F)", 
       caption = "Turma R - 2021") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), # centraliza o titulo
        plot.subtitle = element_text(hjust = 0.5),# centraliza o subtitulo
        axis.title.y = element_text(vjust = 0.5, angle = 0), # ajusta eixo y
        legend.position = "bottom")  # posiciona legenda
  
# Salvar
ggsave("plot_linha.png", height = 8, width = 10, dpi = 300)

## -----------------------------------------------------------------------------
# Fim!




