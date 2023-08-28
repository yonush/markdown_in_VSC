# SoftLab Deployment Process

## Introduction

This document records the creation of Softlab image for School of Computing (SoC).  

## 1. Requirement

This section listed all the software for image creation requirements.

- Hype-V

      Get-WindowsOptionalFeature -Online -FeatureName *hyper-v* | Enable-WindowsOptionalFeature -All

- Windows 10 LTSC
  - SW_DVD5_WIN_ENT_LTSC_2019_64-bit_English_MLF_X21-96425.ISO
  
- Microsoft Office 2019
  - Office Tool Plus.exe
  - office2019volumelicensepack_x64.exe

- Chrome Stand Alone
  - ChromeStandaloneSetup64.exe

- Firefox
  - Firefox Installer.exe
  
- Anaconda3
  - Anaconda3-2019.03-Windows-x86_64.exe

- KNIME 3.7.2
  - KNIME 3.7.2 Installer (64bit).exe

- FileZilla 3.42.1
  - FileZilla_3.42.1_win64_sponsored-setup.exe

- Java Runtime
  - JavaSetup8u211.exe

- Notepad++
  - npp.7.7.Installer.x64.exe

- VirtualBox 6.0.8
  - VirtualBox-6.0.8-130520-Win.exe
  - Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack

- Postgre SQL 11.2.1
  - postgresql-11.2-1-windows-x64.exe

- SQL Server 2017
  - SQLServer2017-SSEI-Expr.exe
  - SSMS-Setup-ENU.exe

- Visual Studio
  - vs_community.exe

- Visual Studio Code
  - VSCodeSetup-x64-1.35.1.exe

- Putty
  - putty-64bit-0.71-installer.msi

- SumatraPDF
  - SumatraPDF-3.1.2-64-install.exe

- PotPlayer
  - PotPlayerSetup64.exe
  
## 2. Create SoC Image

This section demonstrates SoftLab image creation process step by step.

### 2.1 Create VHDX in Hype-V

- **Name**: *Windows IBS image*
  
- **Generation**: *Generation 2*
  
- **Memory**: *8192 MB*
  
- **Hard Disk**: *D:\VM\Windows IBS image.vhdx (VHDX, dynamically expanding)*
  
- **Operating System**: *Will be installed at a later time*

!!! Note
    - Must use disk Generation 2 (VHDX)
    - Must insert DVD after VM created

### 2.2 Install Operating System

- Install Windows 10 LTSC by default

#### Requirement

    SW_DVD5_WIN_ENT_LTSC_2019_64-bit_English_MLF_X21-96425.ISO

!!! Note
    Recommend to use Windows 10 LTSC. Alternatively Windows 1809 Enterprise.

### 2.3 Disable Windows Update - PowerShell Command

    > sc.exe config wuauserv start=disabled
    > sc.exe query wuauserv
    > sc.exe stop wuauserv
    > sc.exe query wuauserv

!!! Note
    Windows update must be disable before connect to Internet.

### 2.4 Install Microsoft Office

- Install Office (a.)
  - Professional Plus 2019 - Volume - [ProPlus2019Volume]
  - Visio Professional 2019 - Volume - [VisioPro2019Volume]
  - Project Professional 2019 - Volume - [ProjectPro2019Volume]
  - Access
  - Publisher
  - Outlook
  - x64
- Install licencepack (b.)

#### Office Requirement

    a. Office Tool Plus.exe
    b. office2019volumelicensepack_x64.exe

!!! Note
    Must use Volume
    Much install Install licencepack.

### 2.5 Active Windows and Office

#### Active Windows - PowerShell Command

    > slmgr.vbs /skms 192.168.25.5 
    > slmgr.vbs /ato
    > slmgr.vbs /xpr

#### Active Office - PowerShell Command

    > cd 'C:\Program Files\Microsoft Office\Office16'
    > cscript.exe .\OSPP.VBS /sethst:192.168.25.5
    > cscript.exe .\OSPP.VBS /act

### 2.6 Configure Windows Optional Feature

#### Enable Hyper-V - PowerShell Command

    Get-WindowsOptionalFeature -Online -FeatureName *hyper-v* | Where {$_.FeatureName -ne "Microsoft-Hyper-V-Hypervisor"} | Enable-WindowsOptionalFeature -Online -NoRestart

!!! Note
    Must exclude "Microsoft-Hyper-V-Hypervisor"

#### Enable Subsystem Linux - PowerShell Command

    Get-WindowsOptionalFeature -Online -FeatureName *Microsoft-Windows-Subsystem-Linux* | Enable-WindowsOptionalFeature -Online -NoRestart

#### Enable Virtual Machine Platform - PowerShell Command

    Get-WindowsOptionalFeature -Online -FeatureName *VirtualMachinePlatform* | Enable-WindowsOptionalFeature -Online -NoRestart

#### Disable Internet Explorer - PowerShell Command

    Disable-WindowsOptionalFeature -Online -FeatureName Internet-Explorer-Optional-amd64 -NoRestart

### 2.7 Configure Registry Keys

#### Registry Requirement

    a. DisableFastboot.reg
    b. DisableInternetProbing.reg
    c. Softlabversion.reg
    d. StartLayout.reg

!!! Note
    Softlab Version will need to be edited manually as version change.

### 2.8 Install Browser

- Install Google Chrome (a.)
- Install Firefox (b.)

#### Browser Requirement

    a. ChromeStandaloneSetup64.exe
    b. Firefox Installer.exe

!!! Note
    Must be installed to all users

### 2.9 BackUp - Stage 1

Shutdown and copy VHDX to other place

!!! Note
    Ensure no "Checkpoint" before copy to other place.

### 2.10 Install VirtualBox

- Install VirtualBox (a.)
- Install Extension Pack (b.)

#### Virtualbox Requirement

    a. VirtualBox-6.0.8-130520-Win.exe
    b. Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack

!!! Note
    VirtualBox will not work if "Hyper-V Hypervisor" installed

### 2.11 Install Database

- Install Postgre SQL (a.)
- Install SQL Server (b.)
- Install SQL Server Management Studio (SSMS) (c.)

#### Database Requirement

    a. postgresql-11.2-1-windows-x64.exe
    b. SQLServer2017-SSEI-Expr.exe
    c. SSMS-Setup-ENU.exe

!!! Note
    Postgre SQL password: Password

### 2.12 Install Visual Studio and Visual Studio Code

- Install Visual Studio (a.)
- Install Visual Studio Code (b.)

#### VS Requirement

    a. vs_community.exe
    b. VSCodeSetup-x64-1.35.1.exe

!!! Note
    - SubSystem for Visual Studio: .NET desktop development
    - SubSystem for Visual Studio Code: Python, Markdown Preview Enhanced

### 2.13 Install Anaconda

- Install Anaconda3
  - Install for All users
  - Choose "Add Anaconda to the system PATH environment Variable"

#### Anacoda Requirement

    Anaconda3-2019.03-Windows-x86_64.exe

!!! Note
    Create a python shortcut from "C:\ProgramData\Anaconda3". Move the shortcut to "C:\ProgramData\Microsoft\Windows\Start Menu\Programs". Pin to Start.

### 2.14 Install KNIME

- Install KNIME
  - Install for All users

#### KNIME Requirement

    KNIME 3.7.2 Installer (64bit).exe

### 2.15 Install Putty

- Install Putty

#### Putty Requirement

    putty-64bit-0.71-installer.msi   

### 2.16 Install Notepad++

- Install Notepad++

#### Notepad++ Requirement

    npp.7.7.Installer.x64.exe 

### 2.17 Install PowerShell 6

- Install PowerShell 6 through PowerShell

#### Install PowerShell 6 - PowerShell Command

    iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"

#### Reference

    https://www.thomasmaurer.ch/2019/03/how-to-install-and-update-powershell-6/

### 2.18 Install FileZilla

- Install FileZilla

#### FileZilla Requirement

    FileZilla_3.42.1_win64_sponsored-setup.exe

!!! Note
    Do not install any antivirus software.

### 2.19 SumatraPDF

- Install SumatraPDF

#### SumatraPDF Requirement

    SumatraPDF-3.1.2-64-install.exe 

### 2.20 Pot Player

- Install Pot Player

#### Pot Player Requirement

    PotPlayerSetup64.exe    

## 3. Windows Appearances Configuration

This section demonstrates the configuration of Windows Appearances.

### 3.1 Desktop

- This PC
- Recycle Bin
- Delete all other icons

### 3.2 Colors

- **SoftLab Color**: Metal Blue
- **TradeLab Color**: SeaFoma Teal

### 3.3 Start Menu

- Pin commonly used software to Start Menu
- Group software on Start Menu
- Use TileIconifier to change icon.

#### Start Menu Requirement

    TileIconifier.exe

!!! Note Preferred colours
    - SoftLab Color:  (#3B4452)
    - TradeLab Color: (#005659)

### 3.4 Start Menu Layout

- Create a folder name "Windows StartLayout" on C:\ProgramData\Microsoft
- Set "Windows StartLayout" to hidden.
  
## 4. Final step of image creation

This section demonstrates the final step of image creation.

### 4.1 Create another administrator account Profiler with PowerShell

``` powershell
    > New-LocalUser -Name Profiler -FullName Profiler -NoPassword
    > Add-LocalGroupMember -Name Users -Member Profiler
    > Add-LocalGroupMember -Name Administrators -Member Profiler
    > Enable-LocalUser -Name Administrator
```

### 4.2 Change default user profile

- Clean up desktop
- Sign out from Audit Mode
- Login to Profiler
- Open command prompt or PowerShell
- Copy DefProf.exe to desktop

    ``` powershell
   > cd C:\Users\Profiler\Desktop
   > ./DefProf.exe Administrator
   > Y
    ```

- Sign out from Profiler and log in back to Audit Mode (Administrator)
- Delete Checkpoint and Shutdown  
- Backup VHDX to other place
- Start and Delete Checkpoint

#### Start Menu Layout Requirement

    DefProf.exe

!!! Note
    This is the one-time-only step, must ensure the Administrator profile is at its final stage before conduct this step.

### 4.3 Delete Profiler profile and account

- Delete Profiler profile

    - Window Key + Pause Break > Advanced System Settings
    - Click Settings button in the User Profiles section
    - Click on the Profiler and click the Delete button

- Delete Profiler account with PowerShell

    > Remove-LocalUser -Name Profiler

### 4.4 Enable Windows update and update Windows

- Enable Windows update with PowerShell

```  powershell
    > sc.exe config wuauserv start= auto
    > sc.exe start wuauserv
```

- Update Windows

!!! Note
    A couple of restarts may occur.

### 4.4 Sysprep

- Export-StartLayout -Path "C:\ProgramData\Microsoft\StartLayout.xml"
- Merge StartLayout.reg
- Delete Checkpoint and Shutdown  
- Backup VHDX to other place
- Start and Delete Checkpoint
- Sysprep

#### Sysprep Requirement

    StartLayout.reg

!!! Note
    Must Delete Checkpoint and Tick Generalize before sysprep

## 5. Convert reference image from VHDX to WIM

This section demonstrates the process of Convert .vhdx to .wim.

- Run scrip as administrator on PowerShell

    ``` powershell
        Get-WindowsImage -Mounted 
        DISM /Cleanup-Wim
        dism /cleanup-mountpoints

        $Path = Read-Host -Prompt "Write the path here"
        $Sti = Read-Host -Prompt "Write the path here"

        Mkdir C:\Mount-Temp
        $Mont = "C:\Mount-Temp"

        $Pathe = Get-ChildItem -Recurse -Path $Path | Where {($_.Extension -eq ".vhdx") -or ($_.Extension -eq ".vhd")}

        ForEach ($Path in $Pathe){
        Mount-WindowsImage -ImagePath $Pathe.Fullname -Path "$Mont" -Index 1
        New-WindowsImage -CapturePath "$Mont" -Name "$Path" -ImagePath "$Sti\$Path.wim" -Description "$Path" -Verify
        Dismount-WindowsImage -Path "$Mont" -Discard
        }

        rm C:\Mount-Temp

        Write-Host "Your VHDx files is now converted to a *.Wim file and is located at $Sti " -ForegroundColor White -BackgroundColor DarkGreen
    ```

- Insert Source path and destination path

!!! Note
    This step will take at least an hour or more.

## 6. Prepare for deployment

This section shows how to be ready for the deployment.

- Relocate the reference image (.wim) into WDS server

    ```  powershell
    > \\192.168.25.2\d$\Images\Windows 10 July-Dec\Sysprep_2019
    ```

- Open MDT > Deployment Share
    - SoftLab: MDT Deployment Share (D:\Deployment Share\MDTDDeployment)
    - Trades: MDT Deployment Share (\\TRADES-DC1:\Deployment Share$)
    - Tairawhiti: MDT Deployment Share (\\SLFTLAB-TDC:\Deployment Share$)

- Insert reference image into MDT

      Right click on Operating System > Import New Operating System > Custom Image File > Browse to the refence image > Setup Files are not need > "Image name". 

- Change deploy image to the newest image

      Task Sequence > "Task" > Task Sequence > Install Operating System > Browse to the image > ok

## 7. Start deploy

- PDQ
- WDS
