**Helm-Charts Overview**

A Helm chart is a set of YAML manifests and templates that describes Kubernetes resources (Deployments, Secrets, CRDs, etc.) and defined configurations needed for the Kubernetes application, and is also easy to deploy in a Kubernetes cluster or in a single node with just one command

**Installing Helm**

sudo apt update

sudo apt install snapd

sudo snap install helm --classic

helm version

****Helm commands ****

helm create <chart-name>: Generates a new chart template with the specified name.

helm install <release-name> <chart-name>: Installs a chart as a new release with the given release name.

helm upgrade <release-name> <chart-name>: Upgrades an existing release with a new version of the chart.

helm rollback <release-name> <revision>: Rolls back a release to a previous revision.

helm uninstall <release-name>: Uninstalls a release and its resources from the cluster.

helm ls: Lists all releases and their statuses.

helm status <release-name>: Displays the status of a release.

helm package <chart-directory>: Packages a chart directory into a versioned chart archive (.tgz).

helm repo add <repository-name> <repository-url>: Adds a new repository to Helm's list of repositories.

helm repo list : Display all helm repo's

helm repo remove <chart-name> : Remove the helm repo's

helm repo update: Updates the local repository cache to reflect the latest available charts.

helm search repo <chart-name>: Searches for a chart in the configured Helm repositories.

helm inspect values <chart-name>: Displays the default configuration values for a chart.

helm inspect chart <chart-name>: Displays metadata and information about a chart.

helm template <release-name> <chart-name>: Generates and displays Kubernetes YAML manifests for a chart, without installing it.

helm fetch <chart-name>: Downloads a chart from a repository without installing it.

helm history <release-name>: Displays the revision history of a release.

helm lint <chart-directory>: Checks the syntax and validity of a chart's files.

helm dependency update <chart-directory>: Updates the dependencies of a chart.

helm plugin install <plugin-name>: Installs a Helm plugin.


