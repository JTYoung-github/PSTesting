BeforeAll { 
    . $PSScriptRoot/Get-Attribute.ps1
}

Describe 'Get-Attribute' {
    Context 'Getting different attributes' {
        It 'retrieve attribute4 ' {
            $TestAttribute = Get-Attribute -Filepath .\test.txt -String "<StringStart1>" -Attribute "attribute4"
            $TestAttribute | Should -Be "test4"
        }    

        It 'retrieve attribute9 ' {
            $TestAttribute = Get-Attribute -Filepath .\test.txt -String "<StringStart1>" -Attribute "attribute9"
            $TestAttribute | Should -Be "test9"
        }    

    }

    Context 'testing different strings' {
        It 'setting attribute' {
            $TestAttribute = Get-Attribute -Filepath .\test.txt -String "<StringStart2>" -Attribute "attribute4"
            $TestAttribute | Should -Be "temp4"
        }    
    }

    Context "Checking no values" {
        It "Stri
        ng Argument = Null" {
            $TestAttribute = Get-Attribute -String "<StringStart2>" -Attribute "attribute4"
            $TestAttribute | Should -Be 'No FilePath provided, please provide a FilePath'
        }

    }

}