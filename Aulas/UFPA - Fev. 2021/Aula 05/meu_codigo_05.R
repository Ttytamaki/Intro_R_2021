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
# Monitores:
# Matheus Ferreira
# e-mail: ferreira.dcp@gmail.com
#



# Se os pacotes necessários não estiverem instalados, faça a instalação
if (! "ggplot2" %in% installed.packages()) install.packages("ggplot2")
if (! "ggrepel" %in% installed.packages()) install.packages("ggrepel")
if (! "gridExtra" %in% installed.packages()) install.packages("gridExtra")

# carrega pacotes
library(ggplot2)
library(dplyr)
library(readr)
library(ggrepel)
library(writexl)
library(gridExtra)

# limpar o environment
rm(list = ls())

# Lê arquivos com extensao .csv separado por ;
bd = read.csv2("banco_marcos.csv")


# Filtrar apenas PARA
names(bd)

unique(bd$uf)


bd1 = bd %>% filter(uf == "PARA") %>% 
  rename(date = `ï..date`)


View(bd1)

## Paleta de cores
paleta <- c( "#0D50D8", "#C70039", "#5DADE2", "#2ca25f", "#e34a33")

### Salvar os dois gráficos separadamente


# Grafico de serie historica (linha)
bd1 %>% group_by(class, date) %>% 
  ggplot(aes(x = date, y = focuses, by = class)) + 
  theme_minimal() +
  geom_line(size = 2, aes(group = class, color = factor(class))) +
  geom_point(size = 4, aes(color = factor(class))) +
  labs(title = "Número de Incêndio | Por mês", subtitle = "No Pará",
       y = 'Focos de incêndio', x ='Data', color = '') +
  theme(axis.title.y = element_text(size = 15), axis.text.y = element_text( size = 15)) +
  theme(axis.text.x = element_blank()) + theme(axis.ticks = element_blank()) + 
  # tira a legenda 
  theme(plot.title = element_text(size = 20),
        plot.subtitle = element_text(size = 20)) +
  theme(axis.text.x = element_text(size = 12, angle = 45)) + 
  theme(axis.title.x = element_text(size = 15)) + 
  theme(axis.ticks = element_blank()) + 
  theme(legend.position = "bottom", 
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, color = "black")) +
  scale_color_manual(values = paleta, name = "Situação") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5))

ggsave("aula05_linha_1.png", height = 8, width = 12, dpi = 300)

# Grafico de barras
ggplot(bd1, aes(x = date, y = focuses, fill = class)) +
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






### Para Salvar 2 gráficos na mesma imagem:

# Grafico de barras
g2 = bd1 %>% 
  ggplot(aes(x = date, y = focuses, fill = class)) +
  geom_col() +
  theme_minimal() +
  labs(x = "Data", y = "Num. de Incênd.") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5)) +
  scale_fill_manual(values = paleta) +
  theme(legend.position = "none") +
  facet_wrap(~class) +
  theme(axis.text.x = element_text(size = 10, angle = 45))
  

# Grafico de linha

g1 = bd1 %>% group_by(class, date) %>% 
  ggplot(aes(x = date, y = focuses, by = class)) +
  geom_line(size = 2, aes(group = class, color = factor(class))) +
  geom_point(size = 4, aes(color = factor(class))) + 
  theme_minimal() +
  labs(title = "Num. de Incêndios | Mês",
       subtitle = "No Pará",
       x = "", y = "Num. de Incênd.",
       caption = "Fonte: Marcos") +
  theme(plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5)) +
  theme(axis.text.x = element_text(size = 10, angle = 45)) +
  theme(legend.position = "bottom") +
  scale_color_manual(values = paleta, 
                     name = "Situação")


teste = grid.arrange(g1, g2)



ggsave("aula5_plot_duplo.png", teste, height = 8, width = 12, dpi = 300)












