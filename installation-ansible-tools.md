```bash
cd
sudo dnf install -y python3-pip wget
wget https://vscode.download.prss.microsoft.com/dbazure/download/stable/2901c5ac6db8a986a5666c3af51ff804d05af0d4/code-1.101.2-1750797987.el8.x86_64.rpm
pip3 install --user ansible ansible-lint
sudo dnf install -y ./code-1.101.2-1750797987.el8.x86_64.rpm

cd Téléchargements/ansible-vms/ansible
code .
```

Depuis code : Terminal > nouveau terminal

```
vagrant ssh
cd /vagrant
``` 
