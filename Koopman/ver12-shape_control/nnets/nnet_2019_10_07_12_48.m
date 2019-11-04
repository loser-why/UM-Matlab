function [Y,Xf,Af] = nnet_2019_10_07_12_48(X,~,~)
%NNET_2019_10_07_12_48 neural network simulation function.
%
% Auto-generated by MATLAB, 07-Oct-2019 12:48:08.
% 
% [Y] = nnet_2019_10_07_12_48(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 8xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-2.05111801315361;-1.7010918120169;-1.80664336465845;-1.00270835594175;-0.909176647337217;-1.19330074844008;-0.836423881611371;-0.518196930377155];
x1_step1.gain = [0.449468687117217;0.632593541923473;0.588292154125161;0.971534469958783;0.921435957700417;0.926357191497144;1.09359428266534;2.09835571302752];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.5270109958579589637;-2.441678038100230097;2.4867531619167273504;-2.2046673305446300439;-2.7468337498029620214;2.0978491262237484172;1.8010469182639854413;-2.4343041364908799551;-1.7776912168625593758;-2.1908305467230255736;1.738688666114921233;-1.7102403755977158006;-1.4070711406996201376;2.18387374617587815;-1.8247873984632090316;2.0569576526469264266;1.5533738546553947923;-1.2974325668963597735;-1.4886878047089762145;-1.6632258482756681062;-1.6201382893244831163;0.79436427466224968086;-1.764368477468708063;-1.3471358932397010655;-0.63238704902249165407;-1.470167700029603397;0.071355478742218134136;0.51328812826829917082;-0.69924656856018929663;1.1454343598413740946;-0.87691530669768757988;0.4856329129388324839;0.32148621818956601981;0.29590498104524609602;0.73892495262922786026;0.13403738010043000917;-0.46709651102992788552;1.1629867681573484717;0.38829338809216973338;-0.016271940563321048157;0.27855898567167880486;0.59876724205018494462;0.37377969894172846654;0.0036928429105083648842;0.23133687956511272965;0.4385364485077822283;-0.30079678319948577325;0.36805166278974693617;-0.14072212627699476339;0.049354136660320589713;-0.90175443444550429373;-0.032643716556019629349;-0.096014789743342682238;0.17079938383481446662;0.27063286188902374585;0.14527580451845614751;0.40789682611210204;-0.029773026869888183366;0.45227213593548015735;-0.36695477067923015779;0.3344917514344394327;-0.59922071259188836034;0.44715746286986934876;0.58117374424393219989;0.80026976822000750467;0.9965177257726649529;0.59463815999289204584;-0.95691346732389070961;-0.62981765161414360321;-0.12929554646221677605;0.19080924519818562302;-1.1060116171441416455;0.66559481807316500657;-0.65688267103942576952;0.55205381936103881113;-0.49141474524316708372;-0.78399877812899088081;-1.0827695782296986593;0.6391354825279104146;-0.87026125863787828774;-1.5438910837226442752;1.6232734882832653422;0.83807969823553651878;1.1810976564581507908;2.1092713534691900357;-1.2428999847435737713;1.3167468616801407677;1.954395535203240275;-1.1916146933718056999;1.9646000952421418528;-1.6592252813480210527;-2.0861305370870821818;2.2877816709666110029;1.9634307947891633805;2.2525325606212027729;-2.567837989849301561;2.2087351085776694148;-2.7332506480080636102;-2.0387498981698706224;-2.5169875826506435956];
IW1_1 = [0.98225508747219680838 -1.1127627417725149961 0.44021782435407180722 -1.4667582741923892442 -0.38371029206697288005 0.23127608333029833765 1.1526793081498676319 0.25660065991905256499;1.0979412886186299403 0.94677359479669920272 -0.68699832194322785206 0.70521388925394590252 -1.2310924411967834047 0.32236905512483049474 0.32463854226726612806 1.1368793680811717373;-0.92103845145312202014 -0.61403358632711002585 0.89118277390255595805 -1.0611412814417582329 0.32000288609139437845 1.1000960762735312315 1.0968773745281152898 -0.25772262809588969423;1.5723744750925412461 0.13269374121420624002 0.18513536046492401477 -1.5344122333056786633 0.038068260430192749078 -1.0424610022646643159 0.86633927215228034857 -0.10082020285823835304;0.54522771816328408079 -0.91089794095892817616 -0.58144247986198716038 -0.00765129301381506019 0.5277843860922082353 -0.69360290453455319959 0.37969307584553474433 -1.3005172588714413173;-0.98103662094812538186 0.22146409306824663132 1.1773286214765841251 -1.1663421430109406352 0.54544054238900052667 -0.98437981897816295707 0.80255418487899043978 -0.66575632746284307828;-0.52817762254853517501 -0.73645739734319004555 1.3538745327105736749 0.77120760096673202089 0.35447059632978356047 1.3886106657945596066 0.96497193300352734902 0.43040082105687926806;0.17360302670102331635 0.3879720477352640029 0.25443040940534300542 0.97302467517665180985 -1.1085050749384997015 0.77459158429113972311 1.0779531761680420932 -0.73713348121992916528;1.159961476915024603 0.86701983738242371924 0.46797059833798970718 0.36702105511045102215 -0.8640654965393980147 0.065267672801667578342 -1.5320469810341481587 0.67731328175615224119;1.1968360335247631987 0.49211245200377734532 0.11624186405707724601 -1.0379159824693533487 -0.78995265094785038773 0.36744912690421971391 1.0988265738412270611 -1.0874274681426410183;-1.3295436910774225403 -0.81456784643446167316 -1.1570749593806270994 0.35996516132635458796 -0.14657845114647261031 0.041026913445271831482 0.44733240823051212409 1.8624621291573795201;1.2318518159087579189 -1.0443551472782177658 -0.5888025963975079824 0.092425912595257966875 0.36697513855089097801 0.20417223437601136893 1.4487489382158347251 -0.12906710710367974571;1.7514137111853556039 -1.243151596213804666 -0.52167058879890704226 1.3093064260989657477 -0.4784243962024120056 0.24254625799499468508 -0.12593290873169188382 1.1394422242840755999;-0.019869330909941827767 0.90496295389895686778 -0.88525894757561995885 0.022903083018607404975 0.5199742966863910576 0.76275577199861266386 -0.10961161177313522019 1.0180315199185683284;0.79251574723081319451 -1.2690929095565284257 1.1464312684473096926 1.1927822171165294307 0.48820831776178047479 -0.22074111870799173474 0.82103144310423348262 -0.84103594301898831898;-0.99155907404743814926 0.79387568926032137107 -0.88124847513783988173 -0.13804216161968502208 0.97417030472466936697 1.371411250929415182 -0.6043001784167951751 -0.24468034888749043421;-0.51154105147750494886 0.67736193034376801503 -1.3395941379456139941 -0.53533457886238178247 0.26065810896345698033 -1.9569343721195473496 1.421728435329477902e-05 -0.43529109422586631517;1.0394840922831580787 1.8538156263299383486 -0.83819806499796700727 0.53191613655136182892 -0.93870241702750545354 -1.6865427346964423361 0.45691528540668963076 0.43776181614702119882;0.44263022689692194112 -0.76998141412317699928 -0.51392463706334912121 -1.1417618847676727079 -1.0606349515352238022 -1.127305644751779079 0.36820474351063864349 0.61339029424086577436;0.96469274138229665905 -0.54093486479999686178 -0.008647667747236860436 -0.81075909414790059415 0.77551586535199468209 -1.2051913107495273447 0.99067084324276000196 -1.1389083949754779113;0.39710801373217619048 -1.340052834655200753 -0.63090206723474895334 -0.93700309251958013856 1.0587096866591196864 -0.2967839405207624015 0.73299801236751860323 -0.84093671496558664025;-1.3323675175962728101 1.147928080162754938 1.0099771896167859531 -0.69143419106800874108 0.38772800192964185229 -0.41637168110767197593 0.012199852330145699586 -0.60259520954978862406;0.89433780161279785581 -0.55165030842668094646 0.025922033182129752826 1.2174125561517818994 -0.82935652749704413811 -0.34427479058840365633 -0.76329730058267353243 -0.88529666974801879409;0.81904388779024217548 2.3927146011116819935 -1.0954085301778175854 2.2981422165040803485 -1.9044042557284759365 3.2444007759338218122 -0.32387637404914909611 0.35527747443404267269;0.83014233724938635284 0.25572467409644139558 1.4197687531591811627 -1.5263561846473827632 -1.2603899657083617036 0.52301033880257630226 -0.59030061630818930762 -0.76332035070122061793;0.29684325849507808837 0.91276600634396820588 1.4710623374270976882 -0.072534907697043654595 -0.96789698107707267116 0.79544324793385523531 0.30974508459671890037 -1.038848500060306046;0.69277111047116834985 -1.7482845417069252658 -0.045157722755402682213 0.83689841987891810948 -0.18024571954426707454 1.9472336100844895856 0.72709951660132277063 -1.2293810153476598668;0.36070963528326105418 0.59050609798271691542 -1.5181969391149028326 0.19905046560050218551 0.82621623143091527108 1.3098552068220992162 0.30564988569792972406 1.447114750337981981;0.51334296980709659408 -1.1330470436325070782 -1.0356638907584241327 0.56892519162725252446 -0.080565544511099873581 -1.1571209664634374281 1.1586566576721923916 0.65764189767769321016;-1.258791564601453139 0.85479940669766085737 -0.14766617105249182917 0.69726432127828918972 0.83379234541871394271 -0.96686888465426190642 2.2223349648098267295 -0.61991713652871849316;0.60727007665601007158 -0.58115750336437288492 0.039648381543143013106 -1.3736593760512227913 0.38803365459407618276 1.2295483677289509306 1.5604117043022813771 2.0288395290965905993;-1.4121531316893141117 0.73544968607778937741 -0.75243122903456016726 -0.50492017738928673953 1.4545487757813357899 -1.0599652607226599521 0.062757055255364110891 -1.1993903045110048122;-0.64963980520898079174 -0.83568018324885351422 1.1081753401850134022 -1.8375390724574076629 0.82471140966171041509 -0.18168999558787962689 1.2466090599058485822 0.62879277245484332948;-1.0200483328629583735 -1.0457123209569449962 0.90176256213126504413 1.0110878865675894112 0.68055055059608438039 0.46222367514199180771 0.17312941331886771978 0.71518756080648138163;-1.2124489283544033214 -1.3361668166561229132 -0.54468782936270432327 -0.67381727417941861269 -0.6446900038124742105 0.74720005734345151804 -1.3015669367417299629 -0.036447575406272698928;0.7215217232082323795 -2.0478831307214950819 -2.6682307602581833983 -0.62363357404397645745 -0.23364617142957633256 0.13279769699036014785 -1.6003073576496085195 -0.15777987217260747155;0.92173284524948884133 1.8144135727498722499 -0.78924447089530269661 -0.95380773781193339822 -0.24695379568136360815 -0.28675210706716247611 1.7516152158230511304 0.58935376251084048427;-0.62588237367962995528 0.41431736600286006578 -0.58492850449665867441 -1.2763646896149243304 0.98444172985596478664 1.0107964841233521014 0.1107072763716319963 -0.65553080572201516407;1.069470259496223763 -0.86056474715090391925 -1.9912819794099265724 0.25018834030229131216 2.5519501117799983092 0.41477457649568205689 3.2763249052409100237 -1.4919928989787887286;-1.412019469296249996 -1.2067877594658351637 -0.6592551889672002563 -1.0300247392650170308 -1.3594507507706028449 0.021279020129445668646 -0.40594165286054628705 -0.46802119331774838518;0.14079347551300835928 3.3142536498751358209 -1.9537761518208027756 0.14203348839525026248 -1.4058800624330320961 -1.4305610693177837067 0.38259806266829221588 2.3544680288555928094;-0.32301930888613566983 0.30724649235151241244 -1.187284071426729648 1.668325691963676638 -1.0977425035394900998 -0.69292148447490031771 0.16090803608356404886 -1.2691500206135624129;0.77511428175679741859 -0.489401541068380741 1.2295027140465422111 -1.5932470146990560522 0.44369151461336958642 0.20970163019367518697 -2.0886491278932672877 -0.7326430798493573926;0.84762356893683321601 -0.090281785326940588998 -1.2315393702956876076 0.29989966244646476534 1.0362072194590714602 -0.7770217615505267128 0.018009299747509151246 -1.3346271085169323367;-1.6130099050139794503 -0.49814931180705812608 2.9518557394645728031 -1.7586007037454827184 -0.87487426993303918366 -1.857540218131157328 -0.82857799716109792332 0.17024718787411752263;0.71611564276296502118 -1.1311717162668022407 2.2428586660976210787 -0.0019351519017177659654 1.7224741485587244938 0.22791236508832579677 -1.9816100792432611577 -2.6043880710404025969;-0.57101523069878457051 -1.6388533392792641319 0.0031028673064117384683 0.22613914891189026979 0.60329152307391586962 -2.163276471795600564 0.51746347696210637235 1.8807041638397090644;0.0010550629636220248964 -1.2112558838598994626 0.49117876165397961197 1.3722564902176332957 -1.4551069236334510659 -0.79473493120056970529 -0.90044036428727802779 -1.1420572944499136625;0.8043698894347831585 -1.2669877257008170801 -0.9909134672103393493 -0.52509270434881516465 0.51657078324442895489 0.6560461674832800405 -1.4919923514941269005 -1.1974748201366514078;0.50402391933927503942 -1.2285747860053088942 0.011763717692634990952 1.3532640600388505803 -0.41488544390172354959 0.1865892528082960522 -0.93397578391779767504 -0.96104523604619174204;-0.25630070588370679197 0.15244062457288062862 1.2160505943061095113 -0.65079193778662924874 1.5159875438214913679 0.79913030567997767051 -0.88231321751398772424 0.010273766133931001854;0.45781744805043211866 -1.4331212657805283417 0.36087188048533186402 0.24074441743557181694 -1.2057486373644890065 -0.25117206264334074328 -0.75077357319828430526 -1.2384282494003435726;0.74641571866431655202 2.3546420098308509239 -0.43657924721537855195 0.46564808515355304852 -0.34987531980522240671 1.6167196407965453986 -1.4470262994511582377 1.008706611456969382;-1.2756096791470619145 1.0647271419281874039 -1.5118178996958850924 -0.59027469910855168145 -0.67651123980656480139 1.0586262550562137719 0.73332461133603765724 -0.35501496132751841905;-2.33134698347830982 -0.15728020362845418489 0.21146949528042674471 1.5274167209697862013 -0.63488673396732930865 -0.43695185143547987661 -1.4963825303663764732 -1.3145927166241151429;0.2228671142456946086 0.60060687109960986252 0.56128258511029427424 0.59815952796179383544 0.66938496632702970679 -1.7534174560924631336 0.37641032961675680024 -1.7245734708392377321;2.2635001354654278316 -0.78605516482830828373 0.24181045906660647571 -1.4170955398327660379 0.62504143946839896273 -1.4738462296640391092 0.022672314994530956556 -0.66465062871333813188;-0.81260678808262420958 0.75536315470120807269 -0.9849074118227482133 -0.82735141233448050713 0.55932859443405313904 -0.19591095956598195138 -0.056113536713462676409 -1.5474675779601427816;0.055595887999778728639 -0.39744301092027067845 -0.40358056171361267328 2.6643629941044779663 -0.54569109052638242741 -0.6211458200051475087 0.9766598307939713397 0.16322286518979184367;-1.1194857356562195605 -0.48811108912356926393 1.1468403988110680292 -0.29534049233123127465 -1.8276459134100389026 -1.3747255930603983209 -1.028247051783750976 1.0890016535133320019;1.0674105671366975745 0.45985476704799604919 -0.62082819174914727345 -1.5332775997429186621 -0.63414080953784268679 1.8306667583291722501 -0.46892192957752432125 0.030675367795258749737;-1.5726648794278850207 -0.45217128775604864543 1.843740902496954881 0.67060897826515020181 0.55463728758467845115 -1.4009548275174279475 0.36387369718748907577 -1.9139327467989626363;-0.18571084605096327413 -1.8439599186327748637 2.4511060858181985544 1.6380329015973400519 -0.088165793867924696636 2.3855867793065388405 1.2701492716311131304 -1.3206169878072957502;0.36965133345072759274 -1.9020845497733884777 0.76502570531672942078 0.43199252785206754268 -0.94174599143125226064 -0.17403044530434227943 1.96489131752598567 1.2515053309841952522;0.68590948467229495566 -0.78518472886266532651 -1.415970782260435934 -1.0859933678449178451 -1.0137374835474319834 0.6987978057182797631 -0.55824345059316460294 0.71490133131262290078;2.3026941651667622857 -1.3171589596963699798 -0.77805606912685132404 -0.77664180603409971315 0.70095493942058695325 -1.1615392620896383136 -1.3527837651252574425 -0.22116758327223565161;-0.22836503688068829354 1.2865345752264767398 -0.70858135640615094175 0.18783281943015750493 -0.99218316397879613433 0.93701459615756999 0.39846906450691244039 -1.0411409065780237171;-1.007420736476288825 0.86646748770630710457 0.75400192095883211696 1.3421714153776744816 1.2593414840803012211 0.909134232218452909 0.33098218886363917068 0.81951718882570168123;-1.4400042804356965043 0.43433920288130534182 -1.2908353482853187622 -1.1534669675323740989 -1.1267514702728627096 -0.64879701444929138709 -0.72629241527136667589 -0.95042027264466322212;0.56777730553998206897 -2.0607929246450029659 0.32635258797608834858 1.6883190697610739317 2.6039576523206044989 -0.73572777730757310533 -0.75388557500679886925 -0.92361547103255969837;0.80411742287366427817 -2.8187993581121748576 -2.4805126564653972032 0.58089998200919035209 -0.7439787485212855378 2.2418478946238442617 2.558979766771877884 1.4562090529801836603;-0.76208841564131435398 -0.53093776360891864474 0.34442022595731025536 -0.10895741055468337322 0.97012946070771921558 1.1440062334828315915 -1.1687917430909957606 -1.6551383936913894868;1.0902729105745030402 1.0859674946480926128 -0.12918251259054719382 -1.008747822691232976 -0.60295752644727773628 -0.59499050084657212345 -1.1135365695002297226 -1.1523302088948728095;-1.3021652260118019573 -1.5235378468776734628 1.1711552917235874549 -0.49822293958347146914 -0.3826690797216774631 0.69197026913980985707 -0.69979534981439694974 0.7006877796548797166;1.8329281751456825145 -1.1006426275757199562 1.0752729005812093899 -0.079697159815147078366 -1.6486189550401313397 -0.61555051040482977598 -0.62533364119343493037 0.350267664514944288;-0.54492865529999567897 -1.2820133867349918777 2.2541150835544168096 -1.3714549850572370637 0.37037471556316109433 2.1306345601085809882 0.51146541917455379256 0.2588470465783566099;-1.2020849190870139811 1.9216435698496212581 5.9517487853637600637 -0.71427205109842162312 1.7589727716359471188 -0.39318427578814962864 0.86016705885763666828 0.81000620211425522488;-1.5253330442039181314 0.29601569852339792988 -0.035620150314202972397 -0.82973680257948445593 -0.68946901669808180468 -1.7594733132768487494 -1.3510680661426270888 0.77566425310095210577;0.038234215049921679852 -0.50906922780124252981 0.31367289713496637749 -0.092963526155698528175 -0.22603641008519023692 2.3071190600585773645 2.7297319968862150397 1.3071057786925293076;-0.60227292436565083023 -0.24428935253296743535 -1.6815113053823329547 0.10231147196648635034 0.68166352818148601145 2.6904917458054726787 1.1207812790767017752 -0.014191602585176155138;-0.65044311758400619183 0.17243739159013468654 -1.8234244673205122211 -0.94429429819923083045 0.4169194300304144285 0.049039346237846358212 0.67075449244911955482 0.64514550987309282615;1.3283802609172354892 -0.89177234540058858414 0.38453955459908401027 -0.49237832255769081735 0.63992057355077958114 1.0830679560995699617 -0.95230980856519442668 0.23531001527015854569;0.58715896405306977623 2.5921784758346806399 0.4075261959006409862 0.75092831319173769522 1.2798638387152847518 0.16814967537111108475 2.7358483980175729577 -0.89528866698701203841;0.2913031329275866943 -0.9134806251081888373 -0.031118347773896059411 -1.3099734567111616101 1.3309882880429209084 -1.4642234557657118899 0.35533076542794000963 -1.030294950612453686;1.0106684841893822657 0.38802015781422205531 0.60425870776863965794 0.84064280309518901735 -0.76744583462566529075 -0.61775870539848209972 1.2156241387928921061 0.44294051400671063945;-0.90776641960723380986 -1.233672726156054722 0.39482145777454397129 1.7619789995093673163 0.1579966183101427224 -0.10237943848220944221 0.93221661720718229649 -0.71919836677497228639;1.1796911561850671468 -0.85810442048490265243 0.58937404327215858757 0.64804841960331671658 -1.2912101491034786438 0.95763183033029286584 0.88474677668045476064 0.61353449133342730093;1.0218324589240985745 -0.0055557842203344479787 1.0428735557166102232 -0.44969628044930343158 -1.0718953593382094525 0.93850919162032564458 0.06222405065169034355 0.43504676067268110984;-0.96107708549298631606 1.6068456227300127459 2.4051110525330186007 -0.32911334995009855486 1.0229035613568144836 0.82384905559081067494 -2.4782187449750159303 -1.4236817719912957525;0.53208097949894361811 -1.6715872074390258906 0.53675258769486933197 -1.1522568393868892755 0.073065984241277789901 -0.71249848073254840042 0.12946520507433489922 -1.1027193151569927299;-1.3672653293848533451 0.46948266872179739151 -0.9472469656222683998 1.5783765554904549688 -0.38324484127756031082 0.03199604253533780418 -1.5922204409471780728 0.5238541939807995762;-1.1309042841123693179 0.7359286741865601611 -0.66810168070113440386 1.0150180466913449884 0.42404788944976423704 -1.0671454953050305559 -1.2589806528897964366 -0.039052412481781498266;0.043078022849480077094 -0.29697217286523747148 1.0606403087241571548 0.50297055126156731131 0.43904043723098773455 -1.0364534037400709998 1.3183524663732832938 0.78247344377549454819;0.81230459729429904669 -0.21396389230086940159 -1.7192618525977869659 -0.68406371129072629511 -0.60963910364967666133 -1.2275926220820738699 -0.81103169400242047793 0.76142355312132237177;1.7424248670550781526 -0.058461674097012687745 -0.07552955098816191426 0.38363481523109721483 0.66901466401619313906 0.6477757005471310725 -0.7495802873575819758 1.0486238786720982752;-1.0224055163583676276 -0.45101292256921077239 -0.9488842197482240115 -1.063035139368977422 -0.021136318344181361656 -0.09234894645486400877 -0.49465317063630953598 -1.0038094901237351042;0.01494506117873651424 -0.12892833918125529147 1.4217080808035866824 -0.30217981459668780131 1.1382918322265636046 -0.98298003523110866197 -0.34033917973269256496 -1.6791070811796156015;-0.20828253614861230725 0.079269887625756096927 0.77597652693093621679 -0.71931352097659806422 0.98777862635978253003 -0.053900216236068804188 0.28423152485242675347 -1.5438318998574791507;-1.1344293648319825341 0.95380165462631083528 0.08596689253542744158 -0.84129291862056143625 -0.48402855849361375862 -0.76133869054128955334 -1.3775296836253521082 1.004416783250503542;-0.44316130101606748815 0.81919557344542015542 -0.076441021676154727316 -0.69802718603211777459 0.32568611357858662236 -1.0832980431418937073 1.0164638700163393104 1.3382176668403231723];

% Layer 2
b2 = [0.51747466299490418873;0.3218497878090083586;-0.8351245876679986857];
LW2_1 = [0.33800762833194469836 -0.79978326571670643741 -0.31207886124204636813 0.17830975552948269414 0.3338870266925818564 -0.33288292084783926983 0.16822136679851643071 -0.42001431117527188164 0.65775447386653518311 -0.27917856789576517285 -0.80006616054387424963 -0.59405166327891101297 -0.81139815505715040533 0.073930411707696930268 -0.86426307532207957696 -0.34454074127536349348 0.32504034090136113555 1.342862060595066076 0.11723962792987883963 -0.57748135040735837364 0.079410527741906739019 0.81554189836904755762 0.20106855540692478157 -1.2796614710904263834 0.28882382544122253698 -0.1688727286764569735 -1.2439684667823709407 -0.60735357249906785082 -0.87257765954634436412 0.36165865439259020642 1.2088709159359387613 -0.54560032842292360833 -0.9760639285775669638 -0.13080538228874327711 -0.26812881337572813667 1.6377647376739226104 -0.77515897300096447964 -0.21146026221550340285 1.4025595130512880093 -0.65596801368678392397 1.1759931097198199623 0.54879170831175094758 -0.88931861383501487062 0.39429065680603991861 -1.3785940367968156917 0.90913469267184976452 -1.1704170352863649818 0.66800367321817910593 -0.10824074656544677153 -0.39607795117717442546 -0.37973084652754535151 0.18129233607699041242 0.96913929391527686708 -0.88420764054827083456 -0.68551282209566544168 -0.48337837145043838216 -0.60133446463712925123 0.82647009250312708506 -0.39343817686785714782 1.2645884488639917986 0.81883300031965267074 1.6211782041674314137 1.3705593404353706433 0.67938646888781184519 0.80271166911180125147 0.62284494118442046418 -0.80904689557676279232 -0.99379731926195835623 0.048464292670788375328 -1.2666611792541033754 -1.4953423465401365355 0.78560712235942142811 -0.93961897516350734172 0.95865190150969059601 -1.0356785613674834856 -1.2100801334301249934 1.5643636186776865848 -1.3280512103122172896 1.2489750918131907742 1.4309432068684881934 0.13861149405983524963 -0.78944967172963886881 -1.3230655645904823015 0.29091564135915515266 0.8227935834701756157 0.41666202079950465098 0.62971860140820856699 -0.395840598549835887 -1.6590996940906517221 -0.23620493690443933321 1.21281395301344741 0.66862159662452724795 -0.50986699983369765388 0.038616966430855090286 -0.26262007148667521061 -0.002010176164480575664 0.90210783476457712116 0.80654287752631959041 -0.17862176901009502172 -0.59029026994232725034;-0.62977099187435436889 -0.48468878653693792113 0.11035478605533327601 0.8351944258730673587 0.71885088640746619415 -0.71395561060939205511 0.62076938626574307278 -0.69159042626768385542 -0.21536109280576942737 -0.32216677000919635709 -0.83796094653313657474 0.11189288010738894508 -0.31758231916886103807 -0.25505594339995024677 0.081108080735772386527 -0.014470143058514156609 -0.60440724605602946795 0.10323102895671405765 -0.24164788865691766429 -0.020901618686112979212 -0.23985062937736748023 -0.30264740470342033074 0.15166338174515103798 -0.60314026918678698141 0.48078657262422985763 -0.55218386823835896582 -0.90850829069042471353 -0.86496401923745036555 -0.18116785108398236748 0.9149271218210016654 0.35215161965844465897 0.38929052709118283637 -0.69666163203548880922 0.93830868574587833475 -0.093129025443405802354 0.44559591435533768555 0.67491566600407992826 -0.57699835532382481862 0.46028350807378065612 -0.022514393565236864858 0.24579186327724630856 0.26220987990357452757 0.53845087502146993241 -0.48804522458167698407 -1.3469199724502995963 0.38382868397316427522 -0.016220387123738314039 -0.25350506942034256586 -0.2818009243483660109 0.50483152645935736036 0.18278638321186749249 0.66141910745473875277 0.36463692951813470033 0.69920841812908496316 -1.1628096527135165505 -0.25770402257525748535 -0.7659472454351440307 -0.34507287413087300854 0.80289645257156716518 -0.11018269120728346744 -0.33365421338063949719 0.67362812192838716907 0.80774543249557440028 0.22621872560116051964 0.55659328481067127381 1.4885921411194602548 0.28581914138241809598 0.39305026612254867491 0.67158840082931259285 -1.060205976675436812 -0.63491467149046021401 0.375721995162147826 0.26971513991159867807 0.054038458325729558929 -0.15285839538969264728 -0.072114037739023528761 0.59495413893972326491 0.60445329739075259745 0.83229748947786086344 0.55624970292440734099 -0.41198823874886364438 -0.044378353851628249416 -0.91898982904184045584 0.76681380485951455839 -0.7101137113777029608 -0.25019558507383443668 0.25012139949610701084 -0.52449653318033639948 -0.22632515907847286507 -0.64021466675909732835 0.96793128841277142893 0.0064217177059351414695 0.015664141690761676506 0.27096946973736552033 -0.2061441744787806396 -0.30292603104491661048 0.64355935326342461611 -0.2357659632019695195 0.21096572368339894243 -0.36282091211928813035;0.40503580290876850523 0.26521219814667068571 0.61000055679769160655 -0.40567966480494271897 0.54762253738052446561 -0.4880813593841708542 0.61705433520038810435 -0.39496585370270687054 -0.60597714492697307698 0.62626335679135358703 0.24385954842765486528 -0.20049264975951780476 0.083772738207914393405 0.35051476612586152104 0.41463835169138740788 0.55212470547069181226 -0.4021731462401128554 0.089364153775803589763 0.36729974117544317291 -0.84383054746309071881 -0.13935015127259858803 0.084717442392901354253 -0.3888413811973626677 -0.33329965627025376351 0.25999367509349363692 0.073354465832924140023 -0.035219192609800484273 -0.9712875822540517623 -0.32606611411875924267 0.69611034242851654863 -0.16828720574816041777 -0.10784695046078111857 -0.2556374559951835046 -0.54273414791479468455 -1.212106570065076161 0.50928389374162275072 -0.20487590979643807709 0.014314616383339858613 0.244874780039681883 0.16109602108065640413 0.14885773561980936153 -0.71684345590790010672 0.36239772517862550716 -0.47424458650733758436 -0.57886629603849837356 0.0016359699897664503609 0.16634531025333618159 -0.028655147173118091647 -0.49279430009498059739 -0.1532767766647738783 0.60570444737233886112 -0.066150888789535955414 0.2842917084223015034 0.55904449822941115755 -0.38420114805956928627 -0.39874209940047833367 -0.7342400622970990387 0.48332043030948051987 0.66034120820972130872 -0.071404181328632243542 -0.24195734184385714327 -0.11266976795492708585 0.531577285779691322 0.64616466454268539632 -0.11567674285719098393 1.0192154533541741834 -0.00034917728357855472993 -0.80790748024376624059 -0.14115581996579332213 -0.13269945761640905557 -0.12851262801368693034 0.24900804824263339521 0.020409843960513193717 -0.27604265957936291453 -0.38660588402464635127 -0.077061694450613005269 0.18999023893234373572 0.2214747808304170229 -0.25143023633456118571 0.056107902461975778241 -0.20946700754531732969 0.28703250836102373045 -0.41790999211736085117 -0.29360773093962172497 0.23571929483610487566 0.31650215872955728136 -0.68922821222748131831 -0.65786301833148119744 0.24773395708072343258 0.68924401256813161432 0.91818022285734179899 0.17645714323699285275 0.24457444949489892672 0.82958695962594719564 0.045674753861575198566 -0.49591741743572587131 -0.45293612402644684023 0.47015454968793868318 -0.44355558666513666966 0.20621210232639394788];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [1;1;1];
y1_step1.xoffset = [-1;-1;-1];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end