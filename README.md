# go-docker

Make it easier to use Go from the official golang Docker container.


# Usage

Use the `go.sh` the same way you would use `go` command from your ***go root folder*** (the one contains subfolders `src`, `pkg`, and `bin`).

For example, to build `src/main/main.go` run:

```
go.sh install main
```

The generated executable is under the `bin` folder.


# Caveats

## Auto-detected OS and architecture

The script uses cross-compile feature of go to compile to the native platform. It uses `uname` to guess the OS and architecture. If your OS and architecture is not understood by the script, just add them to the `checked_detect_os_and_arch` function in the script. 
