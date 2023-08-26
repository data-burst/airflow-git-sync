FROM alpine:3.18.0

LABEL maintainer=mostafa.ghadimi@yahoo.com

LABEL image_name="Airflow DAGs with Git synchronization"

RUN apk add --no-cache git openssh-client rsync

WORKDIR /app

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]


