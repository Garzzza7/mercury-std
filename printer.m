:- module printer.

:- interface.

:- import_module io.
:- import_module int.
:- import_module list.

:- pred print_arr(list(int)::in, io::di, io::uo) is det.

:- implementation.

print_arr(ARR, !IO) :-
    (
        if ARR = [X]
        then io.write_int(X,!IO),
             io.write_char('\n', !IO)
        else if ARR = [X | Xs]
        then io.write_int(X,!IO), io.write_char(' ', !IO),
             print_arr(Xs, !IO)
        else io.write_string("ERROR: Array is empty!\n", !IO)
    ).

:- end_module printer.
