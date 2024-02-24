% Project 4b part 2
% Author: Ian Woodcock

% define all possible options
creator(joanne).
creator(lou).
creator(ralph).
creator(winnie).

animal(bear).
animal(moose).
animal(seal).
animal(zebra).

adventure(circus).
adventure(rock_band).
adventure(spaceship).
adventure(train).

% define rules: rule(creator, animal, adventure).
rule(Creator, seal, Adventure) :- Creator \= joanne, Creator \= lou, Adventure \= spaceship, Adventure \= train.
rule(joanne, Animal, circus) :- Animal \= bear.
rule(winnie, zebra, _).
rule(_, bear, Adventure) :- Adventure \= spaceship.

% precicate to check for valid combinations
validation(Creator, Animal, Adventure) :-
	creator(Creator),
	animal(Animal),
	adventure(Adventure),
	rule(Creator, Animal, Adventure).
	
% predicate to make sure slots are not filled by the same answers
all_different([]).
all_different([H|T]) :- not(member(H, T)), all_different(T).

uniqueAnswers(Creators, Animals, Adventures) :-
	all_different(Creators),
	all_different(Animals),
	all_different(Adventures).
	
% predicate to solve puzzle
solve :-
	findall(Creator, creator(Creator), Creators),
    findall(Animal, animal(Animal), Animals),
    findall(Adventure, adventure(Adventure), Adventures),
	
	validation(Creator1, Animal1, Adventure1),
	validation(Creator2, Animal2, Adventure2),
	validation(Creator3, Animal3, Adventure3),
	validation(Creator4, Animal4, Adventure4),
	
	uniqueAnswers([Creator1, Creator2, Creator3, Creator4], [Animal1, Animal2, Animal3, Animal4], [Adventure1, Adventure2, Adventure3, Adventure4]),
	
	write('Creator1: '), write(Creator1), write(', Animal1: '), write(Animal1), write(', Adventure1: '), write(Adventure1), nl,
    write('Creator2: '), write(Creator2), write(', Animal2: '), write(Animal2), write(', Adventure2: '), write(Adventure2), nl,
    write('Creator3: '), write(Creator3), write(', Animal3: '), write(Animal3), write(', Adventure3: '), write(Adventure3), nl,
    write('Creator4: '), write(Creator4), write(', Animal4: '), write(Animal4), write(', Adventure4: '), write(Adventure4), nl.
	
% recources used: https://www.swi-prolog.org/pldoc/index.html. gpt4 (only as reference & clerification, not straight answers)