BOX=vagrant-hardenedbsd-cpp.box

.PHONY: launch-vm clean-vm clean-boxes clean-vagrant-metadata

launch-vm: Vagrantfile bootstrap
	vagrant up

clean-vm:
	-vagrant destroy -f

clean-boxes:
	-rm -rf *.box

clean-vagrant-metadata:
	-rm -rf .vagrant

clean: clean-boxes clean-vm clean-vagrant-metadata

$(BOX): clean-boxes clean-vm launch-vm export.Vagrantfile
	vagrant package --output $(BOX) --vagrantfile export.Vagrantfile

install-box-virtualbox: $(BOX)
	vagrant box add --force --name mcandre/vagrant-hardenedbsd-cpp $(BOX)
