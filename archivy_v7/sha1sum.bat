@echo off
verify on
title sha1sum

set /p archiv="nazev archivu zip ? "
sha1sum.exe %archiv%

pause
@echo on
