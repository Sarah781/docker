# Usa a imagem oficial do Python 3.8.2-alpine do Docker Hub
FROM python:3.8.2-alpine  

# Define o diretório para a pasta /home/app
WORKDIR /home/app/ 

# Copia o conteúdo do diretório atual para o contêiner na pasta /home/app
COPY . .

# Instala todos os pacotes necessários especificados em requirements.txt e dependências
RUN apk update && apk add --virtual build-dependencies build-base gcc wget git && \
    apk add --no-cache postgresql-dev gcc python3 python3-dev musl-dev && \ 
    pip3 install flask requests flask-sqlalchemy psycopg2

# Executa app.py quando o contêiner for iniciado
CMD [ "python", "app.py" ]
