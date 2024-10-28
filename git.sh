#!/bin/bash

cd /home/srvdpahidrologia/Precipitacion_CELEC_html/

cp *.json /home/srvdpahidrologia/celec_precipitacion

cd /home/srvdpahidrologia/celec_precipitacion
git add .
git commit -m "Subida automatica del $(date)"
git push origin main
