:- dynamic client/2.
:- dynamic rental/2.

init_db :-
    retractall(client(_,_)), retractall(rental(_,_)),
    assertz(client(1, 'Назаров Кирилл')),
    assertz(client(2, 'Иванов Петр')),
    assertz(rental(1, 'Матрица')),
    assertz(rental(2, 'Терминатор')),
    write('>>> БД загружена'), nl.

main :-
    repeat,
    nl, write('БД: ВИДЕОПРОКАТ'), nl,
    write('1. Инициализация'), nl,
    write('2. Все клиенты'), nl,
    write('3. Выдать кассету'), nl,
    write('4. Удалить клиента'), nl,
    write('0. Выход'), nl,
    write('Выбор: '), read(C), action(C), C == 0, !.

action(1) :- init_db, !.
action(2) :- 
    client(ID, Name),
    write('ID: '), write(ID), write(' | Клиент: '), write(Name), nl, fail.
action(2) :- !.
action(3) :-
    write('ID: '), read(ID), write('Фильм: '), read(Movie),
    assertz(rental(ID, Movie)), write('Выдано'), nl, !.
action(4) :-
    write('ID для удаления: '), read(ID),
    retractall(client(ID, _)), retractall(rental(ID, _)),
    write('Клиент удален'), nl, !.
action(0) :- write('Завершение'), nl, !.
action(_) :- write('Ошибка'), nl, !.
