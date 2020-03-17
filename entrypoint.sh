#!/bin/bash
set -e

/bin/graphql-engine serve & /usr/local/bin/caddy
