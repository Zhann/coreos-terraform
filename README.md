This repo is just me experimenting with Terraform, CoreOS, Fleet, SystemD and Docker.

# SETUP

Use homebrew to install `terraform` (required) and `fleetctl` (optional).

You need to source the following (or add to ~/.bashrc or ~/.zshrc):

```
# digitalocean
export DO_PAT=your_digital_ocean_private_access_token

# terraform
export SSH_FINGERPRINT=$(ssh-keygen -lf ~/.ssh/id_rsa.pub | awk '{print $2}')
export TF_VAR_do_token=$DO_PAT
export TF_VAR_etcd_token=$(curl -sw "\n" https://discovery.etcd.io/new)
export TF_LOG=1
```

## SSH pub key

`SSH_FINGERPRINT` your pub key name might be different from `~/.ssh/id_rsa.pub`. Also make sure this key is added to your DigitalOcean account.

## TF Vars

`TF_VAR_etcd_token` needs to be the same for every node in the same cluster, but don't reuse it for a new cluster (even after deleting all the nodes) because it will break.

There's 2 scripts in the script/ folder to help generate a new token and/or update ~/.zshrc to use this new token.

# TIPS

 * Use fleetctl locally, by using `export FLEETCTL_TUNNEL=<ip of random node in cluster>`
 * Excellent guide on getting started with CoreOS: [https://www.digitalocean.com/community/tutorial_series/getting-started-with-coreos-2](https://www.digitalocean.com/community/tutorial_series/getting-started-with-coreos-2)
