function [outputArg1] = conv_u(inputArg1,inputArg2)
%CONV_U Recursive function to get coeficients of (s+1)^n 
   
    if inputArg2 == 0
        outputArg1 = 1;
    end
    if inputArg2 == 1
        outputArg1 = [1 1];
    end
    if inputArg2 > 1
        inputArg2 = inputArg2 - 1;
        outputArg1 = conv(inputArg1,conv_u(inputArg1,inputArg2));
    end
end
