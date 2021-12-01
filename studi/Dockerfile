# Maintainer : "assansanogo@gmail.com"
# download ubuntu image
FROM ubuntu:18.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y  python3.8 python3-pip
#cree le repertoire predicteev dans l'image
RUN mkdir /predicteev

#copy les fichiers .py predicteev dans l'image
COPY ./python_code/* /predicteev

#copy les fichiers concernant le model redicctif dans l'image
COPY ./finalized_model.pkl /predicteev

#installation des librairies via requirements.txt
RUN pip3 install -r /predicteev/requirements.txt

# execute application
ENTRYPOINT [ "python3"]
CMD [ "/predicteev/app.py" ]