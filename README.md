## Usage
```
git clone
cd 
terraform init 
terraform apply --auto-approve
```

## Components
The terraform template will deploy :
1. <B>ResourceGroup</B> : The Azure ResourceGroup that will host our WebApp.
2. <B>App Service plan</B> : Our WebApp needs an AppServicePlan to run. Our SKU is premium.
3. <B>Linux Web App</B> : Our WebApp that will run a pyton application hosted in Dockerhub.

The python script :
This Python script is a simple Flask web application that serves as an Azure Web App. 
1. Flask Setup: It starts by importing the necessary modules from the Flask framework.

2. Flask App Initialization: It initializes a Flask application instance.

3. Template Folder Configuration: It sets the template folder to 'templates'. This folder will contain the HTML templates used for rendering web pages.

4. Default Event Data: It defines a default event data dictionary, which represents an example event with specific attributes like ID, eventType, subject, eventTime, data, and dataVersion.

5. Event Data Initialization: It initializes an event_data variable with a copy of the default_event_data. This variable will hold the event data displayed on the web page.

6. Routes:

6.a. The @app.route('/') decorator defines a route for the root URL ('/'). When accessed, it returns the text "Hello, Azure Web App!".
6.b. The @app.route('/event_data', methods=['GET', 'POST']) decorator defines a route for '/event_data'. This route handles both GET and POST requests.

7. view_event_data Function:

This function is executed when the '/event_data' URL is accessed.
If the request method is POST (indicating a custom event submission), it extracts the incoming JSON data and replaces the event_data variable with the custom event.
It then renders the 'event_data.html' template, passing the event_data as a variable.

8. Main Block: It checks if the script is executed directly (not imported as a module) and starts the Flask application, making it accessible on all available network interfaces ('0.0.0.0') on port 80.

## CLI Commands->

#### To create Azure WebApp deployment
``` bash
az webapp create --name <Name> --resource-group <Resource-group-Name> --plan <App-Service-plan-name> --deployment-container-image-name <Container-image-repo>
```

