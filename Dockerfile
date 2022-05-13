FROM openjdk:17-alpine

ENV REVIEWDOG_VERSION=v0.14.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk add --no-cache git
COPY entrypoint.sh /entrypoint.sh
COPY checkstyle/checkstyle.xml /checkstyle.xml
COPY checkstyle/checkstyle-suppressions.xml /checkstyle-suppressions.xml
COPY checkstyle/import-control.xml /import-control.xml

ENTRYPOINT ["/entrypoint.sh"]
