@echo off
chcp 65001 >nul
echo [INFO] Проверка наличия Python...
python --version >nul 2>&1
if %errorlevel% neq 0 goto no_python
echo [INFO] Проверка виртуального окружения...
if not exist venv goto make_venv

:activate_and_run
call venv\Scripts\activate
echo [INFO] Установка/проверка зависимостей...
pip install -r requirements.txt
echo [INFO] Запуск программы...
python main.py
pause
exit /b

:no_python
echo [ERROR] Python не установлен!
pause
exit /b

:make_venv
echo [INFO] Создание venv...
python -m venv venv
goto activate_and_run
