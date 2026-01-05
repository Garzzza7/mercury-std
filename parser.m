:- module parser.

:- interface.

:- import_module bool.
:- import_module io.

:- pred parse_bool_to_io(bool::in, string::in, string::in, io::di, io::uo) is det.
:- pred parse_bool_to_string(bool::in, string::in, string::in, string::out) is det.

:- implementation.

parse_bool_to_io(Bool, S1, S2, !IO) :-(
    if Bool = yes then io.write_string(S1, !IO)
    else io.write_string(S2, !IO)
   ).

parse_bool_to_string(Bool, S1, S2, Out) :-(
    if Bool = yes then Out = S1
    else Out = S2
   ).

:- end_module parser.
