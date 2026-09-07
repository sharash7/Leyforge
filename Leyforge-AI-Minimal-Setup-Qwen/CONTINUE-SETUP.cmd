@echo off
title Leyforge AI - Continue Setup
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Continue-Leyforge-AI-Setup.ps1"
if errorlevel 1 (
  echo.
  echo Setup stopped. Send the error screen to ChatGPT.
  pause
)
