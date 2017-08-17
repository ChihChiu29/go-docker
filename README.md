# go-docker
Make it easier to use Go over Docker.

# Usage
Run the `gobuild.sh` script from your go `src` folder as:

```
gobuild.sh <relative_path_to_main_package>
```

For example, if there is a `src/main/main.go` file with a `main` function, run:

```
gobuild.sh main
```

The generated executable is `executable.run` under the `src` folder. OS and architecture are auto-detected.
