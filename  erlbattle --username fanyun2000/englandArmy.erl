-module(englandArmy).
-export([start/2]).

start(BattleField, Side) ->
    
	io:format("~p begin to run on ~p army....~n", ["englandArmy", Side]),
	run(BattleField,Side).
	
run(BattleField, Side) ->
	
	BattleField!{command, "Side: marching forword"},
	receive
		finish ->  % 退出消息，以便让主进程能够结束战斗
			BattleField!{command, "Side: finish battle"}
	after 1 -> 
			run(BattleField, Side)
	end.
	