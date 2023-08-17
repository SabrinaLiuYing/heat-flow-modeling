iters = 4;

GEtime = zeros(iters,1);
CHtime = zeros(iters,1);
BandGEtime = zeros(iters,1);
MLtime = zeros(iters,1);
fprintf('GaussElim\tCholesky\tBand\n');
for i = 1:iters
    m = i*10;
    [A,b] = Lap2D(m);
    t0 = cputime;
    xGE = GaussElim(A,b);
    t1 = cputime;
    xCH = Cholesky(A,b);
    t2 = cputime;
    xBGE = BandGE(A,b,m,m);
    t3 = cputime;
    %xMAT = A\b;
    %t4 = cputime;
    
    GEtime(i)  = t1-t0;
    CHtime(i)  = t2-t1;
    BandGEtime(i) = t3-t2;
    MLtime(i) = t4-t3;
    fprintf('%f\t%f\t%f\n', GEtime(i), CHtime(i), BandGEtime(i));
end
