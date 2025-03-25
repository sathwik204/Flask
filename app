{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c323a7e5-15ae-473e-830b-3c8fc0f9048d",
   "metadata": {},
   "outputs": [],
   "source": [
    "# app.py\n",
    "from flask import Flask, render_template, request\n",
    "import joblib\n",
    "import numpy as np\n",
    "\n",
    "# Initialize Flask app\n",
    "app = Flask(__name__)\n",
    "\n",
    "# Load trained model\n",
    "model = joblib.load('iris_model.pkl')\n",
    "\n",
    "@app.route('/')\n",
    "def home():\n",
    "    return render_template('home_html')\n",
    "\n",
    "@app.route('/predict', methods=['POST'])\n",
    "def predict():\n",
    "    # Get data from form\n",
    "    try:\n",
    "        features = [float(request.form[f'features{i}']) for i in range(1, 5)]\n",
    "    except ValueError:\n",
    "        return render_template('result.html', prediction=\"Invalid input. Please enter numeric values.\")\n",
    "\n",
    "    # Make  prediction\n",
    "    prediction = model.predict([features])[0]\n",
    "\n",
    "    # Map prediction to class name\n",
    "    class_names = ['Setosa', 'Versicolor', 'Virginica']\n",
    "    result = class_names[prediction]\n",
    "\n",
    "    return render_template"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "68ab396f-e674-480b-8879-5018cbfefede",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python [conda env:base] *",
   "language": "python",
   "name": "conda-base-py"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.12.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
