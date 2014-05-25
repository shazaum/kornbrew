Kornbrew
=========

Run & play missing package manager for POSIX compatible systems

In which use cases I could use Kornbrew?
----------------------------------------

I did Kornbrew to suply my needs about installing 3r party software as simple user at:
- Cluster environment
- Remote shell accounts
- When I need some specific version or the latest version of some software.
- College's students lab. They could install whatever wants, and the machine keeps always as brand new instalation.
- Don't need to use root in a desktop or workstation(With or without X).


How to install
--------------

Run the installer in your system:

###OpenBSD

`ftp -o - https://raw.githubusercontent.com/TeeBSD/kornbrew/master/installer | perl`

###Linux
`wget -O - https://raw.githubusercontent.com/TeeBSD/kornbrew/master/installer | perl`


Warning
-------

You need to logoff and log in to finish the instalation. Sorry about that... ;)


First steps
-----------

###Some commands

To list or search *available* formulas:

`brew search` or `brew search <string | regex>`

To list or search *installed* formulas:

`brew list` or `brew list <string | regex>`

To *install* some package:

`brew install <string>`

To *uninstall* some package:

`brew uninstall <string>`

To *clean* broken symlinks after *uninstall* command:

`brew doctor`
