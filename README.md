# CONTEXT

## What

A text-based game for MS-DOS computers with CGA graphics (16-color text mode).
Gameplay TBD, but it'll probably be a roguelike.

Some vague goals:

- Work even on extremely old and extremely shitty MS-DOS computers.
- Keep it as a COM file. Working with MZ EXEs looks like a pain.
- At least the executable (and maybe a short readme) should fit on a floppy.

## Why

For fun; and to be a documentation as to how to actually do this stuff, since
the DOS hackers are probably getting very old by now :)

## Useful stuff

Note that the offset for the CGA video memory is `B800h`; that's why I set `ds`
as such :)

- [CGA Registers](http://www.oldskool.org/guides/oldonnew/resources/cgatech.txt)
- [CGA Notes](https://www.seasip.info/VintagePC/cga.html)
