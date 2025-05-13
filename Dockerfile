FROM scratch

ENV ZIPLINEE_GIT_NAME="ziplinee-ci-db-migrator"
LABEL maintainer="ziplinee.io" \
      description="The ziplinee-ci-db-migrator is the component that handles api requests and starts build jobs using the ziplinee-ci-builder"

#COPY ca-certificates.crt /etc/ssl/certs/
COPY publish/ziplinee-ci-db-migrator /
COPY migrations /migrations

ENTRYPOINT ["/ziplinee-ci-db-migrator"]
