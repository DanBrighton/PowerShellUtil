#read content from a text document in current directory
$computers=get-content PingComputer.txt

#for every device name in the text document
foreach ($Device in $computers)
{
    #if the device is contactable
    if(Test-Connection $Device -Count 1 -Quiet)
    {
        Write-Host "Succeed ping ${Device}"
    }
    #If cant contact, return error message
    else
    {
        Write-Host "Fail ping ${Device}"
    }
}