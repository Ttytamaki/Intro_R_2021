# ---
#
# Aula 05 
# Introdução ao R - 2021
#
# ---
#
# Professores:
# Eduardo Ryô Tamaki
# e-mail: eduardo.rtamaki@gmail.com
#
# Virgílio Mendes
# e-mail: virgilioebm@gmail.com
#
# 23/04/2021
#


# Se os pacotes necessários não estiverem instalados, faça a instalação
if (! "ggplot2" %in% installed.packages()) install.packages("ggplot2")
if (! "gridExtra" %in% installed.packages()) install.packages("gridExtra")

# carrega pacotes
library(ggplot2)
library(dplyr)
library(gridExtra)

# Caso tenham limpado o banco origirnal, executar:
db = read.csv("incendios_ativos.csv")
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












