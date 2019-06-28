import json
from sqlalchemy.ext.declarative import DeclarativeMeta
from hungry.api.models import Cuisine, Interest

class AlchemyDecoder(json.JSONDecoder):
    def __init__(self):
        json.JSONDecoder.__init__(self, object_hook=self.dict_to_object)

    def dict_to_object(self, d):
        fields = {}
        for k, v in d.items():
            print("{} -> {}".format(k, v))
            if k in ['interests', 'cuisines']:
                classname = k[:-1].capitalize()
                fields[k] = []
                for i in d[k]:
                    print(i)
                    if classname in globals():
                        constructor = globals()[classname]
                        fields[k].append(constructor(**i))
                fields[k] = []
            else:
                fields[k] = v
        return fields


class AlchemyEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj.__class__, DeclarativeMeta):
            # an SQLAlchemy class
            fields = {}
            for field in [x for x in dir(obj) if not x.startswith('_') and x != 'metadata']:
                if field in ['interests', 'cuisines']:
                    data = []
                    for i in obj.__getattribute__(field):
                       data.append(i.serialize)
                else:
                    data = obj.__getattribute__(field)

                try:
                    json.dumps(data) # this will fail on non-encodable values, like other classes
                    fields[field] = data
                except TypeError:
                    fields[field] = None
            # a json-encodable dict
            return fields

        return json.JSONEncoder.default(self, obj)