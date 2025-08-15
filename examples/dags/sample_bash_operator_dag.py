from airflow import DAG
from datetime import datetime, timedelta
from airflow.providers.standard.operators.bash import BashOperator


default_args = {
    'owner'                 : 'Mostafa Ghadimi',
    'description'           : 'Use of the DockerOperator',
    'depend_on_past'        : False,
    'start_date'            : datetime(2023, 4, 4),
    'email_on_failure'      : False,
    'email_on_retry'        : False,
    'retries'               : 1,
    'retry_delay'           : timedelta(minutes=5)
}

with DAG('docker_dag_sample', default_args=default_args, schedule="5 10 * * *", catchup=False) as dag:
    t1 = BashOperator(
        task_id='print_hello',
        bash_command='echo "hello world"'
    )

t1

