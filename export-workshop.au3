#include <Array.au3>
#include <File.au3>

Local $aArray = FileReadToArray("Cluster_4\Master\modoverrides.lua")

Local Const $sFilePath = "dedicated_server_mods_setup.lua"

Local $hFileOpen = FileOpen($sFilePath, $FO_APPEND)

For $i = 0 to UBound($aArray)-1
   If StringInStr($aArray[$i], '"workshop-') Then
	   ;MsgBox(0,"",'ServerModSetup("' & StringSplit((StringSplit($aArray[$i],'"')[2]),"-")[2] & '")' & @CRLF )
	    FileWriteLine($hFileOpen, 'ServerModSetup("' & StringSplit((StringSplit($aArray[$i],'"')[2]),"-")[2] & '")' & @CRLF)
	   EndIf
Next

FileClose($hFileOpen)

MsgBox(0,"Total mod(s)",_FileCountLines ( $sFilePath ))