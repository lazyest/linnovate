#!/bin/bash

user=$1
if [ -z $user ]; then
    echo "ERROR: Need paramter 'user'"
    exit 1
fi
ip=$2
if [ -z $ip ]; then
    echo "ERROR: Need paramter 'ip'"
    exit 1
fi

echo "User='$user'"
echo "Ip='$ip'"
home=/home/$user
owner_group=`grep "^$user" /etc/passwd | cut -d':' -f4`

yum -y update --exclude=WALinuxAgent
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y  docker-ce docker-ce-cli containerd.io

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo

yum -y install centos-release-openshift-origin311 epel-release git pyOpenSSL
yum -y install origin-clients

systemctl start docker
systemctl enable docker

mkdir /etc/docker /etc/containers

tee /etc/containers/registries.conf<<EOF
[registries.insecure]
registries = ['172.30.0.0/16']
EOF

tee /etc/docker/daemon.json<<EOF
{
   "insecure-registries": [
     "172.30.0.0/16"
   ]
}
EOF

systemctl daemon-reload
systemctl restart docker

echo "net.ipv4.ip_forward = 1" | sudo tee -a /etc/sysctl.conf

home=/home/$user
owner_group=`grep "^$user" /etc/passwd | cut -d':' -f4`
docker_group=`grep docker /etc/group | cut -d':' -f 3`

usermod -aG docker $user

cd $home
systemctl restart docker

echo "Running cluster"

cat > $home/run_cluster_during_install.sh <<EOF
#!/bin/bash
newgrp docker << END
export ip=$ip
oc cluster up --public-hostname=$ip --routing-suffix=$ip.xip.io
END
EOF

cd $home
chown $owner_group:$docker_group run_cluster_during_install.sh
su -c "bash -xv run_cluster_during_install.sh" - $user

echo "****************** END ******************"
