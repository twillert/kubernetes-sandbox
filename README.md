[![Build Status](https://travis-ci.org/twillert/kubernetes-sandbox.svg?branch=master)](https://travis-ci.org/twillert/kubernetes-sandbox)

# A collection of scripts to experiment with Kubernetes on AWS

## Quickstart - will install cluster with dashboard

```
ansible-playbook create_instances.yaml -e role=master -e count=1
ansible-playbook create_instances.yaml -e role=node -e count=3
ansible-playbook -b simple-cluster.yaml
ansible-playbook -b add-dashboard-to-cluster.yaml
ansible-playbook -b heapster-with-influxdb.yaml
```

After completion the debug message will print the URL for your Kubernetes dashboard:

```
TASK [show URL for Dashboard] ***********************************************************
Saturday 10 February 2018  22:41:10 +0100 (0:00:01.114)       0:00:48.391 *****
ok: [18.196.4.155] => {
    "msg": "Dashboard URL: http://ec2-18-196-4-155.eu-central-1.compute.amazonaws.com/"
}
```

## Requirements

- a working Ansible control host with AWS credentials configured
- working dynamic Ansible 'ec2.py' inventory script
- setup AWS Security Group and VPC in add them to 'create_instances.yaml'
- edit to `ansible.cfg` if needed

AWS credentials can be configured like this:

```
export AWS_SECRET_KEY=******
export AWS_ACCESS_KEY=******
export EC2_REGION=eu-central-1
```

---

## Dynamic AWS inventory 'ec2.py'

Read here: http://docs.ansible.com/ansible/latest/intro_dynamic_inventory.html#example-aws-ec2-external-inventory-script

You can get ec2.py and ec2.ini here and save both in /etc/ansible:

https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini
https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py

