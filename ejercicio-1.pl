/*
Implementar las siguientes rutinas recursivas en Prolog:
    a) Cuenta la cantidad de ítems que contiene una lista.
        • ejemplo 1: contar([22,34,44,16,1,3,2,3,55], N) el resultado es N = 9
        • ejemplo 2: contar([d,a,d,g,g,s,d,f], N) el resultado es N = 8
    b) Retira todas las ocurrencias de un elemento en una lista.
        • ejemplo: remover(3, [3,5,8,6,2,3,2,3,2], N) el resultado es N = [5,8,6,2,2,2]
    c) Calcular la potencia de un número.
        • ejemplo: potencia(3,4,X). Respuesta=81
*/

/*A*/
contar(Lista, Conteo) :- 
    tr_contar(Lista, 0, Conteo).
    
tr_contar([], Acc, Acc) :- !.
tr_contar([_|T], Acc, Conteo) :-
    New_acc is Acc + 1,
    tr_contar(T, New_acc, Conteo).

/*B*/
remover(Elemento, Lista, New_lista) :-
    tr_remover(Elemento, Lista, [], New_lista).

tr_remover(_, [], Acc, Acc) :- !.
tr_remover(Elemento, [H|T], Acc, New_lista) :-
    H is Elemento,
    tr_remover(Elemento, T, Acc, New_lista).

tr_remover(Elemento, [H|T], Acc, New_lista) :-
    not(H is Elemento),
    append(Acc, [H], New_acc),
    tr_remover(Elemento, T, New_acc, New_lista).

/*C*/
potencia(Base, Exponente, Resultado) :- 
    tr_potencia(Base, Exponente, 1, Resultado).
tr_potencia(Base, 0, Acc, Acc) :- !.
tr_potencia(Base, Exponente, Acc, Resultado) :-
    Exponente > 0,
    New_acc is Acc * Base,
    New_exp is Exponente - 1,
    tr_potencia(Base, New_exp, New_acc, Resultado).
tr_potencia(Base, Exponente, Acc, Resultado) :-
    Exponente < 0,
    New_acc is Acc / Base,
    New_exp is Exponente + 1,
    tr_potencia(Base, New_exp, New_acc, Resultado).