#!/bin/bash
vtysh -c 'conf t' \
-c 'interface lo' \
-c ' ip address 10.255.0.4/32' \
-c ' ip ospf area 0.0.0.0' \
-c 'exit' \
-c 'interface eth1' \
-c ' ip address 10.0.0.10/30' \
-c ' ip ospf area 0.0.0.0' \
-c 'exit' \
-c 'interface eth2' \
-c ' ip address 10.0.0.18/30' \
-c ' ip ospf area 0.0.0.0' \
-c 'exit' \
-c 'interface eth3' \
-c ' ip address 10.0.0.14/30' \
-c ' ip ospf area 0.0.0.0' \
-c 'exit' \
-c 'router ospf' \
-c ' ospf router-id 10.255.0.4' \
-c ' router-info area 0.0.0.0' \
-c ' passive-interface lo' \
-c ' capability opaque' \
-c ' mpls-te on' \
-c ' mpls-te router-address 10.255.0.4' \
-c ' segment-routing on' \
-c ' segment-routing global-block 16000 19999' \
-c ' segment-routing node-msd 8' \
-c ' segment-routing prefix 10.255.0.4/32 index 4' \
-c 'exit'
