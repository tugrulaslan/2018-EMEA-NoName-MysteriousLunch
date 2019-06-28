from hungry.api.models import User#, Cuisine, Interest

class LunchMatcher(object):
    def match(username):
        user = User.query.filter(User.username == username).first()
        return user