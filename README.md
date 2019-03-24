# SelfProfiler

SelfProfiler is a script that samples the currently active window, streaming [Trace Event Format](https://docs.google.com/document/d/1CvAClvFfyA5R-PhYUmn5OOQtYMH4h6I0nSsKchNAySU/preview) events containing the frontmost application name and window title to standard out.

If the output is piped into a file it can be read by the Google Chrome [Trace Event Profiling Tool](https://www.chromium.org/developers/how-tos/trace-event-profiling-tool).

Currently only OSX is supported via the Accessability APIs.

## Usage
The terminal will require access to OSX Accessability, which is enabled via `System Preferences -> Security & Privacy -> Privacy -> Accessibility` where you can add the terminal emulator that you use.

```sh
$ ./selfprofiler.sh > prof.json
```

In Google Chrome navigate to `about://tracing` and load `prof.json`.

## Installation
If you would like to install SelfProfiler globally so that you can run it in any directory, you can use `install.sh`.

```sh
$ ./install.sh
```

Please restart your terminal or source your environment file after installation is successful.

Now you can run SelfProfiler in any directory.

```sh
$ selfprofiler > prof.json
```

Notes:
- Please make sure `/usr/local/bin` is included in your environment path.

- If you get `permission denied` error message while running `install.sh`, make sure it is executable. You can use the following command to make it executable. _(`sudo` might be required)_

  ```sh
  $ chmod +x ./install.sh
  ```

## Example
Here is an example [profiling output](./example/prof.json?raw=true) which when loaded in Google Chrome's Trace Event Profiling Tool looks as follows:

![Trace Event Profiling Tool Screenshot](./example/screenshot.png?raw=true)

## Contributing
Pull requests are welcome :)

## License

Copyright © 2019 Kiril Videlov

Distributed under the Eclipse Public License.
