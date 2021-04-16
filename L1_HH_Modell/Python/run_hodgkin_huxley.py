from matplotlib.pyplot import *
from hodgkin_huxley import hodgkin_huxley 

V, I_Na, I_K, I_L, c_Na, c_K, m, h, n, t = hodgkin_huxley(40,50)

subplot(3,1,1)
plot(t,V)
legend('V(t)')
ylabel(r'Voltage in $mV$',fontsize='small') 
yticks(fontsize='small')

subplot(6,1,3)
plot(t,m,'m')
plot(t,h,'r')
plot(t,n,'g')
legend(['m(t)','h(t)','n(t)'])
ylabel(r'gating variable',fontsize='small') 
yticks(fontsize='small')

subplot(6,1,4)
plot(t,c_Na,'r')
plot(t,c_K,'g')
legend(['Na conductance','K condactance'])
ylabel(r'conductance $mS/cm^2$',fontsize='small') 
yticks(fontsize='small')

subplot(6,1,5)
plot(t,I_Na,'r')
plot(t,I_K,'g')
plot(t,I_L,'b')
legend(['Na current','K current', 'Leak current'])
ylabel(r'current  $\mu A/cm^2$',fontsize='small') 
yticks([-800,-400,0,400,800],fontsize='small')

subplot(6,1,6)
plot(t,I_Na+I_K+I_L,'b')
legend('sum if currents')
xlabel(r'Time in seconds') 
ylabel(r'current $ \mu A/cm^2$',fontsize='small') 
yticks([-100,0,100,200,300], fontsize='small')

show()
