#!/bin/bash

set -e

echo hello
echo $FOO > /home/vscode/FOO || true
cat /usr/local/secrets/bar > /home/vscode/BAR || true
