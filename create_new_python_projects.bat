@echo off
set /p project_name="Enter project name: "

:: Delete existing project directory if exists
if exist %project_name% rmdir /s /q %project_name%

:: Create project directory
mkdir %project_name%
cd %project_name%

:: Create virtual environment
python -m venv env

:: Activate virtual environment
call env/Scripts/activate.bat

:: Install required packages
pip install flask

:: Create requirements.txt file
pip freeze > requirements.txt

@echo off
echo from flask import Flask > app.py
echo app = Flask(__name__) >> app.py
echo. >> app.py
echo @app.route("/") >> app.py
echo def hello(): >> app.py
echo     return "Hello World!" >> app.py
echo. >> app.py
echo if __name__ == "__main__": >> app.py
echo     app.run() >> app.py

echo "Project %project_name% created successfully!"
