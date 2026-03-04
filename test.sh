#!/bin/bash

set -e

echo $FOO > /home/vscode/FOO || true
cat /usr/local/secrets/bar > /home/vscode/BAR || true
echo "all done"
