<!-- @format -->

[![hex.pm version](https://img.shields.io/hexpm/v/ltsv.svg)](https://hex.pm/packages/poke_make)
[![CI](https://github.com/tashirosota/poke_make/actions/workflows/ci.yml/badge.svg)](https://github.com/tashirosota/poke_make/actions/workflows/ci.yml)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/tashirosota/poke_make)

# PokeMake

**A feature rich Command line tool written in Elixir to decorate your make commands with Pokémons.**

![demo](https://user-images.githubusercontent.com/33741858/150304582-60997dd7-83ee-444c-afe9-ad315d1b38e7.gif)

## Installation

> Homebrew

```
$ brew install tashirosota/homebrew-tap/poke_make
```

> escript

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
hello # call make hello with pokemon
```

### Bugs and Feature requests

Feel free to open an issues or a PR to contribute to the project. 


