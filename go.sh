#! /usr/bin/env bash

# Golang Docker image name.
GO_IMAGE=golang

os=""
arch=""

function print_usage {
  echo 'Usage: godocker <go sub-commands>'
  echo 'Run this script under the "go root" folder, which contains sub-folders "src", "pkg", and "bin".'
  echo 'Example:'
  echo '1) Build src/main.go:'
  echo 'godocker install main'
}

# Changes the values of "os" and "arch".
function checked_detect_os_and_arch {
  case $(uname) in
    "Darwin")
      os="darwin"
      ;;
    "Linux")
      os="linux"
      ;;
    "Windows"|*"_NT"*)
      os="windows"
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

checked_detect_os_and_arch
docker run --rm -v "$PWD":/go/ -w /go/ -e GOOS="$os" -e GOARCH="$arch" golang go "$@"
