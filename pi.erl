-module(pi).
-export([calc_pi/1]).

calc_pi(Count) ->
    calc_pi(Count, 0.0).
calc_pi(0, Value) ->
    4.0 * (1.0 - Value);
calc_pi(Count, Value) when Count rem 2 == 0 ->
    calc_pi(Count - 1, Value - (1.0 / ((Count*2.0)+1.0)));
calc_pi(Count, Value) when Count rem 2 == 1 ->
    calc_pi(Count - 1, Value + (1.0 / ((Count*2.0)+1.0))).



