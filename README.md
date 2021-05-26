### Ubuntu 20.04 Server base template with packer under proxmox

 <br>

variables.json contains proxmox connection params:
```bash
{
	"proxmox_host": "{{env `proxmox_host`}}",
	"proxmox_node_name": "pm",
	"proxmox_api_user": "root@pam",
	"proxmox_api_password": "{{env `proxmox_pass`}}",
}
```
<br>
Define two env variables and export
them under your Linux packer client:

export proxmox_host=<Your_PM_Host_IP>
export proxmox_host=<Your_PM_password>

<br>
Run the templeting...

```bash
$ packer build -var-file="variables.json" ./packer.json
```