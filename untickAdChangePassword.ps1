$adGroup = ""

$studentList = Get-ADGroupMember -Identity $adGroup -Recursive | where-Object { $_.objectClass -eq "user" }

foreach($student in $studentList)
{
    Set-ADUser -identity $student -ChangePasswordAtLogon $false
    write-host $student.Name
}
