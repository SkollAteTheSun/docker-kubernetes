FROM python:3-alpine

ARG USER=app
ARG UID=1001
ARG GID=1001

RUN adduser --disabled-password -u $UID -g $GID ${USER} \
    && mkdir -p /app

COPY --chown=$USER:$USER index.html /app

WORKDIR "app"

CMD python -m http.server 8000

EXPOSE 8000


