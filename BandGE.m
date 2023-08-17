function x = BandGE(A, b, p, q)
    n = size(A, 1);
    x = zeros(n, 1);

    for k = 1:n-1
        for i = k+1:min(k+p, n)
            factor = A(i, k) / A(k, k);
            A(i, k+1:min(k+q, n)) = A(i, k+1:min(k+q, n)) - factor * A(k, k+1:min(k+q, n));
            b(i) = b(i) - factor * b(k);
        end
    end

    x(n) = b(n) / A(n, n);

    for i = n-1:-1:1
        x(i) = (b(i) - A(i, i+1:min(i+q, n)) * x(i+1:min(i+q, n))) / A(i, i);
    end
end
