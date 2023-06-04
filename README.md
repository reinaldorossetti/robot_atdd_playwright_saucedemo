# robot_atdd_playwright_saucedemo
Sample Project with Robot e Playwright Frameworks (Allure Report and GitActions CI)

Projeto Exemplo usando o Robot Framework. Projeto para estudo sobre o Framework.  

Report do Projeto utilizando o Git Actions:   
chromium browser:
https://reinaldorossetti.github.io/robot_atdd_playwright_saucedemo/chromium/#
firefox browser:
https://reinaldorossetti.github.io/robot_atdd_playwright_saucedemo/firefox/#


Na esteira estamos usando em uma PIPELINE o Pabot para rodar em paralelo as features:  
https://github.com/reinaldorossetti/robot_samples_api_test/blob/main/.github/workflows/test_robot_pabot.yml  

Pré-requisito Instalação do Python 3.9.4, e o mesmo deve setar as váriaveis de ambiente no SO.
https://www.python.org/downloads/release/python-394/
** Obs: Na instalação do Pythons selecione a opção para adicionar no Path do Sistema, senão vai precisar adicionar manualmente.

Estamos usando a versão 6.0.2, ultima versão mais estável atualmente:
Release Notes: https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-6.0.2.rst

HOW TO:
```
 git clone https://github.com/reinaldorossetti/robot_samples_api_test.git
 cd robot_samples_api_test   
 pip install -r requirements.txt
```

Install library with browser binaries.

Install Browser library from PyPi with pip:
> pip install robotframework-browser
Initialize the Browser library:
> rfbrowser init

WINDOWS ONLY: Add path to Browser library: 
C:\Users\<user_name_here>\AppData\Roaming\Python\Python311\site-packages\Browser


Command line to runner:

Run All Tests:
```
python -m robot -d my_reports ./  
```
Api features, By File Path:
```
python -m robot -d my_reports --loglevel DEBUG:FAIL features/specifications/weather
python -m robot -d my_reports --loglevel DEBUG:INFO features/specifications/weather
```

Add variable in command line:
```
python -m robot -d my_reports --variable LOG_LEVEL:INFO features/specifications/weather
```

Comando diretamente pelo robot.
```
robot --loglevel DEBUG:INFO -d my_reports -i api_tests ./  
```
Rodando o report local:
```
python -m robot --listener allure_robotframework --rerunfailed my_reports/output.xml -d my_reports -i api_tests ./ 
allure generate ./output/allure -o allure-results/
allure serve
```

Link do Report pelo Git Actions:
https://reinaldorossetti.github.io/robot_openweather_api/allure-results/

Folder Structure Conventions
============================

> Folder structure and naming conventions for my project.

### A typical cucumber directory pattern.
´´´
├── atests                      # Pasta Feature é principal do projeto (root code).
    ├── support                 # Funções comuns que são compartilhadas no projeto.
    ├── features                # Pasta aonde vai conter as features e seus respectivos testes.
        ├── keywords            # Keywords que serão utilizadas nos testes.
        ├── resources           # Arquivos Json ou YAML que fazem parte dos testes.
        feature_test.robot      # Arquivos _test vão conter a escrita dos testes.
        feature_variables.robot # Arquivo que vai conter as variáveis e Resource da feature. 
    ├── global_variables.robot  # Arquivo que vai conter as variáveis e Resource do Projeto. 

├── .gitignore                  # Arquivos/pastas que serão ignorados no github.
├── LICENSE
├── README.md                   # Documentação Simplificada do Projeto.
└── requirements.txt          # Aqui vão estar as bibliotecas do Projeto, definir as versões utilizadas.
´´´

> Use short lowercase names at least for the top-level files and folders except  
> `LICENSE`, `README.md`, in folder pages the name follow github default in Letter case.  
> Use yaml file to store as environment variables and locators, used in the robot files.   
> The Variables that are not mutable must follow upcase in python by default.  

** This project follow the best pratices, below refences of the same.

Dependencies of project:
```
allure-robotframework~=2.13.1
robotframework-requests==0.9.2
robotframework~=6.0.2
robotframework-faker~=5.0.0
robotframework-tidy>=4.1.0
robotframework-jsonlibrary>=0.5
robotframework-pabot~=2.15.0
pyyaml~=5.4
pyopenssl>=23.1.1
pycryptodome~=3.17
Pylance~=0.4.2
psycopg2~=2.9.6
```

Exemplos de Uso do Json Library, ótimo para alterar os valores em um json.
Podemos fazer uso da validação do json schema por esta biblioteca da comunidade.
```
Example Test Case
*** Settings ***				
Library	JSONLibrary			
*** Test Cases ***				
${json_obj}=	            Load Json From File	example.json		
${object_to_add}=	        Create Dictionary	country=Thailand		
${json_obj}=	            Add Object To Json	${json_obj}	$..address	${object_to_add}
${value}=	                Get Value From Json	${json_obj}	$..country	
Should Be Equal As Strings	${value[0]}	Thailand		
${value_to_update}=	        Set Variable	Japan		
${json_obj}=	            Update Value To Json	${json_obj}	$..country	${value_to_update}
Should Be Equal As Strings	${json_obj['country']	${value_to_update}		
Should Have Value In Json	${json_obj}	$..isMarried		
Should Not Have Value In Json	${json_obj}	$..hasSiblings		
Dump Json To File	        ${OUTPUT_DIR}${/}output.json	${json}		
${schema_json_obj}=	        Load Json From File	schema.json		
Validate Json By Schema	        ${json_obj}	${schema_json_obj}		
Validate Json By Schema File	${json_obj}	schema.json		
```

References:    
https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html  
https://github.com/MarketSquare/robotframework-requests  
https://github.com/kennethreitz/requests  
https://requests.readthedocs.io/en/latest/  
https://github.com/robotframework-thailand/robotframework-jsonlibrary

Cursos de Robot  
https://www.udemy.com/course/automacao-de-testes-com-robot-framework-basico/  
https://www.udemy.com/course/automacao-de-testes-com-robot-framework-avancado    
