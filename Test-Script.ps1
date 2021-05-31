#probably something to fix with a module file later!
. .\Get-Attribute.ps1
. .\Set-Attribute.ps1

#$testvar = Get-Attribute -Filepath .\test.txt -String "<StringStart1>" -AttributeName "attribute4" 

#.\Set-Attribute.ps1 -Filepath .\test.txt -String "<StringStart1>" -AttributeName "Attribute4" -AttributeValue "Testing4"

Get-Attribute -Filepath .\test.txt -String "<StringStart1>" -AttributeName "attribute4" | Set-Attribute -AttributeValue "Testing4"

Get-Attribute -Filepath .\test.txt -String "<StringStart1>" -AttributeName "attribute4" | Set-Attribute -AttributeValue "Test4"