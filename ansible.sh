#/bin/bash

sudo cp /vagrant/keys/* /home/vagrant/.ssh/
sudo chown -R vagrant. /home/vagrant/.ssh/
sudo chmod 600 /home/vagrant/.ssh/id_rsa
sudo chmod 644 /home/vagrant/.ssh/id_rsa.pub
sudo cat /home/vagrant/.ssh/id_rsa.pub | tee -a /home/vagrant/.ssh/authorized_keys
sudo dnf update -y
sudo dnf install git -y
sudo dnf makecache -y
sudo dnf install epel-release -y
sudo dnf makecache -y
sudo dnf install ansible -y
sudo dnf install vim -y
sudo dnf install tree -y
echo "autocmd FileType yaml setlocal ai ts=2 sw=2 et" > /home/vagrant/.vimrc
mkdir /home/vagrant/prelim-exam
echo -e "[defaults] \ninventory = ./inventory \nremote_user = vagrant \n \n[privilege_escalation] \nbecome = True \nbecome_method = sudo \nbecome_user = root \nbecome_ask_pass = False" > /home/vagrant/prelim-exam/ansible.cfg
echo -e "[ansible] \n10.67.17.10 \n[target] \n10.67.17.11" > /home/vagrant/prelim-exam/inventory
sudo cp /vagrant/main.yaml /home/vagrant/prelim-exam
