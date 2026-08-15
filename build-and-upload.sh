#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="${1:-$PWD}"

if [[ "$PROJECT_DIR" != /* ]]; then
  PROJECT_DIR="$PWD/$PROJECT_DIR"
fi

# Example usage:
#   ARDUINO_PATH=/dev/cu.usbmodemXXXX ./build-and-upload.sh
#   ./build-and-upload.sh
#   cd ~/arduino/BasicLightControl && ../build-and-upload.sh
#   ./build-and-upload.sh ./MyOtherProject
#   ./build-and-upload.sh /absolute/path/to/project

ARDUINO_PATH="${ARDUINO_PATH:-}"
FQBN="arduino:renesas_uno:unor4wifi"

if [[ -z "$ARDUINO_PATH" ]]; then
  echo "ARDUINO_PATH is not set."
  echo "Example: export ARDUINO_PATH=/dev/cu.usbmodemXXXX"
  echo "Then run: ./build-and-upload.sh [project_path]"
  exit 1
fi

if ! find "$PROJECT_DIR" -maxdepth 1 -type f -name '*.ino' | grep -q .; then
  echo "No Arduino sketch found in: $PROJECT_DIR"
  echo "Pass a project directory like: ./build-and-upload.sh ./BasicLightControl"
  exit 1
fi

cd "$PROJECT_DIR"
arduino-cli compile --fqbn "$FQBN" .
arduino-cli upload -p "$ARDUINO_PATH" --fqbn "$FQBN" .

echo "Compile and upload complete for $PROJECT_DIR."
