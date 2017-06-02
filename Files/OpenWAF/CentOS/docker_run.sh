#!/bin/bash

docker run -d --name openwaf \
           -v /opt/qj/openwaf/conf/ngx_openwaf.conf:/etc/ngx_openwaf.conf \
           -v /opt/qj/openwaf/conf/twaf_access_rule.json:/opt/OpenWAF/conf/twaf_access_rule.json \
           -v /opt/qj/openwaf/log/openwaf_error.log:/var/log/openwaf_error.log \
           titansec/openwaf