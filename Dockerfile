FROM jupyter/minimal-notebook:latest

USER root

ENV JUPYTER_TOKEN=hi

ENV JUPYTER_ENABLE_LAB=yes

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

RUN sudo tljh-config set auth.GoogleOAuthenticator.client_id 435986511295-3t44iqt8nu9e7tsdn0kr6m4nsnm7nsn2.apps.googleusercontent.com

RUN sudo tljh-config set auth.GoogleOAuthenticator.client_secret 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

RUN sudo tljh-config set auth.GoogleOAuthenticator.oauth_callback_url https://docker-notebook-new-rqaxgobioq-uc.a.run.app/

RUN sudo tljh-config set auth.type oauthenticator.google.GoogleOAuthenticator

RUN sudo tljh-config reload

CMD ["sh", "-c","jupyter notebook --ip='*' --no-browser"]
