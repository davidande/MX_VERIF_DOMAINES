$Domaines = ipcsv -Path .\Domaines.csv -Delimiter ";" | Select -ExpandProperty Domaine -Unique
Foreach ($Domaine in $Domaines) 
    {
        Resolve-DnsName -Name $Domaine -Type MX -DnsOnly |
        Select Name, NameExchange, Preference |
        Where Preference -GT 0 | Sort -Property Preference  |
        Out-file .\CheckMX.txt -Append
    }



