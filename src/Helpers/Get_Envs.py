import os
from dotenv import load_dotenv


def get_enviroment_variables():
    load_dotenv()

    environment_variables = {
        'USER': os.getenv('USER'),
        'PASSWORD': os.getenv('PASSWORD'),
        'CODE': os.getenv('CODE'),
        'BASE_API': os.getenv('BASE_API')
    }

    return environment_variables