#!/bin/bash

function die {
  echo 1>&2 "${1}"
  exit 1
}

THISDIR=$(cd $(dirname $0) && pwd)
CS_DIR=$(cd ${THISDIR}/../../../cloudstead-server && pwd)
CS_JAR=$(find ${CS_DIR}/target -maxdepth 1 -type f -name "cloudstead-server-*.jar")
WP_APP_DIR=$(cd ${CS_DIR}/../cloudos/cloudos-apps/apps/wordpress && pwd)
WP_MANIFEST="${WP_APP_DIR}/cloudos-manifest.json"

if [ ! -f ${WP_MANIFEST} ] ; then
  die "No manifest found: ${WP_MANIFEST}"
fi

JSON_EDIT="java -cp ${CS_JAR} org.cobbzilla.util.json.main.JsonEditor"

rsync -avzc --exclude="target" ${WP_APP_DIR}/* ${THISDIR}/
rm -f \
  ${THISDIR}/files/httpful.phar \
  ${THISDIR}/templates/cos_auth.php.erb

cat ${WP_MANIFEST} \
  | ${JSON_EDIT} -o delete -p assets \
  | ${JSON_EDIT} -o delete -p copy \
  | ${JSON_EDIT} -o delete -p auth \
  | ${JSON_EDIT} -o delete -p "templates.'@doc_root/wp-content/plugins/cos_auth.php'" \
  | ${JSON_EDIT} -o delete -p "post_install[0]" \
> ${THISDIR}/cloudos-manifest.json || die "Error editing json"
