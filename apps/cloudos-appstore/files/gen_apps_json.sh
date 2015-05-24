#!/bin/bash
#
# Create apps.json file from current directory, presumed to contain app bundles in the form APPNAME-bundle.tar.gz
#
# Usage: gen_apps_json.sh [hidden-app1] [hidden-app2] ...
#
# If the APPS_BASE_URL is present, it will be used as the default URL for app bundles.
# If absent, the default value is http://cloudstead.io/downloads
#
# The apps listed as hidden will be included in the apps.json's "hidden" array.
# All other apps will be included in the "published" array.
#

HIDDEN="$@"

if [ -z ${APPS_BASE_URL} ] ; then
  APPS_BASE_URL="http://cloudstead.io/downloads"
fi

echo "{
  \"id\": \"apps\",

  \"published\": ["

FIRST=1
for f in $(ls -1 *.tar.gz | grep bundle) ; do

  name=$(echo ${f} | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}' | sed -e 's/-bundle//')

  for hidden in ${HIDDEN} ; do
    if [ "${hidden}" = "${name}" ] ; then
        continue 2
    fi
  done

  if [ ${FIRST} -eq 1 ] ; then
    FIRST=0
  else
    echo ", "
  fi
  echo -n "    { \"name\": \"${name}\",
      \"bundle_url\": \"${BASE_URL}/${f}\",
      \"bundle_sha\": \"$(shasum -a 256 ${f} | awk '{print $1}')\" }"
done

echo "
  ],

  \"hidden\": ["

FIRST=1
for f in $(ls -1 *.tar.gz | grep bundle) ; do

  name=$(echo ${f} | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}' | sed -e 's/-bundle//')

  found=0
  for hidden in ${HIDDEN} ; do
    if [ "${hidden}" = "${name}" ] ; then
        found=1
        break
    fi
  done
  if [ ${found} -eq 0 ] ; then
    continue
  fi

  if [ ${FIRST} -eq 1 ] ; then
    FIRST=0
  else
    echo ", "
  fi
  echo -n "    { \"name\": \"${name}\",
      \"bundle_url\": \"http://cloudstead.io/downloads/${f}\",
      \"bundle_sha\": \"$(shasum -a 256 ${f} | awk '{print $1}')\" }"
done

echo "
  ]"

echo "
}"
