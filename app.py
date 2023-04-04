from flask import Flask,request,jsonify
from flask_sqlalchemy import SQLAlchemy
from extensions import db

#initialize the app
app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///project.db"


#initialize the database
db.init_app(app)


from controller import DobotController as dobot

#engine:[//[user[:password]@][host]/[dbname]]
# engine -> postgresql
# user -> postgres (see `owner` field in previous screenshot)
# password -> password (my db password is the string, `password`)
# host -> localhost (because we are running locally on out machine)
# dbname -> flasksql (this is the name I gave to the db in the previous step)


@app.route('/')
def api():
    return 'Hello World'

@app.post('/add')
def add():
    data = request.get_json()
    message = dobot().add(data)
    return {"message":message,"code":1}
       
@app.get('/get')
def get():
    message = dobot.get()
    return jsonify({"message":message,"code":3})
@app.get('/get_last')
def get_track():
 
    message = dobot.get_last()
    return message

@app.get('/move_to')
def move_to():
   
    message = dobot().move_to(**request.get_json())
    return jsonify({"message":message,"code":2})


if __name__ == '__main__':
    app.run(debug=True)