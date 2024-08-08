#New-NetFirewallRule -DisplayName "NoNetworkBizagi" -Direction Outbound -Program "C:\Users\%username%\AppData\Local\Programs\Bizagi\Bizagi Modeler\BizagiModeler.exe" -Action Block
#
#Caso os scripts estejam desabilitados é necessario executar esse comando abaixo
#Set-ExecutionPolicy RemoteSigned
#
#Para esse comando funcionar é necessario mudar o caminho de instalação para c:\bizagi e executar como administrador
$programPath = "C:\Bizagi\BizagiModeler.exe"
$ruleName = "NoNetwork_Bizagi"

# Verifica se a regra já existe
if (!(Get-NetFirewallRule -DisplayName $ruleName)) {
    # Cria a regra
    New-NetFirewallRule -DisplayName $ruleName -Direction Outbound -Program $programPath -Action Block -Profile Domain,Private,Public -Description "Bloqueia o programa Bizagi Modeler"
    Write-Host "Regra criada com sucesso!"
} else {
    Write-Host "Regra já existe."
}
