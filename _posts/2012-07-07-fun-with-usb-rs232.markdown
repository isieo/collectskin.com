---
layout: post
title:  "Fun with USB RS232"
date:   2023-09-21 01:07:33 +0800
categories: diy electronics
---

Yes, I am alive—pirated butter fish didn’t kill me.

Recently, in my great pile of E-Junk, I found a USB to RS232 converter that wasn’t in use. I decided to do something with it. With a little bit of reading, I made this:

Initially, I hooked up the motor to the TXD and GND pins of the RS232 port and hoped that it worked—it didn’t. It turns out that it doesn’t have enough current to drive the motor (it lit up LEDs though, I didn’t mess around with LEDs much as my LEDs might die from it :/). I figured I need some sort of external power supply; this is where the N-MOSFET comes in.

Anyways, this is what you need to make your own:
- RS232 Port (USB one will do)
- Bread Board
- Jumper Cables for Bread Boards
- Batteries
- N-Channel Mosfet (You can salvage this from an old radio or something)
- Battery Powered device

### Circuit Diagram
Assemble your board according to the diagram.

You can then connect the positive and negative cables to any battery powered device you have lying around (I happened to have a spare propeller). For the battery, I used a standard 9v battery.

Mine turned out like this:

## Connecting to RS232 Port
Connect the Gate pin of the MOSFET to the RS232’s TXD and Connecting GND pin to the source pin.

## On the computer…
All you need to do now is to send something to the port.

In *nix based systems (Linux, Mac, etc):
```bash
$ echo 1 > /dev/tty(WHATEVER)
```

```
C:\> echo 1 > COM(WHATEVER)
```

Notice that the more data you send to the port, the longer your powered device stays powered up. To keep your device powered for a longer time, you might want to write a script to loop through it.

Here’s an idea: Hook this up with Twitter and a battery powered Nerf gun, and every time someone mentions you on Twitter, your Nerf gun will fire!