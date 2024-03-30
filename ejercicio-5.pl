/*
Resolver el siguiente acertijo lógico usando una rutina en Prolog:
• Hugo, Paco y Luís son muy diferentes, cada uno estudia una carrera diferente (sistemas, industrial,
química) y le gusta un deporte diferente (fútbol, tenis, natación). Adicionalmente:
o Paco es hermano del estudiante de sistemas
o Al industrial le gusta el fútbol
o Paco no estudia química
o Hugo le regaló un café al nadador para que termine su taller de programación orientada a objetos
¿Quién práctica el tenis?
*/
carrera(sistemas).
carrera(industrial).
carrera(quimica).

deporte(futbol).
deporte(tenis).
deporte(natacion).

generarEstudiante([hugo,[C1,D1]],[paco,[C2,D2]],[luis,[C3,D3]]) :-
    carrera(C1), carrera(C2), carrera(C3),
    deporte(D1), deporte(D2), deporte(D3),
    
    C1 \== C2, C1 \== C3, C2 \== C3,
    D1 \== D2, D1 \== D3, D2 \== D3,
    
    C1 \== sistemas, D1 \== natacion, C2 \== sistemas, C2 \== quimica.

estudiantes(C1,D1,C2,D2,C3,D3) :-
    generarEstudiante([hugo,[C1,D1]],[paco,[C2,D2]],[luis,[C3,D3]]),
    C1 = industrial, D1 = futbol.

estudiantes(C1,D1,C2,D2,C3,D3) :-
    generarEstudiante([hugo,[C1,D1]],[paco,[C2,D2]],[luis,[C3,D3]]),
    C2 = industrial, D2 = futbol.

estudiantes(C1,D1,C2,D2,C3,D3) :-
    generarEstudiante([hugo,[C1,D1]],[paco,[C2,D2]],[luis,[C3,D3]]),
    C3 = industrial, D3 = futbol.

estudiante(Nombre, Carrera, Deporte) :-
    estudiantes(C1,D1,_,_,_,_), Nombre = hugo, Carrera = C1, Deporte = D1.

estudiante(Nombre, Carrera, Deporte) :-
    estudiantes(_,_,C2,D2,_,_), Nombre = paco, Carrera = C2, Deporte = D2.

estudiante(Nombre, Carrera, Deporte) :-
    estudiantes(_,_,_,_,C3,D3), Nombre = luis, Carrera = C3, Deporte = D3.

    

