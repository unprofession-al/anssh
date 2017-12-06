# anssh

`anssh` is a tiny wrapper around ssh that uses your ansible inventory for
autocompletion. Also, it reads your `ssh_args` from `ansible.cfg` so you
don't have to specify them manually.

[![asciicast](https://asciinema.org/a/goPw7w6l8qCFPLXmEjxZEKCHL.png)](https://asciinema.org/a/goPw7w6l8qCFPLXmEjxZEKCHL)

## Prerequirements

* `zsh` installed
* `ssh` installed
* `sed` and `awk` installed

## Installation

* Place `anssh` in your `$PATH`
* Place `_anssh` in your `$fpath`
* Relaunch your terminal

## Run

Change into your ansible directory (where you would run `ansible`) and run

```
anssh [-i INVENTORY_FILE] HOSTNAME
```
