#!/bin/bash

function die {
  echo 1>&2 "${1}"
  exit 1
}

THISDIR=$(cd $(dirname $0) && pwd)
CS_DIR=$(cd ${THISDIR}/../../../cloudstead-server && pwd)
CS_JAR=$(find ${CS_DIR}/target -maxdepth 1 -type f -name "cloudstead-server-*.jar")
OWA_APP_DIR=$(cd ${CS_DIR}/../cloudos/cloudos-apps/apps/owa && pwd)
OWA_MANIFEST="${OWA_APP_DIR}/cloudos-manifest.json"

if [ ! -f ${OWA_MANIFEST} ] ; then
  die "No manifest found: ${OWA_MANIFEST}"
fi

JSON_EDIT="java -cp ${CS_JAR} org.cobbzilla.util.json.main.JsonEditor"

rsync -avzc --exclude="target" ${OWA_APP_DIR}/* ${THISDIR}/
rm -f \
  ${THISDIR}/files/httpful.phar \
  ${THISDIR}/templates/module.php.erb

cat ${OWA_MANIFEST} \
  | ${JSON_EDIT} -o delete -p assets \
  | ${JSON_EDIT} -o delete -p copy \
  | ${JSON_EDIT} -o delete -p auth \
  | ${JSON_EDIT} -o delete -p dirs \
  | ${JSON_EDIT} -o delete -p "templates.'@doc_root/modules/cos/module.php'" \
  | ${JSON_EDIT} -o delete -p post_install \
  | ${JSON_EDIT} -o write  -p post_install[] -v "{\"exec\": \"php5 @doc_root/cli.php cmd=install domain=https://@hostname email_address=postmaster@@domain\" }" \
> ${THISDIR}/cloudos-manifest.json || die "Error editing json"
