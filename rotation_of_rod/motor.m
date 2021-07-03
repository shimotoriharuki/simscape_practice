clear

syms R L I(t) w(t) V Ke Kt J;

Id = diff(I, t);
eqn = R*I + L*Id + Ke*w - V == 0;

I_sol = isolate(eqn, Id)



