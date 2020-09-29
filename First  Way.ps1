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

$Global:pathPanel= split-path -parent $MyInvocation.MyCommand.Definition
function LoadXaml ($filename){
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}
$XamlMainWindow=LoadXaml("$Global:pathPanel\main.xaml")
$reader = (New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form = [Windows.Markup.XamlReader]::Load($reader)

$CEIP = $Form.FindName("CEIP")
$Choose_Network = $Form.FindName("Choose_Network")
$Choose_Static = $Form.FindName("Choose_Static")
$DNS_Server = $Form.FindName("DNS_Server")
$Domain_Name = $Form.FindName("Domain_Name")
$Gateway = $Form.FindName("Gateway")
$Github = $Form.FindName("Github")
$IPAddress = $Form.FindName("IPAddress")
$MainPanel = $Form.FindName("MainPanel")
$Network_Mask = $Form.FindName("Network_Mask")
$NTP = $Form.FindName("NTP")
$Passwd_R = $Form.FindName("Passwd_R")
$Passwd_VCSA = $Form.FindName("Passwd_VCSA")
$Site_Name = $Form.FindName("Site_Name")
$SSH = $Form.FindName("SSH")


$Form.ShowDialog() | Out-Null

