
cd D:
cd D:\MRepo\p3d_build\windows\bin\Release
set sourpath= D:\MRepo\3DPrinterDriver\slaveReports
set slicePath= D:\MRepo\3DPrinterDriver\slicedbg\
set Destpath= D:\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioIII-SameModels\ProtoII\Run1\

set var=1
set terminator=6
:loop
mpiexec -hosts 5 PC2215 PC2408 PC2154 PC2286 PC2179 -wdir \\pc2215\SharedFolder\MRepo\p3d_build\windows\bin\Release\ Cuttlefish.exe \\pc2215\SharedFolder\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioIII-SameModels\ProtoII\Run1\main_conf.json
set DestFolder= %Destpath%%var%
echo %DestFolder%
md %DestFolder%

copy D:\MRepo\3DPrinterDriver\performanceReport.log %DestFolder%
echo "performanceReport.log to " %DestFolder%

copy D:\MRepo\3DPrinterDriver\text.log %DestFolder%
echo "text.log to " %DestFolder%

xcopy /E %sourpath% %DestFolder%
echo "copied folder" %sourpath% "to" %DestFolder%


cd D:\MRepo\3DPrinterDriver\slicedbg
D:
del /s *.png

echo "Deleted content of slice debugger"

del D:\MRepo\3DPrinterDriver\performanceReport.log 
echo "Deleted performanceReport.log"

del D:\MRepo\3DPrinterDriver\text.log
echo "Deleted text.log"

rd /S /Q %sourpath%
echo "Remove slaveReports successful!"

set /A var=%var%+1
if %var%==%terminator% goto close
goto open
:close
exit
:open
echo %var%
goto loop


