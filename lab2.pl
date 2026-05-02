invert([], []).
invert([H|T], Reversed) :-
    invert(T, RevT),
    append(RevT, [H], Reversed).
