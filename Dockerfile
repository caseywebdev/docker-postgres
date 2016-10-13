FROM postgres:9.6.0

ENV CONTAINERPILOT file:///etc/containerpilot.json
ENV CONTAINERPILOT_VERSION 2.4.3
RUN apt-get update && \
    apt-get install -y wget && \
    wget -O - \
      https://github.com/joyent/containerpilot/releases/download/$CONTAINERPILOT_VERSION/containerpilot-$CONTAINERPILOT_VERSION.tar.gz | \
      tar xz -C /bin/

COPY etc/containerpilot.json /etc/

ENV CONSUL_URL consul

ARG VERSION
ENV VERSION $VERSION

CMD ["containerpilot", "/docker-entrypoint.sh", "postgres"]
