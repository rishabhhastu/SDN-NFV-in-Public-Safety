#!/bin/bash

mongoexport --db nextepc --collection subscribers --out /tmp/nextepc/nextepc.json
mongoimport -h 192.168.10.250 --db nextepc --collection subscribers /tmp/nextepc/nextepc.json
mongoexport -h 192.168.10.250 --db nextepc --collection subscribers --out /tmp/nextepc/nextepc.json
mongoimport --db nextepc --collection subscribers /tmp/nextepc/nextepc.json

