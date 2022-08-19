/**********************DESCRIPTION****************************************************************************/

INSERT INTO [bward].[optTapeDesc] ([TapeDesc])

SELECT 'SD 720x576 BT 601 version'
WHERE NOT EXISTS (SELECT NULL FROM [bward].[optTapeDesc] WHERE TapeDesc = 'SD 720x576 BT 601 version') UNION

SELECT 'SD 1024x576 BT 601 Version'
WHERE NOT EXISTS (SELECT NULL FROM [bward].[optTapeDesc] WHERE TapeDesc = 'SD 1024x576 BT 601 Version') UNION

SELECT 'HD 1920x1080 BT 709 Version'
WHERE NOT EXISTS (SELECT NULL FROM [bward].[optTapeDesc] WHERE TapeDesc = 'HD 1920x1080 BT 709 Version') UNION

SELECT 'UHD 3840x2160  Version'
WHERE NOT EXISTS (SELECT NULL FROM [bward].[optTapeDesc] WHERE TapeDesc = 'UHD 3840x2160  Version') UNION

SELECT 'UHD 3840x2160 BT 709 Version'
WHERE NOT EXISTS (SELECT NULL FROM [bward].[optTapeDesc] WHERE TapeDesc = 'UHD 3840x2160 BT 709 Version') UNION

SELECT 'UHD 3840x2160 BT 2020 Version'
WHERE NOT EXISTS (SELECT NULL FROM [bward].[optTapeDesc] WHERE TapeDesc = 'UHD 3840x2160 BT 2020 Version')  UNION

SELECT 'UHD 3840x2160 HDR Version'
WHERE NOT EXISTS (SELECT NULL FROM [bward].[optTapeDesc] WHERE TapeDesc = 'UHD 3840x2160 HDR Version')  UNION

SELECT '4K 4096x2160 version'
WHERE NOT EXISTS (SELECT NULL FROM [bward].[optTapeDesc] WHERE TapeDesc = '4K 4096x2160 version')


--SD 720x576 BT 601 version

--SD 1024x576 BT 601 Version

--HD 1920x1080 BT 709 Version

--UHD 3840x2160  Version

--UHD 3840x2160 BT 709 Version

--UHD 3840x2160 BT 2020 Version

--UHD 3840x2160 HDR Version

--4K 4096x2160 version

/**********************STANDARDS****************************************************************************/

INSERT INTO [bward].[optStandard] ([Standard])

SELECT '1024p'
WHERE NOT EXISTS (SELECT NULL FROM  [bward].[optStandard]WHERE [Standard] = '1024p') 



/**************************************************************************************************/

