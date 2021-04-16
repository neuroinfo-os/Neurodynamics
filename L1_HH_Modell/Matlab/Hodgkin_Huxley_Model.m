%Implement the Hodgkin-Huxley equations.
%See Gerstner and Kistler, Spiking Neuron Models, 2002, Section 2.2.

function [V,I_Na,I_K,I_L,c_Na,c_K,m,h,n,t] = HH0(I0,T0,Puls_flag)

  dt = 0.001;
  T  = ceil(T0/dt);
  gNa = 120;  
  ENa=115;
  gK = 36;  
  EK=-12;
  gL=0.3;  
  ERest=10.6;

  t = (1:T)*dt;
  V = zeros(T,1);
  m = zeros(T,1);
  h = zeros(T,1);
  n = zeros(T,1);
  I_Na = zeros(T,1);
  I_K  = zeros(T,1);
  I_L  = zeros(T,1);
  
  V(1)=-70.0;
  m(1)=0.05;
  h(1)=0.54;
  n(1)=0.34;
  
  if Puls_flag==1 
    I =0 
  else
    I = I0;
  end
  for i=1:T-1 
      if Puls_flag==1
          if i>(T/2)
              I=I0;
          end
          if i>(T/2)+100
              I=0;
          end
      end
      I_Na(i+1)      = gNa*m(i)^3*h(i)*(ENa-(V(i)+65));
      I_K(i+1)       = gK*n(i)^4*(EK-(V(i)+65));
      I_L(i+1)       = gL*(ERest-(V(i)+65));
      c_Na(i+1)      =  gNa*m(i)^3*h(i);
      c_K(i+1)       =  gK*n(i)^4;
      V(i+1) = V(i) + dt*( I_Na(i+1)+  I_K(i+1)+ I_L(i+1)  + I);
      m(i+1) = m(i) + dt*(alphaM(V(i))*(1-m(i)) - betaM(V(i))*m(i));
      h(i+1) = h(i) + dt*(alphaH(V(i))*(1-h(i)) - betaH(V(i))*h(i));
      n(i+1) = n(i) + dt*(alphaN(V(i))*(1-n(i)) - betaN(V(i))*n(i));
  end
  
end

%Below, define the AUXILIARY FUNCTIONS alpha & beta for each gating variable.

function aM = alphaM(V)
aM = (2.5-0.1*(V+65)) ./ (exp(2.5-0.1*(V+65)) -1);
end

function bM = betaM(V)
bM = 4*exp(-(V+65)/18);
end

function aH = alphaH(V)
aH = 0.07*exp(-(V+65)/20);
end

function bH = betaH(V)
bH = 1./(exp(3.0-0.1*(V+65))+1);
end

function aN = alphaN(V)
aN = (0.1-0.01*(V+65)) ./ (exp(1-0.1*(V+65)) -1);
end

function bN = betaN(V)
bN = 0.125*exp(-(V+65)/80);
end