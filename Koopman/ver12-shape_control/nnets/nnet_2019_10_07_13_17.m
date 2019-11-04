function [Y,Xf,Af] = nnet_2019_10_07_13_17(X,~,~)
%NNET_2019_10_07_13_17 neural network simulation function.
%
% Auto-generated by MATLAB, 07-Oct-2019 13:17:52.
% 
% [Y] = nnet_2019_10_07_13_17(X,~,~) takes these arguments:
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
b1 = [-1.3112658896001281317;-1.004895937106759396;0.018112177545351239999;-0.76024520286972663285;0.85902252197514172849;0.87992096937397623613;-0.34990176814303131092;-0.53126721679210242577;-1.0328763664214757334;0.017808245930252538519;0.072425027996168483968;0.19616518194353405047;-0.0048833917184244995252;0.44826581183324298863;0.19791438885246062651;-0.63717260531731267914;0.41779038078351143914;-0.50755419769194953794;0.42535398122397966025;0.55635951397091776283;-0.0852594842964715105;-0.50562464063367451583;0.36615774770166337193;0.70326283190964644643;0.11457394936411344211;-0.47993453276521358397;-1.1717775093621400906;-0.34424131624250264849;0.17092242742113730736;0.75248704901662966105;0.41274982212678873461;0.24007101504404906867;-0.93198237696336194702;0.76048753506737665209;-0.0085607065679892159482;0.87831565901301134058;0.83393385463103952837;-0.40986399398370604308;-0.91115951601601175014;-0.031735448703089856604;0.13608364054479102356;0.7521210996214782174;1.1915722009052762687;0.52242120809573022733;-0.61344566395636979106;-0.017839796724093370112;-0.58716967447077239584;-0.022769950600439514687;0.69430588963607053898;0.15376204119022354733;1.2815783688187192269;-0.017770644650861908143;-0.69638811483154072768;0.59718641260938065685;-0.32670536687244045027;0.017764532229734952828;-0.46049464860436362112;-0.41141325736981732009;-0.5868225553704581321;0.31265740005347159025;-0.67163865276880130306;0.12602428534495330181;1.3456203574598788464;1.2697334415689276454;-0.34907632454338377581;-0.5644962736354232069;-0.35031877941728967185;0.42875122459460124347;-1.0953148337497748965;-0.33354228664022389506;1.0872195914636244574;-0.26464216269329199349;-0.39584053722086598448;0.010417689128355986372;-0.017868405570496140311;-0.65582476458232330518;-0.97069470055218876059;0.017715717136011433636;-1.1042647221406189928;0.017756355769507944919;0.51031455519723101233;-0.37576967207350919775;-0.017747383207943463052;-0.018327867192011647324;0.89436445358212857126;-0.65612509256846196504;1.3528911004415937747;-0.5125304212959234107;1.2372182994398883693;-0.12014625132942600982;1.1498181724658209646;-0.24517200109181286338;0.017743006560689569828;0.01785649711895087588;-0.33737789559880687618;0.66689045876943231494;-1.1459553501328920699;-0.0018812880429774812233;1.0492915023545470454;0.017792662662811875585];
IW1_1 = [0.11487302651064350278 -0.26572857121537413194 -1.8213233387254355033 0.91667073740445526031 -3.8513421162206582515 0.9440619033325001741 -2.128626098840609604 1.163102623634817645;-0.4971741552873502612 2.5404679713709978905 -1.0834857954279402126 -1.4196572427471256805 -0.49470714716715374903 -0.089964640157502800966 0.55925570573999683344 0.16637050641474773749;0.12526415936976123544 0.22047607016395934232 0.10845265557579225613 -0.064688980489203282143 -0.092601102379956792832 0.069377384083643772739 0.10140551363901659232 0.10802536164643919414;-1.1932191454296667832 -1.1544154048115466971 0.31115422657880159596 1.6955154987060032656 -1.7094197216603645995 0.35638422340674807964 -1.7074254234750625425 1.3192840844787521171;0.063153056808692306645 0.17422323122633354142 1.6097530773643735635 1.3759814006153963106 0.84238382496511909903 1.7545350226060139054 -1.8734483437808431283 -1.0832244474809178403;0.10039464286652809155 0.17513345153894671613 -0.39941079154278724683 1.3927199505301721683 -0.37042896203830616431 1.4928299023018432035 2.2276298057101868721 -0.44121152813862235531;-0.37677294583189624433 -0.53122293065787473676 -0.68126614941603225173 -0.051435479577639831028 2.4665582600780910916 0.1029125514884288578 1.4843445931858358922 0.39604405020919714042;-1.8603346258975963501 0.028255746489093881701 -0.97794210680813109526 0.23311040252770579007 -0.096330342125210938198 -0.99869205567017194092 -0.9057907927025972139 -0.5365908425028774742;-0.11805421020844081292 -3.2658121595727478415 -0.099250491147962277561 -1.8514054026052046975 0.60947064144689067078 1.0383837023423960755 1.3483867163372651454 0.69202034189549344045;0.12520842177074895107 0.2205350613036684837 0.1085069778153544412 -0.064644515910295075045 -0.092664598028967787302 0.069521175639981933059 0.10144722174097395295 0.10812055600999966043;-0.94650107051255194524 -0.29349588656089570238 -1.4192274432535298967 0.52949773427567992101 -3.2819376579016896756 -0.60125820032847843155 1.0881197950099779082 0.43893011724040392751;-1.5457695480660555987 -0.15963093587733720446 -1.4722410978982396479 -2.2920583316145251018 1.7111191524163460453 2.5099398585764296499 -1.3657593009852604382 -0.52877627352021439044;0.30267568816336654081 -0.28568378473897354519 0.28362346444258923484 -2.396581980747502616 -1.9075898348388227177 1.1864134065428209031 -0.54013280975431299247 0.075255576064885504328;-0.93769754258873250219 -3.4819520828367158671 1.4878889851904657515 -0.45010417524510432097 -0.17959130006574416938 1.6878817004008421776 2.0538914456084471638 0.13785385313709350164;-0.53566088068707484737 -2.6876997942858098511 -0.93351297288519829998 -1.7469799525782176985 -0.071043191551510828652 -0.54251068190207762942 -1.0532442923830005466 -0.55236253161952209023;-0.50038272297600294714 -1.173621357026694012 -0.94322851046395417285 -1.429643525809895177 -1.8688934995546178097 -1.0495662374074534728 2.6851920607793733353 1.6151578633630183646;0.057940918468461791169 -0.89081369334098114976 -2.952253408053586714 0.71249424223585688942 -0.3396407175258267519 -0.5491259165604618353 0.70039952353267753704 -0.65071090813816656606;0.14031280022599701418 -0.34155818798560383387 0.10253369326354032365 0.84804200580534372378 0.52589839641324154229 -0.21137901505306078143 0.17465999860802150501 0.26148569268426435919;-1.4133862081464292348 -0.48399338844857475728 0.60940298862887909426 -0.82980620086670753288 -0.036767356799117051347 -0.54197497507587322207 -2.6641837955754583689 -0.97341326207609335519;-0.54672419661847693195 0.074655125495029284188 1.380080818685213373 1.2016902493122907369 0.018706055364423601617 -1.1852814958571549209 -0.77293565778452355541 0.60837949764484167137;-1.6916429029562785047 -0.97721966149989070161 -0.62633745420894593181 3.5116498219280609661 -1.304513325793603018 3.2365765487335540485 1.6072492097488071394 -0.1480137997352991841;-0.067304155663950995803 -0.43517186308204913736 -0.023314894341184631832 1.8293153719586907613 -0.87368788071044012344 -0.063496342713959444404 0.79686114765178217567 0.032801806455963401776;-1.3860213309989115604 -1.2288153780325137276 1.6581743069390222356 -1.9905003209023446331 -1.0134486688755863781 -2.0371463884361098451 -0.48803218870247239147 0.40417109246603266648;1.266988480380184301 -1.167971280302788184 -1.4776023996525433635 0.20269566374750133675 0.12239474424752443127 -0.89590779081099813919 0.3856651947366379618 1.5036593954380890192;1.6555268748187748074 -1.2864914486043179664 1.7061611363294442167 1.2778240934520717076 1.0061583104163187574 -1.8129495389687013684 1.7354226410217046261 0.091632207899519008132;-0.75487165778373699343 1.1801471192713657299 1.6912267535821405851 -0.21494188470931577251 -0.74869770319386674817 0.69977458651308110937 2.1494252023611162272 1.2943430097771573273;-3.3682633605747067662 -1.0882166905402226309 -3.0107904717588360732 -1.8786612951362333668 -2.8604157638107912121 1.845136004132354568 0.42742179077355468841 -0.056908022188532803032;-1.6123197854990927169 -1.3677672313697637474 -0.93861747282422458571 -0.14152278165124759779 0.51173855359384257113 -1.9279999979227451234 -1.9561326035120414346 1.6226728245891757219;-1.8031970954673144369 -0.24693916267757967664 -0.56342771336975361329 0.36145067451770868105 0.44530255860578954463 1.5050232212651877273 0.31631170714021666912 -0.64952033296184241706;0.086569237096372819718 -1.6178749649105683694 -1.7027690633918495244 3.8100670492041661674 0.053471230833358279755 1.0108794992517304845 -1.3243309453809368748 -0.6460344573168386173;-0.90691165386888628053 -0.23743637439765025166 1.1436634631346582758 -1.022642540017697943 0.68972099883899018469 1.9060254403328915629 -1.0911100310556243187 0.97290897944633125682;-0.3436556531459833419 -0.79692834744212059928 -1.5720774573153801779 -1.6421211292903876711 0.44127918906983332192 -0.33119610240819602476 1.4389071315492729664 -1.6201556165518589125;0.81286033123570922143 1.5533559151137086296 1.2036428329726809316 -2.6127465894061723262 -0.31682748114224695835 -2.0879813306489736213 -1.6471410776853481206 3.1419254912329281915;0.67956497409542204746 -1.6674036929275373176 0.11705748032280660631 -0.3234733663252603586 -1.2266333100177426729 -0.39069655843137307549 0.60956982302248441385 1.1490024994492649135;-1.5126546577224826429 -1.896184639995032839 -2.5279292893095326455 1.5663439951120641247 -5.1557376186647241312 0.73956188106083753375 -3.7751651422837406713 1.2710262859672178948;4.2271724134655608296 1.4519227624696229295 -0.66959909155205166176 -7.2717855592830060729 4.7612219333001899457 -5.3690287816417407996 -0.69661927242320376141 -0.41609488492276131;3.1615812788254578081 -10.248629204149867888 -10.230606178289303188 -1.3921996073627167512 1.6073577232483542421 3.9699895113632548416 -0.33572217564905371123 1.3123819616616745343;-1.3832722494164062521 0.725276905335117128 -1.3812701188210974035 0.31657337406453012196 0.40449646803424899044 0.6435282299657437699 -1.2329986074489178716 -1.7148895623533413346;-0.26929250224081197063 10.277027783067408606 7.6708611250052030073 0.64063771887750720069 0.14800308413017129738 -3.021755131414293416 -2.1735113270359329718 -1.2758014491797338152;-0.86887121026163749438 1.1221938916361495764 0.54261672785518244577 -0.95011474191731359884 -1.4643517740756692991 -3.2361424884979794747 2.2316468891354053206 -0.10029817219933317984;-0.61621766437992608889 -3.5357411099154467671 -0.39356983365794023788 1.8439521143774435519 2.3391098164929160497 3.8322950761789957852 2.2055372756720794669 -0.24564777446584865062;-2.9175814508351125554 -9.5854747843801249019 -2.5097745820398125183 -0.70819933101527421382 -1.2352557833781652175 0.79101722120168505015 3.0825642879999577417 0.96260318594072102893;0.38828899730593746664 -0.074428307696467493892 -1.0038477743361449157 1.0475595233018188956 1.7918529814094947827 -2.431938692014317116 1.733988416437957536 0.24631306600733826606;1.6798033341698190846 3.6152207303750496514 0.32050481813144082732 -0.26564417786763000473 0.70935752847283162215 -3.1125171623854601677 -2.9842868026197471032 -0.73457764860997620815;-2.3760898424052818712 0.15343855162081632137 -0.77118589358810063494 -1.0063088154531039109 0.27197697761995875965 1.0904119328005130729 0.56044122331614409926 -0.53493165144130105926;-0.12521480274701252133 -0.22052970063490229258 -0.10850242532503921733 0.06464996148462655301 0.092657807130092473269 -0.069506002139115716232 -0.10144331249451690735 -0.10810995441692927699;-2.2525185516931669483 -0.065417762863285044972 -0.64093317672277194674 -1.1992589972823530786 -1.7513286744951466201 0.46303719271783289058 -0.16664870909333473481 0.43463304571883026872;-0.99604139851661277483 -1.7054756827271972952 -4.3534233171967491316 3.2697840599279679452 -1.5639565579125365158 1.7335967322379046696 2.2626934368762889882 -0.42968626497058476366;-1.4568944773427365824 0.82449128102323188116 -0.87272124105545134665 4.4718597010989222795 -1.2361671034291425997 -0.92547949401186480056 2.3540214651783770705 -0.29392403418662949033;-2.7325780997398325667 -1.9866838562749640218 2.2956323527952995356 0.05180626726906934626 -1.7312405222055342602 -1.9858928678635441312 -0.98397920856652310029 -0.71477103242712936026;1.072624866129539889 0.97206430478552463548 0.72718864031955199323 -0.48756954173793137786 1.1631676080015502794 -0.72634093609519279067 -0.7640317804686719283 2.0198610246206425423;-0.12520060191198059685 -0.22054115945613461669 -0.10851203516418489459 0.064637766531172924367 0.092672730479383874647 -0.069539307382899651078 -0.10145172271058482127 -0.1081334120672759469;-3.0347073633800891734 1.4089709656292694895 2.5672570734595470121 3.9070999794439829067 -3.891014858120325659 -0.74494510836178595703 -2.7464179865333511188 0.92620565533268917058;-1.1742929645158852736 -1.7569372495058248607 1.197068266511161827 2.6813310250063624451 0.99807949509647986286 3.8263949031803985434 -0.54492119428823959648 -3.217948493942871746;0.33656617000732502731 -1.8323844215732343343 0.41619794587018388299 0.027851357649608925876 0.17452959598859191237 4.4981392015629131365 -0.29767064290199574117 0.88883217097588806954;0.12519920911759940818 0.22054200480260080508 0.10851261299573618235 -0.06463646625732609452 -0.092674118521568579765 0.069542340501969113209 0.10145237228350330316 0.10813568375675544631;0.61880256845153192025 0.21364735992790295782 0.92135646083388411665 -1.4446932226686941547 1.0807486256240603772 0.15391375574108423496 0.26707739599716445733 -0.21181253577231765051;-2.7685033780364984857 -1.9270673611842772388 -3.198745678178297247 6.2126728630217158411 -4.981289231089465197 2.4350617811515160582 4.8216275564212986993 0.49661655480160576959;1.1417134091714529198 4.8018461399400358403 -1.4015412225175449823 3.2191299526782226614 -0.39743355134787844429 -0.84320735379937372667 0.46590420261502829558 -0.56379599552649717342;0.21041429832842878378 -1.8393851622741343999 1.540300713297733548 0.57225480390291338928 0.89113448588077548429 0.17505933581779586916 0.93894148148777445417 3.4343801430650118256;-1.1204236399091331844 -2.9957014589336434796 0.32681910780657075222 -2.1317730095872367002 -0.26154248372811467194 1.0589719448978389682 0.94124561525845673593 0.47291558174342579468;-0.53828890580447963377 -7.5582258837301816712 0.59242009169374187927 -3.5018400532118874047 2.1474628309226226897 3.5384353308308464925 0.7958045901449090076 0.96542876264704668987;1.1634703680038771534 -2.3063445537903923821 -3.2076659108274436782 -0.43302053803646683994 1.5978658871853594903 -1.4698094711408302704 -2.3941163264447267167 -1.0278488167471755421;-0.82251823074852403739 -3.6701472716821341713 -0.35779483793249589052 1.428582075945612484 -0.67395497038255935962 -1.522585789455926264 0.2152593112102760553 -1.1455241013316277421;0.88477928083122003855 -0.23277233336516250928 2.4155016139497811345 0.36394868597057650206 1.9842057905688184061 -1.8695221026671489106 -0.0768712956182436985 0.38201307382368399068;-0.93916388414034990273 2.6008809926434022231 0.2240354176072009984 0.24179006049582107973 -2.9437380002822259861 0.43077115628296352989 -1.4236990598995300505 0.58123684191375379893;0.41351884917292275334 -0.07281309320078895031 -0.99539288901019362665 0.75148771833252658858 0.25109803066101343827 0.080652143247040369856 -0.67962860547947034906 1.8082961410648683565;0.51616188962970266374 -2.8222886313014647897 -2.6912284581802068395 -0.047599356302904169413 -0.11367280320172325203 3.43078890263521874 -0.23225137041015317396 0.6268607999112447704;-1.8506895053499190507 -0.29559185913698898807 -0.17791182949718759021 -3.861458242213501979 -0.71613142041443678121 1.7369044615046698166 0.86350596576022098372 0.13112392225622696018;-0.48166523029629526587 0.76328130808223459969 1.7942026090374696423 -0.15202450570814704522 2.3124523072297864523 -1.8817854506838607165 -2.521057465565578859 0.64072368736907681086;-1.2369674602003279951 -1.9982821029924007217 -1.211425234191965572 1.0462243404411837311 1.421305686411821867 -0.77833066627622238265 1.5286336973379606174 -1.5796922124817316391;-0.056932054149841933299 0.37609504315017849851 -3.2163564252884273564 -0.082024731346635987306 -3.2266860975508455667 -1.3730678304294274827 -3.1066187264719209438 1.4163841029716723874;0.0023493370227096331722 -0.53605746243056839884 2.4135014209977572186 -1.2577326046104804202 -1.9968162591768372494 1.2806586852708743418 -0.11776521527526419286 0.67619987512393009421;-1.0148204612187969875 -1.8108734628460532168 -2.9851520933843449512 0.76322593213833156423 -2.8698100911394504031 0.47703847191497444902 2.878552022236851915 0.64369938291858219692;-0.1252203646600499598 -0.22052455938744816577 -0.1084978713782559917 0.064654562100956852744 0.09265174279430747617 -0.069492362705442595194 -0.10143961203598103604 -0.10810063856681717542;0.90583163050278192596 1.3559200001272884162 -1.0616008825409612992 0.14352114617786387862 -0.16699630125496817135 -2.0204033662792300063 0.65196261454919290923 2.6464709137052584431;-0.011803783495702952627 0.94347018680045902084 -1.1549490835722606707 0.96826118615652412291 -1.4414826385881018833 -0.91382910901466707365 -0.8978103224685032302 -0.27499710638007751617;0.1251883693836632061 0.22054898662733452008 0.10851800410535898667 -0.064626883152979083813 -0.092684792118127218297 0.069566028706708693541 0.10145770758481399698 0.10815307774642252125;-0.91122301992987042585 0.94893660747918218146 1.6418081664046961787 0.1135673146930050309 0.8915936318794276394 2.478425787901681776 -2.6862140545941168845 0.14983827144330227887;0.12519741584675839197 0.22054321338542859365 0.1085135379447298154 -0.064634861940259413782 -0.092675922959648882049 0.06954632978157791745 0.10145328596064756566 0.10813859982101672874;1.3311362158678861078 -0.50532323444453719485 -1.5917837945190733695 0.95461351552943263243 -0.3554470325799876651 2.6027887987338913511 1.3632825061659501475 1.2307330011971686634;-0.68793735253457388712 -0.074503464159889759566 0.46298229710595761865 -0.51551726414657472741 -2.4154038246531750467 -1.895058682966280772 -1.4986013646389950704 -0.64265353485519416399;-0.12519542637479993963 -0.220544510410933009 -0.10851451582034159216 0.06463307524385455971 0.09267790703568397348 -0.069550712549979132326 -0.10145427269809673132 -0.10814182229620247777;-0.12530009256441379528 -0.22042944563161925853 -0.10840785085906815 0.064715982048456313636 0.092556916034255060088 -0.069276283709112415621 -0.10137331632036503115 -0.10796161516061535124;-0.22477264306217445422 -9.0486933630538217699 -0.40631219075908631133 -3.6456140189327790324 2.6729984934509829486 2.2034493970293063114 -2.8863370738577645014 0.51442879948417863378;1.3084936328585436982 -0.19595958244943428861 -0.23277385810916551012 -0.29533268301105886078 -1.7335286740033721831 -0.79162693621497726149 1.7267570982147235625 0.70914778954332069461;1.7819585770213193232 2.5655858948838798916 1.9823061925786571447 -2.0900571817287088017 5.3223214978825588162 1.6417895403419362488 4.3415888827016182461 -1.5783165148687832158;-0.67493531718044741385 2.1797224014363227873 -0.39639484901922728 -0.34552379759536516746 -0.66455726712103235787 -0.71649477957848195508 -0.71869640256827660441 0.86410387804434651837;2.4586593228717039672 -1.1484654166458194702 1.5159566180613872621 2.3017776309120163702 -0.98604577284966032913 0.50006886948774298407 -1.0697914706909232851 0.40097393542609560679;0.53871287937955836256 1.18640836154499274 -1.1257015171731572512 0.30124587548962072914 1.8473062365560606324 0.96971216953861405496 -0.43190109032980239512 0.91667419153218832051;0.90577640049651808596 0.38847646869882818121 0.23802504126662954453 0.71113459675234769186 -0.20429264674210700914 -1.0200182215503885708 1.3524216267163602367 -0.66857257483725884839;-0.081492364012872270385 0.78954112603839354811 -0.59875083208177237726 2.4242494028522587612 -0.32098685521507136498 0.5297491040607469337 -0.40647865966618351719 0.48166814954820580397;0.12519453497232813088 0.22054523226876507347 0.10851516243045633558 -0.064632352847350027503 -0.092678818501893203696 0.069552777151466585459 0.1014548051111225091 0.10814325896080249911;0.12521807155011605017 0.22052672708803133794 0.1084998086390231431 -0.064652679952322017476 -0.092654258107686571222 0.069498028730437533262 0.10144116769506228426 0.10810448739946444674;-0.39931186271929969278 -1.0375580665729255969 -0.6425407175792660075 -1.4486513559399025741 -0.98663294225804887283 1.6165677364626700463 1.0303050881847304332 1.4364098159736846672;2.0301372211023149816 2.6195460908712129289 1.9174594457661668923 -2.0170076569764301411 0.68803981017701487666 -1.9710012679369002253 -0.5703228204247782207 -1.0038721768490947994;0.8124639236378499163 0.86069642956601311035 -0.45985374552041613505 0.71319461291339092401 -1.2326751240978011115 -0.80437961267738711246 0.38850422582800603344 0.11926775952066728803;-0.34856195706304138326 -1.5712195156962944775 -0.16029834711023094318 0.090393147345785115898 0.69912138194458284257 -0.18863350517697852204 1.7398233892801631129 2.1361628607679556957;0.71660761147746276922 -1.2055043751361773641 -0.51694129631630314492 0.87684126831327224849 -1.6769396824126963086 0.56811091330682839118 -0.95068119733990974485 -0.80854502287355267676;0.12520525841338603357 0.2205376845003111097 0.108509223576301439 -0.064641839061676614753 -0.092667933370414873329 0.069528644826612945318 0.1014491405529892587 0.10812577724848747296];

% Layer 2
b2 = [0.58548668096956713036;-0.63642282583625398029;0.2039874466886194837];
LW2_1 = [-0.43467060896944947901 -0.62779707547235674703 -0.15603620237755291833 -0.34208723057024947867 -0.70845725490015831749 0.56910228812419116906 0.35395817552534042383 1.3942368839946426284 -1.4157782380112267084 -0.15631814571310834183 -1.1988019617552221341 -0.6466822521610633423 0.75052159101605064873 1.3226842501544355812 -0.20801129069062032628 -0.2493716086193710213 -2.080030180782522109 0.81236906044428192075 1.5924650433215596923 0.17327735413507611151 -3.0167821317886791554 1.0910274939852857568 1.4843753237050316685 -0.081729018885060206179 0.80361092171868786505 1.5710547491849449209 -1.2170638373122231179 1.1317547347072514086 0.27595465265959517875 1.9244224982761659604 2.095480546655519305 0.76896245164438670194 2.1045164441477233197 0.085450741563544430068 1.0857967969647339679 -1.8978773448987056316 2.1155601345492911491 0.10635280251518001993 3.2942801579230280851 2.2445255485664969974 -2.484444007447515812 2.1706501268340288036 -2.3305457495656667355 -2.0487153536507234364 0.39146565453607373719 0.15629022057115851685 1.3373384270346226899 3.1944227347675497874 0.38635767597249992544 -1.9472089799130083421 0.22633839946201680937 0.15635095301703602622 -1.7091927901977861382 1.62977866500317492 2.1003730850101129946 -0.15635599909900241289 -0.6267758666190894612 -1.6102187572008919147 2.5553302102642105886 0.71209236063035308284 -0.6146989133583148357 -1.8784858764704885914 0.50102417382390906919 0.51628169368922727234 0.039030208170683831914 -0.37196524773626055138 1.1374646241172616801 -1.9765755263591615609 1.4975969433568396827 -1.1535606476016231348 0.86526062379623758236 -1.3936348023478279945 -1.0856650404869463422 0.36722922366404620043 0.15626438383946378297 0.10495824644090936961 1.5759937559798298246 -0.15639707794368418181 -1.2373791786578316465 -0.15636292030326875979 -0.75076021042176788178 -2.2076568981985995599 0.1563704677491100925 0.15582816192611617656 1.7525368634692666259 0.27358390592484660431 -1.1943320634795429047 -1.3122587100124725179 0.73081209596732132905 1.0650986727483937599 1.1523040948378289183 0.35044668957316860158 -0.1563743416261288155 -0.15627518895575881475 0.042003897606711186608 0.96437433917013171136 0.81050915854494665069 -2.2207379615328766143 -1.0882104511946546488 -0.15633192189380121229;-0.56152488533803734949 -1.9706687247189984546 -0.26192867107380041203 -0.63661172314620817492 1.6882899823613566337 0.11709467699176044631 -1.616031706591423367 -0.35467218796013338933 1.5147476918655327083 -0.26169674512467522298 -1.7278508935375169742 1.3046208387897686443 -1.5274243982899293748 1.9166210899013329527 1.9269549313098446319 -0.066888469007706508052 0.41132667409220075028 -0.37107590938701762173 0.13378901465419870687 -0.25339196536183722364 -1.1439121927866451323 1.3102393005039798535 -0.75507223149574664856 0.6790477519242366089 1.8744003901667236622 1.4678437004993014625 1.1715274039484717683 1.0872577731275809843 1.5028216722089406954 -0.95480451314063974344 0.80273983694536177325 -1.364743553746457172 0.91253775011096960323 1.6958321937146432212 1.6320419601018563149 -0.81663819854737995652 1.1289914848826261284 1.4074681207758927837 1.7028199366062219955 1.4875239625595415571 -0.71055696917529220791 1.2949962961877068413 -0.89667329254423722151 -0.096743347639447946351 -2.1662062750765440633 0.26172236529985454245 -0.45229233113563777069 0.8354328184601398366 1.7507412481770852075 -1.7149238919316991403 1.2889569143532264572 0.26166566129867829815 -1.4026111950469644096 0.78492438049043899984 0.55290094575402737309 -0.26166028355445608566 0.60528595099271920166 -0.40745859940420681156 1.5280387221933104946 0.083734373733490685687 -1.8262670553158921738 -0.55742997123002313575 1.8879107709437952245 -1.3319379465896337145 -2.2414833922625572171 1.8361004672847074382 -0.69060384352836057253 -1.6644957473460084696 -0.48025394396864334867 -0.3117786702441429636 1.3954174024316010616 -2.1887729914552576105 1.3303276303129010216 0.12552213516434607143 0.261745007665097007 1.2835716415057172313 0.62058548915354982967 -0.26161816759875317073 0.94219685244103079658 -0.26165328070499827007 -1.2718898183030340476 -1.463528444257989003 0.26164554060053923923 0.26208404160389969784 0.80825161124287892012 1.3860965713003901012 -1.5701773700963537195 1.134958381351826473 -1.4842872467469263587 -0.70622869364685070259 0.31652355323499298256 -0.27099069445711065907 -0.26164198018712642169 -0.26173564058071324689 1.024869071893146355 1.1860752564764627248 0.38723637546481104454 -0.87774991533784640918 -1.8191395013677009729 -0.26168406762044182923;-1.9696660431612298403 1.7283869365137751739 -0.22985307497587484371 1.797264955444936696 -1.3357110421367177633 1.8576899922628562489 0.093211656570658968368 -1.0884317777446395059 -0.68086882968380146863 -0.23014545535475078308 -0.94685876837510563053 -0.38148631207392319498 0.81619770004823177789 0.67343634762386173076 1.6517912402226986313 -2.3512117330191402154 -1.1399655031151085804 -0.087850330119203901003 -1.5463877943575685681 1.5958065106388894527 0.41995523591223199444 -0.94328940279207407205 -1.5208361431813108844 1.955640421196907619 -0.7567778525358209718 -0.02550638423310186767 1.035628152016078829 0.93468200136519963284 1.2344522841308236405 -1.2575266927895889513 -0.34035635273759062835 -0.040780301507985207421 -1.0884425824189174481 -0.99669719477780527317 -0.4990747094006016682 -0.38308021509449324826 0.0049910528362271389113 -0.25762862437798944582 -0.11922857032448724857 -0.19450323147550457881 0.28002899486749333047 -0.40777101695075795851 0.53655960410420588946 0.47509195410611587684 0.7953871409090209621 0.2301145361018339941 -2.2082642961950429417 0.85080555637270360858 0.79390591582819947103 -0.47538944353624912331 -1.2384375069681103909 0.23018242231910651663 -0.93327013904128375277 -0.95078767334692348978 0.77675332762267179643 -0.23018861926371206317 1.21474740116364055 -0.66445312733851180642 -0.18957560131642339774 -0.66926181401192230691 1.6378922939974582818 -0.41404607888718919506 0.79464166280964954048 1.0480363845780833465 -0.69298709069955344297 1.9386802732329999621 -0.1803568170287874195 -1.119044497567936558 -1.2129970692047309377 2.0643177270705876936 -1.2849496288382526998 0.10579067169790627723 0.55475090407124449943 1.7584876708535044365 0.23008676644794912036 -1.1922197757416090891 1.0795087386078481284 -0.2302369709409871068 -0.27816845104139081846 -0.23019676170452893493 -1.1890000312079040956 0.12279054470342391781 0.2302057090754094093 0.22964797037371156851 0.15961020993408800428 1.4505638701343843699 -0.50989902676800658021 -0.051801079696566824928 0.79041541569147300006 -1.7499054174380344051 -1.0429208781908125836 1.6427925774738811882 -0.23020991484995814713 -0.23009830001038505953 1.6285784080992491418 1.8571320410830587377 -1.6368258415141878626 0.84046395815841257182 -0.27646059890420526806 -0.23016067556962002683];

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