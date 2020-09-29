#########################################################################
#                        Add shared_assemblies                          #
#########################################################################

[Void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 
[System.Reflection.Assembly]::LoadFrom('assembly\ControlsEx.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')      | out-null  
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.Core.dll')      | out-null 
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.dll')      | out-null 
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.Entypo.dll')      | out-null 
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.FontAwesome.dll')      | out-null 
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.Material.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.MaterialDesign.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.Modern.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.Octicons.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.PicolIcons.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.RPGAwesome.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.SimpleIcons.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.Unicons.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.IconPacks.Zondicons.dll') | Out-Null
[System.Reflection.Assembly]::LoadFrom('assembly\Microsoft.Xaml.Behaviors.dll') | Out-Null
[System.Reflection.Assembly]::LoadFrom('assembly\System.Windows.Interactivity.dll') | Out-Null
#########################################################################
#                        Load Main Panel                                #
#########################################################################
#$verboseLogFile = "VMwareLab.log"
#$Global:pathLog = "$env:USERPROFILE\desktop\$verboseLogFile" 

$Global:pathPanel= split-path -parent $MyInvocation.MyCommand.Definition
function LoadXaml ($filename){
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}
$XamlMainWindow=LoadXaml("$Global:pathPanel\main.xaml")
$reader = (New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form = [Windows.Markup.XamlReader]::Load($reader)

$XamlMainWindow.SelectNodes("//*[@Name]") | %{
    try {Set-Variable -Name "$("WPF_"+$_.Name)" -Value $Form.FindName($_.Name) -ErrorAction Stop}
    catch{throw}
    }

Function Get-FormVariables{
if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
get-variable *WPF*
}
Get-FormVariables



$Form.ShowDialog() | Out-Null

