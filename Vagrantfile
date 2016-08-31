VAGRANTFILE_API_VERSION = "2"
ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
    vb.name = "dockerforge"
  end

  config.vm.define :dockerforge do |dockerforge|
    dockerforge.vm.synced_folder "./assets/", "/var/host/assets"
    dockerforge.vm.network :private_network, ip: "192.168.42.30"
    dockerforge.vm.network "forwarded_port", guest: 8890 , host: 8890
    dockerforge.vm.network "forwarded_port", guest: 8080 , host: 8080
    dockerforge.vm.provision :shell, path: "assets/vagrant/install.sh", args: ""
  end

end