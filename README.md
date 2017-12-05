# anssh

`anssh` is a tiny wrapper around ssh that uses your ansible inventory for
autocompletion. Also, it reads your `ansible.cfg` for `ssh_args` in so you
don't have to specify them manually.

<script type="text/javascript" src="https://asciinema.org/a/goPw7w6l8qCFPLXmEjxZEKCHL.js" id="asciicast-goPw7w6l8qCFPLXmEjxZEKCHL" async></script>

## Prerequirements

* `zsh` installed
* `ssh` installed
* `awk` installed
* custom inventories must be located in `./hosts/` in order to be found by thu completion function

## Installation

* Place `anssh` in your `$PATH`
* Place `_anssh` in your `$fpath`
* Relaunch your terminal

## Run

Change into your ansible directory (where you would run `ansible`) and run

```
anssh [-i INVENTORY_FILE] HOSTNAME
```
