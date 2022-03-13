FROM ghcr.io/jamesdarke/grootgalaxy:latest

COPY ..

CMD ["bash", "resources/startup/startup.sh"]
