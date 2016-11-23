# anssh

`anssh` is a tiny wrapper around ssh that uses your ansible inventory for
autocompletion. Also, it reads your `ansible.cfg` for `ssh_args` in so you
don't have to specify them manually.

## Prerequirements

* `ssh` installed
* `ansible` installed
* `ssh` installed
* custom inventories must be located in `./hosts/` in order to be found by thu completion function

## Installation

* Place `anssh` in your `$PATH`
* Place `_anssh` in your `$fpath`
* Relaunch your terminal

## Run

Change into your ansible directory (where you wourld run `ansible`) and run

```
anssh [-i INVENTORY_FILE] HOSTNAME
```
