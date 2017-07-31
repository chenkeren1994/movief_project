# coding:utf8
__author__ = 'seal'
__data__ = '7/29/17'


from flask import Blueprint

admin = Blueprint("admin", __name__)

import app.admin.views