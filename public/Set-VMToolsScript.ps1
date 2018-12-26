function Set-VMToolsScript {
  #Requires -Version 3.0
  #Requires -Modules VMware.VimAutomation.Core
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory = $true, ValueFromPipeline = $false)]
    [VMware.VimAutomation.ViCore.Impl.V1.VM.UniversalVirtualMachineImpl]$VM,
    [string]$Path,
    [string]$DestinationPath,
    [PSCredential]$HostCredential,
    [PSCredential]$GuestCredential
  )

  Begin {
    $VMToolsScriptFileName = 'VMToolsScript.ps1'
    if ($null -eq $Path) {
      $Path = '{0}\Temp\{1}' -f $env:LOCALAPPDATA, $VMToolsScriptFileName
    }
    if ($null -eq $DestinationPath) {
      $Path = '{0}\VMTools\{1}' -f $env:ProgramData, $VMToolsScriptFileName
    }
  }

  Process {
    Copy-VMGuestFile -Source $Path -Destination $DestinationPath -LocalToGuest -VM $VM -Force
  }

  End {
  }

}
