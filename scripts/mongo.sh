#!/usr/bin/env bash

function installMongo {
    echo Installing MongoDB
    # This script relies on the mongodb-org-2.6.repo file already existing
    # if [ ! -f '/etc/yum.repos.d/mongodb-org-2.6.repo' ]
    #     echo 'etc/yum.repos.d/mongodb-org-2.6.repo is required to install mongodb'
    #     exit 1
    # then
    if [ ! -f '/etc/yum.repos.d/mongodb-org-2.6.repo' ]
    then
        echo Creating /etc/yum.repos.d/mongodb-org-2.6.repo
        cat<<EOF > /tmp/mongodb-org-2.6.repo
[mongodb-org-2.6]
name=MongoDB 2.6 Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOF
        sudo cp /tmp/mongodb-org-2.6.repo /etc/yum.repos.d/mongodb-org-2.6.repo
        rm /tmp/mongodb-org-2.6.repo
    fi

    # Comment out this
        # This will install the latest in the 2.6 line
        # If you go with this option then you will also want to remove the command
        # from above that excludes updates for the latest packages.
        # sudo yum install mongodb-org --quiet --assumeyes

    # Or this!
        # This will install a specific mongo version (2.6.8)
        mongo_version=2.6.8
        echo Installing mongo $mongo_version
        sudo yum install \
            mongodb-org-$mongo_version \
            mongodb-org-server$mongo_version \
            mongodb-org-shell-$mongo_version \
            mongodb-org-mongos-$mongo_version \
            mongodb-org-tools-$mongo_version --quiet --assumeyes
        # sudo yum install mongodb-org-shell-$mongo_version --quiet --assumeyes
        # sudo yum install mongodb-org-mongos-$mongo_version --quiet --assumeyes
        # sudo yum install mongodb-org-tools-$mongo_version --quiet --assumeyes
        # sudo yum install mongodb-org-$mongo_version --quiet --assumeyes
        # sudo yum install mongodb-org-server-$mongo_version --quiet --assumeyes

    # Pin the version of mongo
    echo "exclude=mongodb-org,mongodb-org-server,mongodb-org-shell,mongodb-org-mongos,mongodb-org-tools" | sudo tee -a /etc/yum.conf &> /dev/null

    # Change the config file so that mongo is listening on all addresses (0.0.0.0)
    sudo sed -i.bak -- 's/^bind_ip=127.0.0.1/# bind_ip=127.0.0.1/m' /etc/mongod.conf
    sudo cp /etc/yum.conf /etc/yum.conf.bak

    echo Starting MongoDB
    sudo service mongod start

    echo Finished installing MongoDB
}

mongo --version &> /dev/null || installMongo


