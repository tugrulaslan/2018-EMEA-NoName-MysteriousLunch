import os
import json
from flask import Flask
from flask import Blueprint
from flask import request
from flask import current_app, g

from .encoder import AlchemyEncoder
from hungry.api.models import User, Cuisine, Interest

api = Blueprint('API_v1', __name__)

@api.route("/")
def hello():
    return api.name

@api.route("/interests", methods=['GET'])
def interests():
    q = Interest.query.all()
    return json.dumps(q, cls=AlchemyEncoder)

@api.route("/cuisines", methods=['GET'])
def cuisines():
    cuisines = Cuisine.query.all()
    return json.dumps(cuisines, cls=AlchemyEncoder)

@api.route("/cuisine/<definition>", methods=['GET'])
def cuisine(definition):
    cuisine = Cuisine.query.filter(Cuisine.definition == definition).first()
    return json.dumps(cuisine, cls=AlchemyEncoder)

@api.route("/users", methods=['GET', 'POST'])
def user():
    if request.method == 'POST':
        data = request.data
        dataDict = json.loads(data)
        print(dataDict)
        user = User(**dataDict)
        db_session.add(user)
        db_session.commit()
        return str(user)
    else:
        users = User.query.all()
        return json.dumps(users, cls=AlchemyEncoder)

@api.route("/users/<username>", methods=['GET', 'POST'])
def user_by_name(username):
    if request.method == 'POST':
        # TODO: update existing entry
        return "updated " + userid
    else:
        # get 
        user = User.query.filter(User.username == username).first()
        print(user)
        return json.dumps(user, cls=AlchemyEncoder)