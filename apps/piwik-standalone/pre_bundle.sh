#!/bin/bash

function die {
  echo 1>&2 "${1}"
  exit 1
}

THISDIR=$(cd $(dirname $0) && pwd)
CS_DIR=$(cd ${THISDIR}/../../../cloudstead-server && pwd)
CS_JAR=$(find ${CS_DIR}/target -maxdepth 1 -type f -name "cloudstead-server-*.jar")
PW_APP_DIR=$(cd ${CS_DIR}/../cloudos/cloudos-apps/apps/piwik && pwd)
PW_MANIFEST="${PW_APP_DIR}/cloudos-manifest.json"

if [ ! -f ${PW_MANIFEST} ] ; then
  die "No manifest found: ${PW_MANIFEST}"
fi

JSON_EDIT="java -cp ${CS_JAR} org.cobbzilla.util.json.main.JsonEditor"

rsync -avzc --exclude="target" ${PW_APP_DIR}/* ${THISDIR}/
rm -rf \
  ${THISDIR}/files/httpful.phar \
  ${THISDIR}/files/CloudosAuthentication

cat ${PW_APP_DIR}/templates/config.ini.php.erb | grep -v CloudosAuthentication > ${THISDIR}/templates/config.ini.php.erb

cat ${PW_MANIFEST} \
  | ${JSON_EDIT} -o delete -p assets \
  | ${JSON_EDIT} -o delete -p copy \
  | ${JSON_EDIT} -o delete -p auth \
  | ${JSON_EDIT} -o write -p config -v \
    "[ { \"name\": \"init\", \"items\": [ \"admin.login\", \"admin.password\", \"admin.email\" ] } ]" \
  | ${JSON_EDIT} -o write -p post_install -v \
    "[ { \"exec\": \"@files/piwik_user_add.sh @dbname @config[init][admin][login] @config[init][admin][password] @config[init][admin][email] 1\" } ]" \
> ${THISDIR}/cloudos-manifest.json || die "Error editing json"
