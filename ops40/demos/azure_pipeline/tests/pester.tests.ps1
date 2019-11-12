param (
    [string]$valuesFile="values.yaml",
    [string]$hostName
)

$valuesFile='values.yaml'

Describe 'Cart Host' {
  $hostObject = Get-Content $valuesFile
  $hostName = $hostObject[37].split(" ")[7]

  It 'A test that should be true' {
    $hostName | Should -Be $hostName
  }
}