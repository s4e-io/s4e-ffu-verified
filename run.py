import os
from s4e.app import app
ENV = os.getenv('ENV')
if __name__ == '__main__':
	app.run()
