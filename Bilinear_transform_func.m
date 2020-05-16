function [p_S] = Bilinear_transform_func(p)
%BILINEAR_TRANSFORM_FUNC It takes the discrete polinomio in the Z domain and changes to the S domain
%   Changes the domain of the polinomio Z to the S domain applying the
%   bilinear transformation where z = (1+s)/(1-s). The polinomio p becomes p_S

n = length(p);
p_S = zeros(1,n);

su = [1 1]; % = (s+1)
sv = [-1 1]; % = (s-1)

u = n-1:-1:0; % for (s+1) % it helps after taking the least common multiple to apply convolution
v = 0:1:n-1; % for (s-1)

discrete_coef_matrix = zeros(n,n);
%-- only for debugging
% f = conv_u(su,1)
% g = conv_v(sv,1)
% conv(f,g)
% conv(conv([-1 1],[-1 1]),[-1 1])
%--
for i = 1:1:n
    f = conv_u(su,u(i));
    g = conv_v(sv,v(i));
%-- only for debugging
%     discrete_coef_matrix(i,:) = conv(f,g);
%     k = conv(f,g)
%--
    discrete_coef_matrix(i,:) = p(i)*conv(f,g);
end

for i = 1:1:n
    p_S(i) = sum(discrete_coef_matrix(:,i));
end

end
