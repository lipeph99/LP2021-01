rainhas(N, Rainhas) :-
    length(Rainhas, N),
	tabuleiro(Rainhas, Tabuleiro, 0, N, _, _),
	rainhas(Tabuleiro, 0, Rainhas).

tabuleiro([], [], N, N, _, _).
tabuleiro([_|Rainhas], [Col-Vars|Tabuleiro], Col0, N, [_|VR], VC) :-
	Col is Col0+1,
	functor(Vars, f, N),
	constraints(N, Vars, VR, VC),
	tabuleiro(Rainhas, Tabuleiro, Col, N, VR, [_|VC]).

constraints(0, _, _, _) :- !.
constraints(N, Lin, [R|Rs], [C|Cs]) :-
	arg(N, Lin, R-C),
	M is N-1,
	constraints(M, Lin, Rs, Cs).

rainhas([], _, []).
rainhas([C|Cs], Lin0, [Col|Solucao]) :-
	Lin is Lin0+1,
	select(Col-Vars, [C|Cs], Tabuleiro),
	arg(Lin, Vars, Lin-Lin),
	rainhas(Tabuleiro, Lin, Solucao).