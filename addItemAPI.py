from flask import Flask
from flask_restful import Resource, Api
from flask_restful import reqparse
from flask.ext.mysql import MySQL


# Creating MySQL instance
mysql = MySQL()
app = Flask(__name__)

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'ItemListDB'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)
api = Api(app)

class AddItem(Resource):
    def post(self):
        try:
            # Parse the arguments
            parser = reqparse.RequestParser()
            parser.add_argument('userid', type=str, help='UserID for AddingItem')
            parser.add_argument('itemname', type=str, help='Item Name')
            args = parser.parse_args()

            _userid = args['userid']
            _itemname = args['itemname']
            
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('spAddItem',(_userid, _itemname,))
            data = cursor.fetchall()
            
            conn.commit()
            return {'StatusCode':'200','Message': 'Success. Item Added.'}
            
        except Exception as e:
            return {'error': str(e)}

api.add_resource(AddItem, '/AddItem')

if __name__ == '__main__':
    app.run(debug=True)
