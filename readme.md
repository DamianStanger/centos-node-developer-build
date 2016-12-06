This is intended to be a script that you can run with the absolute bare minimal of knowledge of how vagrant, centos and linux works. It will give you a base CentOS 7 install based on the minimal box as provided by puppetlabs/centos-7.2-64-puppet.

Install Instructions
1. Install vagrant (##URL##)

2. Clone this repo (git clone https://github.com/DamianStanger/centos-node-developer-build.git)

3. Set your own user and passwords in the config.json 
3a. NOTE: if you change the user names of vagrant and root the script might not work as intended. make sure you know what you are doing.

4. Run 'vagrant up' from the command line inside the root folder of the cloned repo

5. Let it run
5a. The scripts will firstly clone this repo into the vm so that the VM has access to all these files internally. It is done this way rather than a shared folder to ensure the files have the correct unix style line endings and so that the machine can be updated later without using vagrant up (and therefore without the vagrant shared folders).
5b. Each script in the scripts folder is then run, these:
* Install the MATE desktop
* Install developer tools
* Install node and NVM
* Install Mongo and mongo related tools
* Create users and set passwords
* Install auxillary tools and packages

6. The scripts should now running VM into the MATE desktop

7. You are done - Rerady for node developemnt?
guides for using linux
guides for node
guides for npm


Changing the default image
To change the default image you can do your changes to the scripts, check them in (this is important as scripts are not shared through the file shares but through git clone and pull), then whilst the VM is running excecute 'vagrant provision' this will cause the VM to re-clone the scripts and rerun them inside the VM. 
NOTE: if a change is made to the vagrantfile you will need to 'git pull' on your host so that the vagrant provisioning uses the correct new vagrant config, any other change to the .sh files only afects the guest VM.  


Distributing to other devs
To run the final resulting VM other folks need not have vagrant installed themselves all they need is the .vbox and .vmdk files (mine are called development-build_default_1480950561529_78522.vbox and packer-centos-7.2-x86_64-virtualbox-vagrant-puppet-1457544893-disk1.vmdk which live inside the folder C:\VirtualBoxVMs\development-build_default_1480950561529_78522 but the default for virtual box is C:\Users\<<username>>\VirtualBox VMs). 
Just double click the .vbox file and its running inside virtual box. NOTE: This wont be exactly the same as vagrant up (example: the vagrant shared folders will not be present)


Installing changes in the scripts on a deployed VM hosted in virtualbox rather than vagrant.
You can also do updates to a live running VM by logging in as root (or use su). Navigating to '/root/Code/development-build' and running the command 'sh setup-for-dev.sh'. This should do the same as if it was run through vagrant itself. NOTE: if you were to run vagrant-up.sh instead you would also reboot the VM, which is probably not what you want to happen.


Gotchas
Ensure that you check in unix style line endings if editing on a windows system. This applies if you send scripts into the VM using vagrant or if you are sharing scripts through the vagrant default share. The scripts as provided in this repo do not do this but just FYI if you change it, beware.