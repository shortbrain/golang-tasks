#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

VERSION=$1
shift
CATALOGCD=${CATALOGCD:-catalog-cd}

TASKS="go-crane-image go-ko-image"
for t in ${TASKS}; do
    yq e -i ".metadata.labels[\"app.kubernetes.io/version\"] = \"${VERSION}\"" ${t}/${t}.yaml
done

git add -u || true
git commit -sS -m "Prepare release $VERSION" || true
    
# Create the actual release
mkdir -p release
${CATALOGCD} release --output release  --version="${VERSION}" ${TASKS}

