Start-Process "msiexec.exe" -Args "/x {E43F30A4-1A56-408F-BF17-C5E808FD4DAC} /q /n" -Wait

Start-Process "msiexec.exe" -Args "/x {A970DAFC-8683-47C1-9C72-E9C59AD9BD0E} /q /n" -Wait

Start-Process "C:\Program Files (x86)\National Instruments\Shared\NIUninstaller\uninst.exe" -Args "/CompanyEnum LEGO_SW /qb /x all" -Wait