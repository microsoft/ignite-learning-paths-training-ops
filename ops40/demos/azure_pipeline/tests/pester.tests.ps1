param (
    [string]$hostName
)

$valuesFile='values.yaml'
$hostObject = Get-Content $valuesFile
$DBName = $hostObject[37].split(" ")[7]

Describe 'Cart Host' {
  It 'A test that should be true' {
    $DBName | Should -Be $hostName
  }
}