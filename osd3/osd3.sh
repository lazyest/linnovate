#!/bin/bash
ssh_rsa="-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAwQHCvNl7YNKTJy2nBsh52RUG5xEex0jzEu/voU92eAyVbAKQ
jf9UB5M8BxUnv1ajmCbUcfaTdz6K9z43jlP7JG++qdABLH4/qnwNa3ZXFZIfQJja
VWJNiqUlHzeAeXZx0o0QXhzZrr2E26YnfTRz3bfyTPbK5RV5OuqfZY4NfYgHGu7h
GwJ+svY+OsWFAlsySOg3movsf3nKXaR9xYiegEIaxNY4jk/GzJvZXKY3mhGWxjxp
h0GAbe2farkmueyS/jVIFEWPT4rW7HUcaqr8Q240ncV8xbvVFDs3re2qnBBMgzgA
07Y/Drf7+Vqb2XIRkEnwLdTQgnrr5OodyErocQIDAQABAoIBABdTDyWjYrWgvQfP
DJBVSeRiFiN2fjG3LyjqthrYb4iyfJxA8xc19AG2WVrBw7vrzHlmt+XN1qRieojG
jBA3NfKBTplW+c1WtHr14ulJs9x3fC9iSYBoENbgfkv3eR80oSzAv2mgMu5bGOMy
gTMwU5BH2pBSgtKMdcoY8IplUFwLDo9zAxob07xs4x1VRvfPbJViNdHnbQjvuDmL
A6EMX4ZV0Uo6G6F/JZD6gX8taBxaAbXnBy/9tndZqjz1ADbqRRMMNJq9BcDtREVl
75ZvEOicuemyntX1OP+AChEziZFDm/H0l3N/3hwqszmnCclk+J06mLM6CuSPIWYK
/g8DrcECgYEA5cUDALWMEVkh2WWiw64psyk+iFJjB9t2BB1OBL6umbCN8XS67lmN
0I6n8rB+XlLglzvSW6Q9tXjevSHtaeQDB66gwMmzh/GKEiNas74qJtBFeAmFS2ac
PP/5TWsMjEdLrjM6AHaoqeIBOh0A3DQSe9EAvfDeXdait0o8PXHmQV8CgYEA1wpd
DgAhrj9vCwgQg+EsszPfG8FEVmggstEKijiAAywa1QMyX41c4pXenfSYW0o52k6o
NXtsDYI95SxgQeF35WKslpT9lafcZg6XZz1a18mabsuzPw7Uo03jewd7Z51DampZ
wQHLVSxt2w+8atDbH8LNZor3iwYGjvEp3W2cGC8CgYEAqustu6ZRBkqmemA3fpac
4HBq2t9mWV7wYEkoUzFBEoSaYiXyNAGcE6s61bZimmnONdHDPnZjjQ3XqxuEzwNV
Ga7WV/LywMp1ad6wxwpLssm1E4EJjbhLurizS9q439TdQD1NBTE/b/f177PJgwSd
R0uG4MQ/tdBHBE+NliuXG8MCgYAxCnoCUWFc/bZzS5mImfe5vqCpEcBl/EVIwoem
0g/PqWVNIvd/9xsxyYAFgdylJR5gfQO7frQ7uHIpK5+gJq1TMNevV7clRCztUXKR
5toq0B1aGzZ7sQQpYf/49NHd5W2UfUCO1bvrZsB+7u3HZm4yphh1xEeD+xHP04v6
pZ6tnQKBgC4/kqwrLlvdeG3+B8cbIQcCU4IX9nNWUcf8Urhbq9wExFTGPruVmcVT
vyUrmcLZg9/ztlJGgOg9bXijO5PlR7X2PE0FjHk7CQq/+QKkaDBpJiY0LfW2zV3P
x8bswqHNdQF5Jy+Bt4QCfrVFaxnqsZgY2z3Dr7dtFo3aKy5N1zcs
-----END RSA PRIVATE KEY-----
"
ssh_rsa_pub="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBAcK82Xtg0pMnLacGyHnZFQbnER7HSPMS7++hT3Z4DJVsApCN/1QHkzwHFSe/VqOYJtRx9pN3Por3PjeOU/skb76p0AEsfj+qfA1rdlcVkh9AmNpVYk2KpSUfN4B5dnHSjRBeHNmuvYTbpid9NHPdt/JM9srlFXk66p9ljg19iAca7uEbAn6y9j46xYUCWzJI6Deai+x/ecpdpH3FiJ6AQhrE1jiOT8bMm9lcpjeaEZbGPGmHQYBt7Z9quSa57JL+NUgURY9PitbsdRxqqvxDbjSdxXzFu9UUOzet7aqcEEyDOADTtj8Ot/v5WpvZchGQSfAt1NCCeuvk6h3ISuhx"

echo "$ssh_rsa_pub" > $home/.ssh/authorized_keys
chown -R $owner $home/.ssh
chmod  600 $home/.ssh/*

echo $@ > /root/parameters.log

#common part for all machines

#uncomment beforerelease

yum -y update --exclude=WALinuxAgent

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y  docker-ce docker-ce-cli containerd.io

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

case $1 in

1)

echo "main node" > /root/status.log

echo "$ssh_rsa" > $home/.ssh/id_rsa
chown -R $owner $home/.ssh
chmod -R 600 $home/.ssh/*

echo "SSH keys done into $home" >> /root/status.log


#create hosts records
hostnamectl set-hostname  master.$4.nip.io

rpm -Uvh https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.7.10-1.el7.ans.noarch.rpm
#ansible --version

cd $home
git clone https://github.com/openshift/openshift-ansible.git
cd openshift-ansible && git fetch && git checkout release-3.11

echo "Git done" >> /root/status.log
cd $home

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

;;

echo "all done" >> /root/status.log

2)

echo "second node" > /root/status.log
hostnamectl set-hostname  compute.$7.nip.io
echo "all done" >> /root/status.log

;;

3)

echo "third node" > /root/status.log
hostnamectl set-hostname  infra.${10}.nip.io
echo "all done" >> /root/status.log

;;

*)

echo "unknown case" >/root/status.log

;;

esac

echo "****************** END ******************"
