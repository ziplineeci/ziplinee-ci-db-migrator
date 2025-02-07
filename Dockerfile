FROM scratch

LABEL maintainer="ziplinee.io" \
      description="The ${ZIPLINEE_GIT_NAME} is the component that handles api requests and starts build jobs using the ziplinee-ci-builder"

#COPY ca-certificates.crt /etc/ssl/certs/
COPY estafette-ci-db-migrator /
COPY migrations /migrations

ENTRYPOINT ["/ziplinee-ci-db-migrator"]
