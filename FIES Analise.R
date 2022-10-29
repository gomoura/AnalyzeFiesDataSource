#Carregando os dados
#print(getwd())
#setwd("C:\\Users\\diego\\Documents\\Mineração_r")
#installed.packages("tidyverse")
library(tidyverse)
dt_data = read.csv2("relatorio_inscricao_dados_abertos_fies.csv",
                    fileEncoding = "Latin1", 
                    check.names = F,
                    sep = ";")

#glimpse(dt_data)

#Convertendo dataframe in Tibble
tibble_data = as_tibble(dt_data)

#Verificar os tipos de exemplos de cada coluna
#str(tibble_data)

# ver os dados em uma tabela
#view(tibble_data)


#Renomeando as colunas com espaço (Primeiro coloco o novo depois o antigo)
tibble_data = rename(tibble_data, 
               'Curso_superior_concluido'='Concluiu curso superior?',
               'Professor'='Professor rede pública ensino?',
               'N_membros_familiar'='Nº de membros Grupo Familiar',
               'Renda_per_capita'='Renda mensal bruta per capita',
               'Regiao_grupo_preferencia'='Região grupo de preferência',
               'Area_conhecimento'='Área do conhecimento',
               'Subarea_conhecimento'='Subárea do conhecimento',
               'Nota_corte'='Nota Corte Grupo Preferência',
               'Curso_escolhido'='Opções de cursos da inscrição',
               'Nome_IES'='Nome da IES',
               'Organizacao_academica_IES'='Organização Acadêmica da IES',
               'Municipio_oferta'='Munícipio do Local de Oferta',
               'Codigo_curso'='Código do curso',
               'Nome_curso'='Nome do curso',
               'Media_nota_enem'='Média nota Enem',
               'Ano_enem'='Ano do Enem',
               'Matematica_e_tec'='Matemática e suas Tecnologias',
               'Linguagem_cod_tec'='Linguagens, Códigos e suas Tec',
               'Ciencias_natureza_tec'='Ciências Natureza e suas Tec',
               'Ciencias_humas_tec'='Ciências Humanas e suas Tec',
               'Etnia'='Etnia/Cor', 'Redacao' = 'Redação',
               'UF_residencia'='UF de residência',
               'Municipio_residencia' = 'Municipio de residência',
               'Deficiencia'='Pessoa com deficiência?',
               'Ensino_medio_publico'= 'Tipo de escola no ensino médio',
               'Ensino_medio_conclusao' = 'Ano conclusão ensino médio')

#selecioando as colunas a serem trabalhadas
tibble_data = select(tibble_data, 'Sexo','UF_residencia','Municipio_residencia',
                     'Deficiencia','Ensino_medio_publico',
                     'Ensino_medio_conclusao', 'Curso_superior_concluido',
                     'Professor','N_membros_familiar','Renda_per_capita',
                     'Regiao_grupo_preferencia','UF','Area_conhecimento',
                     'Subarea_conhecimento','Nota_corte','Curso_escolhido',
                     'Nome_IES','Organizacao_academica_IES','Municipio_oferta',
                     'Codigo_curso','Nome_curso','Turno','Media_nota_enem',
                     'Ano_enem','Redacao','Matematica_e_tec',
                     'Linguagem_cod_tec','Ciencias_natureza_tec',
                     'Ciencias_humas_tec','Etnia')

#Target encoding function with R ---
#install.packages("CatEncoders")
library(CatEncoders)

#definindo etiquetas categoricas para os dados
#categoria_etinia = LabelEncoder.fit(tibble_data$Etnia)
categoria_Sexo= LabelEncoder.fit(tibble_data$Sexo)
categoria_UF_residencia= LabelEncoder.fit(tibble_data$UF_residencia)
categoria_Municipio_residencia= LabelEncoder.fit(tibble_data$Municipio_residencia)
categoria_Deficiencia= LabelEncoder.fit(tibble_data$Deficiencia)
categoria_Ensino_medio_publico= LabelEncoder.fit(tibble_data$Ensino_medio_publico)
categoria_Curso_superior_concluido= LabelEncoder.fit(tibble_data$Curso_superior_concluido)
categoria_Professor= LabelEncoder.fit(tibble_data$Professor)
categoria_Regiao_grupo_preferencia= LabelEncoder.fit(tibble_data$Regiao_grupo_preferencia)
categoria_UF= LabelEncoder.fit(tibble_data$UF)
categoria_Area_conhecimento= LabelEncoder.fit(tibble_data$Area_conhecimento)
categoria_Subarea_conhecimento= LabelEncoder.fit(tibble_data$Subarea_conhecimento)
categoria_Nome_IES= LabelEncoder.fit(tibble_data$Nome_IES)
categoria_Organizacao_academica_IES= LabelEncoder.fit(tibble_data$Organizacao_academica_IES)
categoria_Municipio_oferta= LabelEncoder.fit(tibble_data$Municipio_oferta)
categoria_Nome_curso= LabelEncoder.fit(tibble_data$Nome_curso)
categoria_Turno= LabelEncoder.fit(tibble_data$Turno)


#Convertendo as etiquetas categoricas registradas para numeros
#tibble_data$Etnia = transform(categoria_etinia,tibble_data$Etnia)
tibble_data$Sexo = transform(categoria_Sexo,tibble_data$Sexo)
tibble_data$UF_residencia = transform(categoria_UF_residencia,tibble_data$UF_residencia)
tibble_data$Municipio_residencia = transform(categoria_Municipio_residencia,tibble_data$Municipio_residencia)
tibble_data$Deficiencia = transform(categoria_Deficiencia,tibble_data$Deficiencia)
tibble_data$Ensino_medio_publico = transform(categoria_Ensino_medio_publico,tibble_data$Ensino_medio_publico)
tibble_data$Curso_superior_concluido = transform(categoria_Curso_superior_concluido,tibble_data$Curso_superior_concluido)
tibble_data$Professor = transform(categoria_Professor,tibble_data$Professor)
tibble_data$Regiao_grupo_preferencia = transform(categoria_Regiao_grupo_preferencia,tibble_data$Regiao_grupo_preferencia)
tibble_data$UF = transform(categoria_UF,tibble_data$UF)
tibble_data$Area_conhecimento = transform(categoria_Area_conhecimento,tibble_data$Area_conhecimento)
tibble_data$Subarea_conhecimento = transform(categoria_Subarea_conhecimento,tibble_data$Subarea_conhecimento)
tibble_data$Nome_IES = transform(categoria_Nome_IES,tibble_data$Nome_IES)
tibble_data$Organizacao_academica_IES = transform(categoria_Organizacao_academica_IES,tibble_data$Organizacao_academica_IES)
tibble_data$Municipio_oferta = transform(categoria_Municipio_oferta,tibble_data$Municipio_oferta)
tibble_data$Nome_curso = transform(categoria_Nome_curso,tibble_data$Nome_curso)
tibble_data$Turno = transform(categoria_Turno,tibble_data$Turno)


#Reverter a apresentação dos valores que foram conertidos em números.
#tibble_data$Etnia = inverse.transform(categoria_etinia,tibble_data$Etnia)

#Transformando o dado de Etnia em um valor categórico
tibble_data$Etnia = as.factor(tibble_data$Etnia)

#glimpse(tibble_data)

#Dividindo a base em treino e teste
#make this example reproducible


#Fazendo a divisão distribuida com base nas classes de etinia
library(caret)
set.seed(1)
trainIndex <- createDataPartition(tibble_data$Etnia, p = .7, list = FALSE)
train <- tibble_data[ trainIndex,]
test  <- tibble_data[-trainIndex,]

#Verificando a distribuição
summary(train$Etnia)
summary(tibble_data$Etnia)

#use 70% of dataset as training set and 30% as test set
# <- sample(c(TRUE, FALSE), nrow(tibble_data), replace=TRUE, prob=c(0.7,0.3))
#train  <- tibble_data[sample, ]
#test   <- tibble_data[!sample, ]




#install.packages("C50")
library(C50)
classifier = C5.0(train[1:29],train$Etnia)
#classifier

summary(classifier)
#?C5.0

#Transformando o o tipo da coluna
#train$Etnia = as.factor(train$Etnia)

#Rodando o modelo
#library(rpart)
#classifier = rpart(formula = Etnia ~ ., data = train)

print(classifier)


summary(classifier)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test[1:29], type = 'class')


table(y_pred)
table(test$Etnia)

#table(y_pred)

#etinia_pred = predict(etinia_model, test)

#summary(etinia_pred)

#install.packages('gmodels')
library(gmodels) 

CrossTable(test$Etnia,
           y_pred,
           prop.chisq = FALSE,
           prop.c = FALSE,
           prop.r = FALSE,
           
           dnn = c('Observado', 'Previsto'))
 
autoplot(type = '')


#-------------------

plot(y_pred)

library(ggplot2)
#qplot(x = Sepal.Length, y = Sepal.Width, data = iris, 
#      xlab="Sepal Length", ylab="Sepal Width", 
#      main="Sepal Length-Width", color=Species, shape=Species)

#Histograma -> Variáveis contínuas vs Categóricas
ggplot(tibble_data, aes(x = Renda_per_capita, fill = Etnia)) +
  geom_histogram(alpha=1, position = 'identity')

#Histograma -> Variáveis contínuas vs Categóricas
ggplot(tibble_data, aes(x = Media_nota_enem, fill = Etnia)) +
  geom_histogram(color = "#e9ecef",alpha=1, position = 'identity')


table(tibble_data$Etnia)

ggplot(tibble_data, aes(x = Media_nota_enem, y = Etnia)) +
  geom_point()
plot_grid(p1, p2, p3,
          ncol = 1,
          labels = c("p1", "p2", "p3"),
          rel_widths = c(1, 1.2, 1.2))


#Histograma -> Variáveis contínuas vs Categóricas
tibble_data %>% ggplot(aes(x = Etnia , y = Sexo))+
  geom_col() 
  
  
table(tibble_data$Etnia)


