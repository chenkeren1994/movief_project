# coding:utf8
__author__ = 'seal'
__data__ = '7/29/17'

from flask import Blueprint

home = Blueprint("home", __name__)

import app.home.views
