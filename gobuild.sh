#! /usr/bin/env bash

# Golang Docker image name.
GO_IMAGE=golang

os=""
arch=""

function print_usage {
  echo "Usage: gobuild <package_path>"
  echo "Run this script under the src folder. The generated executable is executable.run under src folder."
}

function checked_detect_os_and_arch {
  case $(uname) in
    "Darwin")
      os="darwin"
      ;;
    "Linux")
      os="linux"
      ;;
    "Windows")
      os="Windows"
      ;;
  esac

  arch_raw=$(uname -m)
  if [[ "$arch_raw" == *"386"* ]]; then
    arch="386"
  fi
  if [[ "$arch_raw" == *"64"* ]]; then
    arch="amd64"
  fi

  if [[ "$os" == "" || "$arch" == "" ]]; then
    echo "Error: cannot detect OS and/or archtitecture."
    exit -1
  fi
}

if [[ $# -lt 1 ]]; then
  print_usage
  exit -1
fi
package_path=$1

checked_detect_os_and_arch
docker run --rm -v "$PWD":/go/src/ -w /go/src/ -e GOOS="$os" -e GOARCH="$arch" golang go build -v -o executable.run "$package_path"
