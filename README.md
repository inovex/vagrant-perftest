## readme

this repo contains a simple vagrant test setup to reproduce and measure the "grunt watch" performance penalty with several     shared filesystems. For more details read XXX_blogpost_URL_XXX 

### usage: vboxfs and nfs

**on your host**

```
install git, vagrant, node, npm, perl

git clone XXX_github_URL_XXX
cd XXX_reponame_XXX/grunt-project

npm install -g grunt-cli
npm install grunt --save-dev
npm install grunt-contrib-watch --save-dev
vagrant up

# now get "grunt watch" up-and-running in vagrant, see below

# enjoy the show. NFS is slow. Really slow. Annoying, isn't it?
perl -e 'use Time::HiRes qw(time); print time . "\n"'; touch src/helloworld.html

```

**in vagrant**

```
# open 3 shells and cd to
cd ~/grunt-project-vboxfs
cd ~/grunt-project-nfs
cd ~/grunt-project-nfs-tuned

# in all 3 shells do
grunt watch
```

### usage: smb

**on your host**

```
install git, vagrant, node, npm, perl

git clone XXX_github_URL_XXX
cd XXX_reponame_XXX/grunt-project

npm install -g grunt-cli
npm install grunt --save-dev
npm install grunt-contrib-watch --save-dev

vagrant up

mkdir /Volumes/vagrant 
mount_smbfs //vagrant:vagrant@192.168.99.99/vagrant /Volumes/vagrant

# now get "grunt watch" up-and-running in vagrant (see below)

# enjoy the show. In this case SMB is way faster then NFS
cd /Volumes/vagrant/local-copy/grunt-project
perl -e 'use Time::HiRes qw(time); print time . "\n"'; touch src/helloworld.html

```

**in vagrant**

```
mkdir ~/local-copy
cp -r ~/vagrant-perftest/grunt-project ~/local-copy
cd ~/local-copy/grunt-project

sudo npm install -g grunt-cli
sudo npm install grunt --save-dev
sudo npm install grunt-contrib-watch --save-dev

grunt watch
```