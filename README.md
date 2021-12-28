# VM-Build-Terraform-jenkins

Here we will try to build blank VM using terraform playbook via jenkins pipeline. I performed it on windows 10 laptop with limited resources.

Pre-requisite:
1. Jenkins installed on laptop with java
2. download terraform binary
3. Access to vcenter with administrator crdentials ( Make sure to perform it on lower environment)

**Steps:**

1. Create the Terraform file. Please see vmbuild.tf
2. In order to integrate terraform into jenkins , https://medium.com/appgambit/terraform-with-jenkins-pipeline-439babe4095c
3. Create the 2 pipelines for building the blank VM and deleting the same blank vms.
Pipeline1 : Demo-vmware-vm-build
Pipeline2 : Demo-Vmware-Vm-build-Destroy
