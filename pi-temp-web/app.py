from flask import Flask, render_template
from datetime import datetime

app = Flask(__name__)

LOGFILE = "/home/darensalteruk/scripts/pi-temp.log"

@app.route("/")
def index():
	labels = []
	temps = []

	try:
		with open(LOGFILE, "r") as f:
			for line in f.readlines()[-100:]:	#Last 100 readings
				line = line.strip()
				if not line:
					continue
			timestamp, temp = line.split(",")
			dt = datetime.strptime(timestamp,"%Y-%m-%d %H:%M:%S")
			labels.append(dt.strftime("%H:%M"))
			temp.append(float(temp))
	except FileNotFoundError:
		pass

	return render_template("index.html", labels=labels, temps=temps)

if __name__ == "__main__":
	app.run(host="0.0.0.0", port=5000)

