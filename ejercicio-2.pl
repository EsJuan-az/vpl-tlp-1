/*
Crear una rutina recursiva en Prolog que permita invertir un número dado usando TAIL RECURSION.
    • Ejemplo: 123456789 -> 987654321
*/
invertir(N, Inv) :-
    invertir_aux(N, 0, Inv).

invertir_aux(0, Inv2, Inv2) :- !.

invertir_aux(N, Inv2, Inv) :-
    E is N mod 10,
    Inv3 is Inv2 * 10 + E,
    N2 is N // 10,            
    invertir_aux(N2, Inv3, Inv).  