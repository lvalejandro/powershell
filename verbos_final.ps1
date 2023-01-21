#este pequeño proyecto se crea por divertimento mientras estudio verbos irregulares 
#no guarda la registros, simplemente es para el aprendizaje de cierto código




$data= @(
    #se accede con $data[n] y con $data[0].Infinitive si deseamos un elemento concreto

[PSCustomObject]@{
    Infinitive = "arise"; SimplePast= "arose"; PastParticiple="arisen" 
}
[PSCustomObject]@{
    Infinitive = "do"; SimplePast= "did"; PastParticiple="done" 
}
) 



$x = 0 #hacemos un do-while para mas de una iteración al meter verbos
do {
    Write-Host "estas dentro"
    $verbo= Read-Host "dime el verbo con sus tres formas, separadas por espacios"
    $verbo.Trim()
    if([string]::IsNullOrWhiteSpace($verbo)){
        Write-Host ("no puede estar vacio")
    }
    $verbo=$verbo -replace "\s{1,}\b","," #remplazamos esos espacios en blanco por caracteres para la lista
    #terminamos con \b (inicio o fin de una cadena) ya que de lo contrario añadiría una coma despues del PastParticipel
    $lista=$verbo.Split(",") # convertimos el array en lista
    #ahora debemos de contar los elementos y si no es igual a 3, no nos sirve
    if ($lista.count -eq 3){
                Write-Host "son 3 elementos, continuamos"
                #después miraremos que no existan ya: si existen nada, de lo conrario las metemos en el array 
                $testigo=0
            for ($i = 0; $i -lt $data.Count; $i++) {  #necesitamos un forearh o romper el loop después que meta introduzca
                if ($lista[0] -eq $data[$i].Infinitive){ #si uno de ellos concuerda el testigo cambia
                    $testigo+=1
                    if($testigo -gt 0){
                        Write-Host "ese verbo ya existe salimos del for"
                        break # romper el bucle
                      }
                }}
                if($testigo -eq 0){#añadimo el verbo ya que el testigo no ha cambiado, ergo ese verbo no existe
                    $data += [PSCustomObject]@{
                        Infinitive = $lista[0]; SimplePast= $lista[1]; PastParticiple=$lista[2]
                        
                    }}
                
            }else{
                    Write-Host "no son 3"
                    
                }

   
        $x= Read-Host "si escribes 0 vuelvas a entrar"
    }while ($x -eq 0)
    
    
 
