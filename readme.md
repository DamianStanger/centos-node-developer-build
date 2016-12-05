This is intended to be a script that you can run with the absolute minimal of knowledge of how vagrant, centos and linux works. It will give you a base CentOS 7 install based on the minimal box as provided by puppetlabs/centos-7.2-64-puppet.

Install Instructions
1. install vagrant (##URL##)

2. clone this repo (git clone ##URL##)

3. set your own passwords in vagrantFile and users.sh (need to change this to read from a config file to make it easier to change passwords)

4. run 'vagrant up' from the command line inside the root folder of the cloned repo

5. let it run

6. shutdown the virtual box console

7. run 'vagrant up' again to boot into the window system (can we make the scripts do this?)

8. You are done
guides for using linux


Changing the default image
To change the default image you can do your changes to the scripts, check them in and whilst the VM is running excecute 'vagrant provision' this will cause the VM to re clone the scripts and rerun them inside the VM. 
NOTE if a change is made to the vagrantfile you will need to 'git pull' on your host so that the provisioning uses the correct new vagrant config. any other change to the .sh files only afects the guest VM.  

Distributing to other devs
They needent have vagrant installed all they need is the .vbox and .vmdk files (mine are called development-build_default_1480950561529_78522.vbox and packer-centos-7.2-x86_64-virtualbox-vagrant-puppet-1457544893-disk1.vmdk inside the folder C:\VirtualBoxVMs\development-build_default_1480950561529_78522 but the default for virtual box is C:\Users\<<username>>\VirtualBox VMs) 
just double click the .vbox file and its running inside virtual box
note this wont be exactly the same as vagrant up (example: the vagrant shared folders will not be present)


Running changes on a deployed VM
You can also do updates to a live running VM by logging in as root (or use su) then navigating to '/root/Code/development-build' and running the vagrant-up.sh by hand. this should do the same as if it was run through vagrant itself.
(Need to add a git pull to the vagrant-up.sh so this works correctly)


Gotchas
ensure that you check in unix style line endings if editing on a windows system. This applies if you are editing the vagrantfile to send in scripts or you are sharing scripts through the vagrant default share. These scripts provided do not do this but if you change it do beware.
