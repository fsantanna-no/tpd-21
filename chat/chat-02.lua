#!/usr/bin/env lua5.3

--[[
SHA=96700ACD1128035FFEF5DC264DF87D5FEE45FF15E2A880708AE40675C9AD039E
freechains-host --port=8401 start /tmp/fc-01
freechains --port=8401 chains join '$chat' $SHA
freechains --port=8401 chain '$chat' post inline "Msg 1"
freechains --port=8401 chain '$chat' consensus

2371
TIMES=30 | t2=18 | t3=6 | t5=5 | t7=1 (1,0) | t8=0 | tnegs=1=0+1
SIZES | fz=2372/7/2366/0 | negs=5x5=25 | xpnds=1/0

4500
TIMES=52 | t2=5 | t3=13 | t5=22 | t7=12 (12,0) | t8=0 | tnegs=12=8+4
SIZES | fz=4599/39/8807/1 | negs=94x103=9682 | xpnds=1/0

5712
TIMES=168 | t2=44 | t3=53 | t5=39 | t7=32 (27,5) | t8=0 | tnegs=26=13+13
SIZES | fz=5713/172/4854/0 | negs=97x116=11252 | xpnds=1/0

7766
TIMES=304 | t2=58 | t3=25 | t5=85 | t7=135 (113,22) | t8=1 | tnegs=114=84+30
SIZES | fz=7766/540/5069/0 | negs=94x121=11374 | xpnds=1/0

8815
TIMES=377 | t2=71 | t3=75 | t5=78 | t7=153 (125,28) | t8=0 | tnegs=125=82+43
SIZES | fz=8816/849/4572/0 | negs=113x134=15142 | xpnds=1/0

9594
TIMES=586 | t2=63 | t3=95 | t5=108 | t7=320 (274,46) | t8=0 | tnegs=273=200+73
SIZES | fz=9595/1179/3637/0 | negs=113x149=16837 | xpnds=1/0

10094
TIMES=536 | t2=86 | t3=120 | t5=175 | t7=155 (129,26) | t8=0 | tnegs=129=91+38
SIZES | fz=10676/660/3077/0 | negs=74x88=6512 | xpnds=1/0

10396
TIMES=692 | t2=70 | t3=74 | t5=122 | t7=426 (347,79) | t8=0 | tnegs=347=243+104
SIZES | fz=10397/1608/2358/0 | negs=109x149=16241 | xpnds=1/0

11381
TIMES=787 | t2=108 | t3=129 | t5=184 | t7=366 (290,75) | t8=0 | tnegs=287=180+107
SIZES | fz=11382/1366/3077/0 | negs=74x88=6512 | xpnds=1/0

]]

NOW = tonumber(assert(...))

dofile 'common.lua'

local PUB = "'@57B7F4EF65AF1630C64B7A7094E4A01B01C9821622E32ECBB8D7F3B718A367FD'"
local RETS = {[true]=0,[false]=0}
local N = 1

for l in io.lines('wikimedia.chat') do
    l = string.gsub(l, "'", " ")
    assert(not string.find(l, "'"))
    local y,m,d,hh,mm,ss,user,msg = string.match(l, "(%d%d%d%d)(%d%d)(%d%d) %[(%d%d):(%d%d):(%d%d)%] %<([%a%d-_]+)%>\t(.*)")
    RETS[y~=nil] = RETS[y~=nil] + 1
    if y then
        assert(y and m and d and hh and mm and ss and user and msg)
        --print(y , m , d , hh , mm , ss , user , msg)
        local ts = os.time({year=y, month=m, day=d, hour=hh, min=mm, sec=ss})
        local h = post(8501, ts, PUB, 'Ashlee', user, 'inline', "'"..msg.."'")
        print(h)
    end
    if N == 5000 then
        break
    end
    N = N + 1
end

print(RETS[true], RETS[false])
epilogue()

--print(table.concat(USERS.Reedy.xxx, ' '))
--print(table.concat(USERS.Reedy.yyy, ' '))

-- how many users?
-- how much likes were necessary?
-- when a users needed a 2nd like, what did the messages look like?
-- SPAM? too much? could be joined?
-- https://archive.org/download/usenet-comp
-- https://archive.org/download/WikimediaIrcLogs/wmbot.zip
-- opcoes p/ chat
--  1. like 0
--  2. 128k de conteudo por like

--[[
$ freechains --port=8401 chains join '@57B7F4EF65AF1630C64B7A7094E4A01B01C9821622E32ECBB8D7F3B718A367FD'
ED083F75F81AF7E9931829E8C03D2A29BDA0E84B6DE828F128E7725C0AC39ACC

Ashlee       57B7F4EF65AF1630C64B7A7094E4A01B01C9821622E32ECBB8D7F3B718A367FD
guillom      72A0727B8976AEE843AC035A129151559F23F9872E5F45488AAC545569B970C1
jorm         AF3FC7ACB836BB36566B272EEC12B181F965787B8D18FA0CD0661270E79B83F5
Nemo_bis     B224A53D66CD427712446B7C5968A9619D425685C3768D4281F595AA8A173751
werdna       EF45242F3212E177EC222E73E84C61D0A17EFB35A8E2F61ED25A0FA609D4F9BD
Platonides   8BE20F16A014F9E1E919427D6929EC9DC92CB0B368D6E40FC9FE65101CBFBB61

350	150
       Reedy	25	141
     tomaszf	18	20
 flipzagging	14	21
     guillom	14	21
        jorm	14	38
 RoanKattouw	10	44
 AryehGregor	7	11
      Tanvir	4	4
     alolita	3	3
TrevorParscal	3	6
       mdale	1	1
      werdna	1	2
  Platonides	1	4
      danese	1	1
      Ashlee	0	33

       Reedy	38	141 *
     tomaszf	11	20
 flipzagging	16	21  *
     guillom	12	21
        jorm	10	38
 RoanKattouw	8	44
 AryehGregor	8	11  *
      Tanvir	4	4
     alolita	3	3
TrevorParscal	4	6   *
       mdale	1	1
      werdna	1	2
  Platonides	1	4
      danese	1	1
      Ashlee	0	33

15	users

# 5000 messages

4153	847
 RoanKattouw	62	1060
        jorm	42	738
       Reedy	38	345
     kaldari	31	77
      werdna	24	127
       robla	23	49
        aude	18	18
  Nikerabbit	17	21
 flipzagging	16	384
   Jamesofur	13	13
     guillom	12	175
     tomaszf	11	21
       NickK	9	9
TrevorParscal	8	305
 AryehGregor	8	11
       mdale	7	40
  Platonides	6	15
       thedj	6	38
       brion	5	23
      Tanvir	4	4
     alolita	4	12
        RobH	4	11
     pdhanda	4	17
    roberthl	3	5
       reedy	2	2
      basile	2	7
     EcceNux	2	2
    bastique	2	2
     bawolff	2	3
     Otourly	2	2
   chilliboy	2	2
 killiondude	2	2
     emrovic	1	1
      danese	1	7
   Dispenser	1	1
     Romaine	1	1
         vvv	1	2
    parutron	1	1
      Ashlee	0	600
39	users	4153	397

# 10000

8625	1375
 flipzagging	106	1161
 RoanKattouw	86	2067
     Shirley	46	91
        jorm	42	1024
TrevorParscal	39	970
       Reedy	38	525
     kaldari	31	77
      werdna	24	211
     jeremyb	23	25
       robla	23	156
     atglenn	20	20
    Dodoiste	19	43
        aude	18	50
    Diederik	17	23
  Nikerabbit	17	58
        Skud	15	15
   Dispenser	14	54
     apergos	13	13
   Jamesofur	13	13
     guillom	12	452
 aokomoriuta	11	11
     tomaszf	11	21
       Bryan	10	49
       NickK	9	9
     EcceNux	9	12
 killiondude	8	13
    YairRand	8	8
 AryehGregor	8	13
       mdale	7	81
  Platonides	6	37
       thedj	6	65
        RobH	6	19
       brion	5	76
      Tanvir	4	4
     pdhanda	4	33
     alolita	4	172
      howief	4	4
        zakg	4	7
    roberthl	3	14
      asalga	3	3
      basile	2	12
   chilliboy	2	2
     bawolff	2	6
     Otourly	2	2
     molliug	2	2
    bastique	2	2
       reedy	2	2
     emrovic	1	1
     Romaine	1	1
       drdee	1	1
    parutron	1	1
     Krinkle	1	11
         vvv	1	5
      danese	1	7
      Ashlee	0	871
55	users	8625	767

>B> 23
>1> 67
>2> 4
>3> 28
>4> 424
>C> 524
>D> 1
>A> 548


>B> 25
>1> 73
>2> 4
>3> 40
>4> 415
>C> 532
>D> 2
>A> 559


>B> 22
>1> 42
>2> 4
>3> 47
>4> 360
>C> 453
>D> 2
>A> 477


>B> 47
>1> 83
>2> 5
>3> 49
>4> 475
>C> 613
>D> 4
>A> 665

]]
