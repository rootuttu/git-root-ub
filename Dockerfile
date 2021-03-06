FROM ghcr.io/jamesdarke/grootgalaxy:latest
# set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN /usr/local/bin/python -m pip install --upgrade pip

# clone the repo and change workdir
RUN git clone https://github.com/rootuttu/git-root-ub.git /root/git-root-ub/
WORKDIR /root/git-root-ub/

# install main requirements.
COPY requirements.txt /deploy/
RUN pip3 install --no-cache-dir -r /deploy/requirements.txt

# install addons requirements
RUN wget -O /deploy/addons.txt https://git.io/JWdOk
RUN pip3 install --no-cache-dir -r /deploy/addons.txt

# start the bot
CMD ["bash", "resources/startup/startup.sh"]
