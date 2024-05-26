-module(merge).
-export([ms/1]).

count(List)->
    count(List, 0).
count([], No)->
    No;
count([_|Tail], No)->
    count(Tail, No + 1).

half_list([], {L, R}, _) ->
    {L, R};
half_list([H|T], {L,R}, No) when No =< 0 ->
    half_list(T, {L, R++[H]}, No - 1);

half_list([H|T], {L,R}, No) when No > 0 ->
    half_list(T, {L++[H], R}, No - 1).

sort([], List)->
    List;
sort([H|T], List)->
    sort(T, List ++ [H]);
sort({[], [H|T]}, List)->
    sort(T, List ++ [H]);
sort({[H|T], []}, List)->
    sort(T, List ++ [H]);
sort({[LH|LT], [RH|RT]}, List) when LH < RH->
    sort({LT, [RH|RT]}, List ++ [LH]);
sort({[LH|LT], [RH|RT]}, List) when RH =< LH->
    sort({[LH|LT], RT}, List ++ [RH]).

ms([])->
    [];
ms([L])->
    [L];
ms(List)->
    Cnt = count(List)/2,
    {L, R} = half_list(List, {[], []}, Cnt),
    A = ms(L),
    B = ms(R),
    sort({A, B}, []).
