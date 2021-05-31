# get-attribute
# Set-attribute
# remove-attribute
# new-attribute

function Get-Attribute
{
    param 
    (
        [string]$Filepath,
        [string]$String,
        [string]$AttributeName
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

        if($CheckFlag -eq 1 -and $FileContent[$I] -match $AttributeName)
        {
            
            $CurrentAttribute = $FileContent[$I] -replace "<$AttributeName>","" -replace "</$AttributeName>",""
            $data = @(
            [pscustomobject]@{FilePath=$Filepath;String=$String;AttributeName=$AttributeName;AttributeValue=$CurrentAttribute;LineCount = $I }
            )

            return $data

        }

    }
       
}

#Get-Attribute -Filepath .\test.txt -String "<StringStart1>" -Attribute "attribute4"