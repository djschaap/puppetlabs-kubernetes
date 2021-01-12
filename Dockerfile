FROM puppet/pdk:latest
RUN \
  apt-get update \
  && apt-get install -y \
    gcc \
    make \
  && rm -rf /var/lib/apt/lists/*
COPY Gemfile metadata.json /code/
WORKDIR /code
RUN \
  /opt/puppetlabs/pdk/bin/pdk bundle
COPY . /code
