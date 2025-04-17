cls

$pole_autoruv_pocitac_info = @(

"informace z pocitace na kterem byl program vytvoren:"
""
"Name                           Value"
"----                           -----"
"PSVersion                      5.1.19041.3570"
"PSEdition                      Desktop"
"PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}"
"BuildVersion                   10.0.19041.3570"
"CLRVersion                     4.0.30319.42000"
"WSManStackVersion              3.0"
"PSRemotingProtocolVersion      2.3"
"SerializationVersion           1.1.0.1"

"------- verze .NET Framework -------"
"533325"
)

for ( $i=0; $i -le $pole_autoruv_pocitac_info.Length -1; $i++ ) { Write-Host -ForegroundColor cyan $pole_autoruv_pocitac_info[$i] }

###############################################################################################################################
echo ""
echo "a stejne informace o verzich z vaseho pocitace jsou pro porovnani zde"
echo $PSVersionTable # jakak verze Power Shellu je v pocitaci
#echo $PSVersionTable.PSVersion
#echo $PSVersionTable.BuildVersion

echo ""
echo "------- verze .NET Framework -------" # vytahne obsah klice z registru a zvjisti verzi .NET Framework v pocitaci
$ver_NET = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").Release
echo $ver_NET
echo ""

Write-Host -ForegroundColor red 'prohlednete si prosim screenshoty z adesare  - "FAQ co poradil Microsoft Copilot AI"'
echo ""

Read-Host -Prompt "Press ENTER to exit"
sleep 1
