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
                    To install Nginx on an Ubuntu machine
Step 1: Update Package Lists : Ensure that your package lists are up-to-date:
sudo apt update
Step 2: Install Nginx : Install Nginx using the following command:
sudo apt install nginx
Step 3: Start Nginx : Once the installation is complete, start the Nginx service:
sudo systemctl start nginx
Step 4: Enable Nginx to Start on Boot : Enable Nginx to start automatically when the system boots:
sudo systemctl enable nginx
Step 5: Check Nginx Status : Verify that Nginx is running without errors:
sudo systemctl status nginx
This should display information indicating that Nginx is active and running.
Step 6: Adjust Firewall Settings (if applicable) : If you have a firewall enabled, you might need to allow traffic on port 80 (HTTP) and 443 (HTTPS). Use the following commands to open these ports:
sudo ufw allow 'Nginx Full'
Additional Configuration (Optional)
•	Configuration File: Nginx configuration files are located in the /etc/nginx directory. The main configuration file is nginx.conf.
•	Website Configuration: You can create specific configurations for your websites by adding configuration files in the /etc/nginx/sites-available directory and creating symbolic links in the /etc/nginx/sites-enabled directory.
•	For Sample Nginx web file 
•	/etc/nginx/sites-available


server {
    listen 80;
    server_name jenkins.validus.vn;
    return 301 https://jenkins.validus.vn$request_uri;
       }
server {
        listen 443 ssl;
        server_name jenkins.validus.vn;
    location / {
        proxy_pass http://localhost:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        client_max_body_size 200m;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
  ssl_certificate /home/ubuntu/ssl/certificate.crt;
  ssl_certificate_key /home/ubuntu/ssl/private.key;
}
                    To Configure EKS-Cluster in Jenkins Machine 
We have to follow two methods
1. Method -1 Create K8S API Token and add Token in Jenkins (secret textfile)
This is for official document 
https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html
Step 1 : Verify have Kubectl : Determine whether you already have kubectl installed on your device.
kubectl version –client
Step 2 : To install or update kubectl on Linux : 
A .Download the kubectl binary for your cluster's Kubernetes version from Amazon S3.
Kubernetes 1.28 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.28.5/2024-01-04/bin/linux/amd64/kubectl
Kubernetes 1.27 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.9/2024-01-04/bin/linux/amd64/kubectl
Kubernetes 1.26 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.26.12/2024-01-04/bin/linux/amd64/kubectl
Kubernetes 1.25 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.25.16/2024-01-04/bin/linux/amd64/kubectl
Kubernetes 1.24 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.17/2024-01-04/bin/linux/amd64/kubectl
Kubernetes 1.23 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.17/2024-01-04/bin/linux/amd64/kubectl
B. (Optional) Verify the downloaded binary with the SHA-256 checksum for your binary. 
1. Download the SHA-256 checksum for your cluster's Kubernetes version from Amazon S3 using the command for your device's hardware platform. The first link for each version is for amd64 and the second link is for arm64.
Kubernetes 1.28 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.28.5/2024-01-04/bin/linux/amd64/kubectl.sha256
Kubernetes 1.27 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.9/2024-01-04/bin/linux/amd64/kubectl.sha256
Kubernetes 1.26 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.26.12/2024-01-04/bin/linux/amd64/kubectl.sha256
Kubernetes 1.25 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.25.16/2024-01-04/bin/linux/amd64/kubectl.sha256
Kubernetes 1.24 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.17/2024-01-04/bin/linux/amd64/kubectl.sha256
Kubernetes 1.23 : curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.17/2024-01-04/bin/linux/amd64/kubectl.sha256
2. Check the SHA-256 checksum for your downloaded binary with one of the following commands.
sha256sum -c kubectl.sha256
When using this command, make sure that you see the following output:
kubectl: OK
openssl sha1 -sha256 kubectl
When using this command, make sure that the generated checksum in the output matches in the checksum in the downloaded kubectl.sha256 file.
C. Apply execute permissions to the binary.
chmod +x ./kubectl
D. Copy the binary to a folder in your PATH. If you have already installed a version of kubectl, then we recommend creating a $HOME/bin/kubectl and ensuring that $HOME/bin comes first in your $PATH.
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
E. (Optional) Add the $HOME/bin path to your shell initialization file so that it is configured when you open a shell.
Note : This step assumes you are using the Bash shell; if you are using another shell, change the command to use your specific shell initialization file.
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
Step 3 : After you install kubectl, you can verify its version.
kubectl version –client
Step 4 :  You need configure AWS credentials in Jenkins machine
This is for official document 
https://repost.aws/knowledge-center/eks-cluster-connection
aws configure
Step 5 :  Add and update your cluster in Jenkins
aws eks update-kubeconfig --region region-code --name my-cluster
                   
              To Configure Jenkins in EKS Cluster for Deployments 
Step 1 : To create a Service Account using a YAML file in Kubernetes
vi service-account.yml
apiVersion: v1
kind: ServiceAccount
metadata:
      name: your service account name
      namespace: your-namespace   # Optional: Specify the namespace
kubectl apply -f service-account.yml
Step 2 : To create a Secret file using a YAML file in Kubernetes
vi secret-token.yml
apiVersion: v1
kind: Secret
type: kubernetes.io/service-account-token
metadata:
      name: your secret name
      namespace: your namespace
      annotations:
               kubernetes.io/service-account.name: "your service account"
     type: kubernetes.io/service-account-token
kubectl apply -f secret-token.yml
Step 3 : To Create Rolebinding for service account
vi rolebinding.yml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: defalut
  name: jenkins-deployment-role
rules:
- apiGroups:
  - ""
  - batch
  - extensions
  - apps
  - autoscaling
  resources:
  - secrets
  - deployments
  - replicasets
  - pods
  - pods/exec
  - pods/log
  - pods/portforward
  - configmaps
  - services
  - endpoints
  - crontabs
  - persistentvolume
  - horizontalpodautoscalers
  - namespaces
  - jobs
  - jobs/batch
  verbs:
  - get
  - describe
  - list
  - watch
  - create
  - update
  - patch
  - delete
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: jenkins-deployment-rolebinding
  namespace: default
subjects:
- kind: ServiceAccount
  name: jenkins
  namespace: default
roleRef:
  kind: Role
  name: jenkins-deployment-role
  apiGroup: rbac.authorization.k8s.io

kubectl apply -f rolebinding.yml
Step 4 : To view Secret Token for add in jenkins
kubectl get secrets your service acc name -o go-template='{{index .data "token"}}' -n your namespace | base64 -d
step 5 : Copy from above Token and paste in to Jenkins under credentials 
2. Method -2 Add K8S End point in Jenkins (secret textfile)
Step 01 : Go to Jenkins machine take copy of server url 
cd /.kube 
cat config
copy = server url : 
step 2 : Copy from above server url and paste in to Jenkins under credentials 

To deploy the AWS Load Balancer Controller to an Amazon EKS cluster
This is for official document 
https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html
Step 1 : Create an IAM policy 
a. ) Download an IAM policy for the AWS Load Balancer Controller that allows it to make calls to AWS APIs on your behalf.
AWS GovCloud (US-East) or AWS GovCloud (US-West) AWS Regions

$ curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy_us-gov.json

All other AWS Regions

$ curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5


b.) Create an IAM policy using the policy downloaded in the previous step. If you downloaded iam_policy_us-gov.json, change iam_policy.json to iam_policy_us-gov.json before running the command.

$ aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
  Note :  after apply this command you need to login the aws console and choose iam service under policy just click on our aws policy remove their warnings and add ELB and provide all resources 

Step 2 : Create an IAM role
Create an IAM role. Create a Kubernetes service account named aws-load-balancer-controller in the kube-system namespace for the AWS Load Balancer Controller and annotate the Kubernetes service account with the name of the IAM role.
You can use eksctl or the AWS CLI and kubectl to create the IAM role and Kubernetes service account.

Replace my-cluster with the name of your cluster, 111122223333 with your account ID, and then run the command. If your cluster is in the AWS GovCloud (US-East) or AWS GovCloud (US-West) AWS Regions, then replace arn:aws: with arn:aws-us-gov:.

$ eksctl create iamserviceaccount \
  --cluster=my-cluster \
  --region=my-region 
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::111122223333:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
Note : You have to change your cluster name and iam policy arn and also replace you cluster region name as well 





Step 3 : Optional 
Step 4 : Optional

Step 5 : Install the AWS Load Balancer Controller
Install the AWS Load Balancer Controller using Helm V3 or later or by applying a Kubernetes manifest. If you want to deploy the controller on Fargate, use the Helm procedure. The Helm procedure doesn't depend on cert-manager because it generates a self-signed certificate.

a ) Install cert-manager using one of the following methods to inject certificate configuration into the webhooks. For more information, see Getting Started on the cert-manager Documentation.
If your nodes have access to the quay.io container registry, install cert-manager to inject certificate configuration into the webhooks.

$ kubectl apply \
    --validate=false \
    -f https://github.com/jetstack/cert-manager/releases/download/v1.13.3/cert-manager.yaml

$ kubectl get pods -n cert-manager 

 Note : Make sure you should have after run this command 3 pods are run in activate state 

Make sure you should have compulsory private and public subnets tags 

Skip below points jump to b 


b ) Install the controller 
 1. Download the controller specification. For more information about the controller, see the documentation on GitHub.

curl -Lo v2_5_4_full.yaml https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.5.4/v2_5_4_full.yaml



2. Make the following edits to the file.
 ! ) If you downloaded the v2_5_4_full.yaml file, run the following command to remove the ServiceAccount section in the manifest. If you don't remove this section, the required annotation that you made to the service account in a previous step is overwritten. Removing this section also preserves the service account that you created in a previous step if you delete the controller.

$ sed -i.bak -e '596,604d' ./v2_5_4_full.yaml

!! ) Replace your-cluster-name in the Deployment spec section of the file with the name of your cluster by replacing my-cluster with the name of your cluster.

Note : Make sure replace your cluster name in my-cluser

$ sed -i.bak -e 's|your-cluster-name|my-cluster|' ./v2_5_4_full.yaml
!!! ) Apply the file. 
$ kubectl apply -f v2_5_4_full.yaml
!V )  Download the IngressClass and IngressClassParams manifest to your cluster.
curl -Lo v2_5_4_ingclass.yaml https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.5.4/v2_5_4_ingclass.yaml
V ) Apply the manifest to your cluster.
kubectl apply -f v2_5_4_ingclass.yaml
Step 6 : Verify that the controller is installed.
kubectl get deployment -n kube-system aws-load-balancer-controller
An example output is as follows.

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
aws-load-balancer-controller   2/2     2            2           84s




Step 7 : Create ingress-nginx file 
vi ingress-nginx.yml
apiVersion: v1
kind: Namespace
metadata:
  labels:
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
  name: ingress-nginx
---
apiVersion: v1
automountServiceAccountToken: true
kind: ServiceAccount
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx
  namespace: ingress-nginx
---
apiVersion: v1
kind: ServiceAccount
metadata:
  labels:
    app.kubernetes.io/component: admission-webhook
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-admission
  namespace: ingress-nginx
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx
  namespace: ingress-nginx
rules:
- apiGroups:
  - ""
  resources:
  - namespaces
  verbs:
  - get
- apiGroups:
  - ""
  resources:
  - configmaps
  - pods
  - secrets
  - endpoints
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - ""
  resources:
  - services
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - networking.k8s.io
  resources:
  - ingresses
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - networking.k8s.io
  resources:
  - ingresses/status
  verbs:
  - update
- apiGroups:
  - networking.k8s.io
  resources:
  - ingressclasses
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - ""
  resourceNames:
  - ingress-controller-leader
  resources:
  - configmaps
  verbs:
  - get
  - update
- apiGroups:
  - ""
  resources:
  - configmaps
  verbs:
  - create
- apiGroups:
  - coordination.k8s.io
  resourceNames:
  - ingress-controller-leader
  resources:
  - leases
  verbs:
  - get
  - update
- apiGroups:
  - coordination.k8s.io
  resources:
  - leases
  verbs:
  - create
- apiGroups:
  - ""
  resources:
  - events
  verbs:
  - create
  - patch
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  labels:
    app.kubernetes.io/component: admission-webhook
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-admission
  namespace: ingress-nginx
rules:
- apiGroups:
  - ""
  resources:
  - secrets
  verbs:
  - get
  - create
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  labels:
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx
rules:
- apiGroups:
  - ""
  resources:
  - configmaps
  - endpoints
  - nodes
  - pods
  - secrets
  - namespaces
  verbs:
  - list
  - watch
- apiGroups:
  - coordination.k8s.io
  resources:
  - leases
  verbs:
  - list
  - watch
- apiGroups:
  - ""
  resources:
  - nodes
  verbs:
  - get
- apiGroups:
  - ""
  resources:
  - services
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - networking.k8s.io
  resources:
  - ingresses
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - ""
  resources:
  - events
  verbs:
  - create
  - patch
- apiGroups:
  - networking.k8s.io
  resources:
  - ingresses/status
  verbs:
  - update
- apiGroups:
  - networking.k8s.io
  resources:
  - ingressclasses
  verbs:
  - get
  - list
  - watch
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  labels:
    app.kubernetes.io/component: admission-webhook
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-admission
rules:
- apiGroups:
  - admissionregistration.k8s.io
  resources:
  - validatingwebhookconfigurations
  verbs:
  - get
  - update
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx
  namespace: ingress-nginx
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: ingress-nginx
subjects:
- kind: ServiceAccount
  name: ingress-nginx
  namespace: ingress-nginx
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  labels:
    app.kubernetes.io/component: admission-webhook
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-admission
  namespace: ingress-nginx
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: ingress-nginx-admission
subjects:
- kind: ServiceAccount
  name: ingress-nginx-admission
  namespace: ingress-nginx
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  labels:
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: ingress-nginx
subjects:
- kind: ServiceAccount
  name: ingress-nginx
  namespace: ingress-nginx
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  labels:
    app.kubernetes.io/component: admission-webhook
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-admission
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: ingress-nginx-admission
subjects:
- kind: ServiceAccount
  name: ingress-nginx-admission
  namespace: ingress-nginx
---
apiVersion: v1
data:
  allow-snippet-annotations: "true"
kind: ConfigMap
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-controller
  namespace: ingress-nginx
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-controller
  namespace: ingress-nginx
spec:
  ports:
  - appProtocol: http
    name: http
    port: 80
    protocol: TCP
    targetPort: http
  - appProtocol: https
    name: https
    port: 443
    protocol: TCP
    targetPort: https
  selector:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
  type: NodePort
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-controller-admission
  namespace: ingress-nginx
spec:
  ports:
  - appProtocol: https
    name: https-webhook
    port: 443
    targetPort: webhook
  selector:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
  type: ClusterIP
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-controller
  namespace: ingress-nginx
spec:
  minReadySeconds: 0
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app.kubernetes.io/component: controller
      app.kubernetes.io/instance: ingress-nginx
      app.kubernetes.io/name: ingress-nginx
  template:
    metadata:
      labels:
        app.kubernetes.io/component: controller
        app.kubernetes.io/instance: ingress-nginx
        app.kubernetes.io/name: ingress-nginx
    spec:
      containers:
      - args:
        - /nginx-ingress-controller
        - --publish-service=$(POD_NAMESPACE)/ingress-nginx-controller
        - --election-id=ingress-controller-leader
        - --controller-class=k8s.io/ingress-nginx
        - --ingress-class=nginx
        - --configmap=$(POD_NAMESPACE)/ingress-nginx-controller
        - --validating-webhook=:8443
        - --validating-webhook-certificate=/usr/local/certificates/cert
        - --validating-webhook-key=/usr/local/certificates/key
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        - name: LD_PRELOAD
          value: /usr/local/lib/libmimalloc.so
        image: registry.k8s.io/ingress-nginx/controller:v1.3.1@sha256:54f7fe2c6c5a9db9a0ebf1131797109bb7a4d91f56b9b362bde2abd237dd1974
        imagePullPolicy: IfNotPresent
        lifecycle:
          preStop:
            exec:
              command:
              - /wait-shutdown
        livenessProbe:
          failureThreshold: 5
          httpGet:
            path: /healthz
            port: 10254
            scheme: HTTP
          initialDelaySeconds: 10
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
        name: controller
        ports:
        - containerPort: 80
          name: http
          protocol: TCP
        - containerPort: 443
          name: https
          protocol: TCP
        - containerPort: 8443
          name: webhook
          protocol: TCP
        readinessProbe:
          failureThreshold: 3
          httpGet:
            path: /healthz
            port: 10254
            scheme: HTTP
          initialDelaySeconds: 10
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
        resources:
          requests:
            cpu: 100m
            memory: 90Mi
        securityContext:
          allowPrivilegeEscalation: true
          capabilities:
            add:
            - NET_BIND_SERVICE
            drop:
            - ALL
          runAsUser: 101
        volumeMounts:
        - mountPath: /usr/local/certificates/
          name: webhook-cert
          readOnly: true
      dnsPolicy: ClusterFirst
      nodeSelector:
        kubernetes.io/os: linux
      serviceAccountName: ingress-nginx
      terminationGracePeriodSeconds: 300
      volumes:
      - name: webhook-cert
        secret:
          secretName: ingress-nginx-admission
---
apiVersion: batch/v1
kind: Job
metadata:
  labels:
    app.kubernetes.io/component: admission-webhook
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-admission-create
  namespace: ingress-nginx
spec:
  template:
    metadata:
      labels:
        app.kubernetes.io/component: admission-webhook
        app.kubernetes.io/instance: ingress-nginx
        app.kubernetes.io/name: ingress-nginx
        app.kubernetes.io/part-of: ingress-nginx
        app.kubernetes.io/version: 1.3.1
      name: ingress-nginx-admission-create
    spec:
      containers:
      - args:
        - create
        - --host=ingress-nginx-controller-admission,ingress-nginx-controller-admission.$(POD_NAMESPACE).svc
        - --namespace=$(POD_NAMESPACE)
        - --secret-name=ingress-nginx-admission
        env:
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        image: registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.3.0@sha256:549e71a6ca248c5abd51cdb73dbc3083df62cf92ed5e6147c780e30f7e007a47
        imagePullPolicy: IfNotPresent
        name: create
        securityContext:
          allowPrivilegeEscalation: false
      nodeSelector:
        kubernetes.io/os: linux
      restartPolicy: OnFailure
      securityContext:
        fsGroup: 2000
        runAsNonRoot: true
        runAsUser: 2000
      serviceAccountName: ingress-nginx-admission
---
apiVersion: batch/v1
kind: Job
metadata:
  labels:
    app.kubernetes.io/component: admission-webhook
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-admission-patch
  namespace: ingress-nginx
spec:
  template:
    metadata:
      labels:
        app.kubernetes.io/component: admission-webhook
        app.kubernetes.io/instance: ingress-nginx
        app.kubernetes.io/name: ingress-nginx
        app.kubernetes.io/part-of: ingress-nginx
        app.kubernetes.io/version: 1.3.1
      name: ingress-nginx-admission-patch
    spec:
      containers:
      - args:
        - patch
        - --webhook-name=ingress-nginx-admission
        - --namespace=$(POD_NAMESPACE)
        - --patch-mutating=false
        - --secret-name=ingress-nginx-admission
        - --patch-failure-policy=Fail
        env:
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        image: registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.3.0@sha256:549e71a6ca248c5abd51cdb73dbc3083df62cf92ed5e6147c780e30f7e007a47
        imagePullPolicy: IfNotPresent
        name: patch
        securityContext:
          allowPrivilegeEscalation: false
      nodeSelector:
        kubernetes.io/os: linux
      restartPolicy: OnFailure
      securityContext:
        fsGroup: 2000
        runAsNonRoot: true
        runAsUser: 2000
      serviceAccountName: ingress-nginx-admission
---
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: nginx
spec:
  controller: k8s.io/ingress-nginx
---
apiVersion: admissionregistration.k8s.io/v1
kind: ValidatingWebhookConfiguration
metadata:
  labels:
    app.kubernetes.io/component: admission-webhook
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.1
  name: ingress-nginx-admission
webhooks:
- admissionReviewVersions:
  - v1
  clientConfig:
    service:
      name: ingress-nginx-controller-admission
      namespace: ingress-nginx
      path: /networking/v1/ingresses
  failurePolicy: Fail
  matchPolicy: Equivalent
  name: validate.nginx.ingress.kubernetes.io
  rules:
  - apiGroups:
    - networking.k8s.io
    apiVersions:
    - v1
    operations:
    - CREATE
    - UPDATE
    resources:
    - ingresses
  sideEffects: None

kubectl apply -f ingress-nginx.yml
Step 8 : Apply alb-ingress
vi alb-ingress.yml
Note : Make sure you have to replace the values of subnets and certificate arn
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: "alb-ingress"
  namespace: "ingress-nginx"
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/tags: Environment=Production,Billing Entity=Validus vietnam
    alb.ingress.kubernetes.io/load-balancer-attributes: deletion_protection.enabled=true
    alb.ingress.kubernetes.io/subnets: subnet-02051415d5b3a9a56, subnet-0cd992cae839ee633
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/certificate-arn: arn:aws:acm:ap-southeast-1:904377157493:certificate/bf1f4ab4-4627-414d-98a8-92b7f76923c9
    alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS":443}]'
    alb.ingress.kubernetes.io/actions.ssl-redirect: '{"Type": "redirect", "RedirectConfig": { "Protocol": "HTTPS", "Port": "443", "StatusCode": "HTTP_301"}}'
spec:
  ingressClassName: "nginx"
  rules:
    - http:
        paths:
          - path: /*
            backend:
              service:
                name: ssl-redirect
                port:
                 name: use-annotation
            pathType: ImplementationSpecific
          - path: /*
            backend:
              service:
                name: "ingress-nginx-controller"
                port:
                 number: 80
            pathType: ImplementationSpecific



