---
layout: post
title: "Old year's solutions"
date: 2018-01-03 23:48
categories: life
excerpt: "Happy holidays, everyone!"
---

I'm done with all the college applications, almost all important exams and, most important, the year. It was fun being around and, although a decent chunk of work was put into CYA-only documents, that was somehow fun too. I got a new laptop (!), a startup (!!) and a bicycle wheel's metal parts (<b>!!</b>), all for $15.

Now, it wasn't all that willy-nilly, but you wouldn't want to sit and read the bad parts (neither do I want to write), so I'll try to keep it as power-user-friendly as possible.

## Embrace the UNIX philosophy when working

Everything must do one thing and it must do that thing well. This shouldn't be applied as-is to humans, but the essence is still the same:

 * focus on one task and finish it;
 * use what you have learned to finish **that single** task;
 * if need be, learn just enough to complete it as efficiently as possible;
 * after completing it, log everything you may need and forget it.

This includes any and all tasks: to make this just a bit more meta, adopt a separate system to manage them. Methinks GTD (["Getting Things Done"] by David Allen) is enough and I'll have to practice it a little more. Anyway, bookmark the Wikipedia page and put it somewhere visible (add a MOTD, perhaps?); you can give it a skim every now and then. That's  what I've done for the past four months or so.  Remember, you are trying to build a habit on which most of your professional life will depend on, so you **will** have to invest time and effort. To ease switching between two tabs, I'm putting a condensed version of the condensed version of Allen's ideas here.

> Follow the 5 GTD workflow stages: capture (information and details about the task), clarify/process (what *you* have to do to complete), organize (the steps needed to complete it), plan (on how to do it), and engage([do it]).
> Keep it as simple as possible. It's the only case you will want to have a horrible hack as a solution.
> Do not overengineer. Go to the first character of this line and reread. This was the hardest for me.
> Think big. Find out what you want to do in life, then, as you go down in scale, figure out what to eat for breakfast.
> Having a clear goal in mind helps, no matter how stupid it may be.

Get `taskwarrior` or `todotxt`, `rofi`, bake some bash magic and that part is done. I have a [similar script] in my dotfiles repo, but it needs fixing and some standardization. As of now, it's compatible with neither tool. Anyone rewriting it, please make a PR. :heart:


## Make the terminal your home and the keyboard your slippers

This includes loving plain text files, which belongs to the previous part, but I'm more concerned with leaving the keyboard to use a pointer (any kind of mouse, basically: trackpads, pressure thingies I don't know the name of, balls, mice, you name it), unless the keyboard *is* the pointer.

Find out how to befriend `tmux` and use a consistent set of keybindings. Although my current window manager is [i3], tmux remains a valuable tool, especially when paired with a bottom-flush terminal window. I personally use Vim as my text editor, so anything with a modal approach and vi-like keybindings is a plus for me. I don't think vi-mode command editing is worth it, though. If you prefer doing finger gymnastics by the Emacs rules, go ahead. Just stay consistent. Leaving navigation to your subconscious means making as few major muscle movements, so look up how to be lazier.

The point above also means that text files and directory structures are the best organizational tools, but remember that the best tools are the most used ones, whatever happens. If you don't have to share your todo-s or need interoperability, you can't force other people to change. If you have to share, use what everyone else is using.

## Remove ALL THE THINGS

Ok, this sounds like it is about minimalism and many won't like it, but seriously, if something doesn't integrate well with what you have and what you need, it's probably not worth the RAM it might take. Somehow I managed to go from wiggling windows around (good old Compiz always has a place in my childish heart) and fiddling with  **T H I C C** GNOME bars, to a barebones setup with only 10 core executables. A VCS can manage versions of things and those things can be virtually anything: my dotfiles, my passwords, my website and more are stored in git repos. I have a home cloud that needs no Nextcloud, just some decade-old software. Find how you can confuse yourself less when switching programs and doing daily tasks. For me, at least, window management and bloat have made sitting in front of a computer not fun, but this doesn't align with my fun times of yore, so I've removed those tasks.

["Getting Things Done"]: https://en.wikipedia.org/Getting_Things_Done
[do it]: http://listenonrepeat.com/?v=lCscYsICvoA#Palpatine_Do_It_(10_Hour_Loop)
[similar script]: https://github.com/alter2000/.dots/tree/master/bin/dofi
[i3]: https://i3wm.org
