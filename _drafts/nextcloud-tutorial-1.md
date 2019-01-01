---
layout: single
title: Nextcloud - server setup
date: 2017-09-10 17:00
categories: tutorials
excerpt: Step by step clickthrough
---

Here's the first part of the tutorial. Since many people I've recommended
a self-hosted server to seem to be afraid of messing something up, here it is.
I'm not quite proud of the screen-by-screen nature, but it's the easiest way to
follow. There's a small paragraph explaining what is going on in each
screenshot, including links for further reading (you wouldn't want to trust me
with my explanations only). Remember, whatever happens, Google is more than
your friend.

I am doing this inside a virtual machine, since screenshots are impossible
during the default server install.

You'll need some portable storage media (a USB stick or a CD/DVD) and an old
computer. I have set this up on my old laptop, an HP/Compaq abomination with
3GB RAM and a Centrino Duo (32 bit; keep your computer's architecture type in
mind, since you'll need to recall it later). Depending on what you're going to
use it for, you may also need a decent-sized HDD or a SATA HDD tray to replace
the CD/DVD tray, or some other way to add more storage.

1.  Grab an ISO of your distro of choice. Here I'm using Ubuntu 16.04 since it
    gets the job done well enough for me, not to mention all the documentation
    and community support. Arch has a prepared package just for that, Ubuntu
    has a snap, etc. Just remember to download the ISO made for your
    architecture. We are going to do this the hard way not because we can, but
    because I am a masochist. Oh, and Sia support, too. Definitely that last
    one.

2.  Burn the ~~witch~~ ISO onto something and boot the computer off of it. Now
    is the time to consult our dear friend Google, which will tell us how to
    burn an ISO on Windows, or use some random UNIX clone and run `dd`:

```shell
# dd if=/path/to/iso of=/live/media/device/path
```

How to find those paths, you say? The first one is where you saved the ISO,
while the second one is not the path in which the media is mounted, but the
path with its device file (remember, in UNIX, *everything* is a file). After
consulting with our good friend, I found [Etcher] to be a pretty good
alternative that also works on Windows.

Run `lsblk` (*list block devices*) before and after inserting your media.  The
added file (say, `/dev/sdb` with `/dev/sdbX`, where X is one or more numbers,
below it) is the device file and its respective partition files.  `dd` doesn't
give any output, so just be patient and hope you have typed the command
correctly, since if you write on your main hard drive, you'll have to start
over and fix your now-no-longer-working device.

```shell
$ lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0   477G  0 disk
├─sda1   8:1    0   261M  0 part /boot
├─sda2   8:2    0  76.8G  0 part /
├─sda3   8:3    0 380.7G  0 part /home
└─sda4   8:4    0  17.2G  0 part [SWAP]
```

3.  After burning, boot the server-to-be from that media. It will prompt you
    for the language to use during installation, system locale and time zone.
    Remember, no mouse. Choose whatever you want and get going. I can't help
    with the "boot from other media" part, since it's often device-specific

4.  Set the keyboard layout, either with the list input option or with the
    installer's help. Most keyboards have a US layout or similar. I picked UK
    English since that's what I have on my laptop. This won't be needed later
    on after we set up SSH, since the server will probably remain tucked away
    in some dark, cold corner of the house with no keyboard or screen.

5.  Input a (preferably descriptive) hostname of your choice. After all, this
    server will not serve any content to the Internet. Even if it will, we can
    just change it. Create the first user and set up its home directory.
    Encryption isn't necessary, since the server will not be physically moved
    anywhere and will stay at home. If you feel like you need it, go ahead and
    encrypt the /home directory, but it will not add much (if any) protection
    from malicious software, not to mention the resources dedicated to
    encryption and decryption, which are quite valuable in a machine still
    alive from 2006.

6.  Set up the device partitions. For now we'll use plain LVM with a single
    device, without any bells and whistles. [The Linux Documentation Project]
    has a nice, beginner-friendly explanation on what LVM is and does, together
    with the [Ubuntu] and [CentOS] guides.



[Etcher]: https://etcher.io
[The Linux Documentation Project]: http://www.tldp.org/HOWTO/LVM-HOWTO/whatisvolman.html
[Ubuntu]: https://wiki.ubuntu.com/Lvm
[CentOS]: https://www.centos.org/docs/5/html/5.1/Deployment_Guide/s1-lvm-intro-whatis.html
