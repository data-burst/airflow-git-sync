from datetime import datetime, timedelta

from airflow import DAG
from airflow.providers.docker.operators.docker import DockerOperator

default_args = {
    "owner": "Mostafa Ghadimi",
    "description": "Use of the DockerOperator",
    "depend_on_past": False,
    "start_date": datetime(2023, 4, 23),
    "email_on_failure": False,
    "email_on_retry": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

with DAG(
    "docker_dag_v2",
    default_args=default_args,
    schedule="5 10 * * *",
    catchup=False,
) as dag:
    t1 = DockerOperator(
        task_id="docker_command",
        image="alpine:latest",
        api_version="auto",
        auto_remove="success",
        command="/bin/sleep 30",
        docker_url="unix://var/run/docker.sock",
        network_mode="bridge",
    )

t1
