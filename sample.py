from flask import Flask, request, jsonify
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import image
import numpy as np
import io
import cv2
application = Flask(__name__)

# Load the trained model
model = load_model('mood_detection_model.h5')
img=cv2.imread("E:\\22IT087\\mlops\\emotion_image_recognition\\download.jpg")