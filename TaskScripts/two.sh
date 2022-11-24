#!/bin/bash
mkdir -p %HPCROOTDIR%/MYDIR
cd %HPCROOTDIR%/MYDIR
echo "Job B" >>  B.txt
cat A.txt >> B.txt
