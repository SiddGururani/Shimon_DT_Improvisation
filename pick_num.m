function num = pick_num(P,X) 
    p = cumsum([0; P(1:end-1).'; 1+1e3*eps]); 
    [a, a] = histc(rand,p); 
    num = X(a);
end