
D:
cd D:\MasterThesis\code\p3d_build\windows\bin\Release

set slicePath= D:\MasterThesis\code\3DPrinterDriver\slicedbg\
set Destpath= D:\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioI-Same-Model\NDScenarioI\Run6\

set var=1
set terminator=6
:loop
D:\MasterThesis\code\p3d_build\windows\bin\Release\Cuttlefish.exe D:\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioI-Same-Model\NDScenarioI\Run6\main_conf.json -i
set DestFolder= %Destpath%%var%
echo %DestFolder%
md %DestFolder%

copy D:\MasterThesis\code\3DPrinterDriver\performanceReport.txt %DestFolder%
echo "performanceReport.txt to " %DestFolder%

copy D:\MasterThesis\code\3DPrinterDriver\text.log %DestFolder%
echo "text.log to " %DestFolder%


cd D:\MasterThesis\code\3DPrinterDriver\slicedbg
D:
del /s *.png

echo "Deleted content of slice debugger"

del D:\MasterThesis\code\3DPrinterDriver\performanceReport.txt 
echo "Deleted performanceReport.txt"

del D:\MasterThesis\code\3DPrinterDriver\text.log
echo "Deleted text.log"

set /A var=%var%+1
if %var%==%terminator% goto close
goto open
:close
exit
:open
echo %var%
goto loop


