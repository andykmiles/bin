Vagrant.configure("2") do |config|
  config.ssh.insert_key = true
  config.vm.hostname = "pydev"
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.provider "docker" do |d|
     d.build_dir = "."
     d.remains_running = true
     d.has_ssh = true
  end
  config.vm.provision :type: "shell", inline:<<-SHELL
	git config --global user.email "akmiles@icloud.com"
	git config --global user.name "Andy Miles"
	python -m pip install --upgrade pip
	python -m pip install loguru
	python -m pip install pysnooper
	python -m pip install pytest
	python -m pip install pytest-cov
	python -m pip install pytest-bdd
	python -m pip install tox
	python -m pip install pytest-mock
	python -m pip install pre-commit
  SHELL
end
