
##############################################
#          Análisis de una invasión          #
##############################################

# Se presenta el código utilizado para realizar
# los cálculos de la metodología propuesta en el 
# artículo de Griffon y Pino (2024).


# ////////////////////////////////////////////
# /// Construcción de las series de tiempo ///
# ////////////////////////////////////////////


# /////////Capturas por trampa////////////////

Fecha <- c("2023-09-28 UTC", "2023-10-02 UTC", "2023-10-05 UTC",
           "2023-10-10 UTC", "2023-10-12 UTC", "2023-10-17 UTC",
           "2023-10-19 UTC", "2023-10-24 UTC", "2023-10-26 UTC",
           "2023-10-31 UTC", "2023-11-02 UTC", "2023-11-07 UTC",
           "2023-11-09 UTC", "2023-11-14 UTC", "2023-11-16 UTC",
           "2023-11-21 UTC", "2023-11-23 UTC", "2023-11-28 UTC",
           "2023-11-30 UTC", "2023-12-05 UTC", "2023-12-07 UTC",
           "2023-12-12 UTC", "2023-12-14 UTC", "2023-12-19 UTC",
           "2023-12-21 UTC", "2023-12-26 UTC", "2023-12-28 UTC",
           "2024-01-02 UTC", "2024-01-04 UTC", "2024-01-09 UTC",
           "2024-01-11 UTC", "2024-01-16 UTC", "2024-01-18 UTC",
           "2024-01-23 UTC", "2024-01-25 UTC", "2024-01-30 UTC",
           "2024-02-01 UTC", "2024-02-06 UTC", "2024-02-08 UTC",
           "2024-02-13 UTC", "2024-02-15 UTC")

Cuartel_6_Norte <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

Cuartel_6_Medio <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

Cuartel_6_Sur <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

Cuartel_7_Norte <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0)

Cuartel_7_Medio <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0)

Cuartel_7_Sur <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0)

Bodega <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

Poniente <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

Pink_Lady <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

Cerezos <- c(0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

Isla_Cerezos <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

Membrillero <- c( 0, 0, 0, 1, 0, 0, 0, 2, 1, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0)

# Creando un set de datos (data frame) con las series de tiempo:

Datos_Trampas <- data.frame(Fecha, 
                            Cuartel_6_Norte, Cuartel_6_Medio, Cuartel_6_Sur,
                            Cuartel_7_Norte, Cuartel_7_Medio, Cuartel_7_Sur,
                            Bodega, Poniente, Pink_Lady,
                            Cerezos, Isla_Cerezos, Membrillero)

View(Datos_Trampas)


# /////////////////////////////////////////////
# ////// Transformado la variable tiempo //////
# //// a un objeto con formato tipo: POSIX ////
# /////////////////////////////////////////////


# Pasando los datos a formato POSIXlt (segundos desde 1970) (cada ítem en un formato amigable, pero pesado).

# Posteriormente se convierten a POSIXct (segundos desde 1970), es un formato
# menos pesado.

# Pasando a POSIXlt:

str(Datos_Trampas) # Muestra la estructura del set de datos.

Datos_Trampas$Fecha_lt<-strptime(Datos_Trampas$Fecha, "%Y-%m-%d", tz = "America/Santiago") # Ordena la fecha.

str(Datos_Trampas)

class(Datos_Trampas$Fecha_lt) # Se comprueba que estén en formato POSIX.

head(Datos_Trampas) # Se muestra parte de objeto, para comprobar que la variable  
# Fecha_lt no sea una columna de NA.

unclass(Datos_Trampas$Fecha_lt[1]) # Otro chequeo del formato de la variable 
# (vemos solo la primera fecha).

#unclass(Datos_Trampas$Fecha_lt) # Vemos todas las fechas.

# Pasando a POSIXct:

?as.POSIXct

Datos_Trampas$Fecha_ct <- as.POSIXct(Datos_Trampas$Fecha,format = "%Y-%m-%d") # Transformando de  POSIXlt a  POSIXct.

head(Datos_Trampas) # Vemos parte del objeto.

class(Datos_Trampas$Fecha_ct) # Se comprueba que estén en el formato correcto.

unclass(Datos_Trampas$Fecha_ct[1]) # Otro chequeo del formato de la variable 
# (vemos solo la primera fecha).

#unclass(Datos_Trampas$Fecha_ct) # Vemos todas las fechas.

View(Datos_Trampas) 

# Ojo: Asegurarse de que las series de tiempo tengan información,
# (la suma de sus valores debe ser mayor que 0).

# Hacerlo para todas las trampas, aquí solo se presentan dos ejemplos:

names(Datos_Trampas) # para ver los nombres de las trampas

sum(Datos_Trampas$Cuartel_6_Norte) # Esta trampa no tiene señal.
# Por lo tanto no se utiliza en los análisis posteriores.

sum(Datos_Trampas$Cuartel_6_Medio) # Esta trampa tiene señal.

# Es importante apreciar que, con este comando, se obtienen las 
# capturas totales por trampa. Esto es un valor importante en la
# metodología.


#////////////////////////////////////////////////////
# /////// Graficación de las series de tiempo ///////
#////////////////////////////////////////////////////


# Graficar las series de tiempo:

library(ggplot2)

# ------Graficar una sola serie de tiempo------

ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Cuartel_6_Medio), color="red", linetype=1)+ 
  theme_classic()+ 
  ylab("Cantidad de individuos \n (Trampa: Cuartel 6 Medio)") +
  xlab("Fecha de captura") +
  scale_x_datetime()

# -------Graficar juntas las series de tiempo-------

library(patchwork)

# //////Trampas internas/////

# Partes de la figura total:

C6N  <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Cuartel_6_Norte), color="green", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Norte / Cuartel 6)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4))  

C6M  <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Cuartel_6_Medio), color="green", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Medio / Cuartel 6)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4)) 

C6S  <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Cuartel_6_Sur), color="green", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Sur / Cuartel 6)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4)) 

C7N  <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Cuartel_7_Norte), color="pink", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Norte / Cuartel 7)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4))

C7M  <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Cuartel_7_Medio), color="pink", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Medio / Cuartel 7)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4))

C7S  <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Cuartel_7_Sur), color="pink", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Sur / Cuartel 7)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4))

# Figura total trampas internas:

C6N + C6M + C6S + C7N + C7M + C7S +
  plot_layout(ncol = 1)

# //////Trampas externas//////

# Partes de la figura total:

Bod  <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Bodega), color="cyan", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Bodega)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4))

Poni  <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Poniente), color="cyan", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Poniente)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4))

Pink <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Pink_Lady), color="cyan", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Pink_Lady)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4))

Cere <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Cerezos), color="cyan", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Cerezos)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4))

Isla <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Isla_Cerezos), color="cyan", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Isla Cerezos)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4))

Membr <- ggplot(Datos_Trampas, aes(x=Fecha_ct)) + 
  geom_line(aes(y = Membrillero), color="cyan", linetype=1, size = 1) + 
  theme_classic()+ 
  ylab("Cantidad de individuos") +
  xlab("Fecha de captura \n (Trampa Membrillero)") +
  scale_x_datetime() +
  ylim(0,13) + 
  theme(text = element_text(size = 4))

# Figura total trampas externas:

Membr + Isla + Cere + Pink + Bod + Poni +  
  plot_layout(ncol = 1)


##############################################
########### Correlaciones Cruzadas ###########
##############################################


# Se muestra un ejemplo del cálculo de la correlación
# cruzada entre dos series de tiempo.

# Se utilizan para el ejemplo, la serie de tiempo de
# la trampa media del cuartel 6 y la trampa sur del cuartel 6.

# Para reproducir los resultados presentados en el artículo, 
# es necesario realizar esta operación entre todos los pares
# series de tiempo que presentan señal.

# Transformar las series de tiempo a un objeto tipo "ts".

?ts

# Primera serie:

DatosST_Trampa1 <- ts(Datos_Trampas$Cuartel_6_Medio, start = c(0000,1))

# Se calcula el tamaño de la serie de tiempo:

Longi1 <-length(na.exclude(DatosST_Trampa1))

Longi1

plot(DatosST_Trampa1)

# Segunda serie:

DatosST_Trampa2 <- ts(Datos_Trampas$Cuartel_6_Sur, start = c(0000,1))

# Se calcula el tamaño de la serie de tiempo:

Longi2 <-length(na.exclude(DatosST_Trampa2))

Longi2

plot(DatosST_Trampa2)

# Ambas tienen igual longitud.

# Si este no fuera el caso, se llevan al tamaño de la más corta.

# Se juntan las longitudes, para establecer la menor:

Longitudes<-c(Longi1, Longi2)

LongMin <- min(Longitudes)

LongMin

# Se asigna la menor longitud a las series de tiempo:

DatosST_Trampa1<- ts(Datos_Trampas$Cuartel_6_Medio[1:LongMin], start = c(0000,1),  
                     freq = 2/7) # ciclos basados en días (24*60/15)


length(na.exclude(DatosST_Trampa1))

DatosST_Trampa2 <- ts(Datos_Trampas$Cuartel_6_Sur[1:LongMin], start = c(0000,1),  
                      freq = 2/7) # ciclos basados en días (24*60/15)

length(na.exclude(DatosST_Trampa2))

# Cálculo de las correlaciones cruzadas.

# Ojo: A la primera serie que se pone en los
# argumentos del comando que se utiliza (ccf),
# se le aplican retardos.

# Utilizar en esta posición (la primera) las trampas más lejanas
# (más abajo se explica la razón de esto)

?ccf

# Ojo: Este comando mueve la primera serie de tiempo hacia atrás,
# y luego hacia adelante.

# Se establece el retardo máximo a utilizar:

Retardo <- LongMin-3 # Se resta 3 para que 
# queden 3 realizaciones para hacer la 
# última correlación.

# Ojo: La variable (serie de tiempo) que se va a "mover" 
# se debe poner primero en el comando “ccf”.

# Lógica: Es aquella que desencadena los otros eventos.

# Por ejemplo: La lluvia desencadena el crecimiento vegetal.
# Por lo tanto, se debe poner primero la serie de tiempo de la 
# lluvia, luego la del crecimiento vegetal.

# Correlación cruzada:

ccf(DatosST_Trampa1,DatosST_Trampa2, na.action = na.pass, lag.max = Retardo)
# En el gráfico que se obtiene, valores mayores a la línea horizontal azul
# representan valores significativos de correlación.

# Obtener los valores de las correlaciones:

Valores <-ccf(DatosST_Trampa1,DatosST_Trampa2, na.action = na.pass, lag.max = Retardo)

Valores$acf # Valores.

round(Valores$acf,3) # Se redondean los valores.

max(Valores$acf) # Valor de la correlación más alta.

# Se construye una tabla con las correlaciones
# y los retardos:

EjeX <- c(-Retardo:Retardo)

TablaCorr <- cbind(EjeX,Valores$acf)

colnames(TablaCorr)<-c("Lag","Correlacion")

TablaCorr

# Identificar la mayor correlación:

max(TablaCorr[,2])
# Este resultado coincide con lo 
# obtenido anteriormente.

# Retardo asociado a la Mayor
# correlación:

maximo<-max(TablaCorr[,2])

DF <- as.data.frame(TablaCorr)

# Retardo:
(MejorRetardo <- with(DF, Lag[Correlacion==maximo]))

# Correlación asociada a este retardo:

round(maximo,3)

# Otra forma (con gráficos útiles):

?lag2.plot
# Ojo: Tomar en cuenta que este comando mueve la serie de
#  tiempo solo hacia atrás.

# Como en este caso el mejor retardo se encuentra hacia adelante,
# se invierte la posición de las series de tiempo (en los argumentos
# del comando):

astsa::lag2.plot(DatosST_Trampa2,DatosST_Trampa1, Retardo)
# Dado que se utilizan muchos retardos (38), la figura contiene 38 graficas.

# Por lo tanto, para obtener una imagen más clara, a continuación se 
# presentan gráficas hasta el retardo asociado al mayor valor de 
# correlación (13):

astsa::lag2.plot(DatosST_Trampa2,DatosST_Trampa1, MejorRetardo)

# Ojo: Internamente el comando "lag2.plot2" usa el 
# comando "ccf". Es decir, solo es otra forma 
# de graficar los resultados.

# Crear una tabla con los resultados. Esto es: con los
# valores de las correlaciones máximas y con los retardos
# asociados a estos valores.


##############################################
############## Tabla Resultados ##############
##############################################


# Para el caso del artículo, se obtiene la siguiente 
# tabla de correlaciones y retardos:

Trampa_1 <- c("C6M" ,   "C6M" ,   "C6M" ,
              "C6M" ,   "C6M" ,   "C6M" ,
              "C6M" ,   "C6S" ,   "C6S" ,
              "C6S" ,   "C6S" ,   "C6S" ,
              "C6S" ,   "C7N" ,   "C7N" ,
              "C7N" ,   "C7N" ,   "C7N" ,
              "C7M" ,   "C7M" ,   "C7M" ,
              "C7M" ,   "Poni",   "Poni",
              "Poni",   "Cere",   "Cere",
              "Isla")

Trampa_2 <- c("C6S"  ,   "C7N"  ,   "C7M"  ,
              "Poni" ,   "Cere" ,   "Isla" ,
              "Membr",   "C7N"  ,   "C7M"  ,
              "Poni" ,   "Cere" ,   "Isla" ,
              "Membr",   "C7M"  ,   "Poni" ,
              "Cere" ,   "Isla" ,   "Membr",
              "Poni" ,   "Cere" ,   "Isla" ,
              "Membr",   "Cere" ,   "Isla" ,
              "Membr",   "Isla" ,   "Membr",
              "Membr")

Correlacion <- c(0.991, 0.815, 0.710, 0.993, 0.551, 0.995, 0.819, 0.818, 0.692, 0.999, 0.573,
                 0.996, 0.802, 0.567, 0.820, 0.463, 0.809, 0.662, 0.573, 0.392, 0.698, 0.573,
                 0.560, 0.997, 0.804, 0.560, 0.466, 0.810)

Retardos <- c(13, 13,  7, 11,  9,  7, 13, 26,  6,  2,  4,  6, 26,  0, 24, 32, 20,  0, 20, 32,  
              0, 20,  2, 4, 24,  2, 27, 20)

Tabla_Corr_Reta <- data.frame(Trampa_1, Trampa_2,
                              Correlacion, Retardos)

View(Tabla_Corr_Reta)


##############################
########## Grafos ############
##############################


# Librería necesaria:

library(igraph)

# Se crea una red (en formato pajek, con los nombres cambiados):

Agroecosistema <- graph( c("Cuartel 6 \n Medio", "Cuartel 6 \n Sur",
                           "Cuartel 6 \n Medio", "Cuartel 7 \n Norte",
                           "Cuartel 6 \n Medio", "Cuartel 7 \n Medio", 
                           "Cuartel 6 \n Medio", "Centro \n Poniente", 
                           "Cuartel 6 \n Medio", "Cerezos",
                           "Cuartel 6 \n Medio", "Isla \n Cerezos",
                           "Cuartel 6 \n Medio", "Membrillero",     
                           "Cuartel 6 \n Sur", "Cuartel 7 \n Norte",
                           "Cuartel 6 \n Sur", "Cuartel 7 \n Medio",
                           "Cuartel 6 \n Sur", "Centro \n Poniente", 
                           "Cuartel 6 \n Sur", "Cerezos",
                           "Cuartel 6 \n Sur", "Isla \n Cerezos",
                           "Cuartel 6 \n Sur", "Membrillero",     
                           "Cuartel 7 \n Norte", "Cuartel 7 \n Medio",
                           "Cuartel 7 \n Norte", "Centro \n Poniente",
                           "Cuartel 7 \n Norte", "Cerezos",
                           "Cuartel 7 \n Norte", "Isla \n Cerezos",
                           "Cuartel 7 \n Norte", "Membrillero",
                           "Cuartel 7 \n Medio", "Centro \n Poniente",
                           "Cuartel 7 \n Medio", "Cerezos",
                           "Cuartel 7 \n Medio", "Isla \n Cerezos",
                           "Cuartel 7 \n Medio", "Membrillero",
                           "Centro \n Poniente", "Cerezos",
                           "Centro \n Poniente", "Isla \n Cerezos",
                           "Centro \n Poniente", "Membrillero",
                           "Cerezos", "Isla \n Cerezos",
                           "Cerezos", "Membrillero",
                           "Isla \n Cerezos", "Membrillero"), directed = F)

# Se grafica la red:

plot(Agroecosistema)

# Se crea un objeto llamado "Circulo" donde se guarda
# una instrucción que hace que la red se grafique 
# como un círculo:

Circulo <- layout_in_circle(Agroecosistema) 

# Se grafica la red como un círculo:

plot(Agroecosistema, layout=Circulo)

####### Graficar los nodos de diferentes colores #######

# Para conocer el orden de los diferentes nodos: 
V(Agroecosistema)$name

# Con base en esta información (siguiendo la lista),
# se puede colorear cada nodo. 

# A continuación se grafican los nodos de diferentes colores
# (es este caso: cuartel 6 de verde, cuartel 7 en rosado y
# externos en azul):

plot(Agroecosistema, layout = Circulo, 
     vertex.color=c("green",
                    "green",
                    "pink", 
                    "pink",
                    "cyan", 
                    "cyan", 
                    "cyan", 
                    "cyan"), 
     edge.width = 3, 
     vertex.size = 28, 
     vertex.color = " gray50", 
     vertex.label.cex = 0.8, 
     vertex.label.color="black", 
     vertex.label.font = 1, 
     vertex.label.dist = 0.0) 

# Agregar densidades totales (tamaño de los nodos):

# Para conocer las densidades totales por trampa,
# se usa esta instrucción: 

# sum(Datos_Trampas$Cuartel_6_Medio) 

# Ojo: El comando se debe ejecutar
# para cada una de las trampas.

# Abundancia de las trampas, de acuerdo al 
# orden de los nodos obtenido con el
# comando “V(Agroecosistema)$name”:

Abundancia <- c(1, 1, 5, 2, 1, 3, 1, 26)  

# Se multiplica por 4 las abundancias, para que 
# las diferencias sean evidentes en la figura
# del grafo:

Abundancia <- 4*Abundancia 

# Se crea un atributo de la red llamado Densidad
# donde se guardan las abundancias:

V(Agroecosistema)$Densidad<- Abundancia 

# Sus valores (multiplicados por 4) se
# pueden ver:

V(Agroecosistema)$Densidad

V(Agroecosistema)$size <- V(Agroecosistema)$Densidad # Con 
# esta instrucción se hace que el tamaño de los nodos sea 
# proporcional al atributo Densidad.

# De esta manera, los nodos ahora
# tienen esta apariencia:

plot(Agroecosistema)  

# Se grafica con el esquema de colores utilizado
# en el artículo:

plot(Agroecosistema, layout = Circulo, 
     vertex.color=c("green",
                    "green",
                    "pink", 
                    "pink",
                    "cyan", 
                    "cyan", 
                    "cyan", 
                    "cyan"), 
     edge.width = 3, 
     vertex.color = " gray50", 
     vertex.label.cex = 0.8, 
     vertex.label.color="black", 
     vertex.label.font = 1, 
     vertex.label.dist = 0.0) 

# Agregar correlaciones:

# Estas van a ser representadas por el
# grosor de los vínculos.

E(Agroecosistema) # Con esta instrucción se obtiene
# el orden de los vínculos.

# Se crea un objeto con los valores de las correlaciones,
# estos se toman de la tabla construida con los resultados
# de la metodología.

CorrelacionGrafo <- Tabla_Corr_Reta$Correlacion

# Se multiplican los valores de las correlaciones
# por 6, para que sean visualmente más evidentes:

CorrelacionGrafo <- 6*CorrelacionGrafo 

E(Agroecosistema)$Correlaciones <- CorrelacionGrafo 
# Se crea un atributo de los vínculos, llamado Correlaciones, 
# en el cual se encuentran las intensidades (correlaciones) 
# asociadas a cada vínculo.

# Se hace que el grosor de los vínculos esté determinado 
# por las correlaciones:

E(Agroecosistema)$width <- E(Agroecosistema)$Correlaciones 

# De esta manera, los vínculos ahora
# tienen esta apariencia:

plot(Agroecosistema)  

# Se grafica con el esquema de estético utilizado
# en el artículo:

plot(Agroecosistema, layout = Circulo, 
     vertex.color=c("green",
                    "green",
                    "pink", 
                    "pink",
                    "cyan", 
                    "cyan", 
                    "cyan", 
                    "cyan"), 
     vertex.color = " gray50", 
     vertex.label.cex = 0.8, 
     vertex.label.color="black", 
     vertex.label.font = 1, 
     vertex.label.dist = 0.0) 

# Finalmente, se incluyen los retardos 
# (color de los vínculos). Para esto se
# crea un objeto con los valores 
# de los retardos:

RetardosGrafo <- Tabla_Corr_Reta$Retardos

# Se transforma los valores de los de los retardos en 
# función a 1, y se los separa proporcionalmente a 
# sus valores originales. Esta información se guarda en 
# un objeto llamado “iii”:

iii <- cut(RetardosGrafo, breaks = seq(min(RetardosGrafo),
                                       max(RetardosGrafo), len = 100), 
           include.lowest = TRUE) 

# Se crea un objeto que contiene un conjunto de tonos,
# del gris al negro, que son proporcionales a los valores de 
# los retardos transformados:

ColoresRetardos <- colorRampPalette(c("gray", "black"))(99)[iii] 
# Transformo los valores anteriores en tonos del gris al negro. 

# Se crea un atributo del grafo con los tonos:

E(Agroecosistema)$Retardos <- ColoresRetardos 

# Se asignan estos colores al atributo de colores del grafo:

plot(Agroecosistema, edge.color= E(Agroecosistema)$Retardos) 

# Se grafica con el esquema de estético utilizado
# en el artículo:

plot(Agroecosistema, layout = Circulo, 
     edge.color= E(Agroecosistema)$Retardos,
     vertex.color=c("green",
                    "green",
                    "pink", 
                    "pink",
                    "cyan", 
                    "cyan", 
                    "cyan", 
                    "cyan"), 
     vertex.color = " gray50", 
     vertex.label.cex = 0.8, 
     vertex.label.color="black", 
     vertex.label.font = 1, 
     vertex.label.dist = 0.0) 


##################################################
##################################################
#      Grafos utilizados en la metodología
##################################################
##################################################


# Solo correlaciones:

plot(Agroecosistema, layout = Circulo, 
     vertex.color=c("green",
                    "green",
                    "pink", 
                    "pink",
                    "cyan", 
                    "cyan", 
                    "cyan", 
                    "cyan"), 
     vertex.size = 28, 
     vertex.color = " gray50", 
     vertex.label.cex = 1, 
     vertex.label.color="black", 
     vertex.label.font = 1, 
     vertex.label.dist = 0.0) 

# Correlaciones y retardos:

plot(Agroecosistema, layout = Circulo, 
     edge.color= E(Agroecosistema)$Retardos,
     vertex.color=c("green",
                    "green",
                    "pink", 
                    "pink",
                    "cyan", 
                    "cyan", 
                    "cyan", 
                    "cyan"), 
     vertex.size = 28, 
     vertex.color = " gray50", 
     vertex.label.cex = 1, 
     vertex.label.color="black", 
     vertex.label.font = 1, 
     vertex.label.dist = 0.0) 

# Capturas, correlaciones y retardos:

plot(Agroecosistema, layout = Circulo, 
     edge.color= E(Agroecosistema)$Retardos,
     vertex.color=c("green",
                    "green",
                    "pink", 
                    "pink",
                    "cyan", 
                    "cyan", 
                    "cyan", 
                    "cyan"), 
     vertex.color = " gray50", 
     vertex.label.cex = 0.9, 
     vertex.label.color="black", 
     vertex.label.font = 1, 
     vertex.label.dist = -2) 
