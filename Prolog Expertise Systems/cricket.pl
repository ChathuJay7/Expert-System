:- use_module(library(jpl)).
start :-sleep(0.4),	
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write('**********************CHATHURA JEEWANTHA*************************'),nl,
		sleep(0.4),
		write('****************COMPUTER SCIENCE & TECHNOLOGY********************'),nl,
		sleep(0.4),
		write('*******************Uva Wellassa University***********************'),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,nl,
		
		
		interface2.
		  
        
    characteristic(User,icc) :- verify(User," have qualified to play ICC cricket (y/n) ?").
 
    characteristic(User,world_cup) :- verify(User," have won a ICC world cup(ODI/T20/Test championship) (y/n) ?").
  
    characteristic(User,kumar_sangakkara) :- verify(User," have a player called 'Kumar Sangakkara' (y/n) ?").

    characteristic(User,virat_kohli) :- verify(User," have a player called 'Virat Kohli' (y/n) ?").
    
    characteristic(User,asia_cup) :- verify(User," have won a Asia cup (y/n) ?").
    
	characteristic(User,score) :- verify(User," have scored 400+ runs in a ODI match (y/n) ?").

    characteristic(User,shoaib_malik) :- verify(User," have a player called 'Shoaib Malik' (y/n) ?").
	
    characteristic(User,shakib_al_hasan) :- verify(User," have a player called 'Shakib Al Hasan' (y/n) ?").
 
    characteristic(User,muttiah_muralidaran) :- verify(User," have a player who got 800 test wickets (y/n) ?").
   
    characteristic(User,rashid_khan) :- verify(User," have a player called 'Rashid Khan' (y/n) ?").
  
    characteristic(User,lahore) :- verify(User," have a ground called 'Lahore' (y/n) ?").
   
    characteristic(User,sachin_tendulkar) :- verify(User," have a player called 'Sachin Tendulkar' (y/n) ?").
	

    
    hypothesis(User,india) :-
        characteristic(User,icc),
        characteristic(User,world_cup),
        characteristic(User,virat_kohli),
		characteristic(User,asia_cup),
		characteristic(User,score),
        characteristic(User,sachin_tendulkar).

	hypothesis(User,srilanka) :-
        characteristic(User,icc),
        characteristic(User,world_cup),
        characteristic(User,kumar_sangakkara),
        characteristic(User,asia_cup),
		characteristic(User,score),
        characteristic(User,muttiah_muralidaran).
        
    hypothesis(User,pakistan) :-
        characteristic(User,icc),
        characteristic(User,world_cup),
        characteristic(User,asia_cup),
        characteristic(User,shoaib_malik),
        characteristic(User,lahore).
        
    hypothesis(User,bangladesh) :-
        characteristic(User,icc),
        characteristic(User,shakib_al_hasan).
        
    hypothesis(User,afghanistan) :-
        characteristic(User,icc),
        characteristic(User,rashid_khan).
    
        
	hypothesis(_,"no here. Try with a country that qualified from ICC").
	
    response(Reply) :-
        read(Reply),
        write(Reply),nl.
		
ask(User,Question) :-
	write(User),write(', Does your country'),write(Question),
	
	interface(', Does your country',User,Question),
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

		hypothesis(User,Country),
		interface3(User,', Your country is ',Country,'.'),
        write(User),write(', Your country is '),write(Country),write('.'),undo,end.

end :-
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU ALL OF YOU |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Cricket Knowledge Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- CRICKET KNOWLEDGE EXPERT SYSTEM ---'],LBL),
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
	jpl_new('javax.swing.JFrame', ['Cricket Knowledge Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- CRICKET KNOWLEDGE EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Hello, What is your name? Please keep an asian country name in your mind'], N),
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