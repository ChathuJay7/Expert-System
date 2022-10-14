:- use_module(library(jpl)).
start :-sleep(0.4),	
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write('********************  CHATHURA JEEWANTHA  ***********************'),nl,
		sleep(0.4),
		write('*************************  CST18035  ***********************'),nl,
		sleep(0.4),
		write('**************  COMPUTER SCIENCE & TECHNOLOGY  ******************'),nl,
		sleep(0.4),
		write('*****************  Uva Wellassa University  *********************'),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,nl,
		
		
		interface2.
		  

    characteristic(User,ten_thousand_runs_odi) :- verify(User," scored more than 10000 runs in ODI's (y/n) ?").
 
    characteristic(User,right_handed) :- verify(User," right handed batsman (y/n) ?").
  
    characteristic(User,two_hundred_runs) :- verify(User," scored 200+ in a ODI inning (y/n) ?").

    characteristic(User,three_hundred_runs) :- verify(User," scored 300+ in a test inning (y/n) ?").
    
    characteristic(User,fifty_plus_average_test) :- verify(User," got 50+ average in test cricket (y/n) ?").
    
    characteristic(User,centuries_all_formats) :- verify(User," got centuries in all three formats (ODI/Test/T20) in international cricket (y/n) ?").

    characteristic(User,ten_thousand_runs_test) :- verify(User," scored more than 10000 runs in Test cricket (y/n) ?").

    characteristic(User,more_than_one_triple_century) :- verify(User," scored more than one triple century Test cricket (y/n) ?").

    characteristic(User,more_than_ten_double_century) :- verify(User," scored more than 10 double centuries Test cricket (y/n) ?").

	characteristic(User,century_below_fifty_balls_odi) :- verify(User," scored a century below 50 balls in ODI match (y/n) ?").
	

    hypothesis(User,sachin_tendulkar) :-
        characteristic(User,ten_thousand_runs_odi),
        characteristic(User,right_handed),
        characteristic(User,two_hundred_runs),
        characteristic(User,fifty_plus_average_test), 
        characteristic(User,centuries_all_formats),  
        characteristic(User,ten_thousand_runs_test). 

     hypothesis(User,kumar_sangakkara) :-
        characteristic(User,ten_thousand_runs_odi),
        characteristic(User,three_hundred_runs),
        characteristic(User,fifty_plus_average_test),
        characteristic(User,ten_thousand_runs_test),
        characteristic(User,more_than_ten_double_century).

	hypothesis(User,brian_lara) :-
        characteristic(User,ten_thousand_runs_odi),
        characteristic(User,three_hundred_runs),
        characteristic(User,fifty_plus_average_test), 
        characteristic(User,ten_thousand_runs_test),
		characteristic(User,more_than_one_triple_century),
		characteristic(User,century_below_fifty_balls_odi). 

	hypothesis(User,alastair_cook) :-
        characteristic(User,ten_thousand_runs_test).

    hypothesis(User,mahela_jayawardena) :-
        characteristic(User,ten_thousand_runs_odi),
		characteristic(User,right_handed),
        characteristic(User,three_hundred_runs),
        characteristic(User,centuries_all_formats), 
        characteristic(User,ten_thousand_runs_test).

    hypothesis(User,donald_bradman) :-
        characteristic(User,right_handed),
        characteristic(User,three_hundred_runs),
        characteristic(User,more_than_ten_double_century),
        characteristic(User,fifty_plus_average_test). 

    hypothesis(User,ricky_ponting) :-
        characteristic(User,ten_thousand_runs_odi),
        characteristic(User,right_handed),
        characteristic(User,fifty_plus_average_test),
        characteristic(User,ten_thousand_runs_test).

	hypothesis(User,virat_kholi) :-
        characteristic(User,ten_thousand_runs_odi),
        characteristic(User,right_handed),
        characteristic(User,fifty_plus_average_test).

	hypothesis(User,ab_devilliers) :-
        characteristic(User,right_handed),
        characteristic(User,fifty_plus_average_test),  
        characteristic(User,century_below_fifty_balls_odi). 

    
        
	hypothesis(_,"no here. Try to find a player that mentioned").
	
    response(Reply) :-
        read(Reply),
        write(Reply),nl.
		
ask(User,Question) :-
	write(User),write(', Does he'),write(Question),
	
	interface(', Does he',User,Question),
	write('Loading.'),nl,
	sleep(1),
	write('Loading..'),nl,
	sleep(1),
	write('Loading...'),nl,
	sleep(1),
    nl.
	
:- dynamic yes/1,no/1.		
	
verify(P,S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(P,S))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.


pt(User):- 

		hypothesis(User,Batsman),
		interface3(User,', Your Batsman is ',Batsman,'.'),
        write(User),write(', Your Batsman is '),write(Batsman),write('.'),undo,end.

end :-
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['IDENTUFY SPECIAL BATSMAN'], F),
	jpl_new('javax.swing.JLabel',['--- IDENTUFY SPECIAL BATSMAN ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _), 
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).
	   		
interface2 :-
	jpl_new('javax.swing.JFrame', ['IDENTUFY SPECIAL BATSMAN'], F),
	jpl_new('javax.swing.JLabel',['--- IDENTUFY SPECIAL BATSMAN ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Hello, What is your name? Please keep a player following in you mind. (Kumar Sangakkara, Sachin Tendulkar, Virat Kholi, Mahela Jayawardena, Brian Lara, Donald Bradman, AB DeVilliers, Alastair Cook, Rickt Ponting)'], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(null)
		->	write('you cancelled'),interface3('you cancelled. ','Thank you ','for use ','me.'),end,fail
		;	write("Hello, What is your name? Please keep an asian country name in your mind : "),write(N),nl,pt(N)
	).
	
	
interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Cricket Knowledge Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- CRICKET KNOWLEDGE EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).
	
help :- write("To start the expert system please type 'start.' and press Enter key").