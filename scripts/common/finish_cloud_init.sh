#!/bin/bash -eux

# ensure vmware datasoruce
echo 'datasource_list: [ "VMware", "OVF" ]' > /etc/cloud/cloud.cfg.d/99-ovf-data.cfg

echo "Cloud-Init version"
cloud-init --version


# remove default conf if given
rm -f /etc/cloud/cloud.cfg.d/99-installer.cfg

# clean cloud init
rm -Rf /var/lib/cloud/data/scripts \
       /var/lib/cloud/scripts/per-instance \
       /var/lib/cloud/data/user-data* \
       /var/lib/cloud/instance \
       /var/lib/cloud/instances/*

cloud-init clean --logs
