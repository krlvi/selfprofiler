# SelfProfiler

SelfProfiler is a script that samples the currently active window, streaming [Trace Event Format](https://docs.google.com/document/d/1CvAClvFfyA5R-PhYUmn5OOQtYMH4h6I0nSsKchNAySU/preview) events containing the frontmost application name and window title to standard out.

If the output is piped into a file it can be read by the Google Chrome [Trace Event Profiling Tool](https://www.chromium.org/developers/how-tos/trace-event-profiling-tool).

Currently only OSX is supported via the Accessability APIs.

## Usage
The terminal will require access to OSX Accessability, which is enabled via `System Preferences -> Security & Privacy -> Privacy -> Accessibility` where you can add the terminal emulator that you use.

`./selfprofiler.sh > prof.json`

In Google Chrome navigate to `about://tracing` and load `prof.json`

## Example
Here is an example [profiling output](./example/prof.json?raw=true) which when loaded in Google Chrome's Trace Event Profiling Tool looks as follows:

![Trace Event Profiling Tool Screenshot](./example/screenshot.png?raw=true)

## Contributing
Pull requests are welcome :)

## License

Copyright © 2019 Kiril Videlov

Distributed under the Eclipse Public License.
