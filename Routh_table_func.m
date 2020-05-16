function [ routh_matrix, criteria, n ] = Routh_table_func(p)
%ROUTH_TABLE_FUNC Generates Routh-Hurwitz's table to define if the transfer
%function is stable
%   The function takes as input the polinomio of the transfer function and returns the routh's table in the form
%   of a matrix n by n, the order plus 1 of the polinomio as 'n' and the
%   number of elements of the first column greater than 1

    n = length(p);
    routh_matrix = zeros(n,n);
    criteria = -1;

    %i = 1:1:n; % only for debugging
    j = 1:2:n;
    k = 2:2:n;

    for i = 1:1:length(j)
        routh_matrix(1,i) = p(j(i));
    end

    for i = 1:1:length(k)
        routh_matrix(2,i) = p(k(i));
    end
% only for debugging
%     L1 = routh_matrix(1,:); % first line of Routh's table
%     L2 = routh_matrix(2,:); % second line of Routh's table

    actual_line = 3:1:n;
    for i = 1:1:length(actual_line)
        pivot1 = routh_matrix( (actual_line(i)-2),1);
        pivot2 = routh_matrix( (actual_line(i)-1),1 );
        if pivot2 == 0 % avoid having inf in the routh_matrix, dividing by zero in line 37 
            criteria = 0;
            break
        end       
        A1 = pivot2 .* routh_matrix( (actual_line(i)-2) ,2:n );
        A2 = pivot1 .* routh_matrix( (actual_line(i)-1) ,2:n );
        nextline = (A1 - A2)/pivot2;
        NL = [nextline 0]; % New Line to be add at routh_matrix
        routh_matrix( actual_line(i) ,:) = NL;
    end
    
    if (criteria == 0)
        criteria = 0;
    else
    criteria = sum(routh_matrix(:,1) > 0 );
    end

end

