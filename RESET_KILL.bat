@echo off
setlocal
cd /d "%~dp0"
if exist "livepaper\data_btc\KILL" (
  del "livepaper\data_btc\KILL"
  echo Kill switch cleared.
) else (
  echo Kill switch was already clear.
)
pause
