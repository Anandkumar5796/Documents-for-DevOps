**Grafana Overview**

Grafana is a multi-platform open source analytics and interactive visualization web application. It provides charts, graphs, and alerts for the web when connected to supported data sources.

**Installing Grafana using Docker Images**

Pull the Grafana Docker Image:
Open your terminal and run the following command to pull the Grafana Docker image from Docker Hub:
1.docker pull grafana/grafana

Run Grafana Container:
Once the image is downloaded, you can run a Grafana container using the following command:
2.docker run -d -p 3000:3000 --name=grafana grafana/grafana
Explanation of flags used in the command:
    -d: Run the container in detached mode.
    -p 3000:3000: Map port 3000 from the container to port 3000 on your host machine. Grafana's web interface runs on port 3000 by default.
    --name=grafana: Assign the name "grafana" to the running container.

3.Access Grafana Web Interface:
After running the container, you can access the Grafana web interface by opening a web browser and navigating to http://localhost:3000. The default login credentials are:
    Username: admin
    Password: admin

**Installing Grafana using Helm-Charts**

helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana stable/grafana
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-ext
minikube service grafana-ext

To get user name and password in Grafana:

kubectl get secret --namespace default grafana -o yaml
echo "RkpwY21aTFNXRDVJN3Z4RWFFUjlibkV1SDBDbnFBendadmc0bmROZQ==" | openssl base64 -d ; echo

Dashboards: https://grafana.com/grafana/dashboards/6417
Grafana playlist: https://www.youtube.com/playlist?list=PLVx1qovxj-akOGKSoQ5sGc5ZRfH8Tpnow

**Componets of Grafana**

Grafana is a monitoring and visualization platform that comprises various components to provide a comprehensive solution for data visualization, dashboarding, and alerting. Here are the key components of Grafana:

Grafana Server : The core component responsible for managing user authentication, dashboards, data sources, plugins, and visualization rendering.

Datasources : Datasources are connectors to various data backends (databases, APIs, etc.). Grafana supports a wide range of datasources, including popular databases like Prometheus, InfluxDB, MySQL, Elasticsearch, etc.

Dashboards : Dashboards are visual collections of panels that display data from datasources. They allow you to create customized views of your data and insights. Grafana dashboards can include graphs, tables, alerts, and other visualizations.

Panels : Panels are individual visual elements within a dashboard that display specific metrics or data. Different types of panels include Graph, Table, SingleStat, Heatmap, and more.

Alerting : Grafana allows you to set up alert rules based on specified conditions. When these conditions are met, Grafana can send notifications through various channels like email, Slack, or other integrations.

Templating : Templating allows you to create dynamic dashboards that can change based on selected variables. For example, you can create a templated dashboard to view data for different servers or time ranges.

Plugins : Grafana supports a plugin architecture that enables the integration of additional features and datasources. There are many community-contributed plugins available, and you can also develop your own custom plugins.

Explore : The Explore feature in Grafana provides an interactive interface to query and visualize data from your datasources. It helps you explore your data before creating formal dashboards.

Annotations : Annotations allow you to mark specific points or ranges on a graph with metadata. This is useful for adding context to your data, like indicating deployments, incidents, or other events.

API and HTTP Endpoints : Grafana provides RESTful APIs and HTTP endpoints that allow programmatic interactions with its features. This can be useful for automating tasks or integrating Grafana with other tools.

    Users and Permissions : Grafana supports user authentication and role-based access control. You can configure different levels of access and permissions for users and teams.

    Organizations : Organizations in Grafana provide a way to separate and manage different groups of users, along with their respective dashboards and settings.



**Grfana dashbaord query**

{namespace="$namespace", container=~"$container"}|~ ".*$search.*" | json log="log" | line_format `{{.log}}`