
-- populate administrator --
Insert into administrator values(100001, 'Abuja' , 'itsPMOofINDIA'),
(100002, 'Oyo' , '293dne83DH'),
(100003, 'Ondo' , '582kee48RJ'),
(100004, 'Benue' , '572jne28RH'),
(100005, 'Osun' , '683fhi82YJ'),
(100006, 'Kaduna' , '479feu95UW'),
(100007, 'Ekiti' , '581fiq74IR'),
(100008, 'Ogun' , '792iex38IC'),
(100009, 'Kano' , '582ian72IS');

select * from administrator;

-- populate scheme --
Insert into scheme
 values(200001, 89264 , 'Commercial Aric scheme' , 100001 ),
		(200002, 46293 , 'Solar water pump Scheme' ,100002 ),
		(200003, 57292 , 'Kama Credit Scheme' , 100003 ),
		(200004, 82664 , 'For food only Scheme' , 100004 ),
		(200005, 54829 , 'Agro funders' , 100005 ),
		(200006, 68264 , 'Lisa Aqua Scheme' , 100006 ),
		(200007, 18234 , 'Kizito Credit Scheme' , 100007 ),
		(200008, 59132 , 'River Basin Credit Scheme' , 100008 ),
		(200009, 71837, 'Agro Credit Guarantee Scheme' , 100009 );

select * from scheme;

-- populate place --
Insert into place 
values  (360101 , 'Ago Araromi' , 'Ekiti'),
		(340281 , 'Iloro' , 'Ondo' ),
		(340231, 'Iwalewa' , 'Ondo' ),
		(110108 , 'Ago Ilorin' , 'Ogun'),
		(232111 , 'Elewure' , 'Osun' ),
		(210231 , 'Adeogun' , 'Oyo' ),
		(210232 , 'Aiyedun' , 'Oyo' ),
		(200261 , 'Oluyole' , 'Oyo' ),
		(200281 , 'Sabo' , 'Oyo' ),
		(971109 , 'Agerega' , 'Benue' ),
		( 800241 , 'Gamji Gate' , 'Kaduna' ),
		( 800272 , 'Jaji Cl.' , 'Kaduna' ),
		(700214 , 'Badawa' , 'Kano' ),
		(700281 , 'Dakata' , 'Kano' ),
		(700241 , 'Kabuga' , 'Kano' );

select * from place;

-- populate Buyer--
Insert into buyer 
values  ( 400001 , 'Agrotraders' , 340281 ),
		( 400002 , 'Polito' , 210231 ),
		( 400003 , 'Panskak' , 232111 ),
		( 400004 , 'Idibia' , 200261 ),
		( 400005 , 'Amani' , 800241 ),
		( 400006 , 'Omoni' , 800272 ),
		( 400007 , 'julius' , 700281 ),
		( 400008 , 'Chritiana' , 700241 ),
		( 400009 , 'Marabo' , 700241 );

select * from buyer;

-- populate farmer --
Insert into farmer 
values  (900001 , 'Ankasa Dariye', 'M' , 815739679 , 700241 , 200001),
		(900002, 'louis Ander', 'M' , 817825679, 700281 , 200003),
		(900003 , 'Sani Shehu' , 'M' , 812346826 , 800241 , 200002 ),
		(900004 , 'Adams Oshio' , 'M' , 682457289 , 971109 , 200004 ),
		(900005 , 'Femi Alakija' , 'M' , 952758257 , 110108 , 200003 ),
		(900006 , 'Amos Seun' , 'M' , 942857556 , 232111 , 200006 ),
		(900007 , 'Bintu Stephens' , 'M' , 620176843 , 800272 , 200005 ),
		(900008 , 'Mohammed Yusuf' , 'M' , 942853194 , 200281 , 200004 ),
		(900009 , 'Oseni Seun' , 'M' , 920831958 , 360101 , 200009 ),
		(900010 , 'Kayode Olarewaju' , 'M' , 835195835 , 340281, 200008 ),
		(900011 , 'Amakowa James' , 'M' , 927461853 , 340231 , 200009 ),
		(900012 , 'Bukola Saraki' , 'M' , 919124387 , 232111 , 200007 ),
		(900013 , 'Innocent Yusuf' , 'M' , 824745109 , 971109 , 200007 ),
		(900014 , 'Yemi Badmus' , 'M' , 929692547 , 210232 , 200005 ),
		(900015 , 'Moses Kasali' , 'M' , 943017985 , 110108 , 200006 ),
		(900016 , 'Yemi Obasanjo' , 'M' , 936837159 , 360101 , 200003 ),
		(900017 , 'Sunday Akinsola' , 'M' , 932947518 , 210232, 200001 ),
		(900018 , 'Ife Adetokunbo' , 'M' , 948194326 , 340231 , 200001 );

select * from farmer;

-- populate Loan --
Insert into loan 
values 	 ( 700001, 900001, 600003 ),
		 ( 700002, 900007, 600006 ),
		 ( 700003, 900009, 600001 ),
		 ( 700004, 900002, 600007 ),
		 ( 700005, 900005, 600002 ),
		 ( 700006, 900008, 600009 ),
		 ( 700007, 900003, 600004 ),
		 ( 700008, 900006, 600008 ),
		 ( 700009, 900004, 600005 );

select * from loan;

-- produces --
insert into produces 
values  (900018, 'Oat'),
		(900008, 'Maize'),
		(900001, 'Peas'),
		(900002, 'Maize'),
		(900007, 'pepper'),
		(900005, 'Turmeric');

select * from produces;

-- populate bank --
Insert into bank 
values  (600001, 'Ferest Bank'),
		(600002, 'UBI'),
		(600003, 'Sky Bank'),
		(600004, 'grand capital Bank'),
		(600005, 'providux Bank'),
		(600006, 'ALUX Bank'),
		(600007, 'GBB'),
		(600008, 'ADEC'),
		(600009, 'Bank of Nigeria');
 
 select * from bank;
 
 -- populate crops --
 Insert into crops values ( 'Beans' , 'pulses' ),
( 'Peas' , 'pulses' ),
( 'Rice' , 'Cereals' ),
( 'Wheat' , 'Cereals' ),
( 'Maize' , 'Cereals' ),
( 'Oat' , 'Cereals'),
( 'Millet' , 'Cereals' ),
( 'Tumeric' , 'Spices' ),
( 'Pepper' , 'Spices' );

select * from crops;

-- populate buys --
Insert into buys 
values   (400008, 'Rice',2000 ), 
		 (400002, 'Maize', 15000 ),
		 (400004, 'Beans', 8000 ),
		 (400009, 'Peas', 7000 ),
		(400001, 'Pepper' , 4000 ),
		(400006, 'Turmeric', 1000 );

select * from buys;

-- populate warehouse --
Insert into warehouse values(500001, 'Adeyemi' , 400005 , 100008),
(500002, 'Jamiu' , 400009 , 100005),
(500003, 'Mohammed' , 400003 , 100009),
(500004, 'Juwon' , 400008 , 100002),
(500005, 'Nasir' , 400004 , 100007),
(500006, 'fikayo' , 400005 , 100001),
(500007, 'Christian' , 400009 , 100006),
(500008, 'Uzodiagu' , 400004 , 100003),
(500009, 'Odinigwe' , 400006 , 100009),
(500010, 'Falana' , 400001 , 100008),
(500011, 'Martin_mary' , 400002 , 100004),
(500012, 'Sterling' , 400006 , 100007),
(500013, 'Folusho' , 400008 , 100005),
(500014, 'Akanni' , 400007 , 100003),
(500015, 'Seun' , 400002 , 100001),
(500016, 'Akomolafe' , 400001 , 100006),
(500017, 'Okocha' , 400007 , 100002),
(500018, 'Oworu' , 400003 , 100004);

select * from warehouse;

-- populate stored_at --
Insert into stored_at
 values ( 'Maize' , 500006),
		( 'Peas' , 500001),
		( 'Rice' , 500002),
		( 'Turmeric' , 500007),
		( 'Wheat' , 500009),
		( 'Beans' , 500003),
		( 'Pepper' , 500008),
		( 'Maize' , 500004),
		( 'Maize' , 500005);
        
select * from stored_at;

-- populate supplier --
Insert into supplier 
values 	 (400001, 'Akindeko' ),
		 (400002, 'Amazing' ),
		 (400003, 'Otoki' ),
		 (400004, 'Zola' ),
		 (400005, 'Oladele' ),
		 (400006, 'Prince' ),
		 (400007, 'Saint' ),
		 (400008, 'Emeka' ),
		 (400009, 'Oliseh' );
 
 select * from supplier;

-- populate supply --
Insert into supply
 values  (400001, 900007 ),
		 (400002, 900009 ),
		 (400003, 900005 ),
		 (400004, 900008 ),
		 (400005, 900003 ),
		 (400006, 900006 ),
		 (400007, 900004 ),
		 (400008, 900001 ),
		 (400009, 900002 );

select * from supply;

-- populate  sells --
Insert into sells 
values   ( 900001 , 400009),
		 ( 900002 , 400008),
		 ( 900003 , 400007),
		 ( 900004 , 400006),
		 ( 900005 , 400005),
		 ( 900006 , 400004),
		 ( 900007 , 400003),
		 ( 900008 , 400002),
		 ( 900009 , 400001);

select * from sells;

-- populate inputs --
Insert into inputs values ( 573 , 682 , 400001 , 4827),
 ( 324 , 588 , 400002 , 5479),
 ( 841 , 764 , 400003 , 3685),
 ( 575 , 489 , 400004 , 5116),
 ( 265 , 342 , 400005 , 7090),
 ( 648 , 538 , 400006 , 3767),
 ( 492 , 500 , 400007 , 6452),
 ( 632 , 730 , 400008 , 4753),
 ( 692 , 650 , 400009 , 5388);
 
 select * from inputs;


