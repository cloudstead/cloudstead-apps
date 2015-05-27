#!/bin/bash
#
# Create apps.json file from current directory, presumed to contain app bundles in the form APPNAME-bundle.tar.gz
#
# Usage: gen_apps_json.sh [cloudstead-app1] [cloudstead-app2] ...
#
# If the APPS_BASE_URL is present, it will be used as the default URL for app bundles.
# If absent, the default value is http://cloudstead.io/downloads
#
# The cloudstead-apps listed will be published as the 'cloudstead' publisher and will be visible only to that publisher
# All other apps will be published as public apps and will be visible to everyone
# If no cloudstead-apps are listed, the default list of cloudstead-apps is:
#   cloudstead cloudos-appstore *-standalone
#

CS_APPS="$@"
if [ -z "${CS_APPS}" ] ; then
  CS_APPS="cloudstead cloudos-appstore $(ls -1 *-standalone-bundle.tar.gz | sed -e 's/-bundle.tar.gz//')"
fi

if [ -z ${APPS_BASE_URL} ] ; then
  APPS_BASE_URL="http://cloudstead.io/downloads"
fi

echo "{
  \"id\": \"apps\",

  \"public\": ["

FIRST=1
for f in $(ls -1 *.tar.gz | grep bundle) ; do

  name=$(echo ${f} | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}' | sed -e 's/-bundle//')

  for csapp in ${CS_APPS} ; do
    if [ "${csapp}" = "${name}" ] ; then
        continue 2
    fi
  done

  if [ ${FIRST} -eq 1 ] ; then
    FIRST=0
  else
    echo ", "
  fi
  echo -n "    { \"name\": \"${name}\",
      \"bundle_url\": \"${APPS_BASE_URL}/${f}\",
      \"bundle_sha\": \"$(shasum -a 256 ${f} | awk '{print $1}')\",
      \"visibility\": \"everyone\" }"
done

echo "
  ],

  \"cloudstead\": ["

FIRST=1
for f in $(ls -1 *.tar.gz | grep bundle) ; do

  name=$(echo ${f} | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}' | sed -e 's/-bundle//')

  found=0
  for csapp in ${CS_APPS} ; do
    if [ "${csapp}" = "${name}" ] ; then
        found=1
        break
    fi
  done
  if [ ${found} -eq 0 ] ; then
    continue
  fi

  if [ $(echo ${name} | grep -o -- '-standalone' | wc -c | tr -d ' ') -gt 0 ] ; then
    name=$(echo ${name} | sed -e 's/-standalone//')
  fi

  if [ ${FIRST} -eq 1 ] ; then
    FIRST=0
  else
    echo ", "
  fi
  echo -n "    { \"name\": \"${name}\",
      \"bundle_url\": \"${APPS_BASE_URL}/${f}\",
      \"bundle_sha\": \"$(shasum -a 256 ${f} | awk '{print $1}')\",
      \"visibility\": \"publisher\" }"
done

echo "
  ]"

echo "
}"
