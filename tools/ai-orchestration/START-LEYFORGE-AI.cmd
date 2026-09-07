@echo off
title Leyforge AI
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Start-Leyforge-AI.ps1"
