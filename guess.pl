% Project 4b part 1
% Author: Ian Woodcock

% predicate to play the game
play :-
	random(1, 21, Answer),
	write('Make sure all guesses are followed by a period.\n'),
	guessNumber(Answer).
	
% predicate for guessing the number
guessNumber(Answer) :-
	write('Guess a number between 1 and 20: '),
    flush_output,
    read(Guess),
    checkGuess(Answer, Guess).
	
% predicates for checking if users answer is too low, too high, or correct
checkGuess(Answer, Guess) :-
	Guess < Answer,
    write('Too low. Try again.\n'),
    guessNumber(Answer).

checkGuess(Answer, Guess) :-
	Guess > Answer,
    write('Too high. Try again.\n'),
    guessNumber(Answer).
	
checkGuess(Answer, Guess) :-
	write('Correct! The number was '), 
    write(Answer).
	
% recources used: https://www.swi-prolog.org/pldoc/index.html. gpt4 (only as reference & clerification, not straight answers)
    
	
