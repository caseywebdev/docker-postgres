FROM postgres:9.5.3

ENV CONTAINERPILOT file:///etc/containerpilot.json
ENV CONTAINERPILOT_VERSION 2.3.0
RUN apt-get update && \
    apt-get install -y wget && \
    wget -O - \
      https://github.com/joyent/containerpilot/releases/download/$CONTAINERPILOT_VERSION/containerpilot-$CONTAINERPILOT_VERSION.tar.gz | \
      tar xz -C /bin/

COPY etc/containerpilot.json /etc/

ARG VERSION
ENV VERSION $VERSION

CMD ["containerpilot", "/docker-entrypoint.sh", "postgres"]
