import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class DicsDataStorage {
  final box = GetStorage();
  final LineSplitter lineSplitter = const LineSplitter();

  int readFirstElementForDictionary(String dicKey) => box.read('${dicKey}_firstElement') ?? 0;
  void writeFirstElementForDictionary(String dicKey, int value) => box.write('${dicKey}_firstElement', value);
  void deleteFirstElementForDictionary(String dicKey) => box.remove('${dicKey}_firstElement');

  List<String> readWordListByDicKey(String dicKey) => List<String>.from(box.read(dicKey) ?? fillInDic(dicKey));
  void writeWordListByDicKey(String dicKey, List<String> value) => box.write(dicKey, value);
  void deleteWordListByDicKey(String dicKey) => box.remove(dicKey);

  List<String> fillInDic(String key) {
    if (key == 'dic_1') {
      return lineSplitter.convert(dic1);
    } else if (key == 'dic_2') {
      return lineSplitter.convert(dic2);
    } else if (key == 'dic_3') {
      return lineSplitter.convert(dic3);
    } else {
      return [];
    }
  }

  String dic1 = '''
I [aɪ] - я
he [hiː] - он
she [ʃiː] - она
his [hɪz] - его
that [ðæt] - тот; чтобы
was [wɒz] - был
for [fɔːr] - для
on [ɒn] - на
is [ɪz] - есть (для ед.ч.)
are [ɑːr] - есть (для мн.ч.)
with [wɪð] - с
without - без
they [ðeɪ] - они
be [biː] - быть
at [ət] - у, в, на
one [wʌn] - один
have [hæv] - иметь
this [ðɪs] - этот, эта
from [frɒm] - из
as [æz] - как
by [baɪ] - от
hot [hɒt] - горячий; жарко
word [wɜːd] - слово
but [bʌt] - но
what [wɒt] - что? какой?
some [sʌm] - некоторый
it - это, этому
you [juː] - ты, вы, тебе, вам, тебя, вас
or [ɔːr] - или
had [hæd] - имел
the [ðiː] - определённый артикль
of [əv] - из, (кого, чего)
to [tuː] - к, в
and [ænd] - и
a [ə] - 
in [ɪn] - в; через (время)
we [wiː] - мы
can [kæn] - может
out [aʊt] - из; вне
other [ˈʌðər] - другой
were [wɜːr] - были
which [wɪtʃ] - который
do [duː] - делать
their [ðeər] - их
time [taɪm] - время
if [ɪf] - если
will [wɪl] - будет
how [haʊ] - как?
said [sed] - говорить
an [æn]
each [iːtʃ] - каждый
tell [tel] - говорить
does [dʌz] - делает
set [set] - устанавливать; комплект
three [θriː] - три
want [wɒnt] - хотеть
air [eər] - воздух
well [wel] - хорошо
also [ˈɔːlsəʊ] - также
play [pleɪ] - играть
small [smɔːl] - маленький
end [end] - конец
put [pʊt] - ставить
home [həʊm] - дом
read [riːd] - читать
hand [hænd] - рука
port [pɔːt] - порт
large [lɑːdʒ] - большой
spell [spel] - читать по буквам; орфография
add [æd] - добавлять
even [ˈiːvən] - даже
land [lænd] - земля
here [hɪər] - здесь
must [mʌst] - должен
big [bɪɡ] - большой
high [haɪ] - высокий
such [sʌtʃ] - такой
follow [ˈfɒləʊ] - следовать
act [ækt] - действовать
why [waɪ] - почему
ask [ɑːsk] - спрашивать
change [tʃeɪndʒ] - менять
went [went] - отправился
light [laɪt] - свет; легкий
kind [kaɪnd] - добрый; разновидность
off [ɒf] - выключенный
need [niːd] - необходимость
house [haʊs] - дом
picture [ˈpɪktʃər] - картина
try [traɪ] - пробовать
us [ʌs] - нас, нам, нами
again [əˈɡen] - снова
animal [ˈænɪməl] - животное
point [pɔɪnt] - точка
mother [ˈmʌðər] - мать
world [wɜːld] - мир
near [nɪər] - близко
build [bɪld] - строить
self [self] - себя
earth [ɜːθ] - земля
father [ˈfɑːðər] - отец
any [ˈeni] - любой
new [njuː] - новый
work [wɜːk] - работа, работать
part [pɑːt] - часть
take [teɪk] - брать
get [get] - получать
place [pleɪs] - место
made [meɪd] - сделать
live [lɪv] - жить
where [weər] - где
after [ˈɑːftər] - после
before [bɪˈfɔːr] - до
back [bæk] - назад
little [ˈlɪtəl] - маленький; немного
only [ˈəʊnli] - только
round [raʊnd] - круглый
man [mæn] - мужчина
men [men] - мужчины; люди
woman [ˈwʊmən] - женщина
women [ˈwɪmɪn] - женщины
human [ˈhjuːmən] - человек
people [ˈpiːpəl] - люди
year [jɪər] - год
came [keɪm] - пришел
show [ʃəʊ] - показывать
every [ˈevri] - каждый
good [ɡʊd] - хороший
me [miː] - мне
give [ɡɪv] - давать
our [aʊər] - наш
under [ˈʌndər] - под
name [neɪm] - имя
very [ˈveri] - очень
through [θruː] - через
just [dʒʌst] - всего-лишь, только
form [fɔːm] - форма, формировать
sentence [ˈsentəns] - предложение
great [ɡreɪt] - отличный
think [θɪŋk] - думать
say [seɪ] - сказать, говорить
help [help] - помогать, помощь
low [ləʊ] - низкий
line [laɪn] - линия
differ [ˈdɪfər] - отличаться
turn [tɜːn] - поворачивать
cause [kɔːz] - причина
much [mʌtʃ] - много
mean [miːn] - значить
move [muːv] - двигать
right [raɪt] - правый; верно
boy [bɔɪ] - мальчик
guy [ɡaɪ] - парень
old [əʊld] - старый
too [tuː] - тоже
same [seɪm] - также
all [ɔːl] - все, всё
there [ðeər] - там
when [wen] - когда?
up [ʌp] - вверх
down [daʊn] - вниз
use [juːz] - использовать
your [jɔːr] - твой
its - его, ее
way [weɪ] - путь, способ
about [əˈbaʊt] - о
many [ˈmeni] - много
then [ðen] - тогда, затем
them [ðem] - им, ими, их
write [raɪt] - писать
would [wʊd] - бы
like [laɪk] - нравиться
so [səʊ] - так
these [ðiːz] - эти
her [hɜːr] - её, ей
long [lɒŋ] - долго; длинный
make [meɪk] - делать
thing [θɪŋ] - вещь
see [siː] - видеть
him [hɪm] - его, ему
two [tuː] - два
has [hæz] - имеет
look [lʊk] - смотреть; взгляд
more [mɔːr] - больше
day [deɪ] - день
could [kʊd] - мог
go [ɡəʊ] - идти
come [kʌm] - приходить
did [dɪd] - сделал
number [ˈnʌmbər] - номер
sound [saʊnd] - звук
no [nəʊ] - нет
most [məʊst] - самый; большинство
my [maɪ] - мой
over [ˈəʊvər] - над
water [ˈwɔːtər] - вода
than [ðæn] - чем
call [kɔːl] - звонить; звонок
first [ˈfɜːst] - первый
who [huː] - кто?
may [meɪ] - может
side [saɪd] - сторона
been [biːn] - был
now [naʊ] - сейчас
find [faɪnd] - найти, находить
head [hed] - голова
stand [stænd] - стоять
own [əʊn] - собственный; владеть
page [peɪdʒ] - страница
should [ʃʊd] - должен
country [ˈkʌntri] - страна
found [faʊnd] - найденный
answer [ˈæn·sər] - ответ, отвечать
school [skuːl] - школа
grow [ɡrəʊ] - расти
study [ˈstʌdi] - учиться, изучать
already - уже, ещё
still [stɪl] - все еще
learn [lɜːn] - учиться
plant [plɑːnt] - растение; сажать
cover [ˈkʌvər] - накрывать; обложка
food [fuːd] - еда
sun [sʌn] - солнце
four [fɔːr] - четыре
between [bɪˈtwiːn] - между
state [steɪt] - состояние; государство, штат  
keep [kiːp] - держать, продолжать
eye [aɪ] - глаз
never [ˈnevər] - никогда
last [lɑːst] - последний
let [let] - позволять
thought [θɔːt] - мысль; думал
city [ˈsɪti] - город
tree [triː] - дерево
cross [krɒs] - пересекать; крест
farm [fɑːm] - ферма
hard [hɑːd] - тяжелый; твердый
start [stɑːt] - начинать
might [maɪt] - может быть
story [ˈstɔːri] - история
saw [sɔː] - увидел
far [fɑːr] - далеко
sea [siː] - море
draw [drɔː] - рисовать
left [left] - лево; левый; оставлять
late [leɪt] - поздно; поздний
run [rʌn] - бежать
don’t [dəʊnt] - не
while [waɪl] - в то время, как
press [pres] - давить
close [kləʊz] - близко; закрывать
night [naɪt] - ночь
real [rɪəl] - настоящий
life [laɪf] - жизнь
few [fjuː] - несколько
north [nɔːθ] - север
book [bʊk] - книга
carry [ˈkæri] - нести  
took [tʊk] - взял
science [ˈsaɪəns] - наука
eat [iːt] - есть
room [ruːm] - комната
friend [frend] - друг
began [bɪˈɡæn] - началось
idea [aɪˈdɪə] - идея
fish [fɪʃ] - рыба
mountain [ˈmaʊntɪn] - гора
stop [stɒp] - остановка; останавливать
once [wʌns] - однажды
base [beɪs] - базовый; основывать
hear [hɪər] - слышать
horse [hɔːs] - лошадь
cut [kʌt] - резать
sure [ʃɔːr] - конечно; уверен
watch [wɒtʃ] - смотреть; часы
colour [ˈkʌlər] - цвет
face [feɪs] - лицо
wood [wʊd] - дерево
main [meɪn] - главный
open [ˈəʊpən] - открыть, открытый
seem [siːm] - казаться
together [təˈɡeðər] - вместе
next [nekst] - следующий
white [waɪt] - белый
child [tʃaɪld] - ребенок
children [ˈtʃɪldrən] - дети
begin [bɪˈɡɪn] - начинать
got [ɡɒt] - получил
walk [wɔːk] - гулять; прогулка
example [ɪɡˈzɑːmpəl] - пример
ease [iːz] - легко
paper [ˈpeɪpər] - бумага
group [ɡruːp] - группа
almost - почти
always [ˈɔːlweɪz] - всегда
music [ˈmjuːzɪk] - музыка
those [ðəʊz] - те
both [bəʊθ] - оба
mark [mɑːk] - отметка; отмечать
often [ˈɒfən] - часто
sometimes - иногда
usually - обычно
letter [ˈletər] - письмо
until [ənˈtɪl] - до тех пор
mile [maɪl] - миля
river [ˈrɪvər] - река
car [kɑːr] - машина
feet [fiːt] - ноги
care [keər] - заботиться; забота
second [ˈsekənd] - секунда
enough [ɪˈnʌf] - достаточно; хватит
plain [pleɪn] - простой
girl [ɡɜːl] - девочка
usual [ˈjuːʒuəl] - обычно
young [jʌŋ] - молодой
ready [ˈredi] - готовый
above [əˈbʌv] - выше
ever [ˈevər] - когда-либо
red [red] - красный
list [lɪst] - список
though [ðəʊ] - хоть
feel [fiːl] - чувствовать
talk [tɔːk] - говорить
bird [bɜːd] - птица
soon [suːn] - скоро
body [ˈbɒdi] - тело
dog [dɒɡ] - собака
family [ˈfæməli] - семья
direct [daɪˈrekt] - прямой; направлять
pose [pəʊz] - поза; позировать
leave [liːv] - покидать
song [sɒŋ] - песня
measure [ˈmeʒər] - мера; мерять
door [dɔːr] - дверь
product [ˈprɒdʌkt] - продукт
black [blæk] - черный
short [ʃɔːt] - короткий
numeral [ˈnjuːmərəl] - числительное
class [klɑːs] - класс; сорт
wind [wɪnd] - ветер
question [ˈkwestʃən] - вопрос
happen [ˈhæpən] - случаться
complete [kəmˈpliːt] - завершать; завершенный
ship [ʃɪp] - корабль
area [ˈeəriə] - пространство
half [hɑːf] - половина
rock [rɒk] - скала; рок (музыка)
order [ˈɔːdər] - заказ; порядок
fire  [faɪər]— огонь
south [saʊθ] - юг
problem [ˈprɒbləm] - проблема
piece [piːs] - часть; кусок  
told [təʊld] - говорил
knew [njuː] - знал
pass [pɑːs] - проходить; передача
since [sɪns] - с (какого-то времени)
top [tɒp] - верх
whole [həʊl] - целый
king [kɪŋ] - король
street [striːt] - улица
inch [ɪntʃ] - дюйм
multiply [ˈmʌltɪplaɪ] - умножать
nothing [ˈnʌθɪŋ] - ничего
course [kɔːs] - курс
stay [steɪ] - оставаться
wheel [wiːl] - колесо
full [fʊl] - полный
force [fɔːs] - сила; заставлять
blue [bluː] - голубой, синий
object [ˈɒbdʒɪkt] - объект
decide [dɪˈsaɪd] - решать
surface [ˈsɜːfɪs] - поверхность
deep [diːp] - глубоко
moon [muːn] - луна
island [ˈaɪlənd] - остров
foot [fʊt] - нога
system [ˈsɪstəm] - система
busy [ˈbɪzi] - занят
test [test] - тест; тестировать
record [rɪˈkɔːd] - записывать
boat [bəʊt] - лодка
common [ˈkɒmən] - общий
gold [ɡəʊld] - золото
possible [ˈpɒsəbəl] - возможный
plane [pleɪn] - самолет; плоскость
stead [sted] - место
dry [draɪ] - сухой
wonder [ˈwʌndər] - чудо; удивляться
laugh [lɑːf] - смех; смеяться
thousand [ˈθaʊzənd] - тысяча
ago [əˈɡəʊ] - тому назад
ran [ræn] - побежал
check [tʃek] - проверять
game [ɡeɪm] - игра
shape [ʃeɪp] - форма
equate [ɪˈkweɪt] - приравнивать
OK [ˌəʊˈkeɪ] - хорошо
miss [mɪs] - скучать; пропускать
brought [brɔːt] - привел
heat [hiːt] - жара, высокая температура
snow [snəʊ] - снег
tire [taɪər] - шина; утомлять
bring [brɪŋ] - приносить
yes [jes] - да
distant [ˈdɪstənt] - отдаленный
fill [fɪl] - наполнять
east [iːst] - восток
paint [peɪnt] - краска; красить
language [ˈlæŋɡwɪdʒ] - язык
among [əˈmʌŋ] - среди
unit [ˈjuːnɪt] - единица
power [paʊər] - мощность, сила
town [taʊn] - город
fine [faɪn] - отлично; хороший
certain [ˈsɜːtən] - определенный
fly [flaɪ] - летать
fall [fɔːl] - падать
lead [liːd] - вести, руководить
cry [kraɪ] - плакать
dark [dɑːk] - темный, темнота
machine [məˈʃiːn] - машина, механизм
note [nəʊt] - заметка, отмечать
wait [weɪt] - ждать
plan [plæn] - план
figure [ˈfɪɡər] - цифра, фигура
star [stɑːr] - звезда
box [bɒks] - коробка
noun [naʊn] - существительное
field [fiːld] - поле
rest [rest] - остальное; отдыхать
correct [kəˈrekt] - поправить; правильный
able [ˈeɪbəl] - способный
pound [paʊnd] - фунт
done [dʌn] - сделанный
beauty [ˈbjuːti] - красота
drive [draɪv] - водить
stood [stʊd] - стоял
contain [kənˈteɪn] - содержать
front [frʌnt] - перед
teach [tiːtʃ] - обучать
week [wiːk] - неделя
final [ˈfaɪnəl] - финал; последний
gave [ɡeɪv] - дал
green [ɡriːn] - зеленый
oh [əʊ] - ох
quick [kwɪk] - быстрый
quickly - быстро
develop [dɪˈveləp] - развивать
ocean [ˈəʊʃən] - океан
warm [wɔːm] - тепло
free [friː] - свободный
minute [ˈmɪnɪt] - минута
strong [strɒŋ] - сильный
special [ˈspeʃəl] - особый
mind [maɪnd] - разум; возражать
behind [bɪˈhaɪnd] - позади
clear [klɪər] - ясный, прозрачный; понятно
tail [teɪl] - хвост
produce [prəˈdʒuːs] - производить
fact [fækt] - факт  
space [speɪs] - пространство; космос
heard [hɜːd] - слышал
best [best] - лучший
hour [aʊər] - час
better [ˈbetər] - лучше
true [truː] - правда  
during [ˈdʒʊərɪŋ] - во время, в течение
hundred [ˈhʌndrəd] - сотня
five [faɪv] - пять
remember [rɪˈmembər] - помнить
step [step] - шаг
early [ˈɜːli] - рано; ранний
hold [həʊld] - держать
west [west] - запад
ground [ɡraʊnd] - земля
interest [ˈɪntrəst] - интерес
reach [riːtʃ] - достигать
fast [fɑːst] - быстро
slowly - медленно
verb [vɜːb] - глагол
sing [sɪŋ] - петь
listen [ˈlɪsən] - слушать
six [sɪks] - шесть
table [ˈteɪbəl] - стол
pen [pen] - ручка
travel [ˈtrævəl] - путешествовать
less [les] - меньше
morning [ˈmɔːnɪŋ] - утро
ten [ten] - десять
simple [ˈsɪmpəl] - просто; простой
several [ˈsevərəl] - несколько
vowel [vaʊəl] - гласный (звук)
towards [twoʊrdz] - по направлению к
war [wɔːr] - война
lay [leɪ] - лежать
against [əˈɡenst] - против
pattern [ˈpætən] - узор
slow [sləʊ] - медленно; медленный
center [ˈsentər] - центр
love [lʌv] - любовь
person [ˈpɜːsən] - человек
money [ˈmʌni] - деньги
serve [sɜːv] - обслуживать  
appear [əˈpɪər] - появляться
road [rəʊd] - дорога
map [mæp] - карта
rain [reɪn] - дождь
rule [ruːl] - правило
govern [ˈɡʌvən] - управлять
pull [pʊl] - тянуть
cold [kəʊld] - холодный
notice [ˈnəʊtɪs] - уведомление; замечать
voice [vɔɪs] - голос
energy [ˈenədʒi] - энергия
hunt [hʌnt] - охотититься
probable [ˈprɒbəbəl] - вероятный
bed [bed] - кровать
brother [ˈbrʌðər] -  брат
egg [eɡ] - яйцо
ride [raɪd] - ездить; поездка
cell [sel] - клетка; мобильный (амер)
believe [bɪˈliːv] - верить
perhaps [pəˈhæps] - возможно
pick [pɪk] - выбирать
sudden [ˈsʌdən] - внезапный
count [kaʊnt] - считать
square [skweər] - квадрат; площадь
reason [ˈriːzən] - причина
length [leŋθ] - длина
represent [ˌreprɪˈzent] - представлять
art [ɑːt] - искусство
subject [ˈsʌbdʒekt] - предмет
region [ˈriːdʒən] - регион
size [saɪz] - размер
vary [ˈveəri] - меняться, варьировать
settle [ˈsetəl] - селиться
speak [spiːk] - говорить
weight [weɪt] - вес
general [ˈdʒenərəl] - главный, общий
ice [aɪs] - лед
matter [ˈmætər] - иметь значение; материя
circle [ˈsɜːkəl] - круг
pair [peər] - пара
include [ɪnˈkluːd] - включать в себя
divide [dɪˈvaɪd] - разделять
syllable [ˈsɪləbəl] - слог
felt [felt] - чувствовал
grand [ɡrænd] - большой, великий
ball [bɔːl] - мяч
yet [jet] - еще
wave [weɪv] - волна
drop [drɒp] - капля; бросать
heart [hɑːt] - сердце
AM [ˌeɪ ˈem] - до полудня
present [ˈprezənt] - подарок; настоящий
heavy [ˈhevi] - тяжелый
dance [dɑːns] - танец; танцевать
engine [ˈendʒɪn] - двигатель
position [pəˈzɪʃən] - позиция
arm [ɑːm] - рука
wide [waɪd] - широкий; повсюду
sail [seɪl] - паруса; плавать
material [məˈtɪəriəl] - материал
fraction [ˈfrækʃən] - доля
forest [ˈfɒrɪst] - лес
sit [sɪt] - сидеть
race [reɪs] - гонка; раса
window [ˈwɪndəʊ] - окно
store [stɔːr] - магазин (амер)
shop [ʃɒp] - магазин (брит)
summer [ˈsʌmər] - лето
train [treɪn] - поезд
sleep [sliːp] - спать
prove [pruːv] - доказывать
alone [əˈləʊn] - один; одинокий
leg [leɡ] - нога
exercise [ˈeksəsaɪz] - упражнение
wall [wɔːl] - стена
catch [kætʃ] - поймать
mount [maʊnt] - монтировать
wish [wɪʃ] - желать
sky [skaɪ] - небо
board [bɔːd] - доска
joy [dʒɔɪ] - радость
winter [ˈwɪntər] - зима
somebody [ˈsʌmbədi] - кто-то
written [ˈrɪtən] - написанный
wild [waɪld] - дикий
instrument [ˈɪnstrəmənt] - инструмент
kept [kept] - сохранил
glass [ɡlɑːs] - стекло
grass [ɡrɑːs] - трава
cow [kaʊ] - корова
job [dʒɒb] - работа
edge [edʒ] - край
sign [saɪn] - подписывать; знак
visit [ˈvɪzɪt] - посещать
past [pɑːst] - прошлое; прошлый
soft [sɒft] - мягкий
fun [fʌn] - веселый; веселье
bright [braɪt] - яркий
gas [ɡæs] - газ, бензин (амер)
weather [ˈweðər] - погода
month [mʌnθ] - месяц
million [ˈmɪljən] - миллион
bear [beər] - медведь
finish [ˈfɪnɪʃ] - закончить
happy [ˈhæpi] - счастливый
hope [həʊp] - надежда; надеяться
flower [flaʊər] - цветок
clothes [kləʊðz] - одежда
strange [streɪndʒ] - странный
gone [ɡɒn] - ушедший
trade [treɪd] - торговля
melody [ˈmelədi] - мелодия
trip [trɪp] - поездка
office [ˈɒfɪs] - офис
receive [rɪˈsiːv] - получать
row [rəʊ] - ряд
mouth [maʊθ] - рот
exact [ɪɡˈzækt] - точный
symbol [ˈsɪmbəl] - символ
die [daɪ] - умирать
least [liːst] - наименее, меньше всего
trouble [ˈtrʌbəl] - проблема
shout [ʃaʊt] - кричать
except [ɪkˈsept] - кроме, исключая
writer [ˈraɪtər] - писатель
seed [siːd] - семя
tone [təʊn] - тон  
join [dʒɔɪn] - присоединяться
suggest [səˈdʒest] - предлагать
clean [kliːn] - чисто; чистый
break [breɪk] - перерыв; ломать
lady [ˈleɪdi] - леди
yard [jɑːd] - двор
rise [raɪz] - подниматься
bad [bæd] - плохой
blow [bləʊ] - удар; дуть
oil [ɔɪl] - масло
blood [blʌd] - кровь
touch [tʌtʃ] - трогать; прикосновение
goal [ɡəʊl] - цель
cent [sent] - цент
mix [mɪks] - смесь; смешивать
team [tiːm] - команда
wire [waɪər] - проволока
cost [kɒst] - стоимость
lost [lɒst] - потерял; потерянный
brown [braʊn] - коричневый
wear [weər] - носить
garden [ˈɡɑːdən] - сад
equal [ˈiːkwəl] - равный
sent [sent] - отправил; отправленный
choose [tʃuːz] - выбирать
fit [fɪt] - соответствовать, подходить
flow [fləʊ] - поток; течь
fair [feər] - честный; ярмарка
bank [bæŋk] - банк; берег
collect [kəˈlekt] - собирать
save [seɪv] - сохранять
control [kənˈtrəʊl] - контроль; контролировать
decimal [ˈdesɪməl] - десятичный
ear [ɪər] - ухо
else [els] - еще
quite [kwaɪt] - довольно
broke [brəʊk] - сломал
case [keɪs] - случай
middle [ˈmɪdəl] - средний
kill [kɪl] - убивать
son [sʌn] - сын
lake [leɪk] - озеро
moment [ˈməʊmənt] - момент
scale [skeɪl] - шкала
loud [laʊd] - громко
spring [sprɪŋ] - весна
observe [əbˈzɜːv] - наблюдать
straight [streɪt] - прямо, прямой
along - вдоль
nation [ˈneɪʃən] - нация
dictionary [ˈdɪkʃənəri] - словарь
milk [mɪlk] - молоко
speed [spiːd] - скорость
method [ˈmeθəd] - метод
organ [ˈɔːɡən] - орган
pay [peɪ] - платить
age [eɪdʒ] - возраст
section [ˈsekʃən] - раздел
dress [dres] - платье; одеваться
cloud [klaʊd] - облако
surprise [səˈpraɪz] - сюрприз
quiet [ˈkwaɪət] - тихо; тихий
stone [stəʊn] - камень
tiny [ˈtaɪni] - крошечный
climb [klaɪm] - подъем; взбираться
cool [kuːl] - крутой; прохладно
design [dɪˈzaɪn] - дизайн
poor [pɔːr] - бедный
lot [lɒt] - много
explain [ɪkˈspleɪn] - объяснять
bottom [ˈbɒtəm] - низ
key [kiː] - ключ
iron [aɪən] - железо
single [ˈsɪŋɡəl] - один; одинокий
stick [stɪk] - приклеивать, придерживаться
flat [flæt] - квартира (брит); плоский
twenty [ˈtwenti] - двадцать
skin [skɪn] - кожа
smile [smaɪl] - улыбка
crease [kriːs] - мять; складка
hole [həʊl] - дыра
jump [dʒʌmp] - прыгать
baby [ˈbeɪbi] - ребенок
eight [eɪt] - восемь
village [ˈvɪlɪdʒ] - деревня
meet [miːt] - встречать
root [ruːt] - корень
buy [baɪ] - покупать
raise [reɪz] - поднимать; повышать
solve [sɒlv] - решать
metal [ˈmetəl] - металл
whether [ˈweðər] - ли
push [pʊʃ] - давить, толкать
seven [ˈsevən] - семь
paragraph [ˈpærəɡrɑːf] - параграф
third [θɜːd] - третий
shall [ʃæl] - должен
held [held] - держал
hair [heər] - волосы
describe [dɪˈskraɪb] - описывать
cook [kʊk] - готовить
floor [flɔːr] - пол
either [ˈaɪðər] - или
result [rɪˈzʌlt] - результат
burn [bɜːn] - гореть; ожог
hill [hɪl] - холм
safe [seɪf] - безопасный
cat [kæt] - кот
century [ˈsentʃəri] - век
consider [kənˈsɪdər] - рассматривать
type [taɪp] - тип; печатать
law [lɔː] - закон
bit [bɪt] - немного; часть
coast [kəʊst] - берег
copy [ˈkɒpi] - копировать; копия
phrase [freɪz] - фраза; формулировать
silent [ˈsaɪlənt] - тихий
tall [tɔːl] - высокий
sand [sænd] - песок
soil [sɔɪl] - почва
roll [rəʊl] - вертеть
temperature [ˈtemprətʃər] - температура
finger [ˈfɪŋɡər] - палец
industry [ˈɪndəstri] - индустрия
value [ˈvæljuː] - значение; стоимость; ценность
fight [faɪt] - драка; бороться
lie [laɪ] - ложь; лгать
beat [biːt] - бить; ритм
excite [ɪkˈsaɪt] - возбуждать
natural [ˈnætʃərəl] - естественный
view [vjuː] - вид
sense [sens] - смысл; чувство
capital [ˈkæpɪtəl] - столица
won’t [wəʊnt] - не будет
chair [tʃeər] - стул
danger [ˈdeɪndʒər] - опасность
fruit [fruːt] - фрукт
rich [rɪtʃ] - богатый
thick [θɪk] - толстый
soldier [ˈsəʊldʒər] - солдат
process [ˈprəʊses] - процесс; выполнять процесс
operate [ˈɒpəreɪt] - управлять
practice [ˈpræktɪs] - практиковать; практика
separate [ˈsepəreɪt] - разделять
difficult [ˈdɪfɪkəlt] - сложный
doctor [ˈdɒktər] - доктор
please [pliːz] - пожалуйста; угождать
protect [prəˈtekt] - защищать
noon [nuːn] - полдень
crop [krɒp] - обрезать
modern [ˈmɒdən] - современный
element [ˈelɪmənt] - элемент
hit [hɪt] - удар; бить
student [ˈstjuːdənt] - студент
corner [ˈkɔːnər] - угол
party [ˈpɑːti] - вечеринка; партия
supply [səˈplaɪ] - обеспечивать; поставка
whose [huːz] - чьи
locate [ləʊˈkeɪt] - размещать
ring [rɪŋ] - кольцо
character [ˈkærəktər] - характер
insect [ˈɪnsekt] - насекомое
caught [kɔːt] - поймал; пойманный
period [ˈpɪəriəd] - период; точка
indicate [ˈɪndɪkeɪt] - указывать
radio [ˈreɪdiəʊ] - радио
spoke [spəʊk] - говорил
atom [ˈætəm] - атом
history [ˈhɪstəri] - история
effect [ɪˈfekt] - эффект
electric [iˈlektrɪk] - электрический
expect [ɪkˈspekt] - ожидать  
bone [bəʊn] - кость
rail [reɪl] - рельс; железнодорожный путь
imagine [ɪˈmædʒɪn] - представлять
provide [prəˈvaɪd] - предоставлять
agree [əˈɡriː] - соглашаться
thus [ðʌs] - таким образом
gentle [ˈdʒentəl] - нежный
captain [ˈkæptɪn] - капитан
guess [ɡes] - предположение; угадывать
necessary [ˈnesəseri] - необходимый
sharp [ʃɑːp] - острый; умный
wing [wɪŋ] - крыло
create [kriˈeɪt] - создавать
neighbour [ˈneɪbər] - сосед
wash [wɒʃ] - мыть
bat [bæt] - бита; летучая мышь
rather [ˈrɑːðər] - скорее
crowd [kraʊd] - толпа
corn [kɔːn] - кукуруза
compare [kəmˈpeər] - сравнивать
poem [ˈpəʊɪm] - стих
string [strɪŋ] - струна
bell [bel] - колокол
depend [dɪˈpend] - зависеть
meat [miːt] - мясо
rub [rʌb] - тереть
tube [tʃuːb] - труба; метро (в Лондоне)
famous [ˈfeɪməs] - известный
dollar [ˈdɒlər] - доллар
stream [striːm] - поток; течь
fear [fɪər] - страх; бояться
sight [saɪt] - взгляд; зрение
thin [θɪn] - тонкий
triangle [ˈtraɪæŋɡəl] - треугольник
planet [ˈplænɪt] - планета
hurry [ˈhʌri] - спешить; спешка
chief [tʃiːf] - шеф
colony [ˈkɒləni] - колония
clock [klɒk] - часы
mine [maɪn] - мой
tie [taɪ] - галстук; завязывать
enter [ˈentər] - вход; входить
major [ˈmeɪdʒər] - основной; майор
fresh [freʃ] - свежий
search [sɜːtʃ] - поиск; искать
send [send] - посылать
yellow [ˈjeləʊ] - желтый
gun [ɡʌn] - пистолет, ружье
allow [əˈlaʊ] - позволять
print [prɪnt] - печать, печатать
dead [ded] - мертвый
spot [spɒt] - пятно, место
desert [ˈdezət] - пустыня
suit [suːt] - костюм; подходить
current [ˈkʌrənt] - текущий
lift [lɪft] - поднимать; лифт (брит)
rose [rəʊz] - роза
arrive [əˈraɪv] - прибывать
master [ˈmɑːstər] - мастер
track [træk] - дорожка; след
parent [ˈpeərənt] - родитель
shore [ʃɔːr] - побережье
division [dɪˈvɪʒən] - деление
sheet [ʃiːt] - лист; простынь
substance [ˈsʌbstəns] - вещество
favour [ˈfeɪvər] - одолжение
connect [kəˈnekt] - соединять
post [pəʊst] - почта; после
spend [spend] - тратить
chord [kɔːd] - аккорд
fat [fæt] - жир; жирный
glad [ɡlæd] - рад
original [əˈrɪdʒənəl] - оригинальный
share [ʃeər] - делиться
station [ˈsteɪʃən] - станция
dad [dæd] - папа
bread [bred] - хлеб
charge [tʃɑːdʒ] - заряд; заряжать
proper [ˈprɒpər] - правильный
bar [bɑːr] - бар
offer [ˈɒfər] - предлагать; предложение
segment [ˈseɡmənt] - часть, сегмент
slave [sleɪv] - раб
duck [dʌk] - утка
instant [ˈɪnstənt] - мгновенный
market [ˈmɑːkɪt] - рынок
degree [dɪˈɡriː] - температура
populate [ˈpɒpjəleɪt] - населять
education [ˌedʒuˈkeɪʃən] - образование
dear [dɪər] - дорогая
enemy [ˈenəmi] - враг
reply [rɪˈplaɪ] - ответ; отвечать
drink [drɪŋk] - напиток; пить
occur [əˈkɜːr] - происходить
support [səˈpɔːt] - поддержка; поддерживать
speech [spiːtʃ] - речь
nature [ˈneɪtʃər] - природа
range [reɪndʒ] - диапазон
steam [stiːm] - пар
motion [ˈməʊʃən] - движение
path [pɑːθ] - путь
liquid [ˈlɪkwɪd] - жидкость
violence [ˈvaɪələns] - жестокость  
meant [ment] - значил
quotient [ˈkwəʊʃənt] - частное
teeth [tiːθ] - зубы
shell [ʃel] - ракушка
neck [nek] - шея
oxygen [ˈɒksɪdʒən] - кислород
sugar [ˈʃʊɡər] - сахар
death [deθ] - смерть
pretty [ˈprɪti] - милый; довольно
skill [skɪl] - умение
season [ˈsiːzən] - сезон; время года
solution [səˈluːʃən] - решение
magnet [ˈmæɡnət] - магнит
silver [ˈsɪlvər] - серебро
thanks [θæŋks] - спасибо  
lunch [lʌntʃ] - ужин
match [mætʃ] - совпадать; матч
treat [triːt] - угощение; обращаться
especially [ɪˈspeʃəli] - особенно
fail [feɪl] - провал; провалиться
afraid [əˈfreɪd] - испуганный
huge [hjuːdʒ] - огромный
sister [ˈsɪstər] - сестра
steel [stiːl] - сталь
discuss [dɪˈskʌs] - обсуждать
forward [ˈfɔːwəd] - вперед
similar [ˈsɪmɪlər] - похожий
guide [ɡaɪd] - руководство; направлять
experience [ɪkˈspɪəriəns] - опыт
score [skɔːr] - счет
apple [ˈæpəl] - яблоко
evidence [ˈevɪdəns] - доказательства
message [ˈmesɪdʒ] - сообщение
movie [ˈmuːvi] - фильм (амер)
coat [kəʊt] - пальто
mass [mæs] - масса
card [kɑːd] - карта
band [bænd] - группа
rope [rəʊp] - веревка
slip [slɪp] - скользить
win [wɪn] - побеждать
dream [driːm] - мечта, мечтать; сон
evening [ˈiːvnɪŋ] - вечер
condition [kənˈdɪʃən] - состояние
feed [fiːd] - кормить
tool [tuːl] - инструмент
total [ˈtəʊtəl] - сумма
basic [ˈbeɪsɪk] - базовый
smell [smel] - запах
valley [ˈvæli] - долина
not [nɒt] - не
double [ˈdʌbəl] - двойной; двойник
seat [siːt] - место
continue [kənˈtɪnjuː] - продолжать
news [njuːz] - новости
police [pəˈliːs] - полиция
hat [hæt] - шляпа
sell [sel] - продавать
success [səkˈses] - успех
company [ˈkʌmpəni] - компания
security [sɪˈkjʊərəti] - безопасность; охрана
event [ɪˈvent] - событие
particular [pəˈtɪkjələr] - особенный; конкретный
deal [diːl] - сделка; разбираться
swim [swɪm] - плавать
term [tɜːm] - срок; семестр; условие
opposite [ˈɒpəzɪt] - напротив; противоположный
husband [ˈhʌzbənd] - муж
wife [waɪf] - жена
shoes [ʃuːz] - обувь; туфли
shoulders [ˈʃəʊldərz] - плечи
spread [spred] - распространение; распространять
arrange [əˈreɪndʒ] - организовывать
camp [kæmp] - лагерь
invent [ɪnˈvent] - изобретать
cotton [ˈkɒtən] - хлопок
born [bɔːn] - родиться
determine [dɪˈtɜːmɪn] - определять
quarter [ˈkwɔːtər] - четверть
nine [naɪn] - девять
remove [rɪˈmuːv] - удалять
noise [nɔɪz] - шум
level [ˈlevəl] - уровень
chance [tʃɑːns] - шанс
gather [ˈɡæðər]— собирать
stretch [stretʃ] - растягивать
throw [θrəʊ] - бросать
shine [ʃaɪn] - сиять
property [ˈprɒpəti] - собственность
issue [ˈɪʃuː] - проблема
legal [ˈliːɡəl] - законный
select [sɪˈlekt] - выбирать
wrong [rɒŋ] - неправильный
gray [ɡreɪ] - серый
repeat [rɪˈpiːt] - повторять
require [rɪˈkwaɪər] - требоваться
broad [brɔːd] - широкий
prepare [prɪˈpeər] - подготавливать
salt [sɒlt] - соль; соленый
nose [nəʊz] - нос
plural [ˈplʊərəl] - множественное число
anger [ˈæŋɡər] - гнев
claim [kleɪm] - запрос; требовать
price [praɪs] - цена
health [helθ] - здоровье
know [nəʊ] - знать
lose [luːz] - терять
love [lʌv] - любить
understand [ˌʌndəˈstænd] - понимать
easy [ˈiːzi] - легкий
free [friː] - свободный, бесплатный
foreign [ˈfɒrən] - иностранный
nice [naɪs] - милый
popular [ˈpɒpjələr] - популярный
''';

  String dic2 = '''
buchstabieren - читать по складам; произносить по буквам
leben - жить; существовать
lesen - читать
meinen - иметь в виду; подразумевать; считать, полагать
möchten - хотел бы
reisen - путешествовать
spielen - играть; резвиться
warten - ждать, дожидаться
werden - становиться, делаться
wohnen - жить, обитать; проживать (в к-л. месте)
das Alter, = - возраст
der Ausländer, = - иностранец
die Eltern - родители
der Familienstand - семейное положение
die Frau, -en - женщина, жена
die Hausfrau, -en - хозяйка (дома); домашняя хозяйка
das Jahr, -e - год
der Kaufmann, die Kaufleute - коммерсант, торговец
der Monat, -e - месяц
das Österreich - Австрия
die Postkarte, -n - (почтовая) открытка
die Postleitzahl, -en - почтовый индекс
der Reiseleiter - экскурсовод; гид-переводчик
der Schüler, = - ученик, школьник
die Schweiz - Швейцария
die Seite, -n - сторона; страница
der Wohnort и der Wohnsitz - местожительство; резиденция
die Zahl, -en - число
alt - старый; пожилой; древний; старинный
berufstätig - работающий (по спец.), занятый на работе
frei - свободный, независимый
geschieden - разведённый (о супругах)
klein - маленький, малый, небольшой
ledig - свободный; холостой
neu - новый; недавний
verheiratet - женатый; замужняя
verwitwet - овдовевший
da - тут; там; здесь
erst - сперва; только
etwa - около, приблизительно; разве
etwas - нечто; что-нибудь; немного
hier - здесь, тут; вот
jetzt - теперь, сейчас
leider - к сожалению, жаль
noch - (пока) ещё; по-прежнему; всё ещё
noch einmal - ещё раз
schon - уже, ну же
übrigens - впрочем, вообще
aber - но
aus - из
das - это
dein - твой (твоя, твоё, твои)
von - от
was - что?
wer - кто?
wie - как?
wie viel - сколько?
ach so! - вот как!, значит так!, ах так!
auf Wiedersehn! - до свидания!
schön - красивый, прекрасный
die Entschuldigung, -en - извинение; оправдание
es geht - ничего, нормально, пойдёт
der Abend, -e - вечер
das macht nichts - это ничего, ничего страшного; не имеет значения
Wie bitter? - Что, простите?, Как?
Wie geht (steht) es Ihnen? - Как у Вас дела?
zur Zeit - в настоящее время
ergänzen - дополнять; добавлять; пополнять
bilden - создавать; составлять; образовывать
ebenso - (точно) так же; таким же образом; в такой же степени
der Lehrer, = - учитель; преподаватель; наставник
passen - подходить; годиться; быть впору, быть к лицу; подходить, годиться
der Landwirt, -e - сельский хозяин; фермер, агроном
auch - также, тоже; и; впрочем
später - поздний; позднеe; после этого
dort - там
kaufen - купить; покупать
verkaufen - продавать; продавать
zusammen - вместе; сообща
dann - тогда; потом, затем
die Stunde, -n - час
möglich - возможный
der Schlosser, = - слесарь
liegen - лежать; быть расположенным; находиться
antworten - отвечать; давать ответ
bekommen - получать; приобретать
entschuldigen - извинять, прощать (за )
funktionieren - функционировать; действовать; работать
kosten - стоить; пробовать
sagen - сказать; говорить
spülen - полоскать, промывать, мыть
stimmen - соответствовать (истине); быть верным
waschen - мыть; стирать; промывать
wechseln - менять(ся); обменивать; разменивать
die Antwort, -en - ответ; отклик (на зов); отзыв (на пароль)
das Benzin, -n - бензин
das Bett, -en - постель; кровать; койка
das Bild, -er - картина; рисунок; (кино)кадр; образ
der Fehler, - - ошибка; погрешность; промах
der Fernsehapparat, -e - телевизор
das Geld - деньги; плата (за ); средства
das Geschäft, -e - дело, занятие; сделка; магазин
das Haus, die Häuser - дом, здание, строение
der Haushalt, -e - домашнее хозяйство
der Herd, -e - очаг, плита
die Idee, die Ideen - идея; мысль; замысел; намерение
die Küche, -n - кухня
der Kugelschreiber, - - шариковая ручка
der Kühlschrank, -schränke - холодильник
das Regal, -e - полка; стеллаж
der Schrank, die Schränke - шкаф
die Steckdose, -n - штепсельная розетка
der Stecker, - - штепсель, вилка
der Stuhl, die Stühle - стул
der Tisch, -e - стол
der Topf, die Töpfe - горшок; кастрюля
die Uhr, -en - часы
das Waschbecken, - - умывальник; раковина
der Wert, -e - стоимость; ценность, значение
die Zeit - время
ähnlich - похожий; сходный; подобный
bequem - удобный; уютный
ehrlich - честный; порядочный
kaputt - разбитый; сломанный; разорванный; погибший
leer - пустой, порожний; незанятый, свободный
lustig - весёлый; радостный; забавный, смешной
originell - оригинальный, своеобразный; странный
sehr - очень, весьма; крайне
heute - сегодня
viel - много; многие; многое
oder - или
sondern - а, но
zu - к, на; в
alle sein, aus sein, raus sein - кончиться, выйти
raus - наружу
die Mikrowelle - Микроволновка
der Taschenrechner - микрокалькулятор
der Geschirrspüler - посудомоечная машина
das Becken - (умывальный) таз; чаша; раковина; бассейн
der Abfalleimer - мусорное ведро
der Bleistift, -e - карандаш
ordnen - приводить в порядок; систематизировать
der Beruf, -e - профессия; специальность
der Arzt, die Ärzte - врач; доктор
die Mine, -n - стержень с пастой; рудник; мина
die Taschenlampe, -n - карманный фонарь
die Spüle, -n - кухонная раковина
der Wasserhahn, -hähne - водопроводный кран
die Glühbirne, -n - лампа накаливания
die Spülmaschine, -n - (посудо)моечная машина; промывной аппарат
das Schubfach,-, die Schublade,- - выдвижной ящик
bestellen - уставлять ч.-л.; заказывать; доставлять
bezahlen - платить; выплачивать; расплачиваться (с)
brauchen - пользоваться (ч.-л.); нуждаться
erkennen - узнавать; (рас)познавать; обнаруживать
glauben - полагать, думать; верить
kochen - варить, готовить (пищу); стряпать; кипятить
mögen - любить; чувствовать расположение к
schmecken - иметь вкус, быть вкусным; пробовать (на вкус)
üben - упражняться
das Abendessen - ужин
die Anzeige, -n - объявление; заявление, уведомление
der Apfel, die Äpfel - яблоко
die Bohne, -n - фасоль
das Brot, -e - хлеб
das Brötchen, - - булочка, хлебец
die Butter - масло (животное)
die Dose, -n - коробка; консервная банка
das Ei, die Eier - яйцо
das Eis - лёд; мороженое
die Erdbeere, -n - земляника
die Flasche, -n - бутылка; фляжка
das Fleisch - мясо
die Frage, -n - вопрос
die Frucht, die Früchte - плод; фрукт
das Frühstück, -e - завтрак
die Gabel, -n - вилка
der Gasthof, die Gasthöfe - забегаловка; постоялый двор
das Gemüse - овощи, зелень
das Gericht, -e - блюдо, кушанье
das Gespräch, -e - разговор; беседа
das Getränk, -e - напиток; питьё
das Gewürz, -e - пряности; приправа
das Glas, die Gläser - стекло; стакан; рюмка
das Hähnchen - циплёнок
der Käse - сыр; творог
der Kuchen, - - пирог; пирожное; торт
der Löffel, - - ложка
das Mehl - мука
das Messer, - - нож
der Nachtisch, -e - десерт
das Öl, -e - масло (растительное)
der Pfeffer - перец
das Pfund - фунт (мера веса); полкило
der Preis, -e - цена
der Reis - рис
der Saft, die Säfte - сок; сироп
die Sahne - сливки
der Schinken, - - окорок; ветчина
die Soße, -n - соус, подливка
die Speisekarte, -n - меню; прейскурант блюд
das Steak, -s - антрекот; кусок жаркого
die Suppe, -n - суп; похлёбка
die Tasse, -n - чашка (чайная); чашка с блюдцем
der Teller, - - тарелка
die Tomate, -n - помидор
die Vorspeise, -n - закуска
die Wäsche - бельё; стирка
die Wurst, die Würste - колбаса
die Zwiebel, -n - лук; луковица
billig - дешёвый (некачественный)
günstig - дешёвый (качественный); благоприятный
bitter - горький
dunkel - тёмный; сумрачный; мрачный
eng - узкий; тесный
fett - жирный; тучный
frisch - свежий, неиспорченный
groß - большой; крупный
hell - светлый; ясный; яркий
hart - твёрдый; крепкий; грубый
hoch - высокий
kalt - холодный
lieber - охотнее, скорее; милее, дороже
mild - мягкий; добрый
nah - близкий; недалёкий; близлежащий
salzig - (слишком) солёный
sauer - кислый; кислотный
scharf - острый (о ноже); чёткий
schlank - стройный; гибкий; худощавый
stark - сильный; толстый; крепкий
süß - сладкий
trocken - сухой; высохший
typisch - типичный; типический
warm - тёплый
wichtig - важный
niedrig - низкий, невысокий; небольшой; низкий, невысокий
(un)gesund - полезный (вредный)
teuer - дорогой
bestehen aus D. - состоять из
etwas zu essen - что-то покушать
abends - вечером; по вечерам
besonders - особенно
danach - после этого; вслед за этим
fast - почти
ganz - целый, весь; совсем, вполне
genug - довольно, достаточно
manchmal - иногда, порой
mittags - в полдень; в обед
morgens - утром, по утрам
nachmittags - после обеда; пополудни
nur - только; лишь, всего
oben - вверху; наверху; сверху
oft - часто
so - так, таким образом
sofort - тотчас; немедленно
überall - везде; (по)всюду; повсеместно
unten - внизу
verschieden - разный; различный
vor allem - прежде всего
vorwiegend - преимущественно; главным образом
zuerst - сначала; сперва
alle - всё, каждый
als - когда; в то время как; как
doch - однако, но; всё-таки
jeder - каждый; всякий; любой
pro - по (количеству), на (гектар)
welcher - какой (именно); который
das Lehrwerk, -e - учебное пособие; учебник
der Ort, -e и Örter - место, населённый пункт, местность
meistens - большей частью; чаще всего
nie - никогда
selten - редко; редкостный
immer - всегда; постоянно; каждый раз
das Obst - фрукты; плоды
der Becher, = - кубок; чаша
das Kalb, die Kälber - телёнок; детёныш
der Ober, = - (старший) официант
getrennt - раздельно; отдельный
mehr - больше; более
die Lösung, -en - решение, разгадка; ослабление; разобщение
dick - толстый; густой; тучный
die Kiste, -n - ящик; сундук
das Spülmittel - моющее средство
die Nudeln - лапша
anfangen - начинать
anziehen - одевать, облачать (к.-л.); надевать (одежду)
aufhören - переставать; прекращаться
aufmachen - открывать, раскрывать
aufräumen - убирать, прибирать; делать уборку
aufstehen - вставать, подниматься
bedienen - прислуживать (к.-л.); обслуживать (машину); ухаживать (за...)
beschreiben - описывать (предмет, событие, ...)
besuchen - посещать, навещать
duschen - принимать душ
einkaufen - покупать, закупать
einladen - приглашать; грузить
feiern - праздновать
fernsehen - смотреть телепередачу
holen - приносить; приводить; привозить
mitbringen - приносить с собой; иметь при себе
mitkommen - идти вместе (с); сопровождать
rauchen - дымить(ся); курить
sehen - смотреть; глядеть
spazieren - прохаживаться, прогуливаться
stattfinden - состояться; иметь место; происходить
stören - мешать; беспокоить; нарушать
vergleichen - сравнивать; сопоставлять
vorhaben - иметь намерение; намереваться
zeichnen - рисовать; чертить
zuhören - слушать, прислушиваться
die Ansichtskarte, -n - открытка
der Ausflug, die Ausflüge - экскурсия, прогулка
der Bäcker, - - пекарь, булочник
das Buch, die Bücher - книга
der Donnerstag, -e - четверг
die Dusche, -n - душ
der Eintritt, -e - вход
das Essen - еда; трапеза
das Fieber - (повышенная) температура, жар; лихорадка, горячка
die Freizeit - досуг
die Frisörin, -nen - парикмахерша
der Gast, die Gäste - гость, гостья
der Gruß, die Grüße - привет, приветствие
der Juli - июль
das Kleid, -er - платье; одежда
das Krankenhaus, die Krankenhäuser - больница; лечебница
die Krankenschwester, -n - медсестра
die Mannschaft, -en - команда, экипаж
das Meer, -e - море; океан; большое озеро
der Mensch, -en - человек
der Mittag, -e - полдень
das Mittagessen, - - обед
der Samstag - суббота
der Satz, die Sätze - предложение, тезис
das Schild, -er - вывеска, табличка
das Schwimmbad, die Schwimmbäder - плавательный бассейн
der Sonnabend - суббота
das Sonnenbad, -bäder - солнечная ванна
der Sonntag - воскресенье
der Spaziergang, die Spaziergänge - прогулка, гулянье
die Uhrzeit, -en - время по часам
der Verband, die Verbände - повязка, бинт; союз, общество
das Viertel, = - четверть; квартал
der Vortrag, die Vorträge - доклад; лекция
die Wohnung, -en - квартира; жилище, жильё
die Zeitung, -en - газета
früh - ранний
geöffnet - открытый, разомкнутый
geschlossen - закрытый; замкнутый; сплочённый
herrlich - великолепный, прекрасный, замечательный
leise - тихий; едва слышный; едва заметный
lieb - милый, дорогой, любимый
nächst - самый близкий, ближайший
nett - милый; симпатичный; приятный; любезный
obligatorisch - обязательный
spät - поздний; запоздалый
verboten - запрещённый
eben - только что, сейчас; гладкий, ровный
morgen - завтра
selbst - сам; даже
vielleicht - может быть, возможно, пожалуй
also - итак, следовательно, значит
auf - (где?) на, в, по
bis - до
gegen - по направлению к, на, против; около
jemand - кто-нибудь; кто-то; некто
nach - в, на, к, за; спустя
von ... bis - от ... до, с ... до
wann - когда
wie lange - сколько времени?, как долго?
zwischen - между, среди
Betten machen - стелить постель
das nächste Mal - в следующий раз
frei haben - быть свободным (от работы)
leid tun - сожалеть
los sein - отвязаться; избавиться; отделаться
Lust haben - иметь желание, охоту
Pause machen - делать паузу
spät sein - опаздывать
anrufen - окликать; звонить (по телефону)
aussehen - выглядеть, иметь вид
baden - купать, мыть
bauen - строить, воздвигать, сооружать
einziehen - вдевать; въезжать; втягивать
gucken - глядеть, смотреть на
herstellen - изготовлять, производить
schauen - смотреть, глядеть (на); созерцать
suchen - искать, разыскивать
umziehen - переезжать, переехать
verbieten - запрещать, воспрещать
verdienen - заслуживать; зарабатывать
das Bad, die Bäder - ванна; купание
das Dach, die Dächer - крыша, кровля
das Ehepaar, -e - супружеская пара
das Einkommen, = - доход; заработок
das Erdgeschoss, -e - первый этаж дома, нижний этаж дома
die Erlaubnis - разрешение, позволение
das Fenster, = - окно
der Flur, -e - коридор, прихожая
der Fußboden, die Fußböden - пол
die Garage, -n - гараж
der Garten, die Gärten - сад; огород
das Glück - счастье; благополучие; удача, успех
das Hochhaus, die Hochhäuser - высотное здание, многоэтажный дом
der Hof, die Höfe - двор (при доме)
die Insel, -n - остров; островок
der Keller, = - погреб, подвал
der Krach, -e - треск, грохот; помеха; скандал
der Lärm - (сильный) шум; гам; тревога
das Leben, = - жизнь, существование
der Mietvertrag, -träge - договор о найме
der Nachbar, -n - сосед
der Raum, die Räume - пространство; помещение
das Reisebüro, -s - бюро путешествий
die Rezeption - заимствование; стол регистрации
die Ruhe - покой, отдых
das Schlafzimmer, = - спальня
der Schreibtisch, -e - письменный стол
der Sessel, = - кресло
die Sonne, -n - солнце
der Stock, die Stöcke - этаж; палка
der Strand, -e - пляж
der Streit, -e - спор; ссора
die Streitigkeit, -en - ссоры, пререкания; распри
die Telefonzelle, -n - телефонная будка
der Teppich, -e - ковёр
die Toilette, -en - туалет
der Urlaub, -e - отпуск
das Urteil, -e - суждение; мнение
der Vermieter, = - домовладелец; наймодатель
der Vogel, die Vögel - птица; птицы (Aves)
der Wagen, = - автомобиль
der Wald, die Wälder - лес
die Ware, -n - товар
die Wiese, -n - луг
die Woche, -n - неделя
das Wohnzimmer, = - жилая комната
das Zimmer, = - комната; кабинет
direkt - прямой; непосредственный
fest - твёрдый; прочный
glücklich - счастливый; благополучный; удачный
häßlich - некрасивый, безобразный, отталкивающий
ruhig - спокойный, выдержанный
sauber - чистый; опрятный
schlecht - плохой, скверный, дурной
willkommen - желанный; приятный
zufrieden - довольный, удовлетворённый
bald - вскоре; скоро
draußen - снаружи, на дворе, на улице
eigentlich - собственно (говоря); в сущности
endlich - наконец, в конце концов
nachts - ночью, по ночам
sogar - даже
vorher - раньше, прежде; заранее
ziemlich - порядочно; довольно; примерно, приблизительно
ab - от, из, с
an - около, возле
beide - оба, обе
beides - и то и другое
gar nicht - вовсе не
niemand - никто
ohne - без, кроме
trotzdem - несмотря на это
unser - наш, свой
Was für? - Что за?
zu (mit Adjektiv) - слишком
Platz haben - садиться
Ruhe finden - найти покой
zu Hause - дома
aufwachen - просыпаться, пробуждаться
bedeuten - значить, означать; иметь значение
dauern - длиться, продолжаться; вызывать жалость; длиться, продолжаться
einpacken - укладывать, складывать; заворачивать
einschlafen - засыпать, уснуть; угасать
hinfallen - падать, упасть (на землю)
klingeln - звонить
mitnehmen - забрать с собой
passieren - случаться, происходить; проходить (мимо)
Recht haben - иметь право
wehtun - причинять боль
die Angst, die Ängste - страх; тоска; тревога
die Apotheke, -n - аптека
das Auge, -n - глаз; око
der Bahnhof, die Bahnhöfe - ж/д станция, вокзал
der Bauch, -e - живот; желудок; пузо
das Bein, -e - нога
die Brust, die Brüste - грудь
das Drittel, = - треть, третья часть
die Drogerie, -rien - аптекарский магазин
die Erkaltung, -en - остывание, охлаждение
der Fuß, die Füße - стопа
die Geschichte, -n - история
die Gesundheit - здоровье
das Grad, -e - градус; балл; степень
der Zettel, - - листок бумаги; бумажка
die Grippe, -n - грипп
der Hals, die Hälse - шея, горло
die Hand, die Hände - рука, кисть (руки)
der Handschuh, -e - перчатка
der Husten - кашель
das Knie, = - колено
der Koffer, = - чемодан; сундук; багажник
der Kollege, -n / die Kollegin, -nen - коллега, сотрудник, сослуживец
der Kopf, die Köpfe - голова; голова
der Krankenschein, -e - больничный листок
die Krankheit, -en - болезнь, недуг; недомогание
das Licht, -er - свет, освещение (мн. огни)
die Luft, die Lüfte - воздух; ветер, дуновение; сквозняк
der Magen, = - желудок; живот
das Medikament, -e - медикамент, лекарство
der Mund, die Münde и die Münder - рот; уста
die Mütze, -n - шапка, кепка
die Nacht, die Nächte - ночь; тьма
die Nase, -n - нос
das Papier, -e - бумага; документ
die Pflanze, -n - растение
das Pflaster, = - пластырь
r Rat, e Räte / r Ratschlag, e Ratschläge - совет(-ник)
der Rücken, = - спина
der Schmerz, -en - боль, страдание; горе, печаль
der Schnupfen, = - насморк
das Spiel, -e - игра; развлечение
die Sprechstunde, -n - приёмное время
der Tip, -s - подсказка, намёк; совет; предсказание
der Tropfen, = - капля
das Verbandzeug - перевязочный материал
die Verstopfung, -en - закупорка; затор; запор
der Wecker, = - будильник, звонок
das Wochenende, -n - конец недели
der Zahn, die Zähne - зуб
arm - бедный; неимущий
erkältet - простуженный
gebrochen - ломанный; дробленный; разбитый
gefährlich - опасный
gesund - здоровый; крепкий
gleich - равный, одинаковый; подобный; немедленно
heiß - жаркий; горячий
krank - больной
kühl - прохладный, свежий
müde - усталый, утомлённый
nervös - нервный; раздражительный
reich - богатый; обильный; щедрый
schlimm - плохой, дурной; больной (орган)
schwer - тяжёлый; массивный
vorsichtig - осторожный, предусмотрительный
bestimmt - определённо, точно
bloß - только (что), лишь, как раз; голый
einmal - однажды, во-первых, однократно
genau - точно; ровно; подробно
häufig - частый; часто, зачастую
höchstens - самое большее; не более как; в крайнем случае
lange - долго, долгое время
plötzlich - вдруг, внезапно, неожиданно
täglich - ежедневно; повседневный
wirklich - действительно, в самом деле; настоящий; реальный
ander - другой; иной; следующий
so viel - сколько, столько
über - (где?) над, поверх, по
ein bisschen - немного
der Sport treiben - заниматься спортом
abfahren - отъезжать; уезжать; отправляться
abholen - заходить, заезжать, приходить (за)
abstellen - отставить; откомандировать; выключать
ansehen - осматривать, рассматривать
anstellen - приставлять; придвигать; включать
ausmachen - тушить, гасить; договариваться; значить
aussteigen - сходить, высаживаться; выходить
ausziehen - вытягивать; выдвигать (ящик стола); снимать (одежду, обувь); выселяться
einsteigen - входить, садиться (в вагон,...)
fallen - падать; спускаться
geben - давать; вручать; предоставлять
gewinnen - (von D) выигрывать (у)
gießen - лить, наливать
heiraten - жениться (на); выходить замуж (за)
kennen lernen - (по)знакомиться с кем-либо / чем-либо
kündigen - отменять, расторгать; увольнять
malen - (на)рисовать; разрисовывать; красить
merken - замечать; ощущать; воспринимать
operieren - оперировать
parken - стоять на стоянке; парковать
putzen - чистить; наряжать
rufen - кричать, звать
sitzen - сидеть
telefonieren - звонить, говорить по телефону
überlegen - класть; положить (поверх); накинуть (платок...)
vorbeikommen - проходить мимо; зайти к
wecken - (раз)будить
wegfahren - уезжать; увозить
die Adresse, -n - адрес
der April, -e - апрель
der August, -e - август
die Autobahn - автострада
die Bank, die Bänke - скамья; прилавок; отмель; банк
der Bericht, -e - доклад; отчёт; корреспонденция
der Besuch, -e - посещение; визит; гость
der Blume, -n - цветок
der Boden, die Böden и = - земля; почва; основа
der Brief, -e - письмо; послание
das Büro, -s - бюро, контора; учреждение
die Decke, -n - покров (любой)
der Dezember, = - декабрь
die Farbe, -n - цвет, краска
der Februar, -e - февраль
der Freund, -e / die Freundin, -nen - друг, приятель(ница)
die Haltestelle, -n - остановка; стоянка, станция
der Handwerker, = - ремесленник; мастеровой
die Heizung, -en - отопление; разогрев
die Jacke, -n - куртка, кофта
der Januar, -e - январь
der Juni, -s - июнь
die Katze, -n - кошка
der Kindergarten, -gärten - детский сад
der Knopf, die Knöpfe - пуговица
das Loch, die Löcher - дыра, отверстие; пролом; скважина
der Mai, -e - май
der Maler, = - художник, живописец
der Mann, die Männer - мужчина
der März, -e - март
die Möglichkeit, -en - возможность; вариант; шанс
der November, = - ноябрь
der Oktober - октябрь
der Parkplatz, die Parkplätze - стоянка
das Pech - смола; неудача, невезение
die Polizei - полиция
der Polizist, -en / die Polizistin, -nen - полицейский
die Prüfung, -en - испытание, проверка; экзамен; исследование
die Reise, -n - поездка, путешествие; рейс
die Sache, -n - вещь, предмет; pl. одежда
die Schule, -n - школа
der September, = - сентябрь
die Stadt, die Städte - город
das Theater, = - театр; спектакль
die Treppe, -n - лестница
die Tür, -en - дверь; дверца
der Unfall, die Unfälle - несчастный случай; авария
der Vater, die Väter - отец
die Wand, die Wände - стена; перегородка
die Welt, -en - мир, вселенная
falsch - ошибочный; искусственный, поддельный
schrecklich - ужасный, страшный, отвратительный
still - тихий, спокойный; неподвижный; безмолвный
allein - самостоятельно; исключительно; единственно; однако (же)
auf einmal - вдруг, сразу, одновременно
außerdem - кроме того, сверх того
diesmal - на этот раз, в этот раз
einfach - просто; прямо-таки; однократный
gerade - прямо(й); откровенно; именно, как раз
gestern - вчера
letzt - последний; крайний, конечный
selbstverständlich - само собой разумеется, естественный
wieder - опять, снова, вновь
wohl - пожалуй, вероятно, может быть
der Ausdruck, -drücke - выражение, проявление
Besuch haben - принимать гостей
Bis bald! - До скорого!
da sein - присутствовать (находиться на месте)
ein paar - несколько; два-три
klar - ясный, прозрачный; светлый; готовый
verabredet - как было условлено; условный
weg sien - отсутствовать; исчезнуть; быть без сознания
alles - всё
das Wort, die Wörter (1) / die Worte (высказ.) - слово; высказывание
der Freitag, -e - пятница
der Montag, -e - понедельник
der Mittwoch, -e - среда (день недели)
der Frisör или der Friseur, -e - парикмахер
der Kellner, - - официант
das Kind, -er - ребёнок, дитя
der Kurs, -e - курс
das Land, die Länder - страна, земля
die Leute - люди; народ
der Name, -n - имя
der Sekretär, -e - секретарь
die Straße, -n - улица; дорога; шоссе
der Student, -en - студент
der Tag, -e - день; сутки
der Vorname - имя (в отличие от фамилии)
unbedingt - безусловно, непременно; безоговорочный
das Fahrrad, die Fahrräder - велосипед
die Miete, -n - наём; прокат; аренда
das geht nicht! - это не выйдет; это невозможно!; это недопустимо; так нельзя
es tut mir leid - мне жаль; я сожалею
Na klar! - Ясно!
noch nicht - ещё нет
kann sein - может быть, возможно
die Veranstaltung, -en - мероприятие; празднество
das Geschirr, -e - посуда; утварь; посудина
der Schnee - снег
wenig - мало; немногие
schade - жаль, досадно; прискорбно
buchen - (по)отмечать; бронировать
der Dienstag, -e - вторник
das Kochfeld - Верхняя панель эл.плиты
das Feld, -er - поле
tschüs - пока!
vorbereiten - подготавливать
entscheiden - решать
die Bäckerei, -en - (хлебо)пекарня; булочная
das Waschmittel - моющее средство
toll - бешеный; безумный; чумовой
herzlich - сердечный, душевный; искренний
der Aufzug, die Aufzüge - лифт; шествие, процессия
das Sonderangebot - распродажа товаров (по сниженным ценам)
außerhalb - вне, за, снаружи
die Verkehrsverbindung - транспортное сообщение
der Supermarket, -s - супермаркет
die Marmelade, -n - мармелад, повидло; джем; варенье
die Taufe, -n - крещение; крестины
die Tante, -n - тётя
weiter - дальнейший; дальше, далее
besorgen - опасаться (ч.-л.); заботиться (о к-л, о ч-л); доставать, заготовлять
einzahlen - платить, вносить (деньги)
erledigen - доделать, закончить; выполнять, исполнять; покончить, разделаться (с)
existieren - существовать, быть; жить
fehlen - отсутствовать; недоставать, не хватать
fliegen - летать, лететь
legen - класть, положить, укладывать
reinigen - чистить, очищать; убирать (помещение)
reparieren - чинить, ремонтировать; восстанавливать
stehen - стоять (находиться в вертикальном положении)
stellen - ставить, поставить; помещать; устанавливать
übernachten - (пере)ночевать
verwenden - употреблять, использовать, применять
ziehen - тянуть (за собой), тащить; таскать; дёргать
zurückgeben - возвращать, вернуть; отдавать
die Abfahrt, -en - отъезд, отправление; старт; съезд (с автострады)
die Auskunft, die Auskünfte - справка; сведения, информация (в ответ на запрос)
die Bahn, -en - путь, дорога; трасса; орбита, траектория
die Briefmarke, -n - почтовая марка
die Buchhandlung, -en - книжный магазин
der Bürger, = - гражданин
der Bus, -se - автобус; магистраль, шина
das Denkmal, die Denkmäler - памятник
das Ding, -e - вещь, предмет; дело, обстоятельство
die/der Erwachsene, -n - взрослый, взрослая
das Europa, -s - Европа
die Fahrkarte, -n - (проездной) билет
der Fahrplan, die Fahrpläne - расписание, [график] движения
die Fahrt, -en - плавание, рейс; поездка; путешествие
die Fantasie, die Fantasien - фантазия
der Flughafen, die Flughäfen - аэропорт, аэродром
das Flugzeug, -e - самолёт
die Freiheit, -en - свобода, воля; вольность; льгота
das Gebäude, = - здание, строение, сооружение
die Grenze, -n - граница, рубеж, предел
das Interesse, -n - интерес, участие
der Journalist, -en - журналист; работник печати
die/der Jugendliche, -n - подросток; юноша, девушка
die Kirche, -n - церковь
die Kleidung, -en - одежда, платье
der Krieg, -e - война, военные действия
der Künstler, = - художник; артист; деятель искусства
der Mantel, die Mäntel - пальто; плащ
die Mauer, -n - стена [ограда] (каменная)
die Metzgerei, -en - бойня; мясная лавка; убой скота
die Mitte, -n - середина; центр
das Museum, die Museen - музей; научный журнал
der Norden - север (без артикля - направление, с опр. артиклем - территория)
die Oper, -n - опера; оперный спектакль
der Osten - восток; восточная сторона
das Paket, -e - пакет; посылка
der Park, -s - парк
der Pass, die Pässe - (заграничный) паспорт
der Platz, die Plätze - место
die Post, -en - почта; почтовое отделение; почтамт
der Punk, -s - панк
das Rathaus, die Rathäuser - ратуша
die Reinigung, -en - чистка, очистка, уборка
der Rest, -e - остаток, оставшаяся часть
der Schalter, = - (задвижное) окошко; касса; форточка; переключатель
der Soldat, -en - солдат, военнослужащий
der Stadtplan, die Stadtpläne - план города
der Süden - юг
die Tasche, -n - карман; портфель; сумка
der Teil, -e - часть, доля; элемент
das Tor, -e - ворота
der Turm, die Türme - башня; вышка
die Universität, -en - университет
die Wahl, -en - выбор
der Weg, -e - дорога, путь; тропа
der Westen - запад
das Zentrum, die Zentren - центр
arbeitslos - безработный
berühmt - знаменитый, известный
bunt - пёстрый; цветной; разноцветный
deutsch - немецкий, германский
früher - более ранний; прежний; пораньше
grau - серый; серый
sozial - социальный, общественный
voll - полный; заполненный, наполненный
anders - иной, другой; иначе
geradeaus - прямо, напрямик
links - слева; налево, влево
rechts - справа, направо; вправо, правее
völlig - полностью, совершенно; полный
bis zu - до
so ... wie ... - такой же, как
über ... nach ... - через ... в ...
von ... nach ... - из ... в ...
zum Schluß - напоследок, в заключение; наконец
wogegen - против чего; в то время как
die Sauna, = и -s - (финская) баня; парная
schicken - посылать, отправлять
das Feuer, = - огонь; пламя
das Klavier, die Klaviere - рояль; пианино; фортепьяно
die Neuigkeit, die Neuigkeiten - новость
der See, die Seen - озеро
die See, die Seen - море; волнение
die Tante, die Tanten - тётя
der Traum, die Träume - сновидение; сон; мечта
die Blume, die Blumen - цветок
behalten - оставлять, удерживать, сохранять; помнить, запоминать
beraten - помогать советами, советовать; советоваться, совещаться (о чём-л - über A)
einschalten - вставлять; включать
erklären - объяснять, толковать; заявлять, провозглашать; признавать, считать (чем-л - für A)
freuen - радовать
gebrauchen - употреблять (что-л), пользоваться (чем-л)
gefallen - нравиться, быть по вкусу
laufen - бегать, бежать
lieben - любить
reichen - подавать, протягивать; быть достаточным, хватать; доставать (до чего-л - bis an A)
schenken - (по)дарить
tragen - носить, нести
verlassen - оставлять, покидать
zeigen - показывать (на к-л - auf A)
zusammengehören - быть связанным друг с другом; подходить друг к другу; составлять одно целое
der Abschnitt, der Abschnitte - отрезок, участок; район, период
r/e/s Bekannte, die Bekannten (ein Bekannter) - знакомый, знакомая, известное
die Beschäftigung, die Beschäftigungen - занятие, работа, деятельность
das Camping, = - кемпинг (лагерная стоянка автотуристов)
die Chance, die Chancen - шанс, возможность, вероятность (успеха)
die Erinnerung, -en (an A) - воспоминание, память (о ком-л, о чём-л)
die Feier, die Feiern - празднество; торжество; празднование
der Fernseher, = - телезритель, телевизор
das Feuerzeug, die Feuerzeuge - зажигалка
der Führerschein, die Führerscheine - удостоверение на право управления, вождения
der Geburtstag, die Geburtstage - день рождения
der Gegenstand, die Gegenstände - предмет, вещь, объект
das Gerät, die Geräte - прибор, аппарат; инструмент
die Großstadt, die Großstädte - большой город, крупный центр
die Handtasche, die Handtaschen - (дамская) сумка
die Hilfe, die Hilfen - помощь, поддержка
das Holz, die Hölzer - дерево (материал); древесина, лесоматериал; дрова, лес
das Huhn, die Hühner - курица
der Hund, die Hunde - собака; пёс
die Information, die Informationen - информация; сведения, инструктаж
der Ingenieur, -e / die Ingenieurin, -nen - инженер; техник (со специальным образованием)
die Kette, die Ketten - цепь; ожерелье, цепочка
das Klima, -s и .. mate - климат
der König, die Könige - король, царь, вождь
die Kuh, die Kühe - корова
die Kunde, die Kunden - известие, весть
der Kunde, die Kunden - покупатель, клиент
das Möbel, die Möbel - мебель (большей частью pl.)
das Mótorrad, die Motorräder - мотоцикл, мотоциклет
die Party, die Partys - вечеринка; компания
die Pfeife, die Pfeifen - свисток; дудка; трубка
das Pferd, die Pferde - лошадь; конь
die Platte, die Platten - блюдо, пластина; лист, поднос
der Plattenspieler, = - проигрыватель; патефон
das Rad, die Räder - велосипед, колесо; ротор, диск
der Reiseführer, = - путеводитель; экскурсовод, проводник
der Ring, die Ringe - кольцо, круг; обойма, обруч
die Schallplatte, die Schallplatten - граммофонная пластинка, грампластинка
der Schlafsack, die Schlafsäcke - спальный мешок
der Schluss - окончание, завершение; вывод, заключение
der Schmuck, die Schmucke - украшение, наряд (pl.-редко)
die Schreibmaschine, -n - пишущая машинка
der Strom, die Ströme - многоводная река; поток, течение; ток
das Tier, die Tiere - животное; зверь
der Verkäufer, = / die Verkäuferin, -nen - продавец/продавщица
das Werkzeug, die Werkzeuge - инструмент, орудие; режущий инструмент
(s) Weihnachten - рождество
der Wunsch, die Wünsche - желание; пожелание
das Zelt, die Zelte - палатка, шатёр, шалаш
das Wörterbuch, die Wörterbücher - словарь
breit - широкий, обширный
dünn - тонкий, худой
kurz - короткий
lang - длинный, долгий
langsam - (за)медленный, неторопливый (о движении)
lebendig - живой, оживлённый
richtig - правильный, верный; подходящий, соответствующий
schmal - узкий, худой
wunderbar - чудесный, поразительный, удивительный
irgendwann - когда-нибудь, когда-либо, когда-то
deshalb - поэтому, потому
selber - сам, сама, само, сами
zu Ende - до конца
aufpassen - быть внимательным; присматривать за (к-л - auf A); подстерегать (к-л - D)
berichten - (über A) сообщать, докладывать что-л; поучать в чём-л (G)
besichtigen - осматривать
bestehen - выдержать, преодолеть; настаивать (на ч-л - auf D)
erfinden - изобретать, придумывать
fließen - течь, литься; струиться, таять
gehören - принадлежать кому-л; принадлежать, относиться (к чему-л - zu D)
wachsen - расти; произрастать
wählen - выбирать
wandern - путешествовать (пешком); странствовать, бродить; заниматься туризмом
der Anfang, die Anfänge - начало
das Ausland - заграница; зарубежные страны
der Bach, die Bäche - ручей, поток; источник
der Bau - строительство; строительные работы
der Beamte(r), -n и -ein / die Beamtin, -nen - гос. служащий; должностное лицо, чиновник
der Berg, die Berge - гора
die Brücke, die Brücken - мост
das Datum, die Daten и Data - дата, (календарное) число
das Elektrogerät, -e - электроприбор
der Dialekt, die Dialekte - диалект, наречие
die Firma, die Firmen - фирма
der Fluss, die Flüsse - река
das Gasthaus, die Gasthäuser - гостиница
das Gebiet, die Gebiete - территория, район; область, округ
der Hafen, die Häfen - порт, гавань
das Jahrhundert, -e - столетие, век; эра, эпоха
die Kneipe, die Kneipen - пивная, трактир, кабак
die Küste, die Küsten - морской берег; побережье, взморье
Lebensmittel - pl. продовольствие, продукты питания
das Mal, die Male и Mäler - пятно, знак, метка; родимое пятно, родинка; монумент, памятник
der Meter, = - метр
der Minister, = / die Ministerin, -nen - министр
die Nation, die Nationen - нация, народ, страна
die Pension, die Pensionen - пенсия, пансион
der Politiker, = - политик, политический деятель
der Schauspieler, = / die Schauspielerin, -nen - актёр, актриса
der Schriftsteller, = / die Schriftstellerin, nen - писатель
die Sehenswürdigkeit, -en - достопримечательность
der Sitz, die Sitze - сиденье; место, местопребывание
die Sprache, die Sprachen - язык, речь
der Staat, die Staaten - государство, держава
das Studium, ..dien - изучение, учёба, занятия
der Tod, -e - смерть
der Tourist, -en / die Touristin, -nen - турист, туристка
das Werk, die Werke - дело, труд, работа
blau - синий, лазурный
endgültig - окончательный
international - международный
fertig - готовый
offiziell - служебный; должностной
tief - глубокий
damals - тогда, в то время
daher - оттуда, туда
darin - в этом [том, нём], там
der Vorhang, die Vorhänge - занавес; шторы
der Frühling, -e - весна
der Sommer, = - лето
der Herbst, -e - осень
der Winter, = - зима
die Erholung, -en - отдых; поправка
der Spiegel, = - зеркало, рефлектор
das Fensterbrett - подоконник
gelb - жёлтый
weiß - белый
lila - лиловый, сиреневый
der Neffe, -n - племянник
die Nichte, -n - племянница
der Onkel, = - дядя
der Opa, -s - дедушка
die Oma, -s - бабушка
das Geschwister, = - братья и сестры; брат и сестра
der Vetter, -n - двоюродный брат, кузен
die Cousine, -n - двоюродная сестра, кузина
das Gesicht, die Gesichter - лицо
das Ohr, die Ohren - ухо, ушная раковина
das Auge, die Augen - глаз
die Nase, die Nasen - нос
die Stirn, die Stirnen - лоб
der Mund, -e, Münde и Münder - рот
die Lippe, die Lippen - губа
das Kinn, die Kinne - подбородок
das Haar, die Haare - волос; волосы
die Wimper, -n - ресница
die Braue, die Brauen - бровь
die Wange, die Wangen - щека
die Erde, die Erden - земля
die Welt, die Welten - мир
der Weltraum - вселенная, космос
die Nachricht, die Nachrichten - весть, известие; сообщение, уведомление
das Schicksal, die Schicksale - судьба, участь, доля
der Haß (gegen A, auf A) - ненависть (к кому-л)
die Liebe - любовь; привязанность
das Wetter, = - погода
der Regen, = - дождь
der Hagel - град
der Nebel - туман, мгла
die Sonne, die Sonnen - солнце
die Wolke, die Wolken - облако; туча
das Gewitter, = - гроза
der Donner, = - гром
der Blitz, die Blitze - молния
das Glatteis - гололедица, гололёд
wissen - знать что-л
kennen - знать, быть знакомым
der Zug, die Züge - поезд
''';

  String dic3 = '''
Да - [Уи] Oui
Нет - [Нон] Non
Спасибо (большое спасибо) - [Мерси (мерси боку)] Merci (merci beaucoup)
Пожалуйста (ответ на спасибо) - [Жё вузан при.] Je vous en prie.
Не за что - [До рьен] De rien
Пожалуйста (просьба) - [Силь ву плэ] S’il vous plaît
Извините - [Пардон / экскюзе муа] Pardon / excusez-moi
Здравствуйте - [Бонжур] Bonjour
До свидания - [О ревуар] Au revoir
Пока - [А бьенто] A bientôt
Я не понимаю. - [Жё нё компран па] Je ne comprends pas.
Вы говорите … по-русски? - [Парле-ву … рюс?] Parlez-vous … russe ?
…по-английски? - […англэ?] …anglais ?
…по-французски? - […франсэ?] …français ?
Я не говорю … по-французски. - [Жё нё парль па … франсэ.] Je ne parle pas … français.
Господин, госпожа… - [Мёсьё, мадам…] Monsieur, madame…
Помедленнее,пожалуйста. - [Плю лянтман,силь ву плэ.] Plus lentement,s’il vous plaît.
Помогите мне, пожалуйста. - [Эдэ-муа, силь ву плэ.] Aidez-moi, s’il vous plaît.
Мне нужно… - [Жэ бёзуэн до] J’ai besoin de…
[Коман вузапле ву?] Comment vous appelez-vous? - Как вас зовут?
Меня зовут… - [Жё мапель…] Je m’appelle …
Очень приятно! - [Аншантэ!] Enchanté !
Как у вас дела? - [Коман тале ву?] Comment allez-vous ?
Хорошо. - [Бьен / бон / са ва] Bien / bon / ça va
Так себе. - [Ком си ком са.] Comme ci comme ça.
Это мой / моя… - [Сэ мон / ма…] C’est mon / ma …
…жена. - […фам.] …femme.
…муж. - […мари.] …mari.
…дочь. - […фий.] …fille.
…сын. - […фис.] …fils.
…мать / мама. - […мэр / маман.] …mère / maman.
…отец / папа. - […пэр / папа.] …père / papa.
..друг / подруга. - […ами / ами.] …ami / amie.
Я из России. - [Жё вьен де Рюси.] Je viens de Russie.
Мы из России. - [Ну венон де Рюси.] Nous venons de Russie.
Где находится…? - [У сё трув…?] Où se trouve… ?
Отель - [Лётэль] L’hôtel
Ресторан - [Лё рэсторан] Le restaurant
Магазин - [Лё магазэн] Le magasin
Музей - [Лё мюзе] Le musée
Улица - [Ля рю] La rue
Площадь - [Ля пляс] La place
Аэропорт - [Ляэропор] L’aéroport
Вокзал жд - [Ля гар] La gare
Автовокзал - [Ля гар рутьер] La gare routière
Остановка - [Лярэ] L’arrêt
Автобус - [Лё бюс] Le bus
Трамвай - [Лё трам] Le tram
Поезд - [Лё трэн] Le train
Самолет - [Лявьон] L’avion
Метро - [Лё метро] Le métro
Такси - [Лё такси] Le taxi
Автомобиль - [Ля вуатюр] La voiture
Отправление - [Лё дэпар] Le départ
Прибытие - [Ляривэ] L’arrivée
Билет - [Лё бийе] Le billet
Сколько стоит билет? - [Кэль э лё при дон бийе?] Quel est le prix d’un billet ?
Налево - [А гош] A gauche
Направо - [А друат] A droite
Прямо - [Ту друа] Tout droit
Где находятся туалеты? - [У сон ле туалет?] Où sont les toilettes ?
Сколько это стоит? - [Комбьен са кут?] Combien ça coûte ?
Какова цена? - [Кэль э лё при?] Quel est le prix ?
Я хотел(а) бы купить / заказать… - [Жё вудрэ аштэ / командэ…] Je voudrais acheter / commander…
У вас есть…? - [Аве ву?] Avez-vous… ?
Я это беру. - [Жё лё пран.] Je le prends.
Вы принимаете кредитные карты? - [Аксепте ву ле карт до креди?] Acceptez-vous les cartes de crédit ?
Открыто - [Увер] Ouvert
Закрыто - [ферме] Fermé
Завтрак - [Лё пти дежёне] Le petit déjeuner
Обед - [Лё дежёне] Le déjeuner
Ужин - [Лё дине] Le dîner
Счет, пожалуйста. - [Лядисьон, силь ву плэ.] L’addition, s’il vous plaît.
Хлеб - [Дю пэн] Du pain
Кофе - [Дю кафе] Du café
Чай - [Дю тэ] Du thé
Сок - [Дю жю] Du jus
Вода - [До лё] De l’eau
Пиво - [До ля бьер] De la bière
Вино - [Дю вэн] Du vin
Соль - [Дю сэль] Du sel
Перец - [Дю пуавр] Du poivre
Мясо - [До ля вьянд] De la viande
Говядина - [Дю бёф] Du boeuf
Свинина - [Дю пор] Du porc
Рыба - [Дю пуасон] Du poisson
Птица - [До ля волай] De la volaille
Овощи - [Дэ легюм] Des légumes
Фрукты - [Дэ фрюи] Des fruits
Картошка - [Дэ пом до тэр] Des pommes de terre
Мороженое - [Юн гляс] Une glace
1 — один,одна - [эн, юн] un , une
2 — два, две - [дё] deux
3 — три - [труа'] trois
4 — четыре - [катр] quatre
5 — пять - [сэнк] cinq
6 — шесть - [сис] six
7 — семь - [сэт] sept
8 — восемь - [юи'т] huit
9 — девять - [нёф] neuf
10 — десять - [дис] dix
11 — одиннадцать - [онз] onze
12 — двенадцать - [дуз] douze
13 — тринадцать - [трэз] treize
14 — четырнадцать - [като'рз] quatorze
15 — пятнадцать - [кэнз] quinze
16 — шестнадцать - [сэз] seize
17 — семнадцать - [дис-сэт] dix-sept
18 — восемнадцать - [диз-юи'т] dix-huit
19 — девятнадцать - [диз-нёф] dix-neuf
20 — двадцать - [вэн] vingt
21 — двадцать один - [вэн-т-э-эн (юн)] vingt-et-un (une)
22 — двадцать два - [вэн-дё] vingt-deux
23 — двадцать три - [вэн-труа'] vingt-trois
30 — тридцать - [трант] trente
31 — тридцать один - [тран-тэ-эн] trente et un
32 — тридцать два - [трант-дё] trente-deux
40 — сорок - [кара'нт] quarante
41 — сорок один - [каран-тэ-эн] quarante et un
42 — сорок два - [карант-дё] quarante-deux
50 — пятьдесят - [сэнка'нт] cinquante
51 — пятьдесят один - [сэнка'н-тэ-эн] cinquante et un
52 — пятьдесят два - [сэнкант-дё] cinquante-deux
60 — шестьдесят - [суаса'нт] soixante
61 — шестьдесят один - [суаса'н-тэ-эн] soixante et un
62 — шестьдесят два - [суаса'нт-дё] soixante deux
70 — семьдесят - [суаса'нт-ди'с] soixante-dix
71 — семьдесят один - [суаса'нт-о'нз] soixante et onze
72 — семьдесят два - [суаса'нт-ду'з] soixante-douze
80 — восемьдесят - [катрё-вэн] quatre-vingts
81 — восемьдесят один - [катрё-вэн-тэ-эн] quatre-vingt et un
82 — восемьдесят два - [катрё-вэн-дё] quatre-vingt-deux
90 — девяносто - [катрё-вэн-дис] quatre-vingt-dix
91 — девяносто один - [катрё-вэн-то'нз] quatre-vingt-onze
92 — девяносто два - [катрё-вэн-ду'з] quatre-vingt-douze
100 —сто - [сан] cent
101 — сто один - [сантэн] cent un
102 — сто два - [сан дё] cent deux
110 — сто десять - [сан дис] cent dix
120 — сто двадцать - [сан вэн] cent vingt
170 — сто семьдесят - [сан суаса'нт-дис] cent soixante-dix
175 — сто семьдесят пять - [сан суаса'нт-кэнз] cent soixante-quinze
178 — сто семьдесят восемь - [сан суаса'нт-диз-юи'т] cent soixante-dix-huit
180 — сто восемьдесят - [сан катрё-вэн] cent quatre-vingts
186 — сто восемьдесят шесть - [сан катрё-вэн сие] cent quatre-vingts six
190 — сто девяносто - [сан катрё-вэн-дис] cent quatre-vingt-dix
197 — сто девяносто семь - [сан катрё-вэн-дис-еэт] cent quatre-vingt-dix-sept
200 — двести - [дё сан] deux cents
201 — двести один - [дё сан-тэн] deux cent un
202 — двести два - [дё сан дё] deux cent deux
300 — триста - [труа сан] trois cents
400 — четыреста - [катрё са'н] quatre cents
500 — пятьсот - [сэнк са'н] cinq cents
600 — шестьсот - [си са'н] six cents
700 — семьсот - [сэт са'н] sept cents
800 — восемьсот - [юи са'н] huit cents
900 — девятьсот - [нёф са'н] neuf cents
1000 — тысяча - [миль] mille
2000 — две тысячи - [дё миль] deux mille
1 000 000 — миллион - [эн мильо'н] un million
1 000 000 000 — миллиард - [эн мильяр] un milliard
''';
}
