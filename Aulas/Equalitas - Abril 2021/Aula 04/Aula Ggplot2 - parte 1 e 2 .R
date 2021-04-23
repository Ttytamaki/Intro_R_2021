## Aula 22/10

## GGPLOT2

## Limpando nosso Environment:
rm(list = ls())

## Instalando e Carregando o pacote do ggplot2:
#install.packages("ggplot2") # quem já tem instalado não precisa rodar

library(ggplot2)
library(dplyr)

iris2 <- iris %>%
  rename(c(sep_comp = Sepal.Length,
           sep_larg = Sepal.Width, 
           pet_comp = Petal.Length,
           pet_larg = Petal.Width,
           tipo = Species))


## Banco de dados: iris

## Função base do ggplot2:
### aes = mapeamento dos dados (eixo x e eixo y)
# estrutura de criação de graficos:  ggplot(data = banco de dados, aes(x = X, y = Y))

## Gráfico de Dispersão:
### geom_point() -> Gráfico de Dispersão
### Duas variáveis Numéricas;

names(iris2)

ggplot(iris2, aes(x = sep_comp, y = sep_larg)) +
  geom_point()

### Size e Shape:
ggplot(iris2, aes(x = sep_comp, y = sep_larg)) +
  geom_point(size = 1, shape = 9)

### Formato, cor e tamanho de acordo com a coluna "Species":
ggplot(iris2, aes(x = sep_comp, y = sep_larg, 
                 col = tipo)) +
  geom_point(aes(shape = tipo), size = 2)

ggplot(iris2, (aes(x = sep_comp, y = sep_larg, col = tipo))) +
       geom_point(aes(shape = tipo, size = sep_comp))



## Dar titulo ao gráfico:
ggplot(iris2, (aes(x = sep_comp, y = sep_larg, col = tipo))) +
       geom_point(aes(shape = tipo, size = sep_comp)) +
  ggtitle("Gráfico de Dispersão")

## Salvar / Exportar o gráfico:
ggsave("plot1 iris.png", height = 7, width = 6, dpi = 300)
### dpi : Dots Per Inch
       
ggplot(iris2, aes(x = sep_comp, y = sep_larg, 
                 col = tipo)) +
  geom_point(aes(shape = tipo, size = tipo), size = 2) +
  ggtitle("Gráfico de Dispersão") +
  ggsave("plot1 iris.png", height = 7, width = 6, dpi = 300)



## Boxplot
## geom_

ggplot(iris, aes(x = Species, y = Sepal.Width)) +
  geom_boxplot()

## preenchendo nosso boxplot de acordo com a coluna "species":
### fill != col
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot()


## Colocar um título ao nosso boxplot:
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  ggtitle("Boxplot Bonitão") + 
  ggsave("boxplot iris.png", height = 6, width = 5, dpi = 300)


       
# Parte 2


# Histograma

names(iris2)

ggplot(data = iris2, aes(x = sep_comp)) +
  geom_histogram(col = "black", bins = 10) + 
  labs(title = "Histograma \n Aula 04", # labs especifica nomes dos eixos e titulos
       subtitle = "Teste", 
       y = "Frequência", 
       x = "Comprimento da Sépala", 
       caption = "Intr. ao R - 2021") + # legenda
  theme_minimal() + # personalização do tema
  theme(plot.title = element_text(hjust = .5), # centraliza o titulo
        plot.subtitle = element_text(hjust = .5)) # centraliza o subtitulo


# grafico de barra
# gráficos de colunas: o geom_bar() e geom_col()
# geom_bar() dispensa o argumento y
# 
ggplot(data = iris2, aes(x = sep_comp, fill = tipo)) +
  geom_bar(bins = 10, position = "dodge") + 
  labs(title = "Histograma \n Aula 04", # labs especifica nomes dos eixos e titulos
       subtitle = "Teste", 
       y = "Frequência", 
       x = "Comprimento da Sépala", 
       caption = "Intr. ao R - 2021") + # legenda
  theme_minimal() + # personalização do tema
  theme(plot.title = element_text(hjust = .5), # centraliza o titulo
        plot.subtitle = element_text(hjust = .5)) # centraliza o subtitulo


# Gráfico de densidade
# Para variáveis numéricas contínuas

library(dplyr)
names(iris2)

ggplot(data = iris2, aes(x = sep_comp)) +
  geom_density()

# mesmo grafico com a logica do pipe
iris2 %>% 
  ggplot(aes(sep_comp, fill = tipo)) +
  geom_density(alpha = 1/3) + # alpha aceita num decimal ou fração: 0.5 ou 1/5
  labs(title = "Gráfico de densidade", # labs especifica nomes dos eixos e titulos
       subtitle = "Aula 04", 
       y = "Densidade", 
       x = "Comprimento da Sépala", 
       caption = "Intr. ao R - 2021") + # legenda
  scale_x_continuous(limits = c(4, 10), breaks = c(5, 8)) +
  # scale_y_continuous() +
  theme_minimal() + # personalização do tema
  theme(plot.title = element_text(hjust = .5), # centraliza o titulo
        plot.subtitle = element_text(hjust = .5)) # centraliza o subtitulo
       


# Grafico de Linha
?swiss

names(swiss)

swiss %>% 
  ggplot(aes(Examination, Education)) +
  geom_line(size = .6, col = "blue") +
  labs(title = "Gráfico de Linha", # labs especifica nomes dos eixos e titulos
       subtitle = "Aula 04", 
       y = "Educação", 
       x = "Exames", 
       caption = "Intr. ao R - 2021") + # legenda
  theme_minimal() + # personalização do tema
  theme(plot.title = element_text(hjust = .5), # centraliza o titulo
        plot.subtitle = element_text(hjust = .5)) # centraliza o subtitulo

  
# Boxplot

iris2 %>% 
  ggplot(aes(x = tipo, pet_comp, fill = tipo)) +
  geom_boxplot() +
  labs(title = "Boxplot", # labs especifica nomes dos eixos e titulos
       subtitle = "Aula 04", 
       y = "Comprimento da Pétala", 
       x = "Estpécie", 
       caption = "Intr. ao R - 2021") + # legenda
  theme_minimal() + # personalização do tema
  theme(plot.title = element_text(hjust = .5), # centraliza o titulo
        plot.subtitle = element_text(hjust = .5),
        legend.position = "none") +# centraliza o subtitulo
  scale_fill_brewer(palette = "Set1",
                    labels = c("Setosa", "Versicolor", "Virginica"))


library(gridExtra)



g2 = swiss %>% 
  ggplot(aes(Examination, Education)) +
  geom_line(size = .6, col = "blue") +
  labs(title = "Gráfico de Linha", # labs especifica nomes dos eixos e titulos
       subtitle = "Aula 04", 
       y = "Educação", 
       x = "Exames", 
       caption = "Intr. ao R - 2021") + # legenda
  theme_minimal() + # personalização do tema
  theme(plot.title = element_text(hjust = .5), # centraliza o titulo
        plot.subtitle = element_text(hjust = .5)) # centraliza o subtitulo


# Boxplot

g1 = iris2 %>% 
  ggplot(aes(x = tipo, pet_comp, fill = tipo)) +
  geom_boxplot() +
  labs(title = "Boxplot", # labs especifica nomes dos eixos e titulos
       subtitle = "Aula 04", 
       y = "Comprimento da Pétala", 
       x = "Espécie", 
       caption = "Intr. ao R - 2021") + # legenda
  theme_minimal() + # personalização do tema
  theme(plot.title = element_text(hjust = .5), # centraliza o titulo
        plot.subtitle = element_text(hjust = .5),
        legend.position = "none") +# centraliza o subtitulo
  scale_fill_brewer(palette = "Set1",
                    labels = c("Setosa", "Versicolor", "Virginica"))



grid.arrange(g1, g2)



ggsave("aula04_plot1.png", height = 8, width = 8, dpi = 300)





