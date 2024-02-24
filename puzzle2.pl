% Project 4b part 3
% Author: Ian Woodcock

% define all possible options
sister(abigail).
sister(brenda).
sister(mary).
sister(paula).
sister(tara).

month(february).
month(march).
month(june).
month(july).
month(december).

day(sunday).
day(monday).
day(wednsday).
day(friday).
day(saturday).

% define earlier relation for months
earlier(february, march).
earlier(february, june).
earlier(february, july).
earlier(february, december).
earlier(march, june).
earlier(march, july).
earlier(march, december).
earlier(june, july).
earlier(june, december).
earlier(july, december).

% define rules
rule(paula, march, Day) :- Day \= saturday.
rule(abigail, _, Day) :- Day \= friday, Day \= wednsday.
rule(_, Month, _) :- earlier(Month, BMonth), earlier(Month, MMonth).
rule(tara, Month, Day) :- Month \= february, Day \= monday, Day \= wednsday, Day \= friday.
rule(mary, Month, Day) :- Month \= december, Month\= july, Day \= monday, Day \= wednsday, Day \= friday, MMonth = Month.
rule(_, june, sunday).
rule(brenda, _, Day) Day \= friday, BMonth = _.

% check for valid combonations
validation(Sister, Month, Day) :-
	sister(Sister),
	month(Month),
	day(Day),
	rule(Sister, Month, Day).

% predicate to make sure slots are not filled by the same answers
all_different([]).
all_different([H|T]) :- not(member(H, T)), all_different(T).

uniqueAnswers(Sisters, Months, Days) :-
	all_different(Sisters),
	all_different(Months),
	all_different(Days).
	
% predicate to solve
solve:-
	findall(Sister, sister(Sister), Sisters),
	findall(Month, month(Month), Months),
	findall(Day, day(Day), Days),
	
	validation(Sister1, Month1, Day1),
	validation(Sister2, Month2, Day2),
	validation(Sister3, Month3, Day3),
	validation(Sister4, Month4, Day4),
	validation(Sister5, Month5, Day5),
	
	uniqueAnswers([Sister1, Sister2, Sister3, Sister4, Sister5], [Month1, Month2, Month3, Month4, Month5], [Day1, Day2, Day3, Day4, Day5]),
	
	write('Sister1: '), write(Sister1), write(', Month1: '), write(Month1), write(', Day1: '), write(Day1), nl,
    write('Sister2: '), write(Sister2), write(', Month2: '), write(Month2), write(', Day2: '), write(Day2), nl,
    write('Sister3: '), write(Sister3), write(', Month3: '), write(Month3), write(', Day3: '), write(Day3), nl,
    write('Sister4: '), write(Sister4), write(', Month4: '), write(Month4), write(', Day4: '), write(Day4), nl,
	write('Sister5: '), write(Sister5), write(', Month5: '), write(Month5), write(', Day5: '), write(Day5), nl.
	
	
% recources used: https://www.swi-prolog.org/pldoc/index.html. gpt4 (only as reference & clerification, not straight answers)
% tried to make this one like i did for puzzle 2 as they are similar in format, but with added complexity from the "earlier than" rules, I dont think I got it quite right though
% let it run for a bit over 15min, and no result, just running, not returning false or anything just endless running