:- module printer.

:- interface.

:- import_module int.
:- import_module io.
:- import_module list.

:- pred print_arr(list(int)::in, io::di, io::uo) is det.
:- pred print_head(list(int)::in, io::di, io::uo) is det.
:- pred print_kth(list(int)::in, int::in, io::di, io::uo) is det.
:- pred print_rev(list(int)::in, io::di, io::uo) is det.

:- implementation.

:- pred print_kth_sub(list(int)::in, int::in, int::in, io::di, io::uo) is det.

print_head(Arr, !IO) :-(
    Arr = [], io.write_string("Empty array gg.\n", !IO)
    ; Arr = [X | _], io.write_int(X, !IO), io.write_char('\n', !IO)
    ).

print_arr(Arr, !IO) :-(
    Arr = [], io.write_char('\n', !IO)
    ; Arr = [X | Xs],
      io.write_int(X, !IO),
      io.write_char(' ', !IO),
      print_arr(Xs, !IO)
    ).

print_rev(Arr, !IO) :-(
    % TODO: nicely add newline at the end?
    Arr = [], io.write_char('\n', !IO)
    ; Arr = [X | Xs],
      print_rev(Xs, !IO),
      io.write_int(X, !IO),
      io.write_char(' ', !IO)
    ).

print_kth(Arr, Id, !IO) :-(
    Arr = [], io.write_string("Empty array gg.\n", !IO)
    ; Arr = [_ | _], print_kth_sub(Arr, Id, 0, !IO)
    ).

print_kth_sub(Arr, Id, Cnt, !IO) :-(
    Arr = [X | Xs],
    (
        if Id = Cnt then io.write_int(X, !IO), io.write_char('\n', !IO)
        else print_kth_sub(Xs, Id, Cnt + 1, !IO)
    )
    ;Arr = [], io.write_string("Index out of scope.\n", !IO)
    ).

:- end_module printer.
