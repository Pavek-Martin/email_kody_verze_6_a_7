@echo off
title rok 2024 - 2032 TEST

for /L %%R IN (24,1,32) DO (
REM           od,krok,do
echo rok 20%%R
REM lua52.exe generuj_hesla_pro_verzi_6.lua 20%%R test
)

pause
@echo on

