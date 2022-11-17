FROM alpine:3.16

ARG BUILD_DATE
ARG VERSION
ARG REVISION

LABEL maintainer="李白"

RUN addgroup -S app \
    && adduser -S -G app app \
    && apk --no-cache add \
    ca-certificates curl netcat-openbsd

WORKDIR /home/app

COPY bin/login .
RUN chown -R app:app ./

USER app

CMD ["./login"]
