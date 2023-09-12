#Aprendendo a usar o pacote pnad para R IBGE

install.packages("PNADcIBGE")

library(PNADcIBGE)

#Exemplos para uso da pnad contínua

#leitura dos dados de forma online
get_pnadc(year,quarter=NULL, interview=NULL, topic=NULL, vars=NULL, defyear=NULL, defperiod=NULL,
          + labels=TRUE, deflator=TRUE, design=TRUE, savedir=tempdir())



# Analisando o serviço domestico no Brasil

variaveis_selecionadas <- c("VD4009")
dadosPNADc <- get_pnadc(year=2013,quarter=1,vars=variaveis_selecionadas)

# sidra IBGE

#1. settar configuracoes
options(scipen = 999)

#2. instalar e carregar pacotes
#2.1 instalar
install.packages('tidyverse')
#para ler excel (.xlsx ou .xls) instalar
install.packages('readxl')
#pacote para escrever xlsx
install.packages("writexl")
#pacotes para graficos
install.packages("ggplot2")
# pacotes para gráficos
install.packages("hrbrthemes")
#2.2 carregar
library(tidyverse)
library(readxl) #tem a funcao read_xlsx
library(writexl)
library(dplyr)
library(ggplot2)
library(stringr)
library(writexl)
library(hrbrthemes)
library(kableExtra)
library(scales)
options(knitr.table.format = "html")

banco_servico_dom <- read_xlsx(path="servicodom_rendimentomedio.xlsx", sheet="Tabela 1")

glimpse(banco_servico_dom)



#grafico 1

# rendimento medio deflacionado

install.packages("PNADcIBGE")
library(PNADcIBGE)
dadosPNADc_dom <- get_pnadc(year=2013, quarter=4, vars=c("VD4009","VD4010"),deflator = TRUE)
dadosPNADc_dom_deflacionado <- pnadc_deflator(data_pnadc=dadosPNADc_dom , deflator.file="deflator_PNADC_trimestral.xls")
