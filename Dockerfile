FROM python:3.7

WORKDIR /app

RUN apt-get update \
	&& apt-get install --no-install-recommends -y xmlstarlet \
	&& rm -rf /var/lib/apt/lists/* \
	&& pip install gunicorn==20.0.4

RUN useradd -M -r knowage \
	&& chown -R knowage:knowage /app \
	&& chmod a+x *.sh

USER knowage