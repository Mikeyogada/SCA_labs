from flask import Flask #importing the Flask class from the flask module to create a web application.
import requests #importing the requests library to make HTTP requests to external APIs.

app = Flask(__name__) #creating an instance of the flask class, which will be our web application.

@app.route("/") #define the route home page of the web application.
def home(): #define a funnction home that will be executed when / is accessed.
    return "SCA Lab Running" #returning a simple string message "SCA Lab Running" when the home page is accessed.