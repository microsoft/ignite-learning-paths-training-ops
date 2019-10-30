param (
    [string]$valuesFile="values.yaml",
    [string]$hostName
)

Describe 'Cart Host' {
    $a = Get-Content $valuesFile
    write-output $a[37].split(" ")[7]

    It 'A test that should be true' {
      $a[37].split(" ")[7] | Should -Be $hostName
    }
  }