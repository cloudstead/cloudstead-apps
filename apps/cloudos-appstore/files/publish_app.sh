#!/bin/bash
#
# Installs and publishes app from a bundle URL
#
# Usage: publish_app.sh <admin> <publisher> <visibility> <bundle-url> [bundle-sha] [server]
#
# You must define APPSTORE_PASS in your environment.
# publisher will usually be the same value as admin
# visibility is one of: everyone, members, publisher
# If bundle-sha is omitted, it will be calculated automatically from the bundle-url
# If server is omitted, the default local server will be used
#

TEMP_JSON=$(mktemp /tmp/app.XXXXXXX.json) || die "Error creating temp file"

function die {
  echo >&2 "${1}"
  if [ -f ${TEMP_JSON} ] ;  then
    rm -f ${TEMP_JSON}
  fi
  exit 1
}

if [ -z "${APPSTORE_PASS}" ] ; then
  die "No APPSTORE_PASS found in environment"
fi
SERVER="${APPSTORE_SERVER:-https://$(hostname)/appstore}"

ADMIN="${1:?No admin provided}"
PUBLISHER="${2:?No publisher provided}"
VISIBILITY="${3:?No visibility provided}"
BUNDLE_URL="${4:?No bundle URL provided}"
BUNDLE_SHA="${5:-$(curl -sf ${BUNDLE_URL} | shasum -a 256 | awk '{print $1}')}"

if [ -z "${ADMIN}" ] ; then die "No admin provided" ; fi
if [ -z "${PUBLISHER}" ] ; then die "No publisher provided" ; fi
if [ -z "${VISIBILITY}" ] ; then die "No visibility provided" ; fi
if [ -z "${BUNDLE_URL}" ] ; then die "No bundle URL provided" ; fi

CAS_OPTS="--account ${ADMIN} --server ${SERVER} --publisher ${PUBLISHER}"

# Create the app, save JSON returned to retrieve version
cas apps ${CAS_OPTS} --operation create --attr-name visibility --attr-value ${VISIBILITY} \
  --bundle ${BUNDLE_URL} --bundle-sha ${BUNDLE_SHA} > ${TEMP_JSON} || die "Error creating app"

# Extract name and version from JSON
created_name=$(cas json --file ${TEMP_JSON} --operation read --path app | tr -d '"')
created_version=$(cas json --file ${TEMP_JSON} --operation read --path version | tr -d '"')

# Extract x.x.x version number
parsed_version=$(echo "${created_version}" | egrep -o '[[:digit:]]+.[[:digit:]]+.[[:digit:]]+')

# Ensure name and version were found, and they are what we expected
if [[ -z "${created_name}" || -z "${created_version}" || "${created_version}" != "${parsed_version}" ]] ; then
  die "Error creating app: created_name=${created_name}, created_version=${created_version}, parsed_version=${parsed_version}"
fi

# Publish the app
cas apps ${CAS_OPTS} --operation update --name ${created_name} --version ${created_version} --status published \
  > ${TEMP_JSON} || die "Error publishing app: ${created_name}/${created_version}"
app_status=$(cas json --file ${TEMP_JSON} --operation read --path status | tr -d '"')

# Verify app was successfully published
if [ "${app_status}" == "published" ] ; then
  echo "App ${PUBLISHER}/${created_name}/${created_version} successfully published"
  rm -f ${TEMP_JSON}
  exit 0

else
  die "Error publishing app (publisher=${PUBLISHER}): ${BUNDLE_URL}"
fi
