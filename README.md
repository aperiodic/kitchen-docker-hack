# WTF Is This?

The only point of this repo is to host a small shell script that's used as the
kitchen-salt bootscript script in [Carcetti][carcetti]. The script runs `sudo
apt-get update` and then downloads and runs [the real kitchen-salt bootstrap
script][kitchen-salt-bootstrap].

[carcetti]: https://stash.d.cylance.com/projects/DI/repos/carcetti/browse?at=develop
[kitchen-salt-bootstrap]: https://raw.githubusercontent.com/saltstack/kitchen-salt/master/assets/install.sh

# Why?

The apt URLs are effectively frozen in the docker container at container build
time. Eventually they will become out of date, preventing things from being
installed in the container until they're updated. This prevents users from doing
any testing of Carcetti until they manually take this step in each container
instance they're trying to test.

One solution to this is to rebuild the container to update the apt URLs;
however, that is an expensive process, and there's no a-priori interval for
rebuilding the container that would guarantee that we can install the things we
need in the container (because the URLs could be updated immediately after the
container is built).

Another solution is to simply update apt before trying to install anything with
it. This is pretty standard practice, but the kitchen-salt bootstrap script
leaves that up to the user. That's why I've created this dumb repo with this
dumb script to do just that before handing off to the real bootstrip script.

# I Have a Better Idea!

Great, I'm all ears! Please share it in the Data Engineering HipChat room.
