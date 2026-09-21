@echo off
setlocal
cd /d "%~dp0"
title Vela Launcher - BTC 15M

if not exist ".env" (
  echo.
  echo [STOP] Missing .env
  echo Copy .env.example to .env and add your Kalshi API credentials.
  echo Real credentials stay ONLY on this computer.
  echo.
  pause
  exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
  echo [SETUP] Creating local Python environment...
  py -3.11 -m venv .venv 2>nul || python -m venv .venv
  if errorlevel 1 (
    echo [STOP] Python 3.11+ is required.
    pause
    exit /b 1
  )
  ".venv\Scripts\python.exe" -m pip install --upgrade pip
  ".venv\Scripts\python.exe" -m pip install -r requirements.txt
  if errorlevel 1 (
    echo [STOP] Dependency install failed.
    pause
    exit /b 1
  )
)

set VELA_ASSET=BTC
set VELA_LIVE=1
set VELA_STRONG_TAKE=1
set VELA_SUPABASE_SYNC=0
set VELA_MAX_DAILY_LOSS=25
set VELA_MAX_OPEN_NOTIONAL=25
set VELA_MAX_OPEN_FRACTION=0.50

echo.
echo ==========================================
echo  VELA LAUNCHER - BTC 15 MINUTE - REAL MONEY
echo  Daily loss halt: $25
echo  Kill switch: livepaper\data_btc\KILL
echo ==========================================
echo.
".venv\Scripts\python.exe" -m livepaper
echo.
echo Vela stopped.
pause
