from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

# A simple list to act as our "database" for now
tasks = [
    {"id": 1, "content": "Fix Docker Naming Conflict", "status": "Done"},
    {"id": 2, "content": "Repair Flask Template Error", "status": "Done"}
]

@app.route('/')
def index():
    return render_template('index.html', tasks=tasks)

@app.route('/add', methods=['POST'])
def add_task():
    task_content = request.form.get('content')
    if task_content:
        new_task = {"id": len(tasks) + 1, "content": task_content, "status": "Pending"}
        tasks.append(new_task)
    return redirect(url_for('index'))

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
