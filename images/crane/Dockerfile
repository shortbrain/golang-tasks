FROM alpine:3.16 AS crane
ARG VERSION=0.12.0
# RUN apk add --no-cache go && go install github.com/slsa-framework/slsa-verifier/cli/slsa-verifier@v1.3.1
RUN ARCH=$(uname -m) OS=$(uname) && \
    wget -O go-containerregistry.tar.gz https://github.com/google/go-containerregistry/releases/download/v${VERSION}/go-containerregistry_${OS}_${ARCH}.tar.gz && \
    # curl -sL https://github.com/google/go-containerregistry/releases/download/v${VERSION}/attestation.intoto.jsonl > provenance.intoto.jsonl && \
    # ~/go/bin/slsa-verifier -artifact-path go-containerregistry.tar.gz -provenance provenance.intoto.jsonl -source github.com/google/go-containerregistry -tag "v${VERSION}" && \
    tar xvzf go-containerregistry.tar.gz -C /bin

FROM alpine:3.16
COPY --from=crane /bin/crane /bin/crane
RUN apk add --no-cache bash tar


