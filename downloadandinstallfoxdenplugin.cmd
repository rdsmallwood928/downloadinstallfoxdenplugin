@ECHO OFF

echo var WinHttpReq = new ActiveXObject("WinHttp.WinHttpRequest.5.1"); > wget.js
echo WinHttpReq.Open("GET", WScript.Arguments(0), /*async=*/false); >> wget.js
echo WinHttpReq.Send(); >> wget.js
echo BinStream = new ActiveXObject("ADODB.Stream"); >> wget.js
echo BinStream.Type = 1; >> wget.js
echo BinStream.Open(); >> wget.js
echo BinStream.Write(WinHttpReq.ResponseBody); >> wget.js
echo BinStream.SaveToFile("out.msi"); >> wget.js

cscript wget.js "%1/plugins/foxden/fdaudiovideoplugin.msi"

msiexec /i out.msi /quiet /qn /norestart

del wget.js
del out.msi
