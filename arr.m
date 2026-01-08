:- module arr.

:- interface.

:- import_module bool.
:- import_module int.
:- import_module list.

:- pred add(list(int)::in, list(int)::in, list(int)::out) is det.
:- pred binary_search(list(int)::in, int::in, bool::out) is det.
:- pred combine(list(int)::in, list(int)::in, list(int)::out) is det.
:- pred copy(list(int)::in, list(int)::out) is det.
:- pred find(list(int)::in, int::in, bool::out) is det.
:- pred hadamard(list(int)::in, list(int)::in, list(int)::out) is det.
:- pred head(list(int)::in, int::out) is det.
:- pred kth(list(int)::in, int::in, int::out) is det.
:- pred last(list(int)::in, int::out) is det.
:- pred merge(list(int)::in, list(int)::in, list(int)::out) is det.
:- pred merge_sort(list(int)::in, list(int)::out) is det.
:- pred pop_back(list(int)::in, list(int)::out) is det.
:- pred pop_front(list(int)::in, list(int)::out) is det.
:- pred push_back(list(int)::in, int::in, list(int)::out) is det.
:- pred push_front(list(int)::in, int::in, list(int)::out) is det.
:- pred remove_kth(list(int)::in, int::in, list(int)::out) is det.
:- pred reverse(list(int)::in, list(int)::out) is det.
:- pred size(list(int)::in, int::out) is det.
:- pred split(list(int)::in, int::in, list(int)::out, list(int)::out) is det.
:- pred sum(list(int)::in, int::out) is det.
:- pred tail(list(int)::in, list(int)::out) is det.

:- pred insert_kth(list(int)::in, int::in, int::in, list(int)::out) is det.

:- implementation.

% helpers
:- pred kth_sub(list(int)::in, int::in, int::in, int::out) is det.
:- pred remove_kth_sub(list(int)::in, int::in, int::in, list(int)::out) is det.
:- pred reverse_sub(list(int)::in, list(int)::in ,list(int)::out) is det.
:- pred size_sub(list(int)::in, int::in, int::out) is det.
:- pred split_sub(list(int)::in, int::in, int::in, list(int)::out, list(int)::out) is det.
:- pred sum_sub(list(int)::in, int::in, int::out) is det.

:- pred insert_kth_sub(list(int)::in, int::in, int::in, int::in, list(int)::out) is det.

insert_kth(Arr, Elem, At, Out) :-(
        Arr = [] -> Out = []
        ; insert_kth_sub(Arr, Elem, At, 0, Out)
        ).

insert_kth_sub(Arr, Elem, At, Cnt, Out) :-(
        % FIXME: only works for the first elemement
        At = Cnt ->
        (
            Arr = [H | T],
            Out = [Elem | OT],
            remove_kth_sub(Arr, At, Cnt + 1, OT)
            ; Arr = [],
              Out = [Elem | OT],
              remove_kth_sub([], At, Cnt + 1, OT)
        )
        ; Arr = [], Out = []
        ; Arr = [H | T],
          Out = [H | OT],
          remove_kth_sub(T, At, Cnt + 1, OT)
    ).

remove_kth(Arr, At, Out) :-(
        Arr = [] -> Out = []
        ; remove_kth_sub(Arr, At, 0, Out)
    ).

remove_kth_sub(Arr, At, Cnt, Out) :-(
        At = Cnt ->
        (
            Arr = [_ | T], remove_kth_sub(T, At, Cnt + 1, Out)
            ; Arr = [], remove_kth_sub([], At, Cnt + 1, Out)
        )
        ; Arr = [], Out = []
        ; Arr = [H | T],
          Out = [H | OT],
          remove_kth_sub(T, At, Cnt + 1, OT)
    ).

binary_search(Arr, Elem, Res) :-(
    Arr = [], Res = no
    ; Arr = [H | T],
      (
        T = [],
        (
            Elem = H -> Res = yes ; Res = no
        )
        ; T = [_ | _],
          arr.size(Arr, Size),
          arr.kth(Arr, Size / 2 - 1, Curr),
          arr.split(Arr, Size / 2 - 1, L, R),
          (
              Curr = Elem -> Res = yes
              ; Curr > Elem -> binary_search(L, Elem, Res)
              ; binary_search(R, Elem, Res)
          )
      )
    ).

merge_sort(Arr, Res) :-(
    Arr = [], Res = []
    ; Arr = [H | T],
      (
        T = [],
        Res = [H]
        ; T = [_ | _],
        arr.size(Arr, Size),
        arr.split(Arr, Size / 2 - 1, Arr1, Arr2),
        arr.merge_sort(Arr1, Res1),
        arr.merge_sort(Arr2, Res2),
        arr.merge(Res1, Res2, Res)
      )
    ).

merge(Arr1, Arr2, Res) :-(
    Arr1 =[],
    (
        Arr2 = [], Res = []
        ; Arr2 = [_ | _], arr.copy(Arr2, Res)
    )
    ; Arr1 = [H1 | T1],
    (
        Arr2 = [], arr.copy(Arr1, Res)
        ; Arr2 = [H2 | T2],
          (
              H2 = H1 -> Res = [H1 | [H2 | T]], arr.merge(T1, T2, T)
            ; H2 < H1 -> Res = [H2 | T],        arr.merge(Arr1, T2, T)
            ;            Res = [H1 | T],        arr.merge(T1, Arr2, T)
          )
    )
    ).

hadamard(Arr1, Arr2, Res) :-(
    Arr1 =[],
    (
        % TODO: debullshitfy?
        Arr2 = [] -> Res = [] ; Res = []
    )
    ; Arr1 = [H1 | T1],
    (
        % TODO: debullshitfy? x2
        Arr2 = [], Res = []
        ; Arr2 = [H2 | T2],
          Res = [(H1 * H2) | T3],
          hadamard(T1, T2, T3)
    )
    ).

add(Arr1, Arr2, Res) :-(
    Arr1 = [],
    (
        % TODO: debullshitfy?
        Arr2 = [] -> Res = [] ; Res = []
    )
    ; Arr1 = [H1 | T1],
    (
        % TODO: debullshitfy? x2
        Arr2 = [], Res = []
        ; Arr2 = [H2 | T2],
          Res = [(H1 + H2) | T3],
          add(T1, T2, T3)
    )
    ).

split_sub(Arr, At, Cnt, Out1, Out2) :-(
    Arr = [], Out1 = [], Out2 = []
    ; Arr = [H | T],
      Out1 = [H | T1],
      (
         At = Cnt -> T1 = [], arr.copy(T, Out2)
         ; split_sub(T, At, Cnt + 1, T1, Out2)
      )
    ).

split(Arr, At, Out1, Out2) :-(
    % Out1 = <0, At>, Out2 = (At, ...>
    Arr = [], Out1 = [], Out2 = []
    ; Arr = [_ | _],
      split_sub(Arr, At, 0, Out1, Out2)
    ).

pop_back(In, Out) :-(
    In = [], Out = []
    ; In = [H | T],
      (
        T = [] -> Out = []
        ; Out = [H | TH], pop_back(T, TH)
      )
    ).

pop_front(In, Out) :-(
    In = [], Out = []
    ; In = [_ | T], Out = T
    ).

find(Arr, Elem, Res) :-(
    Arr = [], Res = no
    ; Arr = [X | Xs],
      (
        X = Elem -> Res = yes
        ; find(Xs, Elem, Res)
      )
    ).

tail(Arr, Out) :-(
    Arr = [], Out = []
    ; Arr = [_ | Tail], Out = Tail
    ).

combine(Arr1, Arr2, Out) :-(
    Arr1 = [],
    (
        Arr2 = [], Out = []
        ; Arr2 = [X | Xs],
          Out = [X | T],
          arr.combine([], Xs, T)
    )
    ; Arr1 = [X | Xs],
      Out = [X | T],
      arr.combine(Xs, Arr2, T)
    ).

push_front(In, Elem, Out) :-(
    Out = [Elem | In]
    ).

sum_sub(Arr, Tmp, Sum) :-(
    Arr = [], Sum = Tmp
    ; Arr = [X | Xs], sum_sub(Xs, Tmp + X, Sum)
   ).

sum(Arr, Sum) :-(
    Arr = [], Sum = 0
    ; Arr = [_ | _],
      sum_sub(Arr, 0, Sum)
    ).

kth_sub(Arr, Id, Cnt, Res) :-(
    Arr = [X | Xs],
    (
        Id = Cnt -> Res = X
        ; kth_sub(Xs, Id, Cnt + 1, Res)
    )
    % TODO: should be a result
    ; Arr = [], Res = 0
    ).

kth(Arr, Id, Res) :-(
    % TODO: should be a result
    Arr = [], Res = 0
    ; Arr = [_ | _], kth_sub(Arr, Id, 0, Res)
    ).

reverse_sub(Arr, Buff, Res) :-(
    Arr = [], Res = Buff
    ; Arr = [H | T],
      reverse_sub(T, [H | Buff], Res)
    ).

reverse(Arr, Res) :-(
    reverse_sub(Arr, [], Res)
    ).

head(Arr, Head) :-(
    Arr = [X | _], Head = X
    ; Arr = [],
      % TODO: should be a result
      Head = -2137
    ).

last(Arr, Last) :-(
    % TODO: should be a result
    Arr = [], Last = -2137
    ; Arr = [X | Xs],
     (
        Xs = [] -> Last = X
        ; arr.last(Xs, Last)
     )
    ).

push_back(In, Elem, Out) :-(
    In = [], Out = [Elem]
    ; In = [Head | Tail],
      Out = [Head | T],
      push_back(Tail, Elem, T)
    ).

copy(Src, Dst) :-(
    Src = [], Dst = []
    ; Src = [H | SrcT],
      Dst = [H | T],
      arr.copy(SrcT, T)
    ).

size_sub(Arr, Cnt, Res) :-(
    Arr = [], Res = Cnt
    ; Arr = [_ | Xs], size_sub(Xs, Cnt + 1, Res)
    ).

size(Arr, Res) :-(
    size_sub(Arr, 0, Res)
    ).

:- end_module arr.
