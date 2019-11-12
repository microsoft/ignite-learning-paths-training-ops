param (
    [string]$valuesFile="values.yaml",
    [string]$hostName
)

$valuesFile='values.yaml'

Describe 'Cart Host' {
    $hostObject = Get-Content $valuesFile

    It 'A test that should be true' {
      $hostObject[37].split(" ")[7] | Should -Be $hostName
    }
  }