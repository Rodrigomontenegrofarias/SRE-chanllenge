FROM python:3.6

# This will make apt-get install without question


RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install flask


RUN pip3 install -U scikit-learn

RUN python3 -m venv venv


ADD templates templates
RUN pip3 install Flask


ADD deploy.py deploy.py
ADD venv venv
ADD pickle_model.pkl pickle_model.pkl

ADD deploy.py deploy.py


RUN python3 -m venv env 
#RUN pip install -r api-r/requirements.txt

CMD [ "python3", "deploy.py","0.0.0.0:5000" ]
#CMD python deploy.py
EXPOSE 5000

