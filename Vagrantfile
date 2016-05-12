# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.hostname = "redis"
    config.vm.box = "ubuntu/trusty32"
    config.vm.network :forwarded_port, guest: 6379, host: 6379
    config.vm.provision :shell, :path => "bootstrap.sh"
end