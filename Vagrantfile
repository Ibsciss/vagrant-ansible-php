Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v|
<<<<<<< HEAD
        v.name = "Ibsciss full stack"
=======
        v.name = "Ibsciss"
>>>>>>> ef2c217e5732c2ef4edb265136acca37f13bef62
        v.customize ["modifyvm", :id, "--memory", 512]
    end

    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

<<<<<<< HEAD
    config.vm.network :private_network, ip: "192.168.50.51"
    config.ssh.forward_agent = true
    config.vm.hostname = "ibsciss.devel"
=======
    config.vm.network :private_network, ip: "192.168.100.100"
    config.ssh.forward_agent = true
>>>>>>> ef2c217e5732c2ef4edb265136acca37f13bef62

    # Ansible provisioning (you need to have ansible installed)

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/playbook.yml"
<<<<<<< HEAD
        ansible.extra_vars = {
            hostname: "config.vm.hostname"
        }
    end

    config.vm.synced_folder "../code/", "/var/www/", id: "vagrant-root", :nfs => true
=======
    end

    config.vm.synced_folder "../code", "/vagrant", id: "vagrant-root", :nfs => true
>>>>>>> ef2c217e5732c2ef4edb265136acca37f13bef62
end