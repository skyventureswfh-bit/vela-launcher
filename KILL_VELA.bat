@echo off
setlocal
cd /d "%~dp0"
if not exist "livepaper\data_btc" mkdir "livepaper\data_btc"
type nul > "livepaper\data_btc\KILL"
echo.
echo KILL SWITCH ARMED.
echo Vela will cancel resting orders and halt on its next management cycle.
echo.
pause
