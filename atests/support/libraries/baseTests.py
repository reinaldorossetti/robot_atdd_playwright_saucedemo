from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
from robot.utils.asserts import fail
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
