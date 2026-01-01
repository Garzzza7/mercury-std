:- module main.

:- interface.

:- import_module bag.
:- import_module bool.
:- import_module cord.
:- import_module float.
:- import_module int.
:- import_module io.
:- import_module list.
:- import_module map.
:- import_module math.
:- import_module string.

:- pred main(io::di , io::uo) is det.
:- pred print_arr(list(int)::in , io::di, io::uo) is det.
:- pred print_rev(list(int)::in , io::di, io::uo) is det.
:- pred print_head(list(int)::in , io::di, io::uo) is det.
:- pred print_kth(list(int)::in , int::in , io::di, io::uo) is det.
:- pred print_kth_sub(list(int)::in , int::in , int::in , io::di, io::uo) is det.
:- pred len(list(int)::in , int::out) is det.
:- pred pb(list(int)::in , int::in , list(int)::out) is det.
:- pred cpy_arr(list(int)::in , list(int)::out) is det.

:- pred head(list(int)::in , int::out) is det.

:- pred rev_arr(list(int)::in, list(int)::out) is det.

:- implementation.

:- pred len_sub(list(int)::in , int::in , int::out) is det.
:- pred cpy_arr_sub(list(int)::in , list(int)::out) is det.
:- pred pb_sub(list(int)::in , int::in , list(int)::out) is det.
:- pred rev_arr_sub(list(int)::in, list(int)::in ,list(int)::out) is det.

rev_arr_sub(Arr , Buff, Res) :-(
      Arr = [] , Res = Buff
      ; Arr = [H | T] ,
        rev_arr_sub(T , [H | Buff] , Res)
    ).

rev_arr(Arr , Res) :-(
     rev_arr_sub(Arr , [] , Res)
     ).

head(Arr , Head) :-(
    Arr = [X | Xs], Head = X
    ; Arr = [] , Head = -2137
    ).

pb_sub(IN , ELEM , OUT) :-(
         IN = [] , OUT = [ELEM]
         ; IN = [Head | Tail] ,
           OUT = [Head | CopiedTail] ,
           pb_sub(Tail , ELEM , CopiedTail)
    ).

pb(In , Elem , Out) :-(
           pb_sub(In , Elem , Out)
    ).

cpy_arr(Source, Destination) :-(
           cpy_arr_sub(Source, Destination)
    ).

cpy_arr_sub(IN , OUT) :-(
    IN = [] , OUT = []
    ; IN = [Head | Tail] ,
      OUT = [Head | CopiedTail] ,
      cpy_arr_sub(Tail , CopiedTail)
    ).

len_sub(ARR , CNT , Res) :-(
    ARR = [] , Res = CNT
    ; ARR = [_ | Xs] , len_sub(Xs , CNT + 1 , Res)
    ).

len(ARR , Res) :-(
    len_sub(ARR , 0 , Res)
    ).

print_head(ARR , !IO) :-(
    if ARR = [X]
    then io.write_int(X , !IO)
    else if ARR = [X | _]
    then io.write_int(X , !IO)
    else io.write_string("Empty array gg.\n" , !IO)
    ).

print_arr(ARR , !IO) :-(
    if ARR = [X]
    then io.write_int(X, !IO),
         io.write_char('\n', !IO)
    else if ARR = [X | Xs]
    then io.write_int(X, !IO),
         io.write_char(' ', !IO),
         print_arr(Xs, !IO)
    else io.write_string("Empty array gg.\n" , !IO)
    ).

print_rev(ARR , !IO) :-(
    if ARR = [X]
    then io.write_int(X, !IO),
         io.write_char(' ', !IO)
    else if ARR = [X | Xs]
    then print_rev(Xs, !IO),
         io.write_int(X, !IO),
         io.write_char(' ', !IO)
    else io.write_string("Empty array gg.\n" , !IO)
    ).

print_kth(ARR , ID , !IO) :-(
    if ARR = []
    then io.write_string("Empty array gg.\n" , !IO)
    else print_kth_sub(ARR , ID , 0 , !IO)
    ).

print_kth_sub(ARR , ID , CNT , !IO) :-(
    if ARR = [X | Xs]
    then (
         if ID = CNT
         then io.write_int(X, !IO),
            io.write_char('\n', !IO)
        else print_kth_sub(Xs , ID , CNT + 1 , !IO)
    )
    else io.write_string("Index out of scope.\n" , !IO)
    ).

main(!IO)  :-(
    io.write_string("hello, world!\n", !IO),
    io.write_string("hello, gab!\n", !IO),
    B : list(int) = [69 , 1 , 2 , 3 , 4 , 123 , 12 , 12  ,  523 , 2345],
    A : list(int) = [1 , 1 , 4 , 5],
    C : list(int) = [2],
    cpy_arr(B , COPY),
    print_arr(COPY , !IO),
    pb(A , 69 , Out),
    print_arr(Out , !IO),
    head(B , Head),
    io.write_int(Head , !IO),
    io.write_char('\n' , !IO),
    len(B , Len),
    io.write_int(Len , !IO),
    io.write_char('\n' , !IO),
    print_arr(B , !IO),
    rev_arr(B , Rev),
    print_arr(Rev , !IO),
    print_rev(B , !IO),
    io.write_char('\n' , !IO)
    ).
