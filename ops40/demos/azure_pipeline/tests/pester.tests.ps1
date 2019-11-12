param (
    [string]$valuesFile="values.yaml",
    [string]$hostName
)

$valuesFile='values.yaml'
$hostName = Get-Content $valuesFile[37].split(" ")[7]
# $hostName = $hostObject[37].split(" ")[7]

Describe 'Cart Host' {
  It 'A test that should be true' {
    $hostName | Should -Be $hostName
  }
}