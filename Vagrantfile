# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

CPUS = 2
MEMORY = 4096

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Using Ubuntu 16.04
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.hostname = "gohan-dev"
  # Forwarding port 8080 to local 8080.
  #config.vm.network "forwarded_port", guest: 8080, host: 8080
  #Calling bootstrap setup
  config.ssh.forward_agent = true
  #config.vm.synced_folder "dev_shared", "/home/vagrant/dev", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp', 'fsc' ,'actimeo=2']
  config.vm.synced_folder "dev_shared", "/home/vagrant/dev", disabled: true
  config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.network :public_network
  config.vm.provider "virtualbox" do |vb|
    vb.memory = MEMORY
    vb.cpus = CPUS
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    # vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end

  config.vm.provision "shell", privileged: false, path: "setup_gohan.sh"
  config.vm.provision "shell", privileged: false, path: "setup_nodejs.sh"
  config.vm.provision "shell", privileged: false, path: "setup_gohanwebui.sh"
  config.vm.provision "shell", privileged: false, path: "setup_vim_tmux.sh"
end
