 $data= @(
    #esto funciona y se accede con $data[n] y con $data[0].Infinitive si deseamos un elemento concreto

[PSCustomObject]@{
    Infinitive = "arise"; SimplePast= "arose"; PastParticiple="arisen" 
}
[PSCustomObject]@{
    Infinitive = "do"; SimplePast= "did"; PastParticiple="done" 
}
) 

$verbo= Read-Host "dime el verbo con sus tres formas, separadas por espacios"
$verbo.Trim()

if([string]::IsNullOrWhiteSpace($verbo)){
    Write-Host ("no puede estar vacio")

}

#$verbo=$verbo.Replace(" ",",")  debemos de dear uno o mas espacios en blanco en solo uno 
#además si hago .replace no me pilla las ER,solo si lo hago como indico
$verbo=$verbo -replace "\s{1,}\b",","
$lista=$verbo.Split(",") # convertimos el array en lista


#ahora debemos de contar los elementos y si no es igual a 3, no nos sirve
if ($lista.count -eq 3)
{
    Write-Host "son 3"
}else{
    Write-Host "no son 3"
}

#después miraremos que no existan ya: si existen nada, de lo conrario las metemos en el array 
#msacamos el primer valor de $lista

<# foreach ($i in $lista) {
    #Write-Host $i[0] esto nos sava el primer cararter de cada elemento
    #vamosa usar un if para sacar  $lista[0] que nos da el primer elemeto de la lista, si hacemos un foreach, ver linea anterior
    Write-Host $i
} #>

<# if($lista[0] -like "uno"){
    Write-Host $lista[0] ", ya existe"
    #aqui tendremos que recorrer todos los data[0].Infinity para poder comparar con ese $lista[0]
} #>

#tenemos que comparar el primer valor con todos los $dat[0].Infinitive

<# foreach ($infinitive in $data[0]) { #un foreach no nos sirve ya que tenemos que recorrer y cambiar el valor
    if ($infinitive -like $lista[0]) {
        Write-Host $lista[0] " existe ya "
    }else{
        Write-Host $lista[0] " no existe"
    }
        
} #>

for ($i = 0; $i -lt $data.Count; $i++) {  #necesitamos un forearh o romper el loop después que meta introduzca
    if ($data[$i].Infinitive -eq $lista[0]) {
        Write-Host $lista[0] " existe ya "
    }else{
        Write-Host $lista[0] " no existe"
        $data += [PSCustomObject]@{
        Infinitive = $lista[0]; SimplePast= $lista[1]; PastParticiple=$lista[2]
    } 
      break
      }
    }


# recapitulemos
#contamos si son 3 valores
#comparamos lo que nos da el usuarios con el array

#debemos de crear el string que, en caso de que n o existe, meta en la variable $data los valores




