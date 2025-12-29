Function clear { [System.Console]::Clear() }
Set-Alias c clear -Scope Global -Option AllScope -Force
Set-Alias l Get-ChildItem -Scope Global -Option AllScope -Force
Set-Alias j Set-Location -Scope Global -Option AllScope -Force
Set-Alias zj zellij -Scope Global -Option AlLScope -Force 
Set-Alias nf neofetch -Scope Global -Option AllScope -Force 

function ll { Get-ChildItem -Force @args } 
function ftouch { New-Item -ItemType File -Path $args[0] -Force }
