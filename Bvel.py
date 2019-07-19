#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul 19 16:07:49 2019
compare velocities
@author: apreziosir
"""


import numpy as np
import matplotlib.pyplot as plt


a = np.loadtxt('Boundary_0011.dat', skiprows = 2)

# Plotting u velocities
#plt.plot(a[:,0], c = 'red')
#plt.plot(a[:,2], c = 'blue')

# Plotting w velocities
plt.plot(a[:,1], c = 'red')
plt.plot(a[:,3], c = 'blue')