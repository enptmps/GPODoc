function Get-GppCommentPath {
    <#
    .SYNOPSIS
    Get Group Policy Preferences Comment file path
    
    .DESCRIPTION
    Get Group Policy Preferences Comment file path
    
    .PARAMETER Gpo
    Group Policy Object reference
    
    .PARAMETER ConfigType
    Configuration Type: Machine or User

    .EXAMPLE
    $gppPath = Get-GppCommentPath -Gpo $gpo -ConfigType 'Machine'
    
    .NOTES
    Updated for 1.2 to handle explicit domain FQDN values
    #>
    param (
        [parameter(Mandatory=$True, HelpMessage="Group Policy Object")]
            [ValidateNotNullOrEmpty()]
            $Gpo,
        [parameter(Mandatory=$True, HelpMessage="Machine or User")]
            [ValidateNotNullOrEmpty()]
            [string] $ConfigType
    )
    $result = "\\$($gpo.DomainName)\SYSVOL\$($gpo.DomainName)\Policies\{$($gpo.Id)}\$ConfigType\Preferences"
    if (Test-Path $result) {
        Write-Output $result
    }
    else {
        Write-Output ""
    }
}
