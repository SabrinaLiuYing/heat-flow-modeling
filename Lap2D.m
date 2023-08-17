function [A,b] = Lap2D(m)
    %solve for
    b = zeros(m^2,1);
    I = speye(m);
    e = ones(m,1);
    T = spdiags([-e,2*e,-e], [-1,0,1],m,m);
    A = kron(T,I) + kron(I,T)
    
    % solve for b
    h = 1 / (m+1);
    cond1 = [0.35,0.6];
    cond2 = [0.8,0.25];
    for i = 0 : m+1
        for j= 0 : m+1
            xi = i * h;
            yj = j * h;
            k= (j-1)*m+i;
            if norm ([xi,yj]-cond1) <= 0.1 || norm ([xi,yj]-cond2) <= 0.1
                b(k) = 1 ;
            end
        end
    end
end
    
