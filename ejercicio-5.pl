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


carrera('sistemas').
carrera('industrial').
carrera('química').
deporte('fútbol').
deporte('tenis').
deporte('natación').

/*RESPUESTA DE JUANES.*/
resolver_juanes(CH, DH, CP, DP, CL, DL) :-
    % Todos estudian una carrera distinta.
    carrera(CH),
    carrera(CP),
    carrera(CL),
    CH \= CP,
    CP \= CL,
    CL \= CH,
    % Todos practican un deporte distinto.
    deporte(DH),
    deporte(DP),
    deporte(DL),
    DH \= DP,
    DP \= DL,
    DL \= DH,
    % Paco NO estudia sistemas.
    CP \= 'sistemas',
    % Paco NO estudia química
    CP \= 'química',
    % Hugo no es nadador ni programador.
    CH \= 'sistemas',
    DH \= 'natación',
    % El nadador es programador.
    \+ (CH = 'sistemas', DH \= 'natación'),
    \+ (CP = 'sistemas', DP \= 'natación'),
    \+ (CL = 'sistemas', DL \= 'natación'),
    % Al industrial le gusta el fútbol.
    \+ (CH = 'industrial', DH \= 'fútbol'),
    \+ (CP = 'industrial', DP \= 'fútbol'),
    \+ (CL = 'industrial', DL \= 'fútbol'),
    !.

expediente('Hugo', CH, DH ) :-
    resolver_juanes(CH, DH, _, _, _, _).

expediente('Paco', CP, DP ) :-
    resolver_juanes(_, _, CP, DP, _, _).

expediente('Luis', CL, DL ) :-
    resolver_juanes(_, _, _, _, CL, DL).
/*CONFIRMAR RESPUESTA:*/
respuesta_juanes :- 
    resolver_juanes(CH, DH, CP, DP, CL, DL),
    expediente(Nombre, _, 'tenis'),
    write('Hugo estudia '), write(CH), write(' y practica '), write(DH), write('.'), nl,
    write('Paco estudia '), write(CP), write(' y practica '), write(DP), write('.'), nl,
    write('Luis estudia '), write(CL), write(' y practica '), write(DL), write('.'), nl,
    write('Adicionalmente '), write(Nombre), write(' practica tenis.'),
    !.















/*RESPUESTA DE JIMENA.*/
generarEstudiante_jime([hugo,[C1,D1]],[paco,[C2,D2]],[luis,[C3,D3]]) :-
    carrera(C1), carrera(C2), carrera(C3),
    deporte(D1), deporte(D2), deporte(D3),
    
    C1 \== C2, C1 \== C3, C2 \== C3,
    D1 \== D2, D1 \== D3, D2 \== D3,
    
    C1 \== 'sistemas', D1 \== 'natación', C2 \== 'sistemas', C2 \== 'química'.

estudiantes_jime(C1,D1,C2,D2,C3,D3) :-
    generarEstudiante_jime([hugo,[C1,D1]],[paco,[C2,D2]],[luis,[C3,D3]]),
    C1 = 'industrial', D1 = 'fútbol'.

estudiantes_jime(C1,D1,C2,D2,C3,D3) :-
    generarEstudiante_jime([hugo,[C1,D1]],[paco,[C2,D2]],[luis,[C3,D3]]),
    C2 = 'industrial', D2 = 'fútbol'.

estudiantes_jime(C1,D1,C2,D2,C3,D3) :-
    generarEstudiante_jime([hugo,[C1,D1]],[paco,[C2,D2]],[luis,[C3,D3]]),
    C3 = 'industrial', D3 = 'fútbol'.

estudiante_jime(Nombre, Carrera, Deporte) :-
    estudiantes_jime(C1,D1,_,_,_,_), Nombre = hugo, Carrera = C1, Deporte = D1.

estudiante_jime(Nombre, Carrera, Deporte) :-
    estudiantes_jime(_,_,C2,D2,_,_), Nombre = paco, Carrera = C2, Deporte = D2.

estudiante_jime(Nombre, Carrera, Deporte) :-
    estudiantes_jime(_,_,_,_,C3,D3), Nombre = luis, Carrera = C3, Deporte = D3.

/*CONFIRMAR RESPUESTA:*/
respuesta_jime :-
    estudiantes_jime(C1,D1,C2,D2,C3,D3),
    estudiante_jime(Nombre, _, 'tenis'),
    write('Hugo estudia '), write(C1), write(' y practica '), write(D1), write('.'), nl,
    write('Paco estudia '), write(C2), write(' y practica '), write(D2), write('.'), nl,
    write('Luis estudia '), write(C3), write(' y practica '), write(D3), write('.'), nl,
    write('Adicionalmente '), write(Nombre), write(' practica tenis.'),
    !.
