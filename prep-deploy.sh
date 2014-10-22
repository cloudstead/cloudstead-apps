#!/bin/bash

BASE=$(cd $(dirname $0) && pwd)
../cloudos/cloudos-appstore/bin/cbundler ${BASE}/apps
