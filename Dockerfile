FROM jupyter/minimal-notebook:latest

ENV JUPYTER_TOKEN=hi

ENV JUPYTER_ENABLE_LAB=yes

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

CMD ["sh", "-c","jupyter notebook --ip='*' --no-browser"]
