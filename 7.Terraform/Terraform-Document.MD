**Terraform Overview**

Terraform is an open-source infrastructure as code (IaC) tool developed by HashiCorp. It is used for building, managing, and provisioning infrastructure resources in a declarative manner.

**Terraform main Components** 

1.Providers : Terraform relies on plugins called "providers" to interact with cloud providers, SaaS providers, and other AP/s.

2.Resources : Resources are the most important element in the Terraform language. Each resource block describes one or more infrastructure objects, such as virtual networks, compute instances, or higher-level components such as DNS records.

3.Variables : Using variables in terraform configurations makes ol deployment more dynamic.
A separate file with name "variables.tf" needs to b created in the working directory to store all variable. for our used in main.tf configuration file.

4.Statefile : After the deployment is finished terraform creates a state file to keep track of current state of the infrastructure. It will use this file to compare when you deploy/destroy resources, in other words it compares "current state" with "desired state" using this file. A file with a name of "terraform.tfstate" will be create in your working directory.

5.Provisioners : Provisioners provide the ability to run additional steps or tasks when a resource is created or destroyed. This is not a replacement for configuration management tools.

6.Backend or Remote statefile : In Terraform, the "backend" or "remote state" refers to the method used to store and retrieve the state file produced after applying Terraform configurations. The state file contains information about the infrastructure resources managed by Terraform, such as their current state, mappings to the real resources in the cloud, dependencies, and more.

7.Modules : Terraform Modules are self-contained packages of Terraform configurations that enable you to encapsulate and reuse logical components or resources in your infrastructure code. They provide a way to organize and abstract infrastructure resources, making it easier to manage, reuse, and share configurations across different projects and teams.

8.Data Sources : In Terraform, data sources are a way to fetch information or retrieve existing data from external sources that are not managed by Terraform itself. They enable you to import information into your Terraform configuration, which can then be used to make decisions, configure resources, or perform other operations

9.Functions : Terraform functions are built-in operations that allow you to perform various transformations and computations within Terraform configurations. These functions enable you to manipulate data, generate values dynamically, and facilitate configuration management.
              



