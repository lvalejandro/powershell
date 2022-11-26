#has de lanzarlo desde el directorio de TM1DATA
#si fueran más de 4 elementos los que se recopilan:
###debes adecuar en $columnas ese elemento de más o de menos
#$columnas=@("puerto,servidor,adminhost,path") # creamos la definición de las columnas para el csv
###debes de adecuar el -eq x a el numero de elementos 
#if ($contador -eq 4) #cuando se metan 4 valores (es decir 4 iteraciones) en la linea (salen concatenados uno,dos,tres,cuatro)


##### primera parte del script #######
#### obtenemos la lista de ficheros que después vamos a parsear####

$files=Get-ChildItem -Path . -Recurse -Filter *.txt #guardamos la lista de ficheros en una variable
$files

foreach ($i in $files) #recorremos cada fichero de $files
{
    #$contenido+=get-Content $i #get-conten en cada fichero ($i) y lo añadimos += a la variable
    #Write-Host $i # nos da los ficheros y mantenemos el directorio
    #Get-Content $i #lee de los ficheros
    #Get-Content $i | Select-String -Pattern "iden|prueba" #esto  nos puede servir para sacar la linea entera
    #(Get-Content $i | Select-String -Pattern "(ServerName=).+|(PortNumber=).+|(AdminHost=).+").Matches.Value #con esto aislo las cadenas que necesito 
    $resultado+=(Get-Content $i.FullName | Select-String -Pattern "(ServerName=).+|(PortNumber=).+|(AdminHost=).+").Matches.Value #mete el resultado en una variable
    $resultado+=$i.FullName #de este modo terminamos   cada iteración con el path del file que se lee y nos sirve de marca

}
$resultado

##### segunda parte del script #######
#### creamos una variable con los resultados debidamente ordenados para exportar en csv ####


$linea=""
$columnas=@("puerto,servidor,adminhost,path") # creamos la definición de las columnas
$array=@()
$final=""

$contador=0
for ($i = 0; $i -lt $resultado.Count; $i++) {
    
        #$s+=($resultado[$i] -join",") esto no funciona ya que el join no es para cadenas, sino para variable
        $s=$resultado[$i] #metemos el valor 
        $linea+=($s+",") #esto funciona...concatenamos el valor con ,
        $contador+=1 
        if ($contador -eq 4) #cuando se metan 4 valores (es decir 4 iteraciones) en la linea (salen concatenados uno,dos,tres,cuatro)
            {
                $contador=0 #reseteamos ya que son 4 los valores que queremos:port,serv,admin,path
                $array+=$linea #volcamos la linea en la array. cada volcado es una linea en el array 
                                #usamos un array para poder exportar a csv y que este a su vez se pueda abrir con excel
                Clear-Variable -Name linea #vaciamos la linea para los siguientes port,ser,admin,path que deseamos
            }

        
        
        
}
$final=$columnas+$array #juntamos para obtener las columnas y los valores para el csv, en otra variables


##test GITHUBE UPDATE 2222
