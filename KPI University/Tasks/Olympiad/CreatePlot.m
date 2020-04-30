function y = CreatePlot(Latency, Offset, PulseWidth, CycleCount)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
SamN = 100;                             % Count of samples on one input digit
Ncycle = SamN * (Offset + PulseWidth);  % Count of samples on whole period
N = Ncycle * CycleCount + SamN*Latency; % Count of samples on whole plot function
y = zeros(1,N);                         % Initializing plot function

for i = 1:CycleCount
    % If it is first pulse - use Latency
    if (i==1)
        for j = 1 : (Ncycle + SamN*Latency)
            if (j < SamN*Latency)
                y( (i-1)*Ncycle + j ) = 0;
            elseif (j < SamN*(Offset+Latency))
                y( (i-1)*Ncycle + j ) = 0;
            elseif (j > SamN*(Offset+Latency)) && (j < SamN*(Offset+Latency+PulseWidth))
                y( (i-1)*Ncycle + j ) = 1;
            end
        end
    % Else do not use it
    else
       for j = SamN*Latency : Ncycle + SamN*Latency
            if (j < SamN*(Offset+Latency))
                y( (i-1)*Ncycle + j ) = 0;
            elseif (j > SamN*(Offset+Latency)) && (j < SamN*(PulseWidth+Offset+Latency))
                y( (i-1)*Ncycle + j ) = 1;
            end
       end
    end  
end

t = linspace(1,N,N);
plot(t,y);
xlim([0 N]);
ylim([-0.5 1.5]);

end

