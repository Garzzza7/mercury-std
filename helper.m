:- module helper.

:- interface.

:- import_module bool.
:- import_module io.

:- pred parse_bool(bool::in , string::in , string::in , io::di , io::uo) is det.

:- implementation.

parse_bool(Bool , S1 , S2 , !IO) :-(
	if Bool = yes then io.write_string(S1 , !IO)
	else io.write_string(S2 , !IO)
   ).

:- end_module helper.
