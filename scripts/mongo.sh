#!/usr/bin/env bash

echo "***** Running mongo *****"

version=2.6.12

function installMongo {
    
    echo "*** Installing MongoDB $version ***"

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

       
    echo Installing mongo $version
    sudo yum install mongodb-org-$version mongodb-org-server$version mongodb-org-shell-$version mongodb-org-mongos-$version mongodb-org-tools-$version --assumeyes

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

    echo "*** change the default data path to be in the home ***"
    sed 's/dbpath=\/var\/lib\/mongo/dbpath=\/stuff\/Data/g' /etc/mongod.conf

    echo "*** Starting MongoDB ***"
    sudo service mongod start

    echo "*** Finished installing MongoDB $version ***"
}

mongo --version &> /dev/null || installMongo

echo "***** Fin! mongo *****"