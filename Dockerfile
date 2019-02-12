FROM python:3.7-alpine
MAINTAINER Nolan Strait

# ensure python output goes straight to printing
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# for security purposes; create user solely for running applications
RUN adduser -D user
USER user