$data= @(
    #se accede con $data[n] y con $data[0].Infinitive si deseamos un elemento concreto

[PSCustomObject]@{
    Infinitive = "arise"; SimplePast= "arose"; PastParticiple="arisen" 
}
[PSCustomObject]@{
    Infinitive = "do"; SimplePast= "did"; PastParticiple="done" 
}
)

$testigo=0
$data | ForEach-Object {
    # Aquí puedes acceder a cada elemento del array con la variable $_
    <# Write-Host "Infinitive: $($_.Infinitive)"
    Write-Host "SimplePast: $($_.SimplePast)"
    Write-Host "PastParticiple: $($_.PastParticiple)" #>
    if ($($_.Infinitive) -eq $lista[0]){
        $testigo+=1
        if($testigo -gt 0){
            Write-Host "ese verbo ya existe salimos del for"
            break # romper el bucle
          }
    }
}

for ($i = 0; $i -lt $data.Count; $i++) {  #necesitamos un forearh o romper el loop después que meta introduzca
    if ($lista[0] -eq $data[$i].Infinitive){ #si uno de ellos concuerda el testigo cambia
        $testigo+=1
        if($testigo -gt 0){
            Write-Host "ese verbo ya existe salimos del for"
            break # romper el bucle
          }
    }}


READ-VARIABLE