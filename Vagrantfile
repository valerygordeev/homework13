# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "generic-x64/alpine319"
  config.vm.box_version = "4.3.12"
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = :host
  end 
  
  config.vm.network "private_network", ip: "192.168.56.10"
  
  config.vm.provider "virtualbox" do |vb|

    vb.memory = "4096"
    vb.cpus = 2
    
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo su
    apk update
    apk upgrade
    apk add docker
    apk add docker-cli-compose
    rc-update add docker boot
    service docker start
    cp /vagrant/nginx.conf /root/nginx.conf
    cp /vagrant/Dockerfile /root/Dockerfile
    cp /vagrant/index.html /root/index.html
    cp /vagrant/script.sh /root/script.sh
    cd /root
    docker build -t nginx .
    docker run -dt -p 88:80 nginx
    curl localhost:88
	SHELL
end
