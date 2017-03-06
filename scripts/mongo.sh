#!/usr/bin/env bash

echo "***** Running mongo *****"

version=3.2.12

function installMongo {
    
    echo "*** Installing MongoDB $version ***"

    if [ ! -f '/etc/yum.repos.d/mongodb-org-3.2.repo' ]
    then
        echo Creating /etc/yum.repos.d/mongodb-org-3.2.repo
        cat<<EOF > /tmp/mongodb-org-3.2.repo
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc
EOF
        sudo cp /tmp/mongodb-org-3.2.repo /etc/yum.repos.d/mongodb-org-3.2.repo
        rm /tmp/mongodb-org-3.2.repo
    fi

       
    echo Installing mongo $version
    sudo yum install mongodb-org-$version mongodb-org-server-$version mongodb-org-shell-$version mongodb-org-mongos-$version mongodb-org-tools-$version --assumeyes

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