#!/bin/bash
scan_directory="/home/xs353-shukum/Desktop/Opentofu/opentofu"
 
tfsec_output_file="tfsec_output.txt"
tfsec "$scan_directory" > "$tfsec_output_file"
 
if grep -q -E 'CRITICAL|HIGH' "$tfsec_output_file"; then
  echo "CRITICAL or HIGH issues found in tfsec output. Failing the pipeline."
  rm -rf tfsec_output.txt
  exit 1
else
  echo "No CRITICAL or HIGH issues found in tfsec output. Pipeline continues."
  rm -rf tfsec_output.txt
fi
