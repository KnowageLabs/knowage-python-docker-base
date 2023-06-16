FROM python:3.7

WORKDIR /app

COPY LICENSE ./

RUN apt-get update \
	&& apt-get install --no-install-recommends -y xmlstarlet \
	&& rm -rf /var/lib/apt/lists/* \
	&& pip install gunicorn==20.0.4

# User home is needed during installation of libraries with pip
RUN useradd -m -r knowage \
	&& chown -R knowage:knowage /app

USER knowage

