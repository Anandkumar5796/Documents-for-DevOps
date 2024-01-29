**Jenkins overview**

Jenkins is an open-source automation server that facilitates the continuous integration and continuous delivery (CI/CD) of software projects. It helps developers automate the building, testing, and deployment of their code, leading to faster and more reliable software development and deployment processes.

**Installing Jenkins on Ubuntu**

 To install Jenkins on an Ubuntu machine

Step 1 : Update Package Lists : Make sure your package lists are up-to-date:
sudo apt update

Step 2 : Install Java : Jenkins requires Java to run. You can install OpenJDK:
sudo apt install openjdk-11-jdk

Step 3: Add Jenkins Repository and Key : Add the Jenkins repository key to your system:
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add –

Add the Jenkins repository to the sources list:
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

Step 4: Install Jenkins : Update your package lists again and install Jenkins:
sudo apt update
sudo apt install jenkins

Step 5: Start Jenkins : Start the Jenkins service:
sudo systemctl start jenkins

Enable Jenkins to start on boot:
sudo systemctl enable jenkins

Step 6: Open Jenkins in your browser : Jenkins runs on port 8080 by default. Open your web browser and navigate to:
http://your_server_ip_or_domain:8080

You will be prompted to unlock Jenkins. Retrieve the initial administrator password by running:

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

**Installing Jenkins on java**

The following software installed:
    Java 11 or Java 17
    Docker (navigate to Get Docker site to access the Docker download that’s suitable for your platform)

Download and run Jenkins
    Download Jenkins Generic Java package (.war)
    Open up a terminal in the download directory
    Run java -jar jenkins.war --httpPort=8080
    Browse to http://localhost:8080

**Master-Slave (or Master-Agent) Architecture**

This architecture involves a central Jenkins instance known as the "master" and one or more remote Jenkins instances known as "slaves" or "agents." The master is responsible for managing job scheduling, configuration, user interfaces, and the overall coordination of the build and deployment processes. Slaves (or agents) are separate machines that perform the actual build, test, and deployment tasks assigned by the master.

**Node Slave**

In Jenkins, a "node" is essentially a machine that can execute Jenkins jobs. Nodes can refer to both the master and any of the connected slave machines. Each node, whether it's the master or a slave, can have specific configurations, labels, and capabilities. When a node is configured as a slave, it can be assigned specific tasks by the master.

**System Configuration**

In Jenkins, the "System Configuration" refers to the global settings and configurations that affect the overall behavior and functionality of the Jenkins instance. These settings are not specific to individual jobs or projects but impact how Jenkins operates as a whole. System configuration covers a wide range of options and settings that help you customize Jenkins according to your needs.

**Security**

Jenkins has a security mechanism in place so that the administrator of Jenkins can control who gets access to what part of Jenkins

**Pipelines**

In Jenkins, a "pipeline" refers to a series of automated steps that define the build, test, and deployment process for your software projects

Declarative Pipeline:
Declarative pipelines are designed to provide a simpler and more concise syntax for defining your pipeline stages and steps. They use a structured syntax that allows you to define stages, steps, and post-build actions. Declarative pipelines are easier to read and maintain, making them a great choice for most pipeline scenarios.

Scripted Pipeline:
Scripted pipelines, also known as "Groovy pipelines," provide more flexibility and control by allowing you to write custom Groovy scripts to define your pipeline logic. You have full programmatic control over every aspect of the pipeline. While powerful, scripted pipelines can be more complex to manage and debug compared to declarative pipelines.



  
  
  