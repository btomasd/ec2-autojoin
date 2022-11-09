<powershell>
# Create logfile function

$Logfile = "C:\Windows\ADjoin.log"

function WriteLog
{
Param ([string]$LogString)
$Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
$LogMessage = "$Stamp $LogString"
Add-content $LogFile -value $LogMessage
}







WriteLog "Installing provider"
<# Install Dependencies #>
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force;
Install-Module -Name AWS.Tools.Installer -Scope AllUsers -Force;
WriteLog "Vars defined"
<# Define Variables #>
$ec2_name = Invoke-RestMethod -Method GET -Uri http://169.254.169.254/latest/meta-data/tags/instance/Name;
WriteLog "Rename computer"
<# Rename Machine #>;
Rename-Computer -NewName $ec2_name -Force;
WriteLog "Installing provider"
<# Define Variables for AD#>
WriteLog "Getting Secrets"
$ad_secret_id = "${ad_secret_id}";
$ad_domain = "${ad_domain}";
$ipdns = "${dns}"

<# Read secret from the Secret Manager #>
$secret_manager = Get-SECSecretValue -SecretId $ad_secret_id;

<# Convert the Secret JSON into an object #>
$ad_secret = $secret_manager.SecretString | ConvertFrom-Json;

<# Set Credentials #>;
$username = $ad_secret.username + "@" + $ad_domain;
$password = $ad_secret.password | ConvertTo-SecureString -AsPlainText -Force;
$credential = New-Object System.Management.Automation.PSCredential($username, $password);

#Set up DNS
WriteLog "Setting DNS"
Set-DnsClientServerAddress "Ethernet" -ServerAddresses $ipdns
WriteLog "Adding to AD"
<# Join AD Domain #>;
Add-Computer -DomainName $ad_domain -Credential $credential -Options JoinWithNewName,AccountCreate -Force -Restart;

</powershell>