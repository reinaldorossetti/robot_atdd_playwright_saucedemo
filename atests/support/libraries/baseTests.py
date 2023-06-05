from robot.libraries.BuiltIn import BuiltIn
from robot.utils.asserts import fail
import allure


ROBOT_LIBRARY_SCOPE = 'Global'

def capture_page_screenshot(path,screen_name):
    try:
         allure.attach.file(path, screen_name, attachment_type=allure.attachment_type.PNG)
    except:
        fail(f"Falhou ao anexar o screenshot ao allure report")
    return path