carrera('sistemas').
carrera('industrial').
carrera('química').
deporte('fútbol').
deporte('tenis').
deporte('natación').

resolver(CH, DH, CP, DP, CL, DL) :-
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

respuesta :- 
    resolver(CH, DH, CP, DP, CL, DL),
    write('Hugo estudia '), write(CH), write(' y practica '), write(DH), nl,
    write('Paco estudia '), write(CP), write(' y practica '), write(DP), nl,
    write('Luis estudia '), write(CL), write(' y practica '), write(DL), nl.

