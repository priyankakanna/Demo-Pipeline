from flask import Flask
app=Flask(_name_)

@app.route('/')
def hello():
    return "Hello from Flask app on Kuberenetes"

if _name_=='_main_':
    app.run(host='0.0.0.0',port=5000)

