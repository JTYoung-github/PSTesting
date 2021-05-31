function Set-Attribute
{
    param 
    (
        [Parameter(ValueFromPipelineByPropertyName)][string]$Filepath,
        [Parameter(ValueFromPipelineByPropertyName)][string]$String,
        [Parameter(ValueFromPipelineByPropertyName)][string]$AttributeName,
        [string]$AttributeValue
    )

    $CurrentAttribute = Get-Attribute -Filepath $Filepath -String $String -Attribute $AttributeName

    $FileContent = Get-Content $Filepath

    $FileContent[$CurrentAttribute.LineCount] = $FileContent[$CurrentAttribute.LineCount] -replace $CurrentAttribute.AttributeValue,$AttributeValue

    Set-Content $Filepath -value $FileContent

    $UpdatedData = @(
        [pscustomobject]@{FilePath=$Filepath;String=$String;AttributeName=$AttributeName;AttributeValue=$AttributeValue;LineCount = $null }
        )

    return $UpdatedData

}

