#!/bin/bash

for i in roo-xls_*; do mv $i $(echo "$i" | sed 's/roo-xls_/roo_/'); done
