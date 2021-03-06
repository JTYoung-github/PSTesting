BeforeAll { 
    . $PSScriptRoot/../Get-Attribute.ps1
    $Attribute1 = "attribute4"
    $Attribute2 = "attribute9"

    $String1 = "<StringStart1>"
    $String2 = "<StringStart2>"

    $Filepath = ".\test.txt"
    $TestPath = "TestDrive:\test.txt"
    Set-Content $testPath -value (Get-Content $PSScriptRoot/$FilePath)

}

Describe 'Get-Attribute' {
    Context 'Getting different attributes' {
        It 'retrieve attribute4 ' {
            $TestAttribute = Get-Attribute -Filepath $TestPath -String $String1 -AttributeName $Attribute1
            $TestAttribute.FilePath | Should -Be $TestPath
            $TestAttribute.String | Should -Be $String1          
            $TestAttribute.AttributeName | Should -Be $Attribute1           
            $TestAttribute.AttributeValue | Should -Be "test4"
            $TestAttribute.LineCount | Should -Be "4"
        }    

        It 'retrieve attribute9 ' {
            $TestAttribute = Get-Attribute -Filepath $TestPath -String $String1 -AttributeName $Attribute2
            $TestAttribute.FilePath | Should -Be $TestPath
            $TestAttribute.String | Should -Be $String1
            $TestAttribute.AttributeName | Should -Be $Attribute2           
            $TestAttribute.AttributeValue | Should -Be "test9"
            $TestAttribute.LineCount | Should -Be "9"
        }    

    }

    Context 'testing different strings' {
        It 'setting attribute' {
            $TestAttribute = Get-Attribute -Filepath $TestPath -String $String2 -AttributeName $Attribute1
            $TestAttribute.FilePath | Should -Be $TestPath
            $TestAttribute.String | Should -Be $String2
            $TestAttribute.AttributeName | Should -Be $Attribute1           
            $TestAttribute.AttributeValue | Should -Be "temp4"
            $TestAttribute.LineCount | Should -Be "16"
        }    
    }

    Context "Checking no values" {
        It "String Argument = Null" {
            $TestAttribute = Get-Attribute -String $String2 -AttributeName $Attribute1
            $TestAttribute | Should -Be 'No FilePath provided, please provide a FilePath'
        }

    }

}