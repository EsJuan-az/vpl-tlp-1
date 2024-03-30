/*
Cuadrado mágico: colocar los números del 1 al 9 en un cuadrado 3x3 buscando que al sumar las líneas
(vertical, horizontal y diagonal) siempre se obtenga el mismo resultado. (buscar las posibles soluciones
dando valores a cada posición).
Por ejemplo: la suma del cuadrado anterior siempre será 30 en cada una de las líneas (vertical,
horizontal y diagonal).

*/
valor(1).
valor(2).
valor(3).
valor(4).
valor(5).
valor(6).
valor(7).
valor(8).
valor(9).

generarCuadradoMagico(A,B,C,D,E,F,G,H,I) :-
    valor(A), valor(B), valor(C), valor(D),
    valor(E), valor(F), valor(G), valor(H),
    valor(I),
    A =\= B, A =\= C, A =\= D, A =\= E, A =\= F, 
    A =\= G, A =\= H, A =\= I, B =\= C, B =\= D,
    B =\= E, B =\= F, B =\= G, B =\= H, B =\= I,
    C =\= D, C =\= E, C =\= F, C =\= G, C =\= H,
    C =\= I, D =\= E, D =\= F, D =\= G, D =\= H,
    D =\= I, E =\= F, E =\= G, E =\= H, E =\= I,
    F =\= G, F =\= H, F =\= I, G =\= H, G =\= I,
    H =\= I,
    A+B+C =:= D+E+F, D+E+F =:= G+H+I,
    G+H+I =:= A+D+G, A+D+G =:= B+E+H,
    B+E+H =:= C+F+I, C+F+I =:= A+E+I,
    A+E+I =:= C+E+G.

mostrarCuadradoMagico :- generarCuadradoMagico(A,B,C,D,E,F,G,H,I),
    write(A), write(" "), write(B), write(" "), write(C), nl, 
    write(D), write(" "), write(E), write(" "), write(F), nl, 
    write(G), write(" "), write(H), write(" "), write(I), nl.