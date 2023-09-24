---
layout: post
title:  "Leg Tracking with Daydream Controller"
date:   2023-09-23 04:31:00 +0800
categories: Devlog
tags: vr daydream slimevr
---

Many months ago, when Mark of Meta/Facebook faked his "Feet tracking", i got an idea. Why not use the Google Daydream controllers (killed by google) for additional tracking?

Scouring though many VR related discord, it seems that no one had done it yet (for a good reason). 

tldr. the repo is here: [DaydreamOwo](https://github.com/isieo/DaydreamOwo)

## Development / R&D

My Vr games are all in my windows machine so, i am focus in making this script work on windows only.

First thing i did was to search how to retrieve data from the Daydream controller, it led me to this Projedt: [Daydream-controller.js](https://mrdoob.github.io/daydream-controller.js/)

![Daydream-controller.js](/images/20230923/daydream-controller.jpg)

Thanks to MrDoob's work it literally cut my development time in half.

In the past i had created a very simple heart rate tracking using the [Web Bluetooth API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Bluetooth_API), it was painless, quick and easy.
It should be the same with NodeJs right? WRONG!

Searching Npm for for a working bluetooth ble package gave me PTSD, getting a package for my linux machine is easy but for windows.. its harder than building your own library (i should have just done that and contribute to the great spiderweb of depency hell :P)

In the end, i found one that worked: [NobelWrt](https://www.npmjs.com/package/noble-winrt)

## DaydreamOwo

Here it is in all its scuffyness [DaydreamOwo](https://github.com/isieo/DaydreamOwo).

To start using, you will need to run scan.bat, this will show the Daydream's bluetooth ID, take note of it.

Next you will need to place the detected ids into daydream_start.js like this:

![Add the tracker id](/images/20230923/config.jpg)

If you have multiple daydream controllers, enter your computer's Network IP in the slimeAddress variable

Turn on your daydream controllers, Launch SlimeVr then run start.bat and you should see the trackers being detected.

![SlimeVr](/images/20230923/slimevr.jpg)

Now you get to use your Daydream controller as a tracker!

Github: [DaydreamOwo](https://github.com/isieo/DaydreamOwo)

I made this as a proof of concept, the code is literal rats' nest, use at your own risk
(as far as i know there are actually people using this lol)

I do not actually use this myself anymore as i have other means for full body tracking.
