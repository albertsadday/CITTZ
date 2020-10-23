del cittz-temp.bat
echo @echo off >> cittz-temp.bat
echo echo set ubicacion= %cd% >> cittz-temp.bat
echo. >> cittz-temp.bat
type cod1.txt >> cittz-temp.bat
type cod2.txt >> cittz-temp.bat
start cittz-temp.bat