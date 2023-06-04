# robot_atdd_playwright_saucedemo
Sample Project with Robot e Playwright Frameworks (Allure Report and GitActions CI)

### Project Report using Git Actions:  
chromium browser:  
https://reinaldorossetti.github.io/robot_atdd_playwright_saucedemo/chromium/#  
firefox browser:  
https://reinaldorossetti.github.io/robot_atdd_playwright_saucedemo/firefox/#  
webkit browser:
https://reinaldorossetti.github.io/robot_atdd_playwright_saucedemo/webkit/#

Na esteira estamos usando em uma PIPELINE o Pabot para rodar em paralelo as features:  
https://github.com/reinaldorossetti/robot_atdd_playwright_saucedemo/blob/main/.github/workflows/test_robot_pabot.yml

### Precondition for running the tests:
1. Installation of Python 3.11, and it must set the environment variables in the OS.  
https://www.python.org/downloads/release/python-3110/

2. Installation of NodeJS:
https://nodejs.org/en/download

** Note: When installing Python, select the option to add it to the System Path, otherwise you will need to add it manually.

3. Install Libraries:
````
pip install -r requirements.txt
````

4. Initialize the Browser library:
> rfbrowser init

We are using version 6.0.2, the latest and most stable version currently:Release Notes: https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-6.0.2.rst

HOW TO (Step by step):
```
 git clone https://github.com/reinaldorossetti/robot_atdd_playwright_saucedemo.git
 cd robot_atdd_playwright_saucedemo   
 pip install -r requirements.txt
 rfbrowser init
 python -m robot -d my_reports ./
```

WINDOWS ONLY: Add path to Browser library: 
C:\Users\<user_name_here>\AppData\Roaming\Python\Python311\site-packages\Browser


Command line to runner:

Run All Tests:
```
python -m robot -d my_reports ./  
```

Run Tests By TAG:
```
robot --loglevel DEBUG:INFO -d my_reports -i shopping_cart_tests ./ 
```
Run Allure in local machine:
```
python -m robot --listener allure_robotframework --rerunfailed my_reports/output.xml -d my_reports -i api_tests ./ 
allure generate ./output/allure -o allure-results/
allure serve
```

Folder Structure Conventions
============================

> Folder structure and naming conventions for my project.

### A typical cucumber directory pattern.
´´´
├── atests                      # Feature folder is main project (root code).
    ├── support                 # Common functions that are shared in the project.
    ├── features                # Folder where the features and their respective folder specification will be located.
        ├── keywords            # Keywords that will be used in the tests.
        ├── elements            # Page Web, elements for the tests.
        feature_test.robot      # _test files will contain the writing of the tests.
    ├── global_variables.robot  # The file that will contain the Project's variables and Resource.

├── .gitignore                  # Files/folders that will be ignored in github.
├── LICENSE
├── README.md                   # Simplified Project Documentation.
└── requirements.txt            # Here will be the Project's libraries, define the versions used.
´´´

> Use short lowercase names at least for the top-level files and folders except  
> `LICENSE`, `README.md`, in folder pages the name follow github default in Letter case.  
> Use yaml file to store as environment variables and locators, used in the robot files.   
> The Variables that are not mutable must follow upcase in python by default.  

** This project follow the best pratices, below refences of the same.

Dependencies of project:
```
allure-robotframework~=2.13.1
robotframework==6.0.2
robotframework-browser==16.2.0
robotframework-faker~=5.0.0
robotframework-jsonlibrary>=0.5
robotframework-pabot~=2.15.0
pyyaml~=5.4
```

References:    
robotframework:
https://docs.robotframework.org/docs
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
browser library:
https://robotframework-browser.org 
https://marketsquare.github.io/robotframework-browser/Browser.html
https://github.com/MarketSquare/robotframework-browser#robotframework-browser

Courses of Robot Framework (PT_BR):  
https://www.udemy.com/course/automacao-de-testes-com-robot-framework-basico/  
https://www.udemy.com/course/automacao-de-testes-com-robot-framework-avancado    
