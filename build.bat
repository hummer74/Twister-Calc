@echo off
chcp 65001 >nul
if not exist venv goto no_venv
call venv\Scripts\activate.bat
echo [INFO] Проверка PyInstaller...
pyinstaller --version >nul 2>&1
if %errorlevel% neq 0 goto install_pi
goto build

:no_venv
echo [ERROR] Сначала запустите start.bat — он создаст venv и установит зависимости.
pause
exit /b

:install_pi
pip install pyinstaller

:build
echo [INFO] Сборка EXE (без консоли)...
pyinstaller --onefile --noconsole --clean --name "Twister" --paths "src" --add-data "assets;assets" --add-data "src\twisted_tube_calc\fluids\data;twisted_tube_calc/fluids/data" --hidden-import twisted_tube_calc.gui.app --collect-all customtkinter main.py
echo.
:run_upx
upx -9 --ultra-brute --backup -f dist\Twister.exe
timeout /t 1 /nobreak > nul
echo DONE!
echo [INFO] Готово! EXE-файл: dist\Twister.exe
pause
