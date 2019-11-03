/* Bagian I */
/* Deklarasi Fakta */

% 1a
pria(jito).
pria(abiyyu).
pria(om_lutfi).
pria(mamet_rojab).
pria(bowo).
pria(ihsan).
pria(arden).
pria(lil_tude).
pria(ipul).

% 1b
wanita(jeremy).
wanita(juri_sutantri).
wanita(emily).
wanita(rias_gremory).
wanita(audy).

% 1c
usia(jito, 71).
usia(jeremy, 69).
usia(abiyyu, 56).
usia(juri_sutantri, 42).
usia(om_lutfi, 58).
usia(emily, 40).
usia(mamet_rojab, 24).
usia(bowo, 30).
usia(ihsan, 32).
usia(rias_gremory, 26).
usia(arden, 28).
usia(audy, 24).
usia(lil_tude, 14).
usia(ipul, 8).

% 1d
menikah(jito, jeremy).
menikah(abiyyu, juri_sutantri).
menikah(om_lutfi, emily).
menikah(ihsan, rias_gremory).
menikah(arden, audy).
menikah(jeremy, jito).
menikah(juri_sutantri, abiyyu).
menikah(emily, om_lutfi).
menikah(rias_gremory, ihsan).
menikah(audy, arden).

% 1e
anak(mamet_rojab, jito).
anak(mamet_rojab, jeremy).
anak(bowo, jito).
anak(bowo, jeremy).
anak(ihsan, jito).
anak(ihsan, jeremy).
anak(rias_gremory, abiyyu).
anak(rias_gremory, juri_sutantri).
anak(arden, abiyyu).
anak(arden, juri_sutantri).
anak(audy, om_lutfi).
anak(audy, emily).
anak(lil_tude, ihsan).
anak(lil_tude, rias_gremory).
anak(ipul, arden).
anak(ipul, audy).

% 1f
saudara(mamet_rojab, bowo).
saudara(bowo, ihsan).
saudara(mamet_rojab, ihsan).
saudara(bowo, mamet_rojab).
saudara(ihsan, bowo).
saudara(ihsan, mamet_rojab).
saudara(rias_gremory, arden).
saudara(arden, rias_gremory).

/* Deklarasi Rules */

% 2a
kakak(X, Y) :- saudara(X, Y), usia(X, A), usia(Y, B), A > B.
% 2b
keponakan(X, Y) :- saudara(Y, Z), anak(X, Z).
% 2c
suami(X, Y) :- menikah(X, Y), pria(X), wanita(Y).
% 2d
sepupu(X, Y) :- anak(X, Z), anak(Y, W), saudara(Z, W).
% 2e
mertua(X, Y) :- menikah(Y, Z), anak(Z, X).
% 2f
bibi(X, Y) :- anak(Y, Z), saudara(X, Z), wanita(X).
% 2g
cucu(X, Y) :- anak(X, Z), anak(Z, Y).
% 2h
anaksulung(X) :- anak(X, A), pria(A) , usia(X, B), \+ (saudara(X, Y), usia(Y, C), C > B).
% 2i
anakbungsu(X) :- anak(X, A), pria(A) , usia(X, B), \+ (saudara(X, Y), usia(Y, C), C < B).


/* Bagian II */
/* Deklarasi Fakta */

/* Deklarasi Rules */

% a
fibbonaci(1, 1) :- !.
fibbonaci(2, 1) :- !.
fibbonaci(N, X) :- N > 2, N1 is N-1, N2 is N-2, fibbonaci(N1, F1), fibbonaci(N2, F2), X is F1 + F2.

% b
gcd(A, 0, X) :- X is A, !.
gcd(A, B, X) :- A >= B, C is mod(A,B), gcd(B, C, X).
gcd(A, B, X) :- A < B, gcd(B, A, X).

% c
power(_, 0, 1) :- !.
power(A, 1, X) :- X is A, !.
power(A, B, X) :- 0 is mod(B, 2), B1 is div(B, 2), pow(A, B1, X1), X is X1 * X1.
power(A, B, X) :- 1 is mod(B, 2), B1 is div(B, 2), pow(A, B1, X1), X is X1 * X1 * A.


/* Bagian III */
/* Deklarasi Fakta */

/* Deklarasi Rules */

% a
inverse(A, B) :- inverse(A, B, []).
inverse([], L, L).
inverse([H|T], L, Cur) :- inverse(T, L, [H|Cur]).

% b
insert([], Y, [Y]).
insert([H|T], Y, [H|Z]) :- H < Y, !, insert(T, Y, Z).
insert([H|T], Y, [H|T]) :- H == Y.
insert([H|T], Y, [Y, H|T]) :- H > Y.

% c
dotProduct([], [], 0).
dotProduct([H1|T1], [H2|T2], X) :- T is H1 * H2, dotProduct(T1, T2, Z), X is T + Z.

% d
countX([], _, 0).
countX([H|T], X, N) :- H == X, countX(T, X, M), N is M + 1.
countX([H|T], X, N) :- H \= X, countX(T, X, M), N is M.

% e
palindrom(L) :- inverse(L, L).