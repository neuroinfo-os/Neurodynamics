# implement the Hodgkin-Huxley equations.
# See Gerstner and Kistler, Spiking Neuron Models, 2002, Section 2.2.

from __future__ import division
import numpy as np

def hodgkin_huxley(I0, T0) :

    dt = 0.001
    T  = int(np.ceil(T0/dt))
    gNa = 120
    ENa=115
    gK = 36
    EK=-12
    gL = 0.3
    ERest=10.6

    t = np.arange(1,T+1)*dt
    
    # assigns a zero verctor of length T to every variable
    V, m, h, n, I_Na, I_K, I_L, c_Na, c_K = np.zeros((9,T))
  
    V[0]=-70.0
    m[0]=0.05
    h[0]=0.54
    n[0]=0.34

    for i in range(T-1) : 
        I_Na[i+1] = gNa * m[i]**3 * h[i] * (ENa-(V[i]+65))
        I_K[i+1]  = gK  * n[i]**4 * (EK-(V[i]+65))
        I_L[i+1]  = gL  * (ERest-(V[i]+65))
        c_Na[i+1] = gNa * m[i]**3 * h[i]
        c_K[i+1]  = gK  * n[i]**4
        V[i+1]    = V[i] + dt*( I_Na[i+1] + I_K[i+1] + I_L[i+1]  + I0 )
        m[i+1]    = m[i] + dt*( alphaM(V[i])*(1-m[i]) - betaM(V[i])*m[i] )
        h[i+1]    = h[i] + dt*( alphaH(V[i])*(1-h[i]) - betaH(V[i])*h[i] )
        n[i+1]    = n[i] + dt*( alphaN(V[i])*(1-n[i]) - betaN(V[i])*n[i] )

    return V, I_Na, I_K, I_L, c_Na, c_K, m, h, n, t
  

#Below, define the AUXILIARY FUNCTIONS alpha & beta for each gating variable.

def alphaM(V) :
    return (2.5-0.1*(V+65)) / (np.exp(2.5-0.1*(V+65))-1)

def betaM(V) :
    return 4*np.exp(-(V+65)/18)

def alphaH(V) :
    return 0.07*np.exp(-(V+65)/20)

def betaH(V) :
    return 1/(np.exp(3.0-0.1*(V+65))+1)

def alphaN(V) :
    return (0.1-0.01*(V+65)) / (np.exp(1-0.1*(V+65))-1)

def betaN(V) :
    return 0.125*np.exp(-(V+65)/80)
 
