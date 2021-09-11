# minecraft-azure
Teraform project to deploy the Java based Minecraft server into a cloud container hosted in Azure.

Thanks to itzg for the great work here: https://github.com/itzg/docker-minecraft-server

This will pull his image straight from dockerhub and host it with a perminent file share. Just restart to get the latest version of the server!

## Installation and Configuration

* Edit the main.tf under tf/main to your liking. CPU, memory, dns name, etc.
* Install terraform from hashicorp: https://www.terraform.io/
* Install the Azure CLI: https://docs.microsoft.com/en-us/cli/azure/

Login using the command az login

From the tf/main directory run the following:
```
terraform init
terraform apply
```
Wait approx 30-60 seconds for the final URI and enjoy!

You can remove all resources and data by running terraform destroy or just stop the container group for a lower bill.