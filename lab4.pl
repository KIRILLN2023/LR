% 1. Полный перебор 
solve_naive(B,L,O,K, S,T,E,N,A) :-
    Digits =[0,1,2,3,4,5,6,7,8,9],
    select(B, Digits, D1), B > 0,
    select(L, D1, D2), select(O, D2, D3), select(K, D3, D4),
    select(S, D4, D5), S > 0,
    select(T, D5, D6), select(E, D6, D7), select(N, D7, D8), select(A, D8, _),
    Blok = B*1000 + L*100 + O*10 + K,
    Stena = S*10000 + T*1000 + E*100 + N*10 + A,
    Stena =:= Blok * 7.

% 2. Оптимизированный (считаем с конца, отсекаем ветви)
solve_opt(B,L,O,K, S,T,E,N,A) :-
    Digits =[0,1,2,3,4,5,6,7,8,9],
    select(K, Digits, D1), A is (K * 7) mod 10, select(A, D1, D2), Carry1 is (K * 7) div 10,
    select(O, D2, D3), N is (O * 7 + Carry1) mod 10, select(N, D3, D4), Carry2 is (O * 7 + Carry1) div 10,
    select(L, D4, D5), E is (L * 7 + Carry2) mod 10, select(E, D5, D6), Carry3 is (L * 7 + Carry2) div 10,
    select(B, D6, D7), B > 0, T is (B * 7 + Carry3) mod 10, select(T, D7, D8),
    S is (B * 7 + Carry3) div 10, select(S, D8, _), S > 0.
