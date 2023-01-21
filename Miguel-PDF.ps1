#algo rápido para poder sacar el texto de un pdf para un colega
#se ha de tener acceso a la .dll 

Add-Type -Path "C:\Users\AlexA\OneDrive\PcVirtualPowershellLab\PowerShellTestDirectorio\Miguel-PDF\itextsharp.dll"
$file="C:\Users\AlexA\OneDrive\PcVirtualPowershellLab\PowerShellTestDirectorio\Miguel-PDF\PDF_MIGUEL.pdf"

$pdf= New-Object itextsharp.text.PdfReader -ArgumentList $file