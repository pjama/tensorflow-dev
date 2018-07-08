FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip \
  && apt-get clean

COPY requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt \
  && rm /tmp/requirements.txt

ENTRYPOINT ["sleep", "infinity"]
