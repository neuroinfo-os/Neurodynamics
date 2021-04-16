clear all
close all

Samples = 600;
r = [2.4:0.001:4 ];
Inits   = 0.5; 
x       = ones(length(Inits),Samples);
f1= figure;
f2= figure;
for IDX_R = 1:length(r)
    for X_Init = 1:length(Inits)
        x(X_Init,1) = Inits(X_Init);
        for Step = 2:Samples
            x(X_Init,Step) = r(IDX_R)*x(X_Init,Step-1)*(1-x(X_Init,Step-1));
        end
    end
    figure(f2)
    hold on
    converged   = x(:,400:Samples);
    plot(r(IDX_R)*ones(size(converged )),converged,'k.')
    set(gca,'Xlim',[min(r ) max(r )]);
    set(gca,'Ylim',[0 1]);
    xlabel('r')
    ylabel('x')
end


