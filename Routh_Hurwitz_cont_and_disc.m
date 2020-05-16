% Estabilidade de sistemas dinâmicos a tempo continuo e discreto
% Criterio de Routh-Hurwitz

clc
clear all

prompt = {'Insira os coeficientes do polinomio em ordem decrescente e separados por espaco:','Insira "c" para continuo ou "d" para discreto:'};
title = 'Criterio de Routh-Hurwitz';
dims = [1 100];
definput = {'1 1 1/4','c'};
answer = inputdlg(prompt,title,dims,definput);

p = str2num(answer{1});
type = (answer{2});

if type == 'c' || type == 'C'  
    [routh_matrix, criteria, n] = Routh_table_func(p);
    
    disp('Polinomio:')
    disp(p)
    disp(' ')
    disp('Tabela de Routh:')
    disp(routh_matrix);
    if criteria == n
        disp('Sistema LIT assintoticamente estavel: Todas as raizes estao situadas no semi-plano esquerdo complexo.');
    else
        disp('Sistema LIT instavel');
    end
    
end

if type == 'd' || type == 'D'
    [p_S] = Bilinear_transform_func(p); % get the polinomio in the S domain by the bilinear tranformation z = (1+s)/(1-s)
    [routh_matrix, criteria, n] = Routh_table_func(p_S);
    
    disp('Polinomio in the S domain:')
    disp(p_S)
    disp(' ')
    disp('Tabela de Routh:')
    disp(routh_matrix);
    if criteria == n
        disp('Sistema LIT assintoticamente estavel: Todas as raizes estao situadas no semi-plano esquerdo complexo.');
    else
        disp('Sistema LIT instavel');
    end
    
end



