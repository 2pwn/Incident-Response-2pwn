##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uO1
##Nc3NCtDXTlaDjofG5iZk2VnhTXwXSsqMt7qoxYWvw//itSTUTJ5aQFd49g==
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4NI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjofG5iZk2VnhTXwXSsqMt7qoxYWvw8Pe9SDBTPo=
##Kc/BRM3KXxU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba

# Source File: IR.psf
#------------------------------------------------------------------------

function Show-IR_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$form1 = New-Object 'System.Windows.Forms.Form'
	# $buttonRUN = New-Object 'System.Windows.Forms.Button'
	$radiobuttonEventLogs = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonAutoruns = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonNetlogon = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonDrivers = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonMapped_Drives = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonProcess = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonScheduled_Tasks = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonServices = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonEnvironment_Variables = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonUsers = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonGroups = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonLogged_on_User = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonNetwork_Configs = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonShares = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonDisk = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonSystem_Info = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonPatches = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonSoftware = New-Object 'System.Windows.Forms.RadioButton'
  
	$textbox1 = New-Object 'System.Windows.Forms.TextBox'
	$buttonALLTYPESOFLOGS = New-Object 'System.Windows.Forms.Button'
	$Label = New-Object 'System.Windows.Forms.Label'

	$Font = New-Object System.Drawing.Font("Times New Roman",11,[System.Drawing.FontStyle]::Italic)		
        # Font styles are: Regular, Bold, Italic, Underline, Strikeout
	$form1.Font = $Font
	$Label = New-Object System.Windows.Forms.Label
	$Label.Text = "Incident Response"

	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$form1_Load={
		#TODO: Initialize Form Controls here
		$computers = $textbox1.Text
		$form1.AutoSize = $True
		$form1.BackColor = "Lime"

	}
	
	$buttonALLTYPESOFLOGS_Click={
		#TODO: Place custom script here
		$computers = $textbox1.Text
		Get-WmiObject -Class win32_startupcommand -ComputerName $computers | select PSComputername, Name, Location, Command, User | Export-CSV ./Autoruns.csv -NoTypeInformation
		Get-WmiObject -Class win32_networkloginprofile -ComputerName $computers | select PSComputername, Name, LastLogon, LastLogoff, NumberOfLogons, PasswordAge | Export-CSV .\NetLogon.csv -NoTypeInformation
		Get-WmiObject -Class win32_ntlogevent -filter "logfile = 'System'" -ComputerName $computers | select -first 460 | Export-CSV .\Eventlogs-System.csv -NoTypeInformation
		Get-WmiObject -Class win32_ntlogevent -filter "logfile = 'Security'" -ComputerName $computers | select -first 460 | Export-CSV .\Eventlogs-Security.csv -NoTypeInformation
		Get-WmiObject -Class win32_ntlogevent -filter "logfile = 'Application'" -ComputerName $computers | select -first 460 | Export-CSV .\Eventlogs-Application.csv -NoTypeInformation
		Get-WmiObject -Class win32_systemdriver -ComputerName $computers | select PSComputername, Name, InstallDate, DisplayName, PathName, State, StartMode | Export-CSV .\Drivers.csv -NoTypeInformation
		Get-WmiObject -Class win32_mappedlogicaldisk -ComputerName $computers | select PSComputername, Name, ProviderName | Export-CSV .\Mapped_Drives.csv -NoTypeInformation
		Get-WmiObject -Class win32_process -ComputerName $computers | select PSComputername, Name, Description, ProcessID, ParentProcessID, Handle, HandleCount, ThreadCount, CreationDate | Export-CSV .\Processes.csv -NoTypeInformation
		Get-WmiObject -Class win32_scheduledjob -ComputerName $computers | select PSComputername, Name, Owner, JodID, Command, RunRepeatedly, InteractWithDesktop | Export-CSV .\Scheduled_Tasks.csv -NoTypeInformation
		Get-WmiObject -Class win32_service -ComputerName $computers | select PSComputername, ProcessID, Name, Description, PathName, Started, StartMode, StartName, State | Export-CSV .\Services.csv -NoTypeInformation
		Get-WmiObject -Class win32_environment -ComputerName $computers | select PSComputername, UserName, Name, VariableValue | Export-CSV .\Environment_Variables.csv -NoTypeInformation
		Get-WmiObject -Class win32_useraccount -ComputerName $computers | select PSComputername, accounttype, name, fullname, domain, disabled, localaccount, lockout, passwordchangeable, passwordexpires, sid | Export-CSV .\Users.csv -NoTypeInformation
		Get-WmiObject -Class win32_group -ComputerName $computers | select PSComputername, Caption, Domain, Name, Sid | Export-CSV .\Groups.csv -NoTypeInformation
		Get-WmiObject -Class win32_computersystem -ComputerName $computers | select PSComputername, Username | Export-CSV .\Logged_on_User.csv -NoTypeInformation
		Get-WmiObject -Class win32_networkadapterconfiguration -ComputerName $computers | select PSComputername, IPAddress, IPSubnet, DefaultIPGateway, DHCPServer, DNSHostname, DNSserversearchorder, MACAddress, description | Export-CSV .\Network_Configs.csv -NoTypeInformation
		Get-WmiObject -Class win32_share -ComputerName $computers | select PSComputername, Name, Path, Description | Export-CSV .\Shares.csv -NoTypeInformation
		Get-WmiObject -Class win32_logicaldisk -ComputerName $computers | select PSComputername, DeviceID, Description, ProviderName | Export-CSV .\Disk.csv -NoTypeInformation
		Get-WmiObject -Class win32_computersystem -ComputerName $computers | select PSComputername, Domain, Model, Manufacturer, EnableDaylightSavingsTime, PartOfDomain, Roles, SystemType, NumberOfProcessors, TotalPhysicalMemory, Username | Export-CSV .\System_Info.csv -NoTypeInformation
		Get-WmiObject -Class win32_quickfixengineering -ComputerName $computers | select PSComputername, HotFixID, Description, InstalledBy, InstalledOn | Export-CSV .\Patches.csv -NoTypeInformation
		Get-WmiObject -Class win32_product -ComputerName $computers | select PSComputername, Name, PackageCache, Vendor, Version, IdentifyingNumber | Export-CSV .\Software.csv -NoTypeInformation
		
	}
	
	$textbox1_TextChanged={
		#TODO: Place custom script here
		
	}
	
	$radiobuttonEventLogs_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_ntlogevent -filter "logfile = 'System'" -ComputerName $computers | select -first 460 | Export-CSV .\Eventlogs-System.csv -NoTypeInformation
		Get-WmiObject -Class win32_ntlogevent -filter "logfile = 'Security'" -ComputerName $computers | select -first 460 | Export-CSV .\Eventlogs-Security.csv -NoTypeInformation
		Get-WmiObject -Class win32_ntlogevent -filter "logfile = 'Application'" -ComputerName $computers | select -first 460 | Export-CSV .\Eventlogs-Application.csv -NoTypeInformation
		
	}
	
	$radiobuttonAutoruns_CheckedChanged={
		#TODO: Place custom script here
		$computers = $textbox1.Text
		Get-WmiObject -Class win32_startupcommand -ComputerName $computers | select PSComputername, Name, Location, Command, User | Export-CSV ./Autoruns.csv -NoTypeInformation
		
	}
	
	$radiobuttonNetlogon_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_networkloginprofile -ComputerName $computers | select PSComputername, Name, LastLogon, LastLogoff, NumberOfLogons, PasswordAge | Export-CSV .\NetLogon.csv -NoTypeInformation
		
	}
	
	$radiobuttonDrivers_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_systemdriver -ComputerName $computers | select PSComputername, Name, InstallDate, DisplayName, PathName, State, StartMode | Export-CSV .\Drivers.csv -NoTypeInformation

	}

	$radiobuttonMapped_Drives_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_mappedlogicaldisk -ComputerName $computers | select PSComputername, Name, ProviderName | Export-CSV .\Mapped_Drives.csv -NoTypeInformation

	}

	$radiobuttonProcesses_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_process -ComputerName $computers | select PSComputername, Name, Description, ProcessID, ParentProcessID, Handle, HandleCount, ThreadCount, CreationDate | Export-CSV .\Processes.csv -NoTypeInformation

	}

	$radiobuttonScheduled_Tasks_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_scheduledjob -ComputerName $computers | select PSComputername, Name, Owner, JodID, Command, RunRepeatedly, InteractWithDesktop | Export-CSV .\Scheduled_Tasks.csv -NoTypeInformation

	}

	$radiobuttonServices_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_service -ComputerName $computers | select PSComputername, ProcessID, Name, Description, PathName, Started, StartMode, StartName, State | Export-CSV .\Services.csv -NoTypeInformation

	}

	$radiobuttonEnvironment_Variables_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_environment -ComputerName $computers | select PSComputername, UserName, Name, VariableValue | Export-CSV .\Environment_Variables.csv -NoTypeInformation

	}

	$radiobuttonUsers_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_useraccount -ComputerName $computers | select PSComputername, accounttype, name, fullname, domain, disabled, localaccount, lockout, passwordchangeable, passwordexpires, sid | Export-CSV .\Users.csv -NoTypeInformation

	}

	$radiobuttonGroups_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_group -ComputerName $computers |select PSComputername, Caption, Domain, Name, Sid | Export-CSV .\Groups.csv -NoTypeInformation

	}

	$radiobuttonLogged_on_User_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_computersystem -ComputerName $computers | select PSComputername, Username | Export-CSV .\Logged_on_User.csv -NoTypeInformation

	}

	$radiobuttonNetwork_Configs_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_networkadapterconfiguration -ComputerName $computers | select PSComputername, IPAddress, IPSubnet, DefaultIPGateway, DHCPServer, DNSHostname, DNSserversearchorder, MACAddress, description| Export-CSV .\Network_Configs.csv -NoTypeInformation

	}

	$radiobuttonShares_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_share -ComputerName $computers |select PSComputername, Name, Path, Description | Export-CSV .\Shares.csv -NoTypeInformation

	}
	$radiobuttonDisk_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_logicaldisk -ComputerName $computers | select PSComputername, DeviceID, Description, ProviderName | Export-CSV .\Disk.csv -NoTypeInformation

	}

	$radiobuttonSystem_Info_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_computersystem -ComputerName $computers | select PSComputername, Domain, Model, Manufacturer, EnableDaylightSavingsTime, PartOfDomain, Roles, SystemType, NumberOfProcessors, TotalPhysicalMemory, Username | Export-CSV .\System_Info.csv -NoTypeInformation

	}



	$radiobuttonPatches_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_quickfixengineering -ComputerName $computers | select PSComputername, HotFixID, Description, InstalledBy, InstalledOn | Export-CSV .\Patches.csv -NoTypeInformation

	}

	$radiobuttonSoftware_CheckedChanged={
		#TODO: Place custom script here
		Get-WmiObject -Class win32_product -ComputerName $computers | select PSComputername, Name, PackageCache, Vendor, Version, IdentifyingNumber | Export-CSV .\Software.csv -NoTypeInformation

	}

	$buttonRUN_Click={
		#TODO: Place custom script here
		$radiobuttonAutoruns.Checked = $true
		$radiobuttonNetlogon.Checked = $true
		$radiobuttonEventLogs.Checked = $true
		}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$form1.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonRUN.remove_Click($buttonRUN_Click)
			$radiobuttonEventLogs.remove_CheckedChanged($radiobuttonEventLogs_CheckedChanged)
			$radiobuttonAutoruns.remove_CheckedChanged($radiobuttonAutoruns_CheckedChanged)
			$textbox1.remove_TextChanged($textbox1_TextChanged)
			$buttonALLTYPESOFLOGS.remove_Click($buttonALLTYPESOFLOGS_Click)
			$form1.remove_Load($form1_Load)
			$form1.remove_Load($Form_StateCorrection_Load)
			$form1.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$form1.SuspendLayout()
	#
	# form1
	#
	$form1.Controls.Add($buttonRUN)
	$form1.Controls.Add($radiobuttonEventLogs)
	$form1.Controls.Add($radiobuttonAutoruns)
	$form1.Controls.Add($radiobuttonNetlogon)
	$form1.Controls.Add($radiobuttonDrivers)
	$form1.Controls.Add($radiobuttonMapped_Drives)
	$form1.Controls.Add($radiobuttonProcess)
	$form1.Controls.Add($radiobuttonScheduled_Tasks)
	$form1.Controls.Add($radiobuttonServices)
	$form1.Controls.Add($radiobuttonEnvironment_Variables)
	$form1.Controls.Add($radiobuttonUsers)
	$form1.Controls.Add($radiobuttonGroups)
	$form1.Controls.Add($radiobuttonLogged_on_User)
	$form1.Controls.Add($radiobuttonNetwork_Configs)
	$form1.Controls.Add($radiobuttonShares)
	$form1.Controls.Add($radiobuttonDisk)
	$form1.Controls.Add($radiobuttonSystem_Info)
	$form1.Controls.Add($radiobuttonPatches)
	$form1.Controls.Add($radiobuttonSoftware)
	$form1.Controls.Add($textbox1)
	$form1.Controls.Add($buttonALLTYPESOFLOGS)
	$form1.Controls.Add($Label)
	$form1.AutoScaleDimensions = '6, 13'
	$form1.AutoScaleMode = 'Font'
	$form1.ClientSize = '822, 316'
	$form1.Name = 'form1'
	$form1.Text = 'Form'
	$form1.add_Load($form1_Load)

	$Label.Location= '300, 250'
	#
	# buttonRUN
	#
	#$buttonRUN.Location = '275, 192'
	#$buttonRUN.Name = 'buttonRUN'
	#$buttonRUN.Size = '75, 23'
	#$buttonRUN.TabIndex = 5
	#$buttonRUN.Text = 'RUN'
	#$buttonRUN.UseCompatibleTextRendering = $True
	#$buttonRUN.UseVisualStyleBackColor = $True
	#$buttonRUN.add_Click($buttonRUN_Click)
	#

	# radiobuttonAutoruns
	#
	$radiobuttonAutoruns.Location = '50, 90'
	$radiobuttonAutoruns.Name = 'radiobuttonAutoruns'
	$radiobuttonAutoruns.Size = '104, 24'
	$radiobuttonAutoruns.TabIndex = 2
	$radiobuttonAutoruns.TabStop = $True
	$radiobuttonAutoruns.Text = 'Autoruns'
	$radiobuttonAutoruns.UseCompatibleTextRendering = $True
	$radiobuttonAutoruns.UseVisualStyleBackColor = $True
	$radiobuttonAutoruns.add_CheckedChanged($radiobuttonAutoruns_CheckedChanged)

	# radiobuttonEventLogs
	#
	$radiobuttonEventLogs.Location = '170, 90'
	$radiobuttonEventLogs.Name = 'radiobuttonEventLogs'
	$radiobuttonEventLogs.Size = '104, 24'
	$radiobuttonEventLogs.TabIndex = 4
	$radiobuttonEventLogs.TabStop = $True
	$radiobuttonEventLogs.Text = 'Event Logs'
	$radiobuttonEventLogs.UseCompatibleTextRendering = $True
	$radiobuttonEventLogs.UseVisualStyleBackColor = $True
	$radiobuttonEventLogs.add_CheckedChanged($radiobuttonEventLogs_CheckedChanged)
	#


	# radiobuttonNetlogon
	#
	$radiobuttonNetlogon.Location = '320, 90'
	$radiobuttonNetlogon.Name = 'radiobuttonNetlogon'
	$radiobuttonNetlogon.Size = '104, 24'
	# $radiobuttonNetlogon.TabIndex = 3
	$radiobuttonNetlogon.TabStop = $True
	$radiobuttonNetlogon.Text = 'Netlogon'
	$radiobuttonNetlogon.UseCompatibleTextRendering = $True
	$radiobuttonNetlogon.UseVisualStyleBackColor = $True
	$radiobuttonNetlogon.add_CheckedChanged($radiobuttonNetlogon_CheckedChanged)

	# radiobuttonDrivers
	#
	$radiobuttonDrivers.Location = '460, 90'
	$radiobuttonDrivers.Name = 'radiobuttonNetlogon'
	$radiobuttonDrivers.Size = '104, 24'
	# $radiobuttonDrivers.TabIndex = 3
	$radiobuttonDrivers.TabStop = $True
	$radiobuttonDrivers.Text = 'Drivers'
	$radiobuttonDrivers.UseCompatibleTextRendering = $True
	$radiobuttonDrivers.UseVisualStyleBackColor = $True
	$radiobuttonDrivers.add_CheckedChanged($radiobuttonDrivers_CheckedChanged)

	#radiobuttonMapped_Drives
	#
	$radiobuttonMapped_Drives.Location = '580, 90'
	$radiobuttonMapped_Drives.Name = 'radiobuttonNetlogon'
	$radiobuttonMapped_Drives.Size = '104, 24'
	# $radiobuttonMapped_Drives.TabIndex = 3
	$radiobuttonMapped_Drives.TabStop = $True
	$radiobuttonMapped_Drives.Text = 'Mapped_Drives'
	$radiobuttonMapped_Drives.UseCompatibleTextRendering = $True
	$radiobuttonMapped_Drives.UseVisualStyleBackColor = $True
	$radiobuttonMapped_Drives.add_CheckedChanged($radiobuttonMapped_Drives_CheckedChanged)

	#radiobuttonProcess
	#
	$radiobuttonProcess.Location = '690, 90'
	$radiobuttonProcess.Name = 'radiobuttonNetlogon'
	$radiobuttonProcess.Size = '104, 24'
	# $radiobuttonProcess.TabIndex = 3
	$radiobuttonProcess.TabStop = $True
	$radiobuttonProcess.Text = 'Process'
	$radiobuttonProcess.UseCompatibleTextRendering = $True
	$radiobuttonProcess.UseVisualStyleBackColor = $True
	$radiobuttonProcess.add_CheckedChanged($radiobuttonProcess_CheckedChanged)

	#radiobuttonScheduled_Tasks
	#
	$radiobuttonScheduled_Tasks.Location = '50, 150'
	$radiobuttonScheduled_Tasks.Name = 'radiobuttonNetlogon'
	$radiobuttonScheduled_Tasks.Size = '104, 24'
	# $radiobuttonScheduled_Tasks.TabIndex = 3
	$radiobuttonScheduled_Tasks.TabStop = $True
	$radiobuttonScheduled_Tasks.Text = 'Scheduled_Tasks'
	$radiobuttonScheduled_Tasks.UseCompatibleTextRendering = $True
	$radiobuttonScheduled_Tasks.UseVisualStyleBackColor = $True
	$radiobuttonScheduled_Tasks.add_CheckedChanged($radiobuttonScheduled_Tasks_CheckedChanged)

	#radiobuttonServices
	#
	$radiobuttonServices.Location = '170, 150'
	$radiobuttonServices.Name = 'radiobuttonNetlogon'
	$radiobuttonServices.Size = '104, 24'
	# $radiobuttonServices.TabIndex = 3
	$radiobuttonServices.TabStop = $True
	$radiobuttonServices.Text = 'Services'
	$radiobuttonServices.UseCompatibleTextRendering = $True
	$radiobuttonServices.UseVisualStyleBackColor = $True
	$radiobuttonServices.add_CheckedChanged($radiobuttonServices_CheckedChanged)

	#radiobuttonEnvironment_Variables
	#
	$radiobuttonEnvironment_Variables.Location = '320, 150'
	$radiobuttonEnvironment_Variables.Name = 'radiobuttonNetlogon'
	$radiobuttonEnvironment_Variables.Size = '104, 24'
	# $radiobuttonEnvironment_Variables.TabIndex = 3
	$radiobuttonEnvironment_Variables.TabStop = $True
	$radiobuttonEnvironment_Variables.Text = 'Environment_Variables'
	$radiobuttonEnvironment_Variables.UseCompatibleTextRendering = $True
	$radiobuttonEnvironment_Variables.UseVisualStyleBackColor = $True
	$radiobuttonEnvironment_Variables.add_CheckedChanged($radiobuttonEnvironment_Variables_CheckedChanged)



	#radiobuttonSoftware
	#
	$radiobuttonSoftware.Location = '460, 150'
	$radiobuttonSoftware.Name = 'radiobuttonNetlogon'
	$radiobuttonSoftware.Size = '104, 24'
	# $radiobuttonSoftware.TabIndex = 3
	$radiobuttonSoftware.TabStop = $True
	$radiobuttonSoftware.Text = 'Software'
	$radiobuttonSoftware.UseCompatibleTextRendering = $True
	$radiobuttonSoftware.UseVisualStyleBackColor = $True
	$radiobuttonSoftware.add_CheckedChanged($radiobuttonSoftware_CheckedChanged)

	#radiobuttonUsers
	#
	$radiobuttonUsers.Location = '580, 150'
	$radiobuttonUsers.Name = 'radiobuttonNetlogon'
	$radiobuttonUsers.Size = '104, 24'
	# $radiobuttonUsers.TabIndex = 3
	$radiobuttonUsers.TabStop = $True
	$radiobuttonUsers.Text = 'Users'
	$radiobuttonUsers.UseCompatibleTextRendering = $True
	$radiobuttonUsers.UseVisualStyleBackColor = $True
	$radiobuttonUsers.add_CheckedChanged($radiobuttonUsers_CheckedChanged)

	#radiobuttonGroups
	#
	$radiobuttonGroups.Location = '690, 150'
	$radiobuttonGroups.Name = 'radiobuttonNetlogon'
	$radiobuttonGroups.Size = '104, 24'
	# $radiobuttonGroups.TabIndex = 3
	$radiobuttonGroups.TabStop = $True
	$radiobuttonGroups.Text = 'Groups'
	$radiobuttonGroups.UseCompatibleTextRendering = $True
	$radiobuttonGroups.UseVisualStyleBackColor = $True
	$radiobuttonGroups.add_CheckedChanged($radiobuttonGroups_CheckedChanged)

	#radiobuttonLogged_on_User
	#
	$radiobuttonLogged_on_User.Location = '50, 200'
	$radiobuttonLogged_on_User.Name = 'radiobuttonNetlogon'
	$radiobuttonLogged_on_User.Size = '104, 24'
	# $radiobuttonLogged_on_User.TabIndex = 3
	$radiobuttonLogged_on_User.TabStop = $True
	$radiobuttonLogged_on_User.Text = 'Logged_on_User'
	$radiobuttonLogged_on_User.UseCompatibleTextRendering = $True
	$radiobuttonLogged_on_User.UseVisualStyleBackColor = $True
	$radiobuttonLogged_on_User.add_CheckedChanged($radiobuttonLogged_on_User_CheckedChanged)


	#radiobuttonNetwork_Configs
	#
	$radiobuttonNetwork_Configs.Location = '170, 200'
	$radiobuttonNetwork_Configs.Name = 'radiobuttonNetlogon'
	$radiobuttonNetwork_Configs.Size = '104, 24'
	# $radiobuttonNetwork_Configs.TabIndex = 3
	$radiobuttonNetwork_Configs.TabStop = $True
	$radiobuttonNetwork_Configs.Text = 'Network_Configs'
	$radiobuttonNetwork_Configs.UseCompatibleTextRendering = $True
	$radiobuttonNetwork_Configs.UseVisualStyleBackColor = $True
	$radiobuttonNetwork_Configs.add_CheckedChanged($radiobuttonNetwork_Configs_CheckedChanged)

	#radiobuttonShares
	#
	$radiobuttonShares.Location = '320, 200'
	$radiobuttonShares.Name = 'radiobuttonNetlogon'
	$radiobuttonShares.Size = '104, 24'
	# $radiobuttonShares.TabIndex = 3
	$radiobuttonShares.TabStop = $True
	$radiobuttonShares.Text = 'Shares'
	$radiobuttonShares.UseCompatibleTextRendering = $True
	$radiobuttonShares.UseVisualStyleBackColor = $True
	$radiobuttonShares.add_CheckedChanged($radiobuttonShares_CheckedChanged)

	#radiobuttonDisk
	#
	$radiobuttonDisk.Location = '460, 200'
	$radiobuttonDisk.Name = 'radiobuttonNetlogon'
	$radiobuttonDisk.Size = '104, 24'
	# $radiobuttonDisk.TabIndex = 3
	$radiobuttonDisk.TabStop = $True
	$radiobuttonDisk.Text = 'Disk'
	$radiobuttonDisk.UseCompatibleTextRendering = $True
	$radiobuttonDisk.UseVisualStyleBackColor = $True
	$radiobuttonDisk.add_CheckedChanged($radiobuttonDisk_CheckedChanged)


	#radiobuttonSystem_Info
	#
	$radiobuttonSystem_Info.Location = '580, 200'
	$radiobuttonSystem_Info.Name = 'radiobuttonNetlogon'
	$radiobuttonSystem_Info.Size = '104, 24'
	# $radiobuttonSystem_Info.TabIndex = 3
	$radiobuttonSystem_Info.TabStop = $True
	$radiobuttonSystem_Info.Text = 'System_Info'
	$radiobuttonSystem_Info.UseCompatibleTextRendering = $True
	$radiobuttonSystem_Info.UseVisualStyleBackColor = $True
	$radiobuttonSystem_Info.add_CheckedChanged($radiobuttonSystem_Info_CheckedChanged)

	#radiobuttonPatches
	#
	$radiobuttonPatches.Location = '690, 200'
	$radiobuttonPatches.Name = 'radiobuttonNetlogon'
	$radiobuttonPatches.Size = '104, 24'
	# $radiobuttonPatches.TabIndex = 3
	$radiobuttonPatches.TabStop = $True
	$radiobuttonPatches.Text = 'Patches'
	$radiobuttonPatches.UseCompatibleTextRendering = $True
	$radiobuttonPatches.UseVisualStyleBackColor = $True
	$radiobuttonPatches.add_CheckedChanged($radiobuttonPatches_CheckedChanged)



	#
	# textbox1
	#
	$textbox1.Location = '31, 30'
	$textbox1.Name = 'textbox1'
	$textbox1.Size = '130, 20'
	$textbox1.TabIndex = 1
	$textbox1.add_TextChanged($textbox1_TextChanged)
	#
	# buttonALLTYPESOFLOGS
	#
	$buttonALLTYPESOFLOGS.Location = '223, 30'
	$buttonALLTYPESOFLOGS.Name = 'buttonALLTYPESOFLOGS'
	$buttonALLTYPESOFLOGS.Size = '149, 23'
	$buttonALLTYPESOFLOGS.TabIndex = 0
	$buttonALLTYPESOFLOGS.Text = 'ALL TYPES OF LOGS'
	$buttonALLTYPESOFLOGS.UseCompatibleTextRendering = $True
	$buttonALLTYPESOFLOGS.UseVisualStyleBackColor = $True
	$buttonALLTYPESOFLOGS.add_Click($buttonALLTYPESOFLOGS_Click)
	$form1.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $form1.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$form1.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$form1.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $form1.ShowDialog()

} #End Function

#Call the form
Show-IR_psf | Out-Null
