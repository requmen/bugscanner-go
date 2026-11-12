# Bugscanner Go

A command-line tool for testing CDN, proxy, and TLS/SNI behavior. The original project is dedicated to [DARKTUNNEL.NET](https://www.darktunnel.net) and its Telegram community: [@darktunnel_group](https://t.me/darktunnel_group).

This repository is published at [github.com/requmen/bugscanner-go](https://github.com/requmen/bugscanner-go). The project originates from [github.com/aztecrabbit/bugscanner-go](https://github.com/aztecrabbit/bugscanner-go); the original MIT license and copyright notice are retained.

## Requirements

- Go 1.21 or newer
- Optional: [Subfinder](https://github.com/projectdiscovery/subfinder) or another tool for preparing a domain list

## Install

Install the latest version from this repository:

```sh
go install -v github.com/requmen/bugscanner-go@latest
```

To install the latest commit instead:

```sh
go install -v github.com/requmen/bugscanner-go@HEAD
```

Add Go's bin directory to your Bash `PATH` with:

```sh
echo 'PATH="$PATH:$HOME/go/bin"' >> $HOME/.bashrc && source $HOME/.bashrc
```

Open a new shell, then check the available commands:

```sh
bugscanner-go --help
bugscanner-go scan --help
```

## Prepare a domain list

For example, use Subfinder to discover subdomains and save them to a file:

```sh
subfinder -d example.com -o example.com.lst
```

Only scan domains and systems that you own or are authorized to test.

## Examples

### Direct scan

```sh
bugscanner-go scan direct -f example.com.lst -o cf.lst
```

### CDN SSL scan

```sh
bugscanner-go scan cdn-ssl --proxy-filename cf.lst --target ws.example.com
```

The target is expected to return HTTP status `101` for a successful WebSocket upgrade.

### SNI scan

```sh
bugscanner-go scan sni -f example.com.lst --threads 16 --timeout 8 --deep 3
```

The current SNI implementation connects to the built-in endpoint `158.178.198.153:443`; it does not accept a `--target` flag.

## License

MIT. See [LICENSE](LICENSE) for the original copyright and terms.
