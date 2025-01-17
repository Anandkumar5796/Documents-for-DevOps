**Kubernetes overview**

Kubernetes, also known as "K8s", is an open-source container orchestration platform developed by Google. 

kubernetes It is designed to automate the deployment, scaling, and management of containerized applications across a cluster of nodes. 

Kubernetes provides a consistent and reliable way to manage applications, regardless of whether they are running on-premises, in the cloud, or in hybrid environments

**Kubernetes main Components** 

1.Master Components:
These components manage the overall Kubernetes cluster.
kube-apiserver: The API server exposes the Kubernetes API and is the entry point for all control operations in the cluster.
etcd: A distributed key-value store used to store configuration data and state information for the entire cluster.
kube-scheduler: Responsible for assigning pods to nodes based on resource availability and constraints.
kube-controller-manager: Runs various control loops that regulate the state of the system. Examples include node controller, replication controller, and service account controller.
cloud-controller-manager: Integrates the cluster with the cloud provider's API, handling features like node provisioning, load balancing, and storage management.

2.Node Components:
These components run on each node and manage the containers and their associated resources.
kubelet: Communicates with the API server to ensure that containers are running in a pod. It manages the containers' lifecycle, monitors their health, and takes actions based on the desired state.
kube-proxy: Maintains network rules to manage network connectivity to and from pods.
Container Runtime: The software responsible for running containers, such as Docker, containerd, or CRI-O.

3.Add-ons:
Add-ons provide additional features and functionality to the Kubernetes cluster.
DNS (CoreDNS): Provides DNS-based service discovery for pods and services in the cluster.
Dashboard: A web-based graphical user interface for managing and monitoring the cluster.
Ingress Controller: Manages external access to services within the cluster using HTTP and HTTPS routing rules.
Monitoring and Logging: Various tools like Prometheus and Fluentd are used for monitoring and logging applications.
Networking Solutions: Plugins like Calico, Flannel, and Weave provide network connectivity between pods and nodes.

4.Persistent Storage:
Kubernetes provides various options for persistent storage.
Persistent Volumes (PV): Abstracts physical storage resources and provides a way to attach and manage them within pods.
Persistent Volume Claims (PVC): A request for a specific amount of storage with specific access modes. PVCs are used by pods to request storage.

**Kubernets list of key resources and concepts in Kubernetes:**

1.CPU (Central Processing Unit) : Represents the processing power allocated to containers. Measured in CPU units or cores.Managed using requests and limits in pod specifications.

2.Memory : Represents the RAM allocated to containers.Measured in bytes, with common suffixes (e.g., Mi, Gi) for megabytes and gigabytes.Managed using requests and limits in pod specifications.

3.Storage : Persistent Volumes (PVs) and Persistent Volume Claims (PVCs) manage storage resources.Allows data to persist beyond pod lifecycle.

4.Pods : In Kubernetes, a "pod" is the smallest and most basic unit of deployment. 
It represents a single instance of a running process within the cluster. 
kubernetes A pod encapsulates one or more containers, storage resources, network confiqurations, and other options required to run a specific set of containers together. 
Pods are typically created and managed using higher level abstractions such as Deployments, ReplicaSets, or StatefulSets, which provide additional features like scaling, rolling updates, and self-healing capabilities. 
Pods provide several benefits, including resource isolation, flexible deployment strategies, easy scaling, and enhanced reliability..

5.Deployments : In Kubernetes, a Deployment is an object that provides declarative updates and management for a set of replica Pods. 
kubernetes When you create a Deployment, you specify the desired state by defining the container images, number of of replicas, and other configuration parameters. 
Kubernetes then ensures that the actual state matches the desired state. 
If there are any discrepancies, Kubernetes automatically takes action to reconcile the state, creating or deleting Pods as necessary

6.ReplicaSet: In Kubernetes, a ReplicaSet is an object that ensures a specified number of replica Pods are running at any given time. 
kubernetes It is responsible for maintaining the desired replica count and managing the lifecycle of the Pods. ReplicaSets are typically used to manage stateless applications where individual instances of the application can be treated as interchangeable. 
They help in achieving high availability and scalability by automatically scaling the number of replicas up or down based on the defined specifications. 
nextops When you create a ReplicaSet, you specify the desired number of replicas and provide a template for creating the Pods.

6.Services : Provide network connectivity to a set of pods.Allow load balancing and service discovery.

7.ConfigMaps : In Kubernetes, a configmap is an API object used to store configuration data consumed by pods or other resources in a cluster. 
kubernetes provides a way to decouple configuration settings from containerized applications, making it easy to manage and update configuration data without modifying application code or container images. ConfigMaps store key-value pairs or provide the ability to mount configuration files as data. 
This may include environment variables, command-line arguments, configuration files, or any other configuration data required by your application.

8.Namespaces : Namespaces are a way to create virtual clusters within a physical cluster. They provide a way to divide cluster resources into logical groups, enabling multiple teams or applications to coexist and operate independently within the same Kubernetes cluster. kubernetes Namespaces help in organizing and isolating resources, improving resource utilization, and providing a level of separation between different environments, projects, or teams. They act as a scope for Kubernetes objects, such as pods, services, deployments, configmaps, and secrets. Each object in Kubernetes belongs to a specific namespace

9.Nodes : Physical or virtual machines that run containers. Managed by the Kubernetes control plane.

10.Control Plane Components : Consists of components like kube-apiserver, etcd, kube-scheduler, and kube-controller-manager.Manages the overall state of the cluster.

11.Network Policies : Define how pods are allowed to communicate with each other.Enforce security and network segmentation.

12.Volumes : Allows data to be shared and persisted between containers and pods.Various types include emptyDir, hostPath, and cloud provider-specific volumes.

13.Ingress : Manages external access to services within the cluster. Routes traffic based on rules and hostnames.

14.DaemonSets : Ensures that a specific pod runs on all (or specific) nodes in the cluster.Useful for system daemons or monitoring agents.

15.StatefulSets : StatefulSets in Kubernetes are a workload API object used to manage stateful applications Unlike the traditional deployment of stateless applications, stateful applications require stable and unique network identities, stable storage, and ordered and predictable deployment and scaling. kubernetes StatefulSets are commonly used for deploying and managing stateful applications such as databases (e.g., MySQL, PostgreSQL), messaging systems (e.g., Kafka), and other applications that require stable network identities and persistent storage.

Stateful Pod Scaling: StatefulSets support both vertical and horizontal scaling. Vertical scaling involves changing the resources (CPU and memory) allocated to each pod, while horizontal scaling involves adding or removing or removing pods from the StatefulSet. kubernetes Ordered Termination: Termination: When scaling down or terminating pods in a StatefulSet, Kubernetes ensures that the pods are terminated in the reverse order of their creation. This allows for orderly application shutdown and ensures data integrity and consistency

Stable Storage: StatefulSets provide stable and unique storage volumes for each pod. Persistent Volumes (PVs) and Persistent Volume Claims (PVCs) are used to provide storage to the pods, allowing data to be persisted and retained across pod restarts and rescheduling. kubernetes Headless Service: StatefulSets automatically create a Headless Service, which allows each pod to have its own DNS entry. This enables direct communication between pods using their unique hostnames

Stateful Pod Scaling: StatefulSets support both vertical and horizontal scaling. Vertical scaling involves changing the resources (CPU and memory) allocated to each pod, while horizontal scaling involves adding or removing or removing pods from the StatefulSet. kubernetes Ordered Termination: When scaling down or terminating pods in a StatefulSet, Kubernetes ensures that the pods are terminated in the reverse order of their creation. This allows for orderly application shutdown and ensures data integrity and consistency


16.Horizontal Pod Autoscaling : Automatically adjusts the number of replicas in a Deployment or ReplicationController based on resource utilization.

17.Vertical Pod Autoscaling : Adjusts the resource requests and limits of pods based on observed usage.

18.Pod Disruption Budgets : Define the number of pods that can be disrupted during voluntary disruptions.

19.Custom Resource Definitions (CRDs) : Extend the Kubernetes API to support custom resources and controllers.

20.Metrics and Monitoring : Kubernetes provides integration with monitoring tools like Prometheus for collecting cluster and application metrics.

21. Persistent Volume: Persistent Volume (PV) is a piece of storage provisioned in a cluster that can be dynamically allocated and administrators. managed by kubernetes PVs provide a way to decouple storage from the lifecycle of pods and allow data to persist beyond the lifetime of individual pods. Persistent Volumes serve as an abstraction layer between the physical storage (such as a network attached storage or local storage) and the application's need for storage. They enable applications to request storage resources without needing to know the details of the underlying infrastructure

PVs can be provisioned statically or dynamically. Static provisioning involves creating PVs in advance, kubernetes while dynamic provisioning allows PVs to be created on-demand when requested by the applications. Storage Classes: Dynamic provisioning of PVs is facilitated through the use of Storage Classes. Storage Classes define different classes of storage with specific characteristics (e.g., performance, access modes) and specify the provisioner responsible for dynamically creating the storage

22. Persistent Volume Claims (PVCs): Persistent Volume Claims (PVCs) in Kubernetes have three different reclaim policies that determine what happens to the associated Persistent Volume (PV) when the PVC is deleted or no longer needed. kubernetes Retain: With the "Retain" policy, the PV associated with the PVC is not automatically deleted or released when the PVC is deleted. Instead, the PV is retained, and its contents are preserved. Delete: The "Delete" policy indicates that the associated PV should be automatically deleted when the PVC is deleted. nextops Recycle (Deprecated): The "Recycle" policy is deprecated and no longer recommended for use.

**How to connect clsuter in local machine**

aws --version

aws sts get-caller-identity

aws eks --region example_region update-kubeconfig --name cluster_name

kubectl get pods --kubeconfig ./.kube/config

kubectl get svc

**List of all commands in Kubernetes**

1.Managing Resources:
    kubectl create -f deployment.yaml : Create a resource from a file, URL, or stdin.
    kubectl apply -f deployment.yaml : Apply changes to resources from files, URLs, or stdin. Used for creating and updating resources.
    kubectl get : Retrieve information about resources (pods, services, deployments, etc.).
    kubectl get pods -n <namespace>
    kubectl get services --all-namespaces
    kubectl get deployments -o wide
    kubectl describe : Provide detailed information about a resource, including events and statuses.
    kubectl describe pod my-pod
    kubectl describe service my-service
    kubectl delete : Delete resources by filename, stdin, resource and name, or by resources in a file.
    kubectl delete pod my-pod
    kubectl edit deployment my-deployment : Edit a resource in the default text editor (use with caution).
    kubectl logs pod -n namespace : Fetch logs from a container in a pod.
    kubectl exec -it pod -n namespace : Execute a command in a container in a pod.
    kubectl run <resource-name> --image=<image-name> : Create a deployment or job to run a particular image on the cluster.
    kubectl expose <resource-type> <resource-name> --port=<port> --target-port=<target-port> --type=<service-type> : Create a service to expose a deployment, pod, or replication controller.
    kubectl scale : Change the number of replicas in a deployment, replication controller, or statefulset.
    kubectl scale <resource-type>/<resource-name> --replicas=<desired-replicas>
    kubectl scale deployment/my-deployment --replicas=3
    kubectl rollout : Manage rollouts of updates to a deployment.
    kubectl rollout status <resource-type>/<resource-name>
    kubectl rollout pause <resource-type>/<resource-name>
    kubectl rollout resume <resource-type>/<resource-name>
    kubectl rollout undo <resource-type>/<resource-name>
    kubectl rollout status deployment/my-deployment
    kubectl port-forward : Forward local ports to a pod.
    kubectl port-forward <pod-name> <local-port>:<remote-port>
    kubectl port-forward my-pod 8081:8080
    kubectl attach : Attach to a running container in a pod.
    kubectl exec -it : Open an interactive shell to a container in a pod.

2.Configuration and Access:
    kubectl config : Manage kubeconfig files for cluster access and context management.
    kubectl cluster-info : Display information about the cluster, including master and services.
    kubectl api-resources : List all supported API resources on the server.
    kubectl api-versions : List all supported API versions on the server.
    kubectl auth : Manage user authentication configuration.
    kubectl auth can-i : Check permissions for a resource or action.
3.Interacting with Nodes:
    kubectl get nodes : Retrieve information about nodes in the cluster.
    kubectl describe node : Show detailed information about a node.
    kubectl cordon : Mark a node as unschedulable.
    kubectl uncordon : Mark a node as schedulable.
    kubectl drain : Drain a node of pods gracefully.

4.Networking:
    kubectl expose : Expose a port or service externally.
    kubectl port-forward : Forward one or more local ports to a pod.
    kubectl proxy : Run a proxy to the Kubernetes API server.
    kubectl ingress : Manage ingress resources for HTTP routing.

5.Namespace Management:
    kubectl create namespace : Create a new namespace.
    kubectl create namespace <namespace-name>
    kubectl get namespaces : List all namespaces.
    kubectl delete namespace : Delete a namespace and all its resources.

6.Troubleshooting and Debugging:
    kubectl describe : Get detailed information about a resource for troubleshooting.
    kubectl logs : Fetch logs from a container for debugging.
    kubectl exec : Execute commands in a container to investigate.
    kubectl get events : Retrieve events from the cluster for diagnosis.
    kubectl top : Display resource usage (CPU, memory) of pods and nodes.

**Deployment file**

A Deployment is a higher-level abstraction that manages the creation, scaling, and updating of replicas of your application's pods. It ensures that a specified number of replicas are running at all times, and it provides rolling updates for changes to your application's container images or configuration.

apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
  namespace: my-namespace
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-container
          image: my-image:latest
          ports:
            - containerPort: 8080

**Congigmap file**

A ConfigMap is used to store configuration data that can be consumed by pods or other resources within the cluster. This allows you to separate configuration from application code and manage it independently.

apiVersion: v1
kind: ConfigMap
metadata:
  name: my-configmap
  namespace: my-namespace
data:

**Service file**

Kubernetes Services are used to expose and access groups of pods in a consistent and reliable manner. A service file contains the configuration details needed to create and define the behavior of a service within the Kubernetes cluster.

apiVersion: v1
kind: Service
metadata:
  name: my-service
  namespace: my-namespace
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  type: ClusterIP

**Ingress file**

In Kubernetes, an Ingress is an API object that manages external access to services within your cluster. It provides a way to configure the routing of incoming HTTP and HTTPS traffic to different services based on hostnames and paths. An Ingress resource defines rules and settings for how traffic should be directed to backend services. To define these rules, you create an Ingress YAML file.

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
  namespace: my-namespace
spec:
  rules:
    - host: example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: my-service
                port:
                  number: 80

**Persistent Volume Claim**

 Persistent Volume Claim (PVC) is used to request a certain amount of storage from a Persistent Volume (PV), which is a cluster-level resource. PVCs abstract the underlying storage details and provide a way for applications to dynamically request storage resources without needing to know where or how the storage is provisioned

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
  namespace: my-namespace
spec:
  accessModes:
    - ReadWriteOnce  # The access mode for the volume
  resources:
    requests:
      storage: 1Gi   # The requested storage size

**Persistent Volume**

Persistent Volume (PV) is a cluster-level resource that represents a piece of storage in the cluster, such as a physical disk, a network-attached storage, or a cloud storage volume. PVs are used to provide persistent storage that can be dynamically claimed by Persistent Volume Claims (PVCs).

apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
  namespace: my-namespace
spec:
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: manual
  hostPath:
    path: /data/my-pv


**Kubernetes Dashboard**

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/





