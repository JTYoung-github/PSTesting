# get-attribute
# update-attribute
# remove-attribute
# new-attribute
# check-attribute - check out pester tests perhaps? if not, write a custom function
Import-Module Pester

function Get-Attribute
{
    param 
    (
        [string]$Filepath,
        [string]$String,
        [string]$Attribute
    )

    if (Test-Path $Filepath)
    {
        $FileContent = Get-Content $Filepath
    }
    else {
        return "No FilePath provided, please provide a FilePath"
    }


    for($I=0; $I -lt $FileContent.count; $I++)
    {

        if ($FileContent[$I] -match $String ) 
        {
            $CheckFlag = 1
        }

        if ($FileContent[$I] -match "/$String" ) 
        {
            $CheckFlag = 0
        }

        if($CheckFlag -eq 1 -and $FileContent[$I] -match $Attribute)
        {
            
            $AttributeValue = $FileContent[$I] -replace "<$Attribute>","" -replace "</$Attribute>",""
            return $AttributeValue

        }

    }
       
}


#Get-Attribute -Filepath .\test.txt -String "<StringStart1>" -Attribute "attribute4"