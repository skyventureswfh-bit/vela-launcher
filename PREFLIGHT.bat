@echo off
setlocal
cd /d "%~dp0"
title Vela Preflight

echo ==========================================
echo  VELA PREFLIGHT - NO ORDERS
echo ==========================================
echo.

if not exist ".env" (
  echo [FAIL] Missing .env
  echo Copy .env.example to .env and add Kalshi credentials locally.
  pause
  exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
  echo [SETUP] Creating local Python environment...
  py -3.11 -m venv .venv 2>nul || python -m venv .venv
  if errorlevel 1 (
    echo [FAIL] Python 3.11+ not found.
    pause
    exit /b 1
  )
  ".venv\Scripts\python.exe" -m pip install --upgrade pip
  ".venv\Scripts\python.exe" -m pip install -r requirements.txt
  if errorlevel 1 (
    echo [FAIL] Dependency install failed.
    pause
    exit /b 1
  )
)

echo [CHECK] Python...
".venv\Scripts\python.exe" --version || goto :fail

echo [CHECK] Runtime imports...
".venv\Scripts\python.exe" -c "import livepaper.config, livepaper.store, livepaper.priceblend, livepaper.trading; print('Runtime imports OK')" || goto :fail

echo [CHECK] Kalshi authentication and account read only...
".venv\Scripts\python.exe" -c "from livepaper.trading.broker import KalshiBroker; b=KalshiBroker(); print('Kalshi auth OK; balance $%.2f' %% b.balance_dollars())" || goto :fail

echo.
echo [PASS] PREFLIGHT COMPLETE. NO ORDER WAS PLACED.
echo You can now close this window and use START_BTC_LIVE.bat when ready.
echo.
pause
exit /b 0

:fail
echo.
echo [FAIL] Preflight stopped. Live launcher was NOT started.
echo.
pause
exit /b 1
