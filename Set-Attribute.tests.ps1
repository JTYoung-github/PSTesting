BeforeAll { 
    . $PSScriptRoot/Get-Attribute.ps1
    . $PSScriptRoot/Set-Attribute.ps1
    $Attribute1 = "attribute4"
    $Attribute2 = "attribute9"

    $String1 = "<StringStart1>"
    $String2 = "<StringStart2>"

    $AttributeValue1 = "Testing4"
    $AttributeValue2 = "Testing9"
    $AttributeValue3 = "Temping4"

    $Filepath = ".\test.txt"
    $TestPath = "TestDrive:\test.txt"
    Set-Content $testPath -value (Get-Content $PSScriptRoot/$FilePath)

}

#Set-Attribute -Filepath .\test.txt -String "<StringStart1>" -Attribute "attribute4" -AttributeValue "Test4"

Describe 'Set-Attribute' {
    Context 'Updating different attributes' {
        It 'updating attribute4 ' {
            $TestAttribute = Set-Attribute -Filepath $TestPath -String $String1 -Attribute $Attribute1 -AttributeValue $AttributeValue1
            $TestAttribute.AttributeName | Should -Be $Attribute1           
            $TestAttribute.Attribute | Should -Be $AttributeValue1
            $TestAttribute.LineCount | Should -Be "4"
        }    

        It 'updating attribute9 ' {
            $TestAttribute = Set-Attribute -Filepath $TestPath -String $String1 -Attribute $Attribute2 -AttributeValue $AttributeValue2
            $TestAttribute.AttributeName | Should -Be $Attribute2           
            $TestAttribute.Attribute | Should -Be $AttributeValue2
            $TestAttribute.LineCount | Should -Be "9"
        }    

    }

    Context 'updating attributes under different strings' {
        It 'setting attribute' {
            $TestAttribute = Set-Attribute -Filepath $TestPath -String $String2 -Attribute $Attribute1 -AttributeValue $AttributeValue3
            $TestAttribute.AttributeName | Should -Be $Attribute1           
            $TestAttribute.Attribute | Should -Be $AttributeValue3
            $TestAttribute.LineCount | Should -Be "16"
        }    
    }


}
