from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
from robot.utils.asserts import fail
import allure
import jsonschema
import json

ROBOT_LIBRARY_SCOPE = 'Global'


def validate_json_schema(schema_path, response, encoding=None):
    """Validates the sample JSON against the given schema."""
    with open(schema_path, encoding=encoding) as f:
            schema = json.load(f)
    try:
        jsonschema.validate(response, schema)
    except jsonschema.ValidationError as e:
        fail(f"Json does not match the schema: {e.schema}")
    except jsonschema.SchemaError as e:
        fail(f"Json schema error: {e}")

def capture_page_screenshot(path,screen_name):
    try:
         allure.attach.file(path, screen_name, attachment_type=allure.attachment_type.JPG)
    except:
        fail(f"Falhou ao anexar o screenshot ao allure report")
    return path