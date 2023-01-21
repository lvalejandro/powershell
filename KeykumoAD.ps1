@@ -0,0 +1,58 @@
$nl = [Environment]::NewLine
#nl aplica un salyo de línea 

##### primera parte del script #######


##### Connect-AzureAD 
#el script no funciona si ese módulo está instalado, por lo tanto si lo está lo desinstalamos
if ( Get-InstalledModule -Name Connect-AzureAD -ErrorAction Ignore)
 {
    
    Uninstall-Module -Name connect-AzureAD
     
 }
 

##### segunda parte del script #######


 ####  AzureADPreview ###### 
 ##Necesitamos saber si está instalado y si no lo está lo necesitamos
 $test = Get-InstalledModule -Name AzureADPreview -ErrorAction Ignore
 # metemos el resultado en una variable, si no lo está,  error no sale nada ya que se ignora y por lo tanto la variable $test
 #estaría vacía. si está vacía es que no existía el módulo por lo tanto lo instalamos 
  if ($null -eq $test) # si está vacía es que no existe AzureADPreview, y la instalamos 
  {
    Install-Module AzureADPreview
  }





  
### Fecha del script ######
## no existe comprobaciones.
#los resultados que dará son los que existan después de esa fecha, es decir:
# 2020-01-01 nos dará los sigin desde esa fecha hasta el día actual 

Write-Host "HOLA $nl"
Write-Host "Los resultados que descargaremos  son los que indiques en el rango de fechas $nl" 
write-host "No esta implementada comprobación alguna por lo tanto introduce las fechas en el formato adecuado y no pidas el día 31 si no existe $nl"
write-host "EL formato es el siguiente:   YYYY-MM-DD $nl "
$fechainicio = Read-Host "Dame la fecha de inicio de rango en este formato 2022-03-11:$nl"
$fechafinal = Read-Host "Dame la fecha de final de rango  en este formato 2022-03-11:$nl"





#### la parte final del SCRIPT



## conectamos al TENANT
connect-AzureAD

Get-AzureADAuditSignInLogs -All:$true -Filter "createdDateTime gt $fechainicio and createdDateTime lt $fechafinal" |  Select-Object CreatedDateTime, UserDisplayName, UserPrincipalName, AppDisplayName,ClientAppUsed,  IpAddress,@{Name = 'Error'; Expression = { $_.Status.FailureReason }}, @{Name='ErrorCode'; Expression = {$_.status.ErrorCode}},  @{Name = 'SO'; Expression = { $_.DeviceDetail.OperatingSystem }}, @{Name = 'Provincia'; Expression =  { $_.Location.State }}, @{Name = 'Ciudad'; Expression =  { $_.Location.City }},@{Name = 'País'; Expression =  { $_.Location.CountryOrRegion }} | Export-CSV "C:\TEST101.CSV" -NoTypeInformation -Encoding UTF8
