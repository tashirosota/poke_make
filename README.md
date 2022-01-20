<!-- @format -->

[![hex.pm version](https://img.shields.io/hexpm/v/ltsv.svg)](https://hex.pm/packages/poke_make)
[![CI](https://github.com/tashirosota/poke_make/actions/workflows/ci.yml/badge.svg)](https://github.com/tashirosota/poke_make/actions/workflows/ci.yml)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/tashirosota/poke_make)

# PokeMake

**Command line tool to decorate your make commands with Magic Circle made by Elixir**

![demo](https://user-images.githubusercontent.com/33741858/147806471-13b68d26-21e7-4e05-b831-45bfad37e277.gif)

## Installation

- Homebrew

```
$ brew install tashirosota/homebrew-tap/poke_make
```

- escript

```
$ mix escript.install hex poke_make
$ export PATH=$PATH:~/.mix/escripts
```

## Usage

```
$ poke -h
usage: poke [version | -v | --version]
           [help | -h | --help]
           <make command>

poke <make command> is to start make <make command>
$ cat Makefile
hello:
	echo hello
$ poke hello

=====================================================================================
                          ※              ※          ※※   ※※
                          ※              ※           ※    ※
                ※※ ※  ※※※ ※  ※  ※※       ※※※   ※※    ※    ※   ※※
                ※ ※ ※※  ※ ※※※  ※ ※※      ※  ※ ※ ※※   ※    ※  ※  ※
                ※ ※ ※※  ※ ※  ※ ※※        ※  ※ ※※     ※    ※  ※  ※
                ※ ※ ※ ※※※ ※  ※  ※※       ※  ※  ※※   ※※※  ※※※  ※※
=====================================================================================
hello # call make hello with circle art
```

## Bugs and Feature Requests

We welcome Bugs and Feature Requests. Feel free to send us an issue or PR.
