#!/bin/bash
# check PSU Firmware
while IFS= read -r ipmi
do
 echo "IP ADDRESS: $ipmi"
 ipmitool -I lanplus  -H $ipmi -U admin -P Nokia@1234567890 raw 0x6 0x52 0xf 0xb0 0x8 0xd5 | xxd -rp
 echo ""
 ipmitool -I lanplus  -H $ipmi -U admin -P Nokia@1234567890 raw 0x6 0x52 0xf 0xb2 0x8 0xd5 | xxd -rp
 echo ""
 echo "completed"
 echo ""
done < $1
