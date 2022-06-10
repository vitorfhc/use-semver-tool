FROM alpine:3.16

RUN apk add -q --no-cache bash

RUN wget -q -O /usr/local/bin/semver https://raw.githubusercontent.com/fsaintjacques/semver-tool/master/src/semver
RUN chmod +x /usr/local/bin/semver

COPY ./entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT [ "/usr/local/bin/entrypoint" ]
