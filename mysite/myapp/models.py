# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Album(models.Model):
    name = models.CharField(max_length=100)
    release_date = models.DateField()
    num_stars = models.IntegerField()

    def __unicode__(self):# 在Python3中用 __str__ 代替 __unicode__
        return self.name
