% 5-bus Newton-Raphson load flow: WORKED EXAMPLE with assumed data (not a client project)
% Author: Rohit Kumar Sah. Base 100 MVA. Polar form, flat start, tol 1e-8 pu.
clear; clc;
Sb = 100;
% line data: from to R X B(total)  [pu]
L = [1 2 .02 .06 .06; 1 3 .08 .24 .05; 2 3 .06 .18 .04; 2 4 .06 .18 .04;
     2 5 .04 .12 .03; 3 4 .01 .03 .02; 4 5 .08 .24 .05];
n = 5;
Pd = [0 20 45 40 60]'/Sb;  Qd = [0 10 15 5 10]'/Sb;  Pg = [0 40 0 0 0]'/Sb;
Vset = [1.06 1.045 1 1 1]';
type = [1 2 3 3 3];             % 1 slack, 2 PV, 3 PQ
% bus admittance matrix (pi model)
Y = zeros(n);
for k = 1:size(L,1)
    f = L(k,1); t = L(k,2); y = 1/complex(L(k,3),L(k,4)); b = 1i*L(k,5)/2;
    Y(f,f) = Y(f,f)+y+b; Y(t,t) = Y(t,t)+y+b; Y(f,t) = Y(f,t)-y; Y(t,f) = Y(t,f)-y;
end
G = real(Y); B = imag(Y);
V = Vset; th = zeros(n,1);
Psp = Pg-Pd; Qsp = -Qd;
ns = find(type~=1); pq = find(type==3);
for it = 0:20
    P = zeros(n,1); Q = zeros(n,1);
    for i = 1:n, for k = 1:n
        d = th(i)-th(k);
        P(i) = P(i)+V(i)*V(k)*(G(i,k)*cos(d)+B(i,k)*sin(d));
        Q(i) = Q(i)+V(i)*V(k)*(G(i,k)*sin(d)-B(i,k)*cos(d));
    end, end
    mis = [Psp(ns)-P(ns); Qsp(pq)-Q(pq)];
    fprintf('iter %d  max mismatch %.3e\n', it, max(abs(mis)));
    if max(abs(mis)) < 1e-8, break; end
    na = numel(ns); nv = numel(pq); J = zeros(na+nv);
    for a = 1:na, i = ns(a);
        for c = 1:na, k = ns(c); d = th(i)-th(k);
            if i==k, J(a,c) = -Q(i)-B(i,i)*V(i)^2;
            else,    J(a,c) = V(i)*V(k)*(G(i,k)*sin(d)-B(i,k)*cos(d)); end
        end
        for c = 1:nv, k = pq(c); d = th(i)-th(k);
            if i==k, J(a,na+c) = P(i)/V(i)+G(i,i)*V(i);
            else,    J(a,na+c) = V(i)*(G(i,k)*cos(d)+B(i,k)*sin(d)); end
        end
    end
    for a = 1:nv, i = pq(a);
        for c = 1:na, k = ns(c); d = th(i)-th(k);
            if i==k, J(na+a,c) = P(i)-G(i,i)*V(i)^2;
            else,    J(na+a,c) = -V(i)*V(k)*(G(i,k)*cos(d)+B(i,k)*sin(d)); end
        end
        for c = 1:nv, k = pq(c); d = th(i)-th(k);
            if i==k, J(na+a,na+c) = Q(i)/V(i)-B(i,i)*V(i);
            else,    J(na+a,na+c) = V(i)*(G(i,k)*sin(d)-B(i,k)*cos(d)); end
        end
    end
    dx = J\mis;
    th(ns) = th(ns)+dx(1:na); V(pq) = V(pq)+dx(na+1:end);
end
Vc = V.*exp(1i*th);
S = Vc.*conj(Y*Vc)*Sb;           % bus injections, MVA
Sgen = S + (Pd+1i*Qd)*Sb;        % generation at each bus
T = table((1:n)', V, rad2deg(th), real(Sgen), imag(Sgen), ...
    'VariableNames', {'Bus','V_pu','Angle_deg','Pgen_MW','Qgen_MVAr'});
disp(T);
fprintf('Total line loss = %.3f MW\n', sum(real(S)) );
