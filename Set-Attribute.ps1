function Set-Attribute
{
    param 
    (
        [string]$Filepath,
        [string]$String,
        [string]$Attribute,
        [string]$AttributeValue
    )

    $CurrentAttribute = Get-Attribute -Filepath $Filepath -String $String -Attribute $Attribute

    $FileContent = Get-Content $Filepath

    $FileContent[$CurrentAttribute.LineCount] = $FileContent[$CurrentAttribute.LineCount] -replace $($CurrentAttribute.Attribute),$AttributeValue

    Set-Content $Filepath -value $FileContent

    $UpdatedData = [pscustomobject]@{AttributeName=$Attribute;Attribute=$AttributeValue;LineCount=$($CurrentAttribute.LineCount)}

    return $UpdatedData

}

