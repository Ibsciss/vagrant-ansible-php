Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v|
        v.name = "Ibsciss full stack"
        v.customize ["modifyvm", :id, "--memory", 512]
    end

    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config.vm.network :private_network, ip: "192.168.50.51"
    config.ssh.forward_agent = true
    config.vm.hostname = "ibsciss.devel"

    # Ansible provisioning (you need to have ansible installed)

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/playbook.yml"
        ansible.extra_vars = {
            hostname: "config.vm.hostname"
        }
    end

    config.vm.synced_folder "../code/", "/var/www/", id: "vagrant-root", :nfs => true
end