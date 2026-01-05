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
:- import_module parser.
:- import_module printer.

:- pred main(io::di, io::uo) is det.

:- implementation.

main(!IO) :-(
    B : list(int) = [69, 1, 2, 3, 4, 123, 12, 12, 523, 2345],
    A : list(int) = [1, 1, 4, 5],
    Atest : list(int) = [1, 1, 1, 1],
    C : list(int) = [2],
    arr.merge_sort([16, 13, 12, 10, 9, 8, 67, 7, 6, 5, 4, 3, 2, 1, 11], Sorted),
    % arr.merge_sort([1 , 2], Sorted),
    printer.print_arr(Sorted, !IO),
    arr.binary_search(Sorted, 1, Found1),
    parser.parse_bool_to_io(Found1, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 2, Found2),
    parser.parse_bool_to_io(Found2, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 3, Found3),
    parser.parse_bool_to_io(Found3, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 4, Found4),
    parser.parse_bool_to_io(Found4, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 5, Found5),
    parser.parse_bool_to_io(Found5, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 6, Found6),
    parser.parse_bool_to_io(Found6, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 7, Found7),
    parser.parse_bool_to_io(Found7, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 8, Found8),
    parser.parse_bool_to_io(Found8, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 9, Found9),
    parser.parse_bool_to_io(Found9, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 10, Found10),
    parser.parse_bool_to_io(Found10, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 11, Found11),
    parser.parse_bool_to_io(Found11, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 12, Found12),
    parser.parse_bool_to_io(Found12, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 13, Found13),
    parser.parse_bool_to_io(Found13, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 16, Found16),
    parser.parse_bool_to_io(Found16, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 67, Found67),
    parser.parse_bool_to_io(Found67, "Got it!\n", "Nope\n", !IO),
    arr.binary_search(Sorted, 69, Found69),
    parser.parse_bool_to_io(Found69, "Got it!\n", "Nope\n", !IO),
    arr.merge([1, 2, 5] , [2, 3] , Merge),
    printer.print_arr(Merge, !IO),
    arr.add(A, Atest, Addition),
    printer.print_arr(Addition, !IO),
    arr.hadamard([1, 1, 1, 1], [1, 1, 1, 1], Hadamard),
    printer.print_arr(Hadamard, !IO),
    arr.split(A, 2, Copa, Copa1),
    printer.print_arr(Copa, !IO),
    printer.print_arr(Copa1, !IO),
    arr.pop_front(B, Popfront),
    printer.print_arr(Popfront, !IO),
    arr.pop_back(B, Popback),
    printer.print_arr(Popback, !IO),
    arr.combine(B, A, Com),
    arr.find(Com, 12, F),
    parser.parse_bool_to_io(F, "FOUND!\n", "NOT FOUND!\n", !IO),
    parser.parse_bool_to_string(F, "FOUND!\n", "NOT FOUND!\n", Parsed),
    io.write_string(Parsed, !IO),
    printer.print_arr(Com, !IO),
    arr.tail(Com, Tail),
    printer.print_arr(Tail, !IO),
    arr.push_front(B, 420, D),
    printer.print_arr(D, !IO),
    printer.print_kth(B, 4, !IO),
    printer.print_kth(B, 5, !IO),
    arr.kth(B, 4, Kth1),
    arr.kth(B, 5, Kth2),
    io.write_int(Kth1, !IO),
    io.write_char('\n', !IO),
    io.write_int(Kth2, !IO),
    io.write_char('\n', !IO),
    arr.copy(B, COPY),
    printer.print_arr(COPY, !IO),
    printer.print_head(COPY, !IO),
    push_back(A, 69, Out),
    io.write_string("HERE : ", !IO),
    printer.print_arr(Out, !IO),
    arr.head(B, Head),
    io.write_int(Head, !IO),
    io.write_char('\n', !IO),
    arr.size(B, Len),
    io.write_int(Len, !IO),
    io.write_char('\n', !IO),
    printer.print_arr(B, !IO),
    arr.reverse(B, Rev),
    printer.print_arr(Rev, !IO),
    printer.print_rev(B, !IO),
    io.write_char('\n', !IO),
    arr.last(B, Last),
    io.write_int(Last, !IO),
    io.write_char('\n', !IO),
    arr.sum(A, Sum),
    io.write_int(Sum, !IO)
    ).
