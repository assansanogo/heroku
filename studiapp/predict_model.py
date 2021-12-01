from sklearn import datasets
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
import pickle


def predict():
    # save the model to disk
    filename = './finalized_model.pkl'
    with open(filename,'rb') as f:
        clf = pickle.load(f)

    # chargement du jeu de données iris
    iris_test = np.load("x_test_iris.npy")

    return clf.predict(iris_test)