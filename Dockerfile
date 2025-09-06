# https://airflow.apache.org/docs/docker-stack/build.html
FROM apache/airflow:3.0.1
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt

USER root

RUN rm -rf /var/lib/apt/lists/*

RUN apt-get update

RUN apt-get install -y libaio1 unzip

RUN rm -rf /var/lib/apt/lists/*

COPY instantclient_12_1 /instantclient_12_1
ENV LD_LIBRARY_PATH=/instantclient_12_1