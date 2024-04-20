# bundesliga

**bundesliga** - Fussball Bundesliga current matchday and standings.

## Introduction

bundesliga is a command line tool to display the current matchday and standings
records of the German professional football leagues. The information is
gathered from the [OpenLigaDB](https://www.openligadb.de/) API.

## Installation

    $ rake install

## Usage

For usage of the bundesliga command line tool, please see following help
output.

    Usage:
        bundesliga [OPTIONS] SUBCOMMAND [ARG] ...

    Parameters:
        SUBCOMMAND                 subcommand
        [ARG] ...                  subcommand arguments

    Subcommands:
        matchday                   show current matchday
        standings                  show current standings

    Options:
        -a, --available-leagues    show available leagues
        -h, --help                 print help
        -m, --man                  show manpage
        -v, --version              show version

## License

[MIT License](https://spdx.org/licenses/MIT.html).

## Is it any good?

[Yes](https://news.ycombinator.com/item?id=3067434).
