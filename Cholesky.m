function x = Cholesky(A, b)
    L = chol(A, 'lower');
    U = L';
    n = size(L, 1);
    y = zeros(n, 1);
    x = zeros(n, 1);
    % forward Substitution
    y(1) = b(1) / L(1, 1);
    for i = 2:n
        y(i) = (b(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
    end
    %backward Substitution
    x(n) = y(n) / U(n, n);
    
    for i = n-1:-1:1
        x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
    end
end
