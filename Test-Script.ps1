#probably something to fix with a module file later!
. .\Get-Attribute.ps1
. .\Set-Attribute.ps1

Set-Attribute -Filepath .\test.txt -String "<StringStart1>" -Attribute "attribute4" -AttributeValue "Test4"