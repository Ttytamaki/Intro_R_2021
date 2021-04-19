## Aula 05 - 12/02/2021

## GGPLOT2

## Limpando nosso Environment:
rm(list = ls())

## Instalando e Carregando o pacote do ggplot2:
#install.packages("ggplot2") # quem já tem instalado não precisa rodar


# Se os pacotes necessários não estiverem instalados, faça a instalação
if (! "ggplot2" %in% installed.packages()) install.packages("ggplot2")
if (! "ggrepel" %in% installed.packages()) install.packages("ggrepel")
if (! "gridExtra" %in% installed.packages()) install.packages("gridExtra")

# carrega pacotes
library(ggplot2)
library(dplyr)
library(tidyverse)
library(readr)
library(ggrepel)
library(writexl)
library(gridExtra)


## Banco de dados: 
bd = read_csv2("data/banco_marcos.csv")



bd1 = bd %>% filter(uf == "PARA") %>% 
  group_by(class, date) %>% 
  count(focuses) %>% 
  summarise(foco = sum(focuses)) %>% 
  ungroup()


bd_final <- tapply(bd1$foco, list(bd1$date, bd1$class), sum) %>% as.data.frame()

# inclui coluna data
bd_final$date <- rownames(bd_final)

# exportar em excel
write_xlsx(bd_final, "tabela_marcos.xlsx")


## Paleta de cores
paleta <- c( "#0D50D8", "#C70039", "#5DADE2", "#2ca25f", "#e34a33")



# Grafico de serie historica (linha)
bd1 %>% group_by(class, date) %>% 
  ggplot(aes(x = date, y = foco, by = class)) + 
  theme_minimal() +
  geom_line(size = 2, aes(group = class, color = factor(class))) +
  #geom_point(size = 4, aes(color = factor(class))) +
  labs(title = "Número de Incêndio | Por mês", subtitle = "No Pará",
       y = 'Focos de incêndio', x ='Data', color = '') +
  scale_color_manual(values = paleta, name = "Situação") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5))

ggsave("aula05_linha_1.png", height = 8, width = 12, dpi = 300)

# Grafico de barras
ggplot(bd1, aes(x = date, y = foco, fill = class)) +
  geom_col() +
  theme_minimal() +
  labs(title = "Número de Incêndio | Por mês",
       subtitle = "No Pará",
       x = "Data", y = "Focos de incêndio",
       caption = "Fonte: Intro. R - 2021") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5)) +
  scale_fill_manual(values = paleta) +
  theme(axis.text.x = element_text(size = 10, angle = 45)) + 
  theme(axis.ticks = element_blank()) + 
  theme(legend.position = "none") +
  facet_wrap(~class)

ggsave("aula05_barras_1.png", height = 8, width = 12, dpi = 300)



# falta criar G1 e G2

grid.arrange(g1, g2)



ggsave("aula05_plot_duplo.png", height = 8, width = 12, dpi = 300)

