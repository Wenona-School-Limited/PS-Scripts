﻿If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

Import-Module ActiveDirectory
$groups = get-content C:\Scripts\BlockSendersoutsideOrganisation.txt | Get-ADGroup 

$groups | Set-ADObject -Add @{msExchRequireAuthToSendTo=$true}