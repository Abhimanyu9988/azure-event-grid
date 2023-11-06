from flask import Flask, render_template, request

app = Flask(__name__)
app.template_folder = 'templates'
# Default event data
default_event_data = [
    {
        "id": "1",
        "eventType": "recordInserted",
        "subject": "myapp/before/event",
        "eventTime": "2023-10-30T12:00:00Z",
        "data": {
            "make": "Contoso",
            "model": "Monster"
        },
        "dataVersion": "1.0"
    }
]

# Initialize event_data with the default event
event_data = default_event_data.copy()

@app.route('/')
def hello():
    return "Hello, Azure Web App!"

@app.route('/event_data', methods=['GET', 'POST'])
def view_event_data():
    global event_data

    if request.method == 'POST':
        # Handle incoming custom event
        custom_event = request.get_json()
        event_data = [custom_event]  # Replace event_data with the custom event

    return render_template('event_data.html', event_data=event_data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
