X = -(T1+T2)/(T1*T2);
Y = -1/(T1*T2);
Z = K/(T1*T2);
T=1;

ulin = sym("ulin");
z = sym("z");

A = [X 1; Y 0];
B = [0; Z*(a1+2*a2*ulin+3*a3*ulin.^2+4*a4*ulin.^3)];
C = [1 0];
pom = [z 0; 0 z];

C*((pom-A)^(-1))*B
