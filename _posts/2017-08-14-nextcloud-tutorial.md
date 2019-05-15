---
title: Nextcloud - what is it?
date: 2017-08-14 16:14
categories: tutorials
excerpt: The introduction of a series on the FOSS self-hosted cloud alternative
---

The why
---

I've been frowned upon one too many times when suggesting other means of file
storage besides WhatsApp (or whatever the correct capitalization is) group
chats and USB drives floating around. For some reason, most of my classmates
are fine with using a chat platform as cloud storage and nobody would even
spend less than ten minutes creating a new Google account strictly for communal
use. Personally, I'm fine with the current situation too: spam stays only on my
phone and I get to manually delete the whole folder after backing up only what
**I** need.

Yes, this is selfish.

Yes, I am indifferent to their problems and I couldn't care less.

Everybody knows I'm an egotistic spawn of Satan that is ~~cursed~~ blessed by
him to cure everyone's MS Office maladies. I actually like this status quo,
even though it allows people to just dismiss me with my "technobabble" (*Open
the installer, click "Next" 5 times and reboot*)

Although I've definitely recommended Google Drive and Dropbox more than once as
a cloud storage provider, I've done so to people with the technological literacy
of a 6 year old, and I can prove that a 6 year old can log into an Ubuntu
session, start their favorite game, open local and Youtube videos and update
their computer. Fortunately, I have successfully managed to show some of the
latter the ethical issues with third-party providers (even Nextcloud-based
providers; in the end you are giving your data away in good faith that the
company will actually follow the agreement and there is no way to prove it).

With enough spare time I decided to make a series on how to get a Nextcloud
server up and running on an old computer with no fancy setups (one HDD, one
partition and a swapfile, running Ubuntu Server) and explain every step. After
all, this is made for absolute beginners who have only seen a CLI on TV.

What is Nextcloud?
---

From [Wikipedia](https://en.wikipedia.org/wiki/Nextcloud):

> Nextcloud is a suite of client-server software for creating and using file
  hosting services. It is functionally similar to Dropbox, although Nextcloud
  is free and open-source, allowing anyone to install and operate it on
  a private server. In contrast to proprietary services like Dropbox, the open
  architecture allows adding additional functionality to the server in form of
  applications.

And before you ask,

> Nextcloud is an actively maintained fork of ownCloud.

I hope that clears out a bit of confusion.  
What are the benefits of it over, say, GDrive?  
First of all, **you** own the hardware, the data *and* the software.  
And what's the fuss about having all those things?  
As I said in the last post, the four freedoms.  

Here in Albania, though, uptime (the amount of time the server is up - running
and doing its job) is a problem, mainly because of the costly, yet patchy
electric supply and high bandwidth prices. As for hardware prices, I'm not
sure, but I know that buying a new server is more expensive per unit than
buying a datacenter's worth. Personally, peace of mind is more expensive than
both. The rest is mainly technical issues that can be overcome by pressing the
right buttons.

I am not making this tutorial about OwnCloud, mainly because of two reasons:
Nextcloud is fully free, together with the core extensions, and OwnCloud has no
Sia integration (we'll get to this later) as for now.
