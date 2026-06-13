FROM ollama/ollama:latest

RUN apt-get update && \
    apt-get install -y curl nodejs npm

WORKDIR /app

COPY package.json .
RUN npm install

COPY proxy.js .
COPY start.sh .

RUN chmod +x start.sh

ENTRYPOINT []

CMD ["/app/start.sh"]
