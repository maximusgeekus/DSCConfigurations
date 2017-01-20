Configuration AD_DomainMembership
{   
    param
    (
        [Parameter(Mandatory=$true)]
        [string]$Domain,

        [Parameter(Mandatory=$true)]
        [pscredential]$Credential

    )

    Import-DscResource -ModuleName 'xDSCDomainjoin'
        
    node $AllNodes.NodeName
    {
        xDSCDomainjoin JoinDomain
        {
            
            Domain = $Domain
            Credential = $Credential
           
        }
    }
}

<#
$ConfigData = @{
                #Place any specific additional configuration data requirements here
                AllNodes = @(
                              @{
                                 NodeName = "IsDomainMember"

                                 # Allows credential to be saved in plain-text in the the *.mof instance document.
                                 PSDscAllowPlainTextPassword = $true

                                 Domain = "cosmos.com"

                              }
                              
                              @{
                                 NodeName = "NotDomainMember"

                                 # Allows credential to be saved in plain-text in the the *.mof instance document.
                                 PSDscAllowPlainTextPassword = $true
                              }
                            )
              }
#>

<#@{

    AllNodes = @(

        @{
            NodeName        = "*"
            SQLServerName   = "MySQLServer"
            SqlSource       = "C:\Software\Sql"
            DotNetSrc       = "C:\Software\sxs"
        },

        @{
            NodeName        = "Prod-SQL"
            Role            = "MSSQL"
        },

        @{
            NodeName        = "Prod-IIS"
            Role            = "Web"
            SiteContents    = "C:\Website\Prod\SiteContents\"
            SitePath        = "\\Prod-IIS\Website\"
        }

        @{
            NodeName         = "Dev"
            Role             = "MSSQL", "Web"
            SiteContents     = "C:\Website\Dev\SiteContents\"
            SitePath         = "\\Dev\Website\"

        }

    )

}

    )

}
#>