## Explicar:
options(mc.cores = parallel::detectCores())
install.packages("pacman")
# pacman::p_load(x)

iris2 <- read.csv(file.choose())

# Achar NA's:
which(is.na(iris2))

# Attach:
attach(iris2)
summary(Species)



## Apply:
# Substituto para Loops():

### 1) Apply():
# x -> Data Frame ou Matriz;
# Output: Vetor, lista ou Array;
# Evitar o uso de Loop;
## apply(x, margin, fun):
# x : Matriz ou Data Frame;
# margin : a função vai ser aplicada em qual sentido?
## margin = 1 -> Linhas;
## margin = 2 -> Colunas;
## margin = c(1, 2) -> Linhas e Colunas;
## fun: qual função vamos usar? 

m1 <- matrix(1:10, nrow = 5, ncol = 6)
m1
apply(m1, 2, sum)
apply(m1, 1, sum)

which()

### 2) lapply():
# Indicada para operações em listas e que retorna para gente uma lista
# de objetos do mesmo comprimento do original.
## lapply(x, fun)
# x : vetor ou objeto;
# FUN : função;
## apply() != lapply() : output

x <- 1:10
lapply(x, sum)

### 3) sapply():
# Mesma coisa do lapply, mas retorna um vetor ou matriz
x <- 1:10
sapply(x, sum)

### 4) tapply():
# Aplica uma função a cada variavel de um objeto ou matriz;
# A diferença é que a função conta com o equivalente do
# group_by do dplyr:
## tapply(x, INDICE, fun):
# x -> Objeto/vetor;
# INDICE -> Por qual variável ou variáveis iremos agrupar;
# fun -> Função

iris %>%
  group_by(Species) %>%
  summarise(media = mean(Sepal.Width))

tapply(iris$Sepal.Width, iris$Species, mean)

#
###############################



library(dplyr)

marcus <- read.csv2(file.choose())

marcus$uf <- tolower(marcus$uf)

x1 <- c("2020/04", "Desmatamento Recente", 0, "para")
x2 <- c("2020/04", "Floresta", 0, "para")

marcus2 <- rbind(marcus, x1)
marcus2 <- rbind(marcus2, x2)

t_marcus <- marcus2 %>%
  filter(uf == "para") %>%
  rename(data = ï..date)

lapply(t_marcus, class)

t_marcus$data <- as.factor(t_marcus$data)
t_marcus$focuses <- as.numeric(t_marcus$focuses)

t_marcus <- t_marcus %>%
  group_by(data, class, focuses) %>%
  summarise(focuses = sum(focuses)) 

vetor_dat <- unique(t_marcus$data)
desm_cons <-  NA
desm_rec <- NA
flores <- NA
outros <- NA

marcus_final <- data.frame(vetor_dat, desm_cons, desm_rec, flores, outros)

marcus_final$desm_cons <- t_marcus$focuses[t_marcus$class == "Desmatamento Consolidado"]
marcus_final$desm_rec <- t_marcus$focuses[t_marcus$class == "Desmatamento Recente"]
marcus_final$flores <- t_marcus$focuses[t_marcus$class == "Floresta"]
marcus_final$outros <- t_marcus$focuses[t_marcus$class == "Outros"]

View(marcus_final)

###-------------------------------------------

?tapply
# Aplica uma função para CADA obs;
# tapply(x, indice, fun)


marcus <- tapply(marcus$focuses, list(marcus$ï..date, marcus$class), sum) %>%
  data.frame()

marcus$data <- rownames(marcus)

rownames(marcus) <- 1:nrow(marcus)

lapply(marcus, class)

marcus$data <- as.factor(marcus$data)

View(marcus)


