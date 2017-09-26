#!/bin/bash

# -------------------------------------------------------------------------- #
# Copyright 2010-2017, OpenNebula Systems                                    #
#                                                                            #
# Licensed under the Apache License, Version 2.0 (the "License"); you may    #
# not use this file except in compliance with the License. You may obtain    #
# a copy of the License at                                                   #
#                                                                            #
# http://www.apache.org/licenses/LICENSE-2.0                                 #
#                                                                            #
# Unless required by applicable law or agreed to in writing, software        #
# distributed under the License is distributed on an "AS IS" BASIS,          #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   #
# See the License for the specific language governing permissions and        #
# limitations under the License.                                             #
#--------------------------------------------------------------------------- #

NAME=${NAME:-one-context}
VERSION=${VERSION:-5.4.1}
FILENAME=${FILENAME:-${NAME}-${VERSION}.msi}

if [ ! -f rhsrvany.exe ]; then
    if [ -f /usr/share/virt-tools/rhsrvany.exe ]; then
        cp /usr/share/virt-tools/rhsrvany.exe .
    else
        echo 'Missing rhsrvany.exe' >&2
        exit 1
    fi
fi

set -e

wixl -D Version="${VERSION}" -o "${FILENAME}" package.wxs
echo "${FILENAME}"
