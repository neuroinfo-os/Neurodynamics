
close all

[V,I_Na,I_K,I_L,c_Na,c_K,m,h,n,t] = Hodgkin_Huxley_Model(100,50,1);

subplot(3,1,1)
plot(t,V)
hold on
plot(t,V.*0+V(end),'r')
legend('V(t)')
set(gca,'Xlim',[24 45])
xlabel('Time in ms') 
ylabel('Voltage in mV') 

subplot(6,1,3)
plot(t,m,'m')
hold on
plot(t,h,'r')
plot(t,n,'g')
set(gca,'Xlim',[24 45])
legend('m(t)','h(t)','n(t)')
xlabel('Time in ms') 
ylabel('gating variable') 

subplot(6,1,4)
plot(t,c_Na,'r')
hold on
plot(t,c_K,'g')
set(gca,'Xlim',[24 45])
legend('Na conductance','K condactance')
xlabel('Time in ms') 
ylabel('conductance [mS/cm^2]') 


subplot(6,1,5)
plot(t,I_Na,'r')
hold on
plot(t,I_K,'g')
plot(t,I_L,'b')
set(gca,'Xlim',[24 45])
legend('Na current','K current', 'Leak current')
xlabel('Time in ms') 
ylabel('current [µA/cm^2]') 

subplot(6,1,6)
plot(t,I_Na+I_K+I_L,'b')
set(gca,'Xlim',[24 45])
legend('sum if currents')
xlabel('Time in ms') 
ylabel('current [µA/cm^2]') 


