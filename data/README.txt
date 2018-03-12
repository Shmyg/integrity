This directory contains data for all referential tables for ESB project.

How to run:

for i in `cat list.txt`; do sqlldr control=$i userid=<>; done
