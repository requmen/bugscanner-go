# Bugscanner Go

This tool is dedicated to [DARKTUNNEL.NET](https://www.darktunnel.net), please support us if you find this tool useful.

Join to our telegram group @darktunnel_group or click [here](https://t.me/darktunnel_group).


Install
-------

**Latest Release**

	go install -v github.com/aztecrabbit/bugscanner-go@latest

**Latest Commit**

	go install -v github.com/aztecrabbit/bugscanner-go@HEAD


#### Add go bin to PATH

**Bash**

	echo 'PATH="$PATH:$HOME/go/bin"' >> $HOME/.bashrc && source $HOME/.bashrc

**Zsh**

	echo 'PATH="$PATH:$HOME/go/bin"' >> $HOME/.zshrc && source $HOME/.zshrc


Usage
-----

	bugscanner-go --help


### Before Scanning

**1. Install subfinder (or any tool for finding subdomain)**

Visit subfinder repo if you want to install subfinder [here](https://github.com/projectdiscovery/subfinder#installation)


**2. Scan subdomain using subfinder and save it to file**

	subfinder -d example.com -o example.com.lst


### Scanning

#### Scan Direct

	bugscanner-go scan direct -f example.com.lst -o cf.lst

#### Scan CDN SSL

	bugscanner-go scan cdn-ssl --proxy-filename cf.lst --target ws.example.com

* target server response must be returning 101 status code.

#### Scan Server Name Indication

	bugscanner-go scan sni -f example.com.lst --target 203.0.113.10:443 --threads 16 --timeout 8 --deep 3

* Replace `203.0.113.10:443` with the host and port of a server you own or are authorized to test. Every SNI name in the file is sent to this same target.

#### Note

* Another subcommand for scanning will be updated soon.
