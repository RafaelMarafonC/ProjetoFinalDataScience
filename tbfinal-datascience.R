library(tidyverse)
library(ggplot2)
library(plotly)

genshin <- read.csv('C:/Users/maraf/Documents/dataset genshin/genshin.csv', sep=',')
genshin_stats <- read.csv('C:/Users/maraf/Documents/dataset genshin/Genshin_Impact_All_Character_Stat.csv', sep = ',')

head(genshin)

gnp <- filter(genshin, playable == 'Y')

zongli <- filter(genshin_stats, Character == 'Zhongli' )
yanfei <- filter(genshin_stats, Character == 'Yanfei')
head(gnp)
head(zongli)
head(yanfei)


ggplot(data = gnp, mapping = aes(x=weapon_type, y=atk_90_90))+ geom_point(aes(color= vision)) 

ggplot(data = gnp, mapping = aes(x=weapon_type, y=atk_90_90))+ geom_point(aes(color= rarity)) 

ggplot(data = gnp, mapping = aes(x=talent_weekly, y=weapon_type)) + geom_point (aes(color=vision))

ggplot(data = gnp, mapping = aes(x=weapon_type, y=hp_90_90))+ geom_boxplot(aes())+ geom_point(aes(color = vision))

ggplot(data = gnp, mapping = aes(x=vision, y=hp_90_90)) + geom_point(aes(color= weapon_type))

ggplot(data = gnp, mapping = aes(x=region )) + geom_bar(aes(color=weapon_type))

p1 <- plot_ly(zongli, x = ~Lv, y = ~Base.HP, name = "Vida Base", type = 'scatter', mode= 'lines+markers')%>%
  add_trace(y = ~Base.ATK, name = 'Ataque Base', mode= 'lines+markers')%>%
  add_trace(y = ~Base.DEF, name = 'Defesa Base', mode= 'lines+markers')

p2 <- plot_ly(yanfei, x = ~Lv, y = ~Base.HP, name = "Vida Base", type = 'scatter', mode= 'lines+markers')%>%
  add_trace(y = ~Base.ATK, name = 'Ataque Base', mode= 'lines+markers')%>%
  add_trace(y = ~Base.DEF, name = 'Defesa Base', mode= 'lines+markers')
subplot(nrows = 2, shareX = TRUE, p1, p2)
