# A collection of scripts to help experiment with Kubernetes and AWS instances

## Quickstart - will install cluster with dashboard

ansible-playbook create_instances.yaml -e role=master -e count=1
ansible-playbook create_instances.yaml -e role=node -e count=3
ansible-playbook -b simple-cluster.yaml
ansible-playbook -b add-dashboard-to-cluster.yaml

## Requirements

- a working Ansible control host with AWS credentials configured
- working dynamic Ansible 'ec2.py' inventory script
- setup AWS Security Group and VPC in add them to 'create_instances.yaml'

AWS credentials can be configured like this:

export AWS_SECRET_KEY=******
export AWS_ACCESS_KEY=******
export EC2_REGION=eu-central-1

---

Dynamic AWS inventory 'ec2.py' (http://docs.ansible.com/ansible/latest/intro_dynamic_inventory.html#example-aws-ec2-external-inventory-script)

You can get ec2.py and ec2.ini here and save both in /etc/ansible:

https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini
https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py

