function x = GaussElim(A, b)
    n = size(A, 1);
    x = zeros(n, 1);

    for k = 1:n-1
        for i = k+1:n
            factor = A(i, k) / A(k, k);
            A(i, k+1:n) = A(i, k+1:n) - factor * A(k, k+1:n);
            b(i) = b(i) - factor * b(k);
        end
    end

    x(n) = b(n) / A(n, n);

    for i = n-1:-1:1
        x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    end
end
