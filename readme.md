# Purpose
This is intended to be a script that you can run with the absolute bare minimal of knowledge of how vagrant, centos and linux works. It will give you a base CentOS 7 install based on the minimal box as provided by puppetlabs/centos-7.2-64-puppet.

## Install Instructions
1. Prerequisites on the host (im running windows 10)

   * Install VirtualBox - https://www.virtualbox.org/   
   * Install vagrant - https://www.vagrantup.com/
   * Install git - https://git-scm.com/

2. Clone this repo (git clone <https://github.com/DamianStanger/centos-node-developer-build.git>)

3. (Optional) Set your own user and passwords in the config.json 
   * NOTE: Changing the user names of vagrant and root might cause the script to cease working as intended. make sure you know what you are doing!

4. Run 'vagrant up' from the command line inside the root folder of the cloned repo

5. Let it run
   * The scripts will firstly clone this repo into the vm so that the VM has access to all these files internally (cloned into the root user space). It is done this way rather than a shared folder to ensure the files have the correct unix style line endings and so that the machine can be updated later without using vagrant up (and therefore without the vagrant shared folders).
   * Each script in the scripts folder is then run, these:
     * Install the MATE desktop
     * Install developer tools
     * Install node and NVM
     * Install Mongo and mongo related tools
     * Create users and set passwords
     * Install auxillary tools and packages

6. The scripts should now reboot the VM into the MATE desktop

7. The initial run of ```vagrant up``` takes around 20 minutes for me with a pre-downloaded vagrant image of centos 7. Subsequent runs of ```vagrant provision``` takes about 2 minutes. (your milage may vary depending on your internet speed, there is a lot to download) 

8. We are done - Ready for some node developemnt?
   * guides for using linux
   * guides for node
   * guides for npm


## Changing the base vagrant box
To use a different base vagrant box you need to change the vagrantfile (in particular the config setting config.vm.box, but refer to vagrants docs). I then run a few manual tasks documented at the bottom of this document to extend the VM hard disk, partition, format and mount a new data disk. (unfortunatly ive yet to automate this process) 


## Amending the current vagrant built image
Make your changes to the scripts then check them in (this is important as scripts are not shared through the file shares but through git clone and pull). Then whilst the VM is running excecute 'vagrant provision' on the host, this will cause the VM to re-clone the scripts and rerun them inside the VM. 
NOTE: If a change is made to the vagrantfile you will need to 'git pull' on your host so that the vagrant provisioning uses the correct new vagrant config, any other change to the .sh files only afects the guest VM.  


## Distributing to other devs
To run the final resulting VM on a different machine, it need not have vagrant installed, All that is needed is the .vbox and .vmdk files (mine are called development-build_default_1480950561529_78522.vbox and packer-centos-7.2-x86_64-virtualbox-vagrant-puppet-1457544893-disk1.vmdk which live inside the folder C:\VirtualBoxVMs\development-build_default_1480950561529_78522 but the default for virtual box is C:\Users\<<username>>\VirtualBox VMs). 
Just double click the .vbox file and its running inside virtual box. NOTE: This wont be exactly the same as vagrant up (for example the vagrant shared folders will not be present). 

I find that its best to do an export application from virtual box, this will create an archive file that is a 1/3 the size of the uncompressed files. it will also contain all the files needed to get the VM running on another devs machine.  


## Installing changes in the scripts on a deployed VM hosted in virtualbox rather than vagrant.
You can also do updates to a live running VM by logging in as root (or use su). Navigating to '/root/Code/development-build', git pull, then run the command 'sh setup-for-dev.sh cent' (if you changed the default user amend cent to be that user). This should do the same as if it was run through vagrant itself. NOTE: If you were to run vagrant-up.sh instead you would also reboot the VM, which is probably not what you want to happen.


## Gotchas
Ensure that you check in unix style line endings if editing on a windows system. This applies if you send scripts into the VM using vagrant or if you are sharing scripts through the vagrant default share. The scripts as provided in this repo do not do this but just FYI if you change it, beware.


## Manual steps
When provisioning a new box the first thing i do after downloading the box from vargrant with 'vagrant add' is to extend the hard disk which is usually quite small ~16Gb to 200Gb. Since the vmdk is an expanding disk it does not actually eat 200Gb on your drive but if you were to use it it would. the commands to do this are:

```
VBoxManage clonehd "source.vmdk" "cloned.vdi" --format vdi
VBoxManage modifyhd "cloned.vdi" --resize 204800
mv source.vmdk source_original.vmdk
VBoxManage clonehd "cloned.vdi" "resized.vmdk" --format vmdk
```

Where VBoxManage is installed in the virtualBox folder in 'program files' and by default the source.vmdk will be somewhere like "C:\Users\<<username>>\.vagrant.d\boxes\puppetlabs-VAGRANTSLASH-centos-7.2-64-puppet\1.0.1\virtualbox\packer-centos-7.2-x86_64-virtualbox-vagrant-puppet-1457544893-disk1.vmdk"

To utilise this space you need to open the VM with virtualbox and use the GParted tooling or fdisk to partition, format and mount a new volume. I find its best to do this after running vagrant up as everything is installed at that point. 

### (optional) Manual step add a second data disk
We have had some problems with machines crashing and not coming back to life tus loosing the current work in progress. To mitigate this we are now mounting an extra data disk to the main VM. and mounting it in the root folder /stuff