# Maintainer : "assansanogo@gmail.com"
# download ubuntu image
FROM ubuntu:18.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y  python3.8 python3-pip
#cree le repertoire predicteev dans l'image
RUN mkdir /predicteev

#copy les fichiers .py predicteev dans l'image
COPY ./studiapp/* /predicteev

#copy les fichiers concernant le model redicctif dans l'image
COPY ./studiapp/finalized_model.pkl /predicteev

#installation des librairies via requirements.txt
RUN pip3 install -r /predicteev/requirements.txt

# execute application
# Run the image as a non-root user

WORKDIR /predicteev

RUN adduser -D myuser
USER myuser

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
CMD gunicorn --bind 0.0.0.0:$PORT wsgi
