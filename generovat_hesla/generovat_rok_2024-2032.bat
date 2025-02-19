@echo off
title rok 2024 - 2032
echo budou vygenerovany hesla pro rok 2024-2032
pause

for /L %%R IN (24,1,32) DO (
REM           od,krok,do
echo generuju hesla pro rok 20%%R
lua52.exe generuj_hesla_pro_verzi_6.lua 20%%R
)

pause
@echo on

