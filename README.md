# Arduino Uno R4 Projects

Parent workspace for multiple Arduino UNO R4 WiFi projects. Each project sketch lives in its own folder while shared helper files and VS Code config stay at the parent level.

## Build and Upload Using the Helper Script

From the parent directory, pass the project folder to `build-and-upload.sh`:

```sh
export ARDUINO_PATH=/dev/cu.usbmodemXXXXXXXXXXXX
./build-and-upload.sh ./BasicLightControl
```

Or use any other project folder:

```sh
./build-and-upload.sh ./MyOtherProject
```

You can also omit the project path to default to the current directory:

```sh
cd BasicLightControl
../../build-and-upload.sh
```

Replace `/dev/cu.usbmodemXXXXXXXXXXXX` with your board's actual serial port.

## Manual Compile and Upload

If you prefer to run commands directly:

```sh
cd BasicLightControl
arduino-cli compile --fqbn arduino:renesas_uno:unor4wifi .
# Or with a local build dir
arduino-cli compile --fqbn arduino:renesas_uno:unor4wifi --output-dir ./build .
```

Upload (requires `ARDUINO_PATH` set or port available):

```sh
arduino-cli upload -p /dev/cu.usbmodemXXXXXXXXXXXX --fqbn arduino:renesas_uno:unor4wifi .
```

## Install the core if needed
```sh
arduino-cli core update-index
arduino-cli core install arduino:renesas_uno
```

## Common quick checks
```sh
arduino-cli board list
arduino-cli config dump
```
