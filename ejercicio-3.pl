/*
. Crear un programa llamado viajeros, que permita definir lugar de origen, lugar de destino, tipo de
transporte y precio del transporte.
• Definir un grafo con al menos 6 nodos, como el que aparece a continuación:
• Crear una estructura de hechos que represente cada conexión del grafo.
• Para cada consulta origen-destino, presentar la lista de ciudades en el recorrido, los transportes
a utilizar, la lista de precios por trayecto y el Valor Total del viaje.
Por ejemplo: uno de los trayectos posibles (para el grafo de ejemplo), entre Medellín e Islas del
Rosario, puede ser:
    Origen = Medellín,
    Destino = Islas del Rosario,
    Recorrido = [Medellín, Cartagena, Islas del Rosario],
    Precio total = 300000,
    Precios por trayecto = [200000, 100000],
    Tipos de transporte = [Avión, Lancha]
    % IDEA ESTRUCTURA DE LA SOLUCIÓN enrutar(Origen, Destino, Recorrido, Precio_por_trayecto
    , Precio_total, Tipos_transporte) :- ...
*/
viaje('Macondo', 'Neerlandia', 'Caballo', 5).
viaje('Neerlandia', 'Valle de Upar', 'Tren', 15).
viaje('Neerlandia', 'Sektor II', 'Irse con los gitanos rumbo Angosta', 60).
viaje('Sektor II', 'Paradiso', 'Metro', 3500).
viaje('Sektor II', 'Salto', 'Canoa', 1500).
viaje('Salto', 'Luthadel', 'Grieta hacia El Imperio Final', 0).
viaje('Luthadel', 'Fadrex', 'Caballo', 200).
viaje('Fadrex', 'Fellise', 'Tren', 500).
viaje('Fellise', 'Macondo', 'Caminata cognitiva a Cien años de Soledad', 0).


my_append([], Element, [Element]).
my_append([H|Tail], Element, [H|Result]) :-
	my_append(Tail, Element, Result).

enrutar(Origen, Destino, Recorrido, Precio_trayectos, Precio_total, Tipos_transporte) :-
    tr_enrutar(Origen, Destino, [Origen], [], 0, [], Recorrido,Precio_trayectos, Precio_total, Tipos_transporte).

tr_enrutar(Origen, Destino, Acc_recorrido, Acc_precios, Acc_total, Acc_tipos, New_acc_recorrido,New_acc_precios, New_acc_total, New_acc_tipos) :-
    viaje(Origen, Destino, Transporte, Precio),
    my_append(Acc_recorrido, Destino, New_acc_recorrido),
    my_append(Acc_precios, Precio, New_acc_precios),
    New_acc_total is Acc_total + Precio,
    my_append(Acc_tipos, Transporte, New_acc_tipos),
    !.

tr_enrutar(Origen, Destino, Acc_recorrido, Acc_precios, Acc_total, Acc_tipos, Recorrido,Precio_trayectos, Precio_total, Tipos_transporte) :-
    viaje(Origen, X, Transporte, Precio),
    X \= Destino,
    my_append(Acc_recorrido, X, New_acc_recorrido),
    my_append(Acc_precios, Precio, New_acc_precios),
    New_acc_total is Acc_total + Precio,
    my_append(Acc_tipos, Transporte, New_acc_tipos),
    tr_enrutar(X, Destino, New_acc_recorrido, New_acc_precios, New_acc_total, New_acc_tipos, Recorrido, Precio_trayectos, Precio_total, Tipos_transporte).


