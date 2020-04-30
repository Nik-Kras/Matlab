function X = DSPf8(x)

%     N = 8;
%     y = length(x);
%     switch(y)
%         case 2
%             X(1) = x(1) + x(2);
%             X(2) = x(1) - x(2);
%         case 4
%             i4 = 0:1;
%             x_odd4(i4 + 1) = x(2*i4 + 1); %% 1 and 3
%             x_even4(i4 + 1) = x(2*i4 + 2); %% 2 and 4
%             
%             X(i4 + 1) = DSPf8(x_odd4) + exp(-1i*2*pi*i4/4).*DSPf8(x_even4);
%             X(i4 + 1 + N/4) = DSPf8(x_odd4) - exp(-1i*2*pi*i4/4).*DSPf8(x_even4);
%         case 8
%             i8 = 0:3;
%             x_odd8(i8 + 1) = x(2*i8 + 1); %% 1 and 3 and 5 and 7
%             x_even8(i8 + 1) = x(2*i8 + 2);%% 2 and 4 and 6 and 8
% 
%             X(i8 + 1) = DSPf8(x_odd8) + exp(-1i*2*pi*i8/8).*DSPf8(x_even8);
%             X(i8 + 1 + N/2) = DSPf8(x_odd8) - exp(-1i*2*pi*i8/8).*DSPf8(x_even8);
%     end
    
    N = length(x);
    if N == 2
        X(1) = x(1) + x(2);
        X(2) = x(1) - x(2);
    else
        i = 0:(N/2 - 1);
        x_odd(i + 1) = x(2*i + 1); %% 1 and 3
        x_even(i + 1) = x(2*i + 2); %% 2 and 4

        X(i + 1) = DSPf8(x_odd) + exp(-1i*2*pi*i/N).*DSPf8(x_even);
        X(i + 1 + N/2) = DSPf8(x_odd) - exp(-1i*2*pi*i/N).*DSPf8(x_even);
    end
    
           
end


