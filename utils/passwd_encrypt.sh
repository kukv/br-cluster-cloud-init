#! /bin/bash

set -euxo pipefail

openssl passwd -6 -salt=salt "$@"
