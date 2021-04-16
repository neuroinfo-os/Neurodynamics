clear all
close all

Samples = 1000;
r = [2.5:0.1:4 ];
Inits   = 0:0.01:1
x       = ones(length(Inits),Samples);
f1= figure;
f2= figure;
f3= figure;
f4= figure;
for IDX_R = 1:length(r)
    for X_Init = 1:length(Inits)
        x(X_Init,1) = Inits(X_Init);
        for Step = 2:Samples
            x(X_Init,Step) = r(IDX_R)*x(X_Init,Step-1)*(1-x(X_Init,Step-1));
        end
    end
    figure(f1)
    subplot(4,4,IDX_R)   
    plot(x(:,1:200)')
    title(['r ' num2str(r(IDX_R)) ])
    xlabel('n')
    ylabel('x_n')
    
    figure(f2)
    hold on
    converged   = x(50,900:Samples);
    plot(r(IDX_R)*ones(size(converged )),converged,'k.')
    xlabel('r')
    ylabel('x')
    
    figure(f3)
    subplot(4,4,IDX_R)   
    plot(converged(1:end-1),converged(2:end))
    title(['Stable patterns for r ' num2str(r(IDX_R)) ])
    xlabel('x_n')
    ylabel('x_{n-1}')
    figure(f4)
    subplot(4,4,IDX_R)   
    plot((Samples-50:Samples-1),x(50,Samples-50:Samples-1))
    title(['r ' num2str(r(IDX_R)) ])
    xlabel('n')
    ylabel('x_n')
end


