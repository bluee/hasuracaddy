FROM hasura/graphql-engine:latest as base
FROM python:3.7-slim-stretch

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends libpq-dev jq \
    && apt-get install -y curl \
    && apt-get install -y systemd \
    && apt-get -y auto-remove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/share/doc/ \
    && rm -rf /usr/share/man/ \
    && rm -rf /usr/share/locale/

# copy hausra binary from base container
COPY --from=base /bin/graphql-engine /bin/graphql-engine

COPY entrypoint.sh /entrypoint.sh
COPY Caddyfile /Caddyfile
RUN chmod +x /entrypoint.sh
RUN curl https://getcaddy.com | bash -s personal http.nobots,http.minify,http.proxyprotocol
# TODO: Add http.websocket

# Validate install
RUN /usr/local/bin/caddy -version
RUN /usr/local/bin/caddy -plugins

CMD ["/entrypoint.sh"]
