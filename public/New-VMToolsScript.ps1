function New-VMToolsScript {
  #Requires -Version 3.0
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory = $true, ValueFromPipeline = $false)]
    [string]$ScriptText,
    [string]$AppendCommand,
    [string]$Path = ''
  )

  Begin {
    $VMToolsScriptFileName = 'VMToolsScript.ps1'
    if ('' -eq $Path) {
      $FilePath = '{0}\Temp\{1}' -f $env:LOCALAPPDATA, $VMToolsScriptFileName
    }
  }

  Process {
    $ScriptText | Out-File -FilePath $FilePath -Force
    $AppendCommand | Out-File -FilePath $FilePath -Append
  }

  End {
  }

}
