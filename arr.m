:- module arr.

:- interface.

:- import_module bool.
:- import_module int.
:- import_module list.

:- pred copy(list(int)::in , list(int)::out) is det.
:- pred find(list(int)::in , int::in , bool::out) is det.
:- pred head(list(int)::in , int::out) is det.
:- pred kth(list(int)::in , int::in , int::out) is det.
:- pred last(list(int)::in , int::out) is det.
:- pred merge(list(int)::in , list(int)::in , list(int)::out) is det.
:- pred push_back(list(int)::in , int::in , list(int)::out) is det.
:- pred push_front(list(int)::in , int::in , list(int)::out) is det.
:- pred reverse(list(int)::in, list(int)::out) is det.
:- pred size(list(int)::in , int::out) is det.
:- pred sum(list(int)::in , int::out) is det.
:- pred tail(list(int)::in , list(int)::out) is det.

:- implementation.

% helpers
:- pred kth_sub(list(int)::in , int::in , int::in , int::out) is det.
:- pred reverse_sub(list(int)::in, list(int)::in ,list(int)::out) is det.
:- pred size_sub(list(int)::in , int::in , int::out) is det.
:- pred sum_sub(list(int)::in , int::in , int::out) is det.

find(Arr , Elem , Res) :-(
	Arr = [], Res = no
	; Arr = [X | Xs],
	  (
		if X = Elem then Res = yes
		else find(Xs , Elem , Res)
	  )
    ).

tail(Arr , Out) :-(
	Arr = [], Out = []
	; Arr = [_ | Tail], Out = Tail
    ).

merge(Arr1 , Arr2 , Out) :-(
	Arr1 = [],
	(
		Arr2 = [], Out = []
		; Arr2 = [X | Xs],
		  Out = [X | T],
		  arr.merge([] , Xs , T)
	)
	; Arr1 = [X | Xs],
	  Out = [X | T],
	  arr.merge(Xs , Arr2 , T)
    ).

push_front(In , Elem , Out) :-(
	Out = [Elem | In]
    ).

sum_sub(Arr , Tmp , Sum) :-(
	Arr = [], Sum = Tmp
	; Arr = [X | Xs], sum_sub(Xs , Tmp + X , Sum)
   ).

sum(Arr , Sum) :-(
	Arr = [], Sum = 0
	; Arr = [_ | _],
	  sum_sub(Arr , 0 , Sum)
    ).

kth_sub(Arr , Id , Cnt , Res) :-(
	Arr = [X | Xs],
	(
		if Id = Cnt then Res = X
		else kth_sub(Xs , Id , Cnt + 1 , Res)
	)
	% TODO: should be a result
	; Arr = [], Res = 0
    ).

kth(Arr , Id , Res) :-(
	% TODO: should be a result
	Arr = [], Res = 0
	; Arr = [_ | _], kth_sub(Arr , Id , 0 , Res)
    ).

reverse_sub(Arr , Buff, Res) :-(
	Arr = [], Res = Buff
	; Arr = [H | T],
	  reverse_sub(T , [H | Buff] , Res)
    ).

reverse(Arr , Res) :-(
	reverse_sub(Arr , [] , Res)
     ).

head(Arr , Head) :-(
	Arr = [X | _], Head = X
	; Arr = [],
	  % TODO: should be a result
	  Head = -2137
    ).

last(Arr , Last) :-(
	% TODO: should be a result
	Arr = [], Last = -2137
	; Arr = [X | Xs],
	(
		if Xs = [] then Last = X
		else arr.last(Xs, Last)
	)
    ).

push_back(In , Elem , Out) :-(
	In = [] , Out = [Elem]
	; In = [Head | Tail],
          Out = [Head | CopiedTail],
          push_back(Tail , Elem , CopiedTail)
    ).

copy(Src, Dst) :-(
	Src = [] , Dst = []
	; Src = [Head | Tail],
	  Dst = [Head | CopiedTail],
          arr.copy(Tail , CopiedTail)
    ).

size_sub(Arr , Cnt , Res) :-(
	Arr = [] , Res = Cnt
	; Arr = [_ | Xs] , size_sub(Xs , Cnt + 1 , Res)
    ).

size(Arr , Res) :-(
	size_sub(Arr , 0 , Res)
    ).

:- end_module arr.
