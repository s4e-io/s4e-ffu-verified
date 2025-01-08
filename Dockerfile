FROM --platform=linux/amd64 python:3.10.0-alpine3.14
COPY requirements.txt /

RUN apk update && apk upgrade
RUN apk add --no-cache --virtual .build-deps build-base gcc musl-dev
RUN python3 -m pip install --verbose  -r requirements.txt --no-cache-dir
RUN apk --purge del .build-deps

COPY . /app

WORKDIR /app
EXPOSE 8000
RUN chown nobody:nobody * -R \
    && chmod +x gunicorn.sh 

ENTRYPOINT ["./gunicorn.sh"]