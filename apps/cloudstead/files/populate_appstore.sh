#!/bin/bash
#
# Called during chef-run, populates the appstore with the initial set of apps
#

function die {
  echo >&2 "${1}" ; exit 1
}

if [ -z "${APPSTORE_PASS}" ] ; then die "No APPSTORE_PASS found in environment" ; fi

SERVER="${APPSTORE_SERVER:-https://$(hostname)/appstore}"
export APPSTORE_SERVER="${SERVER}"

publisher="${1?No publisher arg specified}"
JSON_FILE="${2?No JSON file specified}"
if [ -f ${JSON_FILE} ] ; then
    echo "Reading apps from ${JSON_FILE}"

elif [[ $(echo ${JSON_FILE} | head -c 7) = "http://" || $(echo ${JSON_FILE} | head -c 8) = "https://" ]] ; then
    echo "Reading apps from ${JSON_FILE}"
    TMP=$(mktemp /tmp/$(basename $0).XXXXXXX) || die "Error creating temp file"
    curl -sf ${JSON_FILE} > ${TMP} || die "Error fetching JSON: ${JSON_FILE}"
    JSON_FILE=${TMP}

else
    die "Unreadable: ${JSON_FILE}"
fi

SINGLE_APP="${3}"
if [ -z "${SINGLE_APP}" ] ; then
  echo "Publishing all apps for publisher ${publisher}"

elif [ "${SINGLE_APP}" = "--force" ] ; then
  FORCE="--force"
  SINGLE_APP=""

else
  echo "Publishing single app ${SINGLE_APP} for publisher ${publisher}"
  shift
fi
FORCE="${3}"

OK_APPS=""
SKIPPED_APPS=""
FAILED_APPS=""

function populate_app {
  publisher="${1}"
  app_name="${2}"
  visibility="${3}"
  bundle_url="${4}"
  bundle_sha="${5}"

  if cas apps --account ${publisher} --publisher ${publisher} --server ${SERVER} --operation read --name ${app_name} > /dev/null && [ "${FORCE}" != "--force" ] ; then
    SKIPPED_APPS="${SKIPPED_APPS} ${publisher}/${app_name}"
  else
    if publish_app.sh ${publisher} ${publisher} ${visibility} ${bundle_url} ${bundle_sha} ; then
      OK_APPS="${OK_APPS} ${publisher}/${app_name}"
    else
      FAILED_APPS="${FAILED_APPS} ${publisher}/${app_name}"
    fi
  fi
}

i=0
while [ true ] ; do
  APP_JSON="$(cstead json -f ${JSON_FILE} -o read -p ${publisher}[${i}])" || break

  name="$(echo "${APP_JSON}" | cstead json -o read -p name | tr -d '"')"

  if [[ -z "${SINGLE_APP}" || "${SINGLE_APP}" == "${name}" ]] ; then
      visibility="$(echo "${APP_JSON}" | cstead json -o read -p visibility | tr -d '"')"
      bundle_url="$(echo "${APP_JSON}" | cstead json -o read -p bundle_url | tr -d '"')"
      bundle_sha="$(echo "${APP_JSON}" | cstead json -o read -p bundle_sha | tr -d '"')"

      populate_app ${publisher} ${name} ${visibility} ${bundle_url} ${bundle_sha}
  fi

  i=$(expr ${i} + 1)
done

echo "---------------------------------"
echo "Appstore initialization complete"
if [ ! -z "${OK_APPS}" ] ; then echo "Apps installed OK: ${OK_APPS}" ; fi
if [ ! -z "${SKIPPED_APPS}" ] ; then echo "Apps already installed (skipped): ${SKIPPED_APPS}" ; fi
if [ ! -z "${FAILED_APPS}" ] ; then echo "Apps that FAILED installation: ${FAILED_APPS}" ; fi
echo "---------------------------------"
