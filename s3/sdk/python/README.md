- Python 3 instalado (por ejemplo 3.12).
- `pip` disponible en tu instalación de Python.


python -m venv .venv

source .venv/bin/activate

deactivate

pip install boto3

pip freeze > requirements.txt

pip install -r requirements.txt