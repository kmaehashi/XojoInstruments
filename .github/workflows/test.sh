#!/bin/bash

set -uex

if [[ "${DISPLAY:-}" = "" ]]; then
    source /headless
fi

# Start Xojo.
rm -vf /opt/xojo/xojo/Plugins/*.xojo_plugin
# Workaround the issue by setting LIBGL_ALWAYS_INDIRECT:
# : CommandLine Error: Option 'x86-use-base-pointer' registered more than once!
# LLVM ERROR: inconsistency in registered CommandLine options
LIBGL_ALWAYS_INDIRECT=1 /opt/xojo/xojo2022r1.1/Xojo &

# Setup xojo-tools.
pip install git+https://github.com/kmaehashi/xojo-tools

# Build with the unittest mode.
# N.B. The first `--receive` is to capture IDE Version Mismatch.
PROJECT_PATH="$(realpath "DesktopApp/XojoInstruments.xojo_project")"
xojo-ide-communicator --debug --timeout 120 --wait \
    --command "OpenFile(\"${PROJECT_PATH}\")" \
    --receive \
    --command 'ConstantValue("App.UNITTEST") = "True"' \
    --command 'DoCommand("RunPaused")' \
    --command 'Print("Debug build done!")' \
    --receive

# Run the app.
DesktopApp/DebugXojoInstruments/DebugXojoInstruments
