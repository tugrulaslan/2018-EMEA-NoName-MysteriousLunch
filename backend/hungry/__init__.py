import os
import json
from flask import Flask
from flask import request
from flask import current_app, g

from hungry.database import db_session
from hungry.models import User, Cuisine
from hungry.encoder import AlchemyEncoder

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route("/")
    def hello():
        return "Hello World!"
    
    @app.route("/cuisines", methods=['GET'])
    def cuisines():
        cuisines = Cuisine.query.all()
        return json.dumps(cuisines, cls=AlchemyEncoder)

    @app.route("/cuisine/<definition>", methods=['GET'])
    def cuisine(definition):
        cuisine = Cuisine.query.filter(Cuisine.definition == definition).first()
        return json.dumps(cuisine, cls=AlchemyEncoder)

    @app.route("/user", methods=['POST'])
    def user():
        data = request.data
        dataDict = json.loads(data)
        print(dataDict)
        user = User(**dataDict)
        db_session.add(user)
        db_session.commit()
        return 'POST'

    @app.route("/user/<username>", methods=['GET', 'POST'])
    def user_by_name(username):
        if request.method == 'POST':
            # TODO: update existing entry
            return "updated " + userid
        else:
            # get 
            user = User.query.filter(User.username == username).first()
            return json.dumps(user, cls=AlchemyEncoder)

    @app.teardown_appcontext
    def shutdown_session(exception=None):
        db_session.remove()

    return app    