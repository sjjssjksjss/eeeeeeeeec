# Get the current logged-in username
$UserName = $env:USERNAME

# Remove the password (set to blank)
net user $UserName ""

# Disable password expiration
wmic UserAccount where Name="$UserName" set PasswordExpires=False

# Enable auto-login (optional, use with caution)
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "$UserName" /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d "" /f
