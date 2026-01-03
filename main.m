:- module main.

:- interface.

% standard imports
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

% custom imports
:- import_module arr.
:- import_module helper.
:- import_module printer.

:- pred main(io::di , io::uo) is det.

:- implementation.

main(!IO)  :-(
	B : list(int) = [69 , 1 , 2 , 3 , 4 , 123 , 12 , 12 , 523 , 2345],
	A : list(int) = [1 , 1 , 4 , 5],
	C : list(int) = [2],
	arr.pop_front(B , Popfront),
	printer.print_arr(Popfront , !IO),
	arr.pop_back(B , Popback),
	printer.print_arr(Popback , !IO),
	arr.merge(B , A , Com),
	arr.find(Com , 12 , F),
	helper.parse_bool(F , "FOUND!\n" , "NOT FOUND!\n" , !IO),
	(
		if F = yes then io.write_string("FOUND!\n" , !IO)
		else io.write_string("NOT FOUND!\n" , !IO)
	),
	printer.print_arr(Com , !IO),
	arr.tail(Com , Tail),
	printer.print_arr(Tail , !IO),
	arr.push_front(B , 420 , D),
	printer.print_arr(D , !IO),
	printer.print_kth(B , 4 , !IO),
	printer.print_kth(B , 5 , !IO),
	arr.kth(B , 4 , Kth1),
	arr.kth(B , 5 , Kth2),
	io.write_int(Kth1 , !IO),
	io.write_char('\n' , !IO),
	io.write_int(Kth2 , !IO),
	io.write_char('\n' , !IO),
	arr.copy(B , COPY),
	printer.print_arr(COPY , !IO),
	printer.print_head(COPY , !IO),
	push_back(A , 69 , Out),
	io.write_string("HERE : " , !IO),
	printer.print_arr(Out , !IO),
	arr.head(B , Head),
	io.write_int(Head , !IO),
	io.write_char('\n' , !IO),
	arr.size(B , Len),
	io.write_int(Len , !IO),
	io.write_char('\n' , !IO),
	printer.print_arr(B , !IO),
	arr.reverse(B , Rev),
	printer.print_arr(Rev , !IO),
	printer.print_rev(B , !IO),
	io.write_char('\n' , !IO),
	arr.last(B , Last),
	io.write_int(Last , !IO),
	io.write_char('\n' , !IO),
	arr.sum(A , Sum),
	io.write_int(Sum , !IO)
    ).
