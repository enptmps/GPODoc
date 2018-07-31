function Get-GpoDocVersion {
    $ModuleData = Get-Module GPODoc
    $ModuleVer  = $ModuleData.Version -join '.'
    $ModulePath = $ModuleData.Path -replace 'GPODoc.psm1',''
    return $ModuleVer
}
