
cd D:
cd D:\MRepo\p3d_build\windows\bin\Release
set sourpath= D:\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioIII-SameModels\ProtoI\Run3\DistributedComputing
set slicePath= D:\MRepo\3DPrinterDriver\slicedbg\
set Destpath= D:\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioIII-SameModels\ProtoI\Run3\

set var=1
set terminator=6
:loop
mpiexec -hosts 5 PC2215 PC2408 PC2155 PC2286 PC2179 -wdir \\pc2215\SharedFolder\MRepo\p3d_build\windows\bin\Release\ Cuttlefish.exe \\pc2215\SharedFolder\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioIII-SameModels\ProtoI\Run3\main_conf.json
set DestFolder= %Destpath%%var%
echo %DestFolder%
md %DestFolder%

set rmFld1= D:\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioIII-SameModels\ProtoI\Run3\DistributedComputing\Node_1\Node_1_ReportedSlices
echo %rmFld1%

set rmFld2= D:\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioIII-SameModels\ProtoI\Run3\DistributedComputing\Node_2\Node_2_ReportedSlices
echo %rmFld2%

set rmFld3= D:\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioIII-SameModels\ProtoI\Run3\DistributedComputing\Node_3\Node_3_ReportedSlices
echo %rmFld3%

set rmFld4= D:\MasterThesis\Documentation\ThesisDocumentation\Results\ScenarioIII-SameModels\ProtoI\Run3\DistributedComputing\Node_4\Node_4_ReportedSlices
echo %rmFld4%

rd /S /Q %rmFld1%
rd  /S /Q %rmFld2%
rd  /S /Q %rmFld3%
rd  /S /Q %rmFld4%
echo "Remove folder successful!"

copy D:\MRepo\3DPrinterDriver\performanceReport.txt %DestFolder%
echo "performanceReport.txt to " %DestFolder%

copy D:\MRepo\3DPrinterDriver\text.log %DestFolder%
echo "text.log to " %DestFolder%

xcopy /E %sourpath% %DestFolder%
echo "copied folder" %sourpath% "to" %DestFolder%


cd D:\MRepo\3DPrinterDriver\slicedbg
D:
del /s *.png

echo "Deleted content of slice debugger"

del D:\MRepo\3DPrinterDriver\performanceReport.txt 
echo "Deleted performanceReport.txt"

del D:\MRepo\3DPrinterDriver\text.log
echo "Deleted text.log"

rd /S /Q %sourpath%
echo "Remove DistributedComputing successful!"

set /A var=%var%+1
if %var%==%terminator% goto close
goto open
:close
exit
:open
echo %var%
goto loop


