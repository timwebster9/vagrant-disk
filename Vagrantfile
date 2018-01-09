# -*- mode: ruby -*-
# vi: set ft=ruby :

docker_disk = './tmp/docker.vdi'
portworx_disk = './tmp/portworx.vdi'

Vagrant.configure("2") do |config|

  config.vm.define "host1" do |host1|

    host1.vm.box = "ubuntu/xenial64"
    host1.vm.hostname = "host1"

    config.vm.provider "virtualbox" do |v|

      v.memory = 2048
      v.cpus = 2

      unless File.exists?(docker_disk)
        v.customize ['createhd', '--filename', docker_disk, '--size', 25 * 1024]
      end
      
      unless File.exists?(portworx_disk)
        v.customize ['createhd', '--filename', portworx_disk, '--size', 25 * 1024]
      end

      v.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 4, '--device', 0, '--type', 'hdd', '--medium', docker_disk]
      v.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 5, '--device', 0, '--type', 'hdd', '--medium', portworx_disk]

    end

	end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "provisioning/playbook.yml"
  end

end
