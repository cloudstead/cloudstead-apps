#!/bin/bash

BASE=$(cd $(dirname $0) && pwd)
../cloudos/cloudos-appstore/bin/mcbundle ${BASE}/apps
