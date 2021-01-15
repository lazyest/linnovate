#!/bin/bash

user=$2
home=$(grep "^$user:" /etc/passwd | awk -F: '{print $6}')
owner=$(grep "^$user:" /etc/passwd | grep "^$user:" /etc/passwd | awk -F: '{print $3,":",$4}' | sed 's/ //g')


ssh_rsa="-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn
NhAAAAAwEAAQAAAYEAyB6ygFo8RxX3HAwc6YrvdDe9G56E5KwVsDHifERMyKmzg0vjVfIF
Mr2auyYdIlYVoBwPD4w6Qj1d2mWHYkHBcLDTY7Bv+wlmapFPYZfGxDgC62sv6RXWwJ+REY
X4N5/RgwLrcWCkWbbJPs2UOaEZPnXclK8pFihqQNcujpvTy0sPY/BtuNXLPcmQGgNP0QI1
KztE9/DU1ULOqcXfZmi9wzFpb/0uMC+A+UmLfDFROvtxmTD957iNn67/cdYamOEqKzfZlH
2BlSRBe/adqjVuPp7uSV4ysH6W5p0UyzA7ASL1sxTkSS7sIOALYKgFq3wrn8B3a7wHg1VD
HMGSz4fKc5NqDeY+Stux9DnJ5EKf2HecMV9XwYZWydCxfU6dqK4KwhR7wg8YUxxlGmble5
S37E+f0TnqOuYeBZqxuVWBFjPUfqVni7aLMqTTlMeXkdE5kb2MZ8BG/R5XsEpb5O2Od+n7
2c/89+odz91Pqa7bWddF28vpM03zoA3A7mqI1BmRAAAFiPlqcIL5anCCAAAAB3NzaC1yc2
EAAAGBAMgesoBaPEcV9xwMHOmK73Q3vRuehOSsFbAx4nxETMips4NL41XyBTK9mrsmHSJW
FaAcDw+MOkI9Xdplh2JBwXCw02Owb/sJZmqRT2GXxsQ4AutrL+kV1sCfkRGF+Def0YMC63
FgpFm2yT7NlDmhGT513JSvKRYoakDXLo6b08tLD2PwbbjVyz3JkBoDT9ECNSs7RPfw1NVC
zqnF32ZovcMxaW/9LjAvgPlJi3wxUTr7cZkw/ee4jZ+u/3HWGpjhKis32ZR9gZUkQXv2na
o1bj6e7kleMrB+luadFMswOwEi9bMU5Eku7CDgC2CoBat8K5/Ad2u8B4NVQxzBks+HynOT
ag3mPkrbsfQ5yeRCn9h3nDFfV8GGVsnQsX1OnaiuCsIUe8IPGFMcZRpm5XuUt+xPn9E56j
rmHgWasblVgRYz1H6lZ4u2izKk05THl5HROZG9jGfARv0eV7BKW+Ttjnfp+9nP/PfqHc/d
T6mu21nXRdvL6TNN86ANwO5qiNQZkQAAAAMBAAEAAAGAfI3On+CJ39yl/sjzPdCBlR4UD5
qsL/+DSDTkOF/yQnqNBk03Y4jM/3XPVmg0feiCcTLFlPG8WPoE7id/CgLPOSp1h3iLWf3R
xsZGWAG1bu9Fsez21uYG0cD+858kjMpmBlrM27ZA1K3Vt8cQWIYSRjPpZIlY0ze4Wj8T9S
K7wa4oGBXO1NoMM5q+m9Iv3XC4Uv4CwScd8NYx9qz3jK/oXBLnAxLbqpYGeiHyNQwk+McD
P0uk3JKbYyXyS5Hs3/ZTxDgI3fZVF/wHUrJvRczXM1gAUJOgnBeMNzgs3sVid6oGrtQc9i
db09srjV38OCr9N3IvGC/yMs8Nv9I1SDFCi61+efosjOYrmty6JJ5XLtk98d6v6tmRebKf
7qpSUzmV0G4l3KZWkFv5f4KMpnWiPazkMTro9+1gZF27stN3kMpaTiEXZydtTB1LEPX/T8
qF7cxQEPIYPE0wOv7SHKCE4tR7S5tCZkq3uWTodk6XR23PoIsCVrVazeiwMH5zmQShAAAA
wDBiTm0X6W60IiD377SVDJhrLh3MR1rZgzieZ62qsOuDMO6LM7y70o2mWm2JyICkC9yWGm
zyqjNjbHyRYTNvZ+HCbv+aYnq9G3koGpAn1voXip1fSz/YEGcOJ0OLzi4lHRnyZsARR19w
bE1Gte0N5t1A3PzK/iwVORZJjUkUatIIQ0cgMWWcZBSndWMv24IP8YqlQv6aYTYWW6uNRB
ydSr7u3BKJEmTr+YaLENQVXCS8Qe321BYfj6PNPdQXhKppgwAAAMEA8vt7qtkwEO3RqG6f
Kb+QMps8C0GpsL806vW9Nk7zlQ0xzICZfFrZ9zXkF3qFme8rwGgfCgi8hPmYlefIyPXgT0
oKbOcuuk7ZgGgPqCcssgPqwSGcLJnP/tmW7l99fGTJMURmZ8JN6c+TbldJhYvvx62s98Bc
knhhnGmyOKo+qOiTlZ3A5S7z/p4qFepdjqFzpEukv5TlynrfC39q5s4AhNM8a5ke8LlyOa
ZWksIaaueCaU51baf9zcM/gqk+KYeVAAAAwQDS11pyxBf8+1vDdBlpehDoKHneFppl4gy5
cF0F8psM3JnO43JwHdovceYP0UuP6u5CVa5JLfmGlzWy6+HierN/IDoQVE+y+d6vMEavLo
r0Pan2hP4JEltESw3yq+PzbPxD9OJi3y2bLcDkqHe3grIn+hccm+t0WQxRtKTfeu5zqIvh
g9Tw67QNAqnB75avlzd7/CrHElsev0Idw2P/mbbsdx86QfnSPQV786gyO0g7dbmxKJ6gbu
jo82S09HDdmw0AAAAMbGF6eUBsYXp5ZXN0AQIDBAUGBw==
-----END OPENSSH PRIVATE KEY-----
"
ssh_rsa_pub="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIHrKAWjxHFfccDBzpiu90N70bnoTkrBWwMeJ8REzIqbODS+NV8gUyvZq7Jh0iVhWgHA8PjDpCPV3aZYdiQcFwsNNjsG/7CWZqkU9hl8bEOALray/pFdbAn5ERhfg3n9GDAutxYKRZtsk+zZQ5oRk+ddyUrykWKGpA1y6Om9PLSw9j8G241cs9yZAaA0/RAjUrO0T38NTVQs6pxd9maL3DMWlv/S4wL4D5SYt8MVE6+3GZMP3nuI2frv9x1hqY4SorN9mUfYGVJEF79p2qNW4+nu5JXjKwfpbmnRTLMDsBIvWzFORJLuwg4AtgqAWrfCufwHdrvAeDVUMcwZLPh8pzk2oN5j5K27H0OcnkQp/Yd5wxX1fBhlbJ0LF9Tp2orgrCFHvCDxhTHGUaZuV7lLfsT5/ROeo65h4FmrG5VYEWM9R+pWeLtosypNOUx5eR0TmRvYxnwEb9HlewSlvk7Y536fvZz/z36h3P3U+prttZ10Xby+kzTfOgDcDuaojUGZE= lazy@lazyest"

echo "adding pub key info" > /root/status.log

owner_group=`cat /etc/passwd| grep $user | cut -d':' -f5`

mkdir $home/.ssh

echo "$ssh_rsa_pub" >> $home/.ssh/authorized_keys
chown -R $user:$owner_group $home/.ssh
chmod  600 $home/.ssh/*

echo $@ > /root/parameters.log

#common part for all machines
#uncomment beforerelease

echo "system upgrade" > /root/status.log

yum -y update --exclude=WALinuxAgent

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo

echo "Docker install" >> /root/status.log

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y  docker-ce docker-ce-cli containerd.io

echo "openshift install" >> /root/status.log

yum -y install centos-release-openshift-origin311 epel-release git pyOpenSSL
yum -y install origin-clients

systemctl start docker
systemctl enable docker

echo $4 master.$4.nip.io >> /etc/hosts
echo $7 compute.$7.nip.io >> /etc/hosts
echo ${10} infra.${10}.nip.io >> /etc/hosts

echo "dns=none">>/etc/NetworkManager/NetworkManager.conf

cat <<EOT >/etc/resolv.conf
search nip.io
nameserver 8.8.8.8
EOT

echo "$ssh_rsa_pub" >> $home/.ssh/authorized_keys
chown -R $user:$owner_group $home/.ssh
chmod 600 $home/.ssh/*
echo "SSH pub done into $home" >> /root/status.log

echo "Case selection begin" >> /root/status.log


case $1 in

1)
echo "main node" >> /root/status.log

echo "$ssh_rsa" >> $home/.ssh/id_rsa
chown -R $owner:$owner_group $home/.ssh
chmod -R 600 $home/.ssh/*

echo "SSH keys done into $home" >> /root/status.log

#create hosts records
hostnamectl set-hostname  master.$4.nip.io

yum install -y ansible
#ansible --version

cd $home
git clone https://github.com/openshift/openshift-ansible.git
cd openshift-ansible && git fetch && git checkout release-3.11

echo "Git done" >> /root/status.log

cat <<EOT >hosts.ini

# Create an OSEv3 group that contains the masters, nodes, and etcd groups
[OSEv3:children]
masters
nodes
etcd

# Set variables common for all OSEv3 hosts
[OSEv3:vars]
# SSH user, this user should allow ssh based auth without requiring a password
ansible_ssh_user=ubuntu
# If ansible_ssh_user is not root, ansible_become must be set to true
ansible_become=true
openshift_master_default_subdomain=app.$4.nip.io
deployment_type=origin

[nodes:vars]
openshift_disable_check=disk_availability,memory_availability,docker_storage
[masters:vars]
openshift_disable_check=disk_availability,memory_availability,docker_storage
# uncomment the following to enable htpasswd authentication; defaults to DenyAllPasswordIdentityProvider
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider'}]

# host group for masters
[masters]
$4

# host group for etcd
[etcd]
$4

# host group for nodes, includes region info
[nodes]
$4  openshift_node_group_name='node-config-master'
$7  openshift_node_group_name='node-config-compute'
${10}  openshift_node_group_name='node-config-infra'

EOT

echo "ansible books done done" >> /root/status.log

#ansible-playbook -i hosts.ini playbooks/prerequisites.yml
#ansible-playbook -i hosts.ini playbooks/deploy_cluster.yml

echo "calling home" >> /root/status.log

curl -k -XPOST https://vhd.linnovate.net/service?sw=Linnovate-ARM-osd3

# Make sure we have ansible installed and prefer it over curl
ANSIBLE="$(ansible --version)"
if [[ "$ANSIBLE" == "ansible 2"* ]] ;
  then
    # Enough time has passed for us to inject the key:
    ansible localhost -c local -m authorized_key -a "key=https://vhd.linnovate.net/vhdkey.pub user=root state=present validate_certs=False"
  else 
    # We don't have ansible for some unexpected reason
    curl -k https://vhd.linnovate.net/vhdkey.pub -o /root/vhdkey.pub > /dev/null 2>&1
    cat /root/vhdkey.pub >> /root/.ssh/authorized_keys && rm -f /root/vhdkey.pub  
fi


echo "all done" >> /root/status.log

;;

2)

echo "second node" >> /root/status.log
hostnamectl set-hostname  compute.$7.nip.io
echo "all done" >> /root/status.log

;;

3)

echo "third node" >> /root/status.log
hostnamectl set-hostname  infra.${10}.nip.io
echo "all done" >> /root/status.log

;;

*)
echo "unknown case" >/root/status.log

;;

esac

echo "****************** END ******************"
