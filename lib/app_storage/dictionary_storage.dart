import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class DictionaryStorage {
  final box = GetStorage();
  final LineSplitter lineSplitter = const LineSplitter();

  int get readLastCreatedDicIndex => box.read('lastCreatedDicIndex') ?? 3;
  void writeLastCreatedDicIndex(int value) => box.write('lastCreatedDicIndex', value);

  String get readLastOpenedDic => box.read('lastOpenedDic') ?? 'dic_1';
  void writeLastOpenedDic(String value) => box.write('lastOpenedDic', value);

  List<Map<String, dynamic>> get readAvailableDics => List<Map<String, dynamic>>.from(box.read('availableDics') ??
      [
        {
          'storageName': 'dic_1',
          'humanName': 'En-Ru TOP',
        },
        {
          'storageName': 'dic_2',
          'humanName': 'De-Ru TOP',
        },
        {
          'storageName': 'dic_3',
          'humanName': 'Fr-Ru TOP',
        },
      ]);
  void writeAvailableDics(List<Map<String, dynamic>> value) => box.write('availableDics', value);

  int readFirstElementForDictionary(String dicKey) => box.read('${dicKey}_firstElement') ?? 0;
  void writeFirstElementForDictionary(String dicKey, int value) => box.write('${dicKey}_firstElement', value);
  void deleteFirstElementForDictionary(String dicKey) => box.remove('${dicKey}_firstElement');

  Map<String, String> readDicLanguages(String dicKey) =>
      Map<String, String>.from(box.read('${dicKey}_languages') ?? fillInDicLanguages(dicKey));

  void writeDicLanguages(String dicKey, Map<String, String> value) => box.write('${dicKey}_languages', value);
  void deleteDicLanguages(String dicKey) => box.remove('${dicKey}_languages');

  Map<String, String> fillInDicLanguages(String key) {
    if (key == 'dic_1') {
      return {
        'fromLanguage': 'en-US',
        'toLanguage': 'ru-RU',
      };
    } else if (key == 'dic_2') {
      return {
        'fromLanguage': 'de-DE',
        'toLanguage': 'ru-RU',
      };
    } else if (key == 'dic_3') {
      return {
        'fromLanguage': 'fr-FR',
        'toLanguage': 'ru-RU',
      };
    } else {
      return {};
    }
  }

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
ja - да
nein - нет
Hallo! - Здравствуйте!
Guten Morgen! - Доброе утро!
Guten Tag! - Добрый день!
Guten Abend! - Добрый вечер!
Auf Wiedersehen! - До свидания!
Tschüss! - Пока!
Bitte! - Пожалуйста!
Danke! - Спасибо!
Vielen Dank! - Большое спасибо!
Herzlichen Dank! - Огромное спасибо!
Entschuldigung! - Извините!
Kein Problem. - Нет проблем.
Gesundheit! - Будьте здоровы!
Viel Erfolg! - Удачи!
Willkommen! - Добро пожаловать!
Bis bald! - До скорого!
Wie geht es dir? - Как дела? (How are you?)
Wie geht es Ihnen? - Как поживаете?
Wie geht's? - Как дела?
alles gut - все хорошо
sehr gut - очень хорошо
Mir geht es gut - У меня все хорошо
Und Ihnen? - А у вас?
Auch gut - Тоже хорошо
Was geht ab? - Что происходит?
Alles easy. - Все окей.
Alles klar? - Все ясно?
Wo ist…? - Где находится...? (Where is...?)
Wie viel kostet das? - Сколько стоит? (How much does it cost?)
Ich verstehe nicht - Я не понимаю (I don't understand)
Sprechen Sie Englisch? - Говорите ли вы по-английски? (Do you speak English?)
Ich habe keine Lust. - Я не хочу.
Es ist nicht so mein Fall. - Мне это не очень нравится.
lesen - читать
buchstabieren - читать по буквам или по складам
schreiben - писать
sagen - говорить
Alphabet - алфавит
H [ха] - возле гласных не читается. Читается как "х", если в начале слова
j [йот] - читается как "й"
L [эль] - читается "ль"
Q [ку] - в сочетании читается как "ку" или "кв"
R [эр] - читается как "гр" или вообще пропускается
S [эс] - когда одна, читается как "з". Как "с" читается, если написано сразу две (ss, ß)
V [фау] - в английских и иностранных словах читается как "в", в немецких словах читается как "ф"
W [вэ] - читается как "в"
X [икс] - читается как "кс"
Y [ипсилон] - читается как "у"
Z [цет] - читается как "ц"
Ä [а умлаут] - читается как "ьэ"
Ö [о умлаут] - читается как "ьо"
Ü [у умлаут] - читается как "ьу"
ß [εs tse:t] - читается как "с"
ie - читается как "и"
еi = ai - читается как "ай"
eu = äu - читается как "ой"
ch - читается как "х" после букв "а, о, u"
сk - читается как "к"
chs - читается как "кс"
sch - читается как "ш"
tsch - читается как "ч"
sp - читается как "шп" (в начале слова или корня)
st - читается как "шт" (в начале слова или корня)
er - чтение похоже как в английском "ар", то есть "р" почти не читается
Все существительные пишутся с большой Буквы
Ударение в словах обычно ставится на первый корневой слог
der - определённый артикль, мужской род
die - определённый артикль, женский род
das - определённый артикль, нейтральный род
ein - неопределённый артикль, мужской и нейтральный род
eine - неопределённый артикль, женский род
Нулевой артикль используется для определения чего-то общего, профессии или национальности
ich - я
du - ты
er - он
sie - она
es - оно
wir - мы
ihr - вы (единственное число)
sie - они
Sie - вы (множественное число, формальное обращение)
mein - мой
dein - твой
sein - его
ihr - ее
sein - его/их (средний род)
unser - наш
euer - ваш
ihr - их/ваш (средний род)
dieser, diese, dieses - этот, эта, это
jener, jene, jenes - тот, та, то
hier - здесь
da - там
dort - там
dort drüben - там, за тем
hierher - сюда
dahin - туда
dorthin - туда
wer - кто
was - что
welcher - который
wessen - чей
wem - кому
wen - кого
alle - все
jemand - кто-то
niemand - никто
etwas - что-то
nichts - ничто
man - человек/люди
etliche - несколько
die Frage - вопрос
fragen - спрашивать
Wer? - кто? (Who?)
Was? - что? (What?)
Wie? - как? (How?)
Wo? - где? (Where?)
Wann? - когда? (When?)
Warum? - почему? (Why?)
Wie viel? / Wie viele? - сколько? (How much? / How many?)
Welcher / Welche / Welches? - какой / какая / какое? (Which?)
Wofür? - для чего? (What for?)
Womit? - чем? (With what?)
Wodurch? - чем? (Through what?)
Woran? - на чем? (On what?)
Worauf? - на что? (On what?)
Wohin? - куда? (Where to?)
Woher? - откуда? (Where from?)
derjenige, diejenige, dasjenige - тот, который
derselbe, dieselbe, dasselbe - тот же самый
solcher, solche, solches - такой, подобный
dasselben - того же самого
von hier - отсюда
von dort - оттуда
da oben - там, вверху
da unten - там, внизу
da hinten - там, сзади
hier oben - здесь, вверху
hier unten - здесь, внизу
hier hinten - здесь, сзади
direkt - прямо
zurück - назад
Vor - перёд
nach vorne - вперёд
Eingang - вход
Ausgang - выход
links - лево, налево
Rechts - право, направо
der Biegung - поворот
drehen - поворачивать
die Umleitung - объезд
mich - себя (мужской род)
dich - себя (женский род)
sich - себя (средний род/множественное число)
uns - себя (мы)
euch - себя (вы)
sich - себя (они)
und - и
oder - или
aber - но, а
denn - ибо, потому что
sondern - а, а не
weil - потому что
dass - что
wenn - если
obwohl - хотя, несмотря на то, что
weil - так как, потому что
damit - для того чтобы
als - чем, как
nachdem - после того как
bevor - прежде чем
während - в то время как
sobald - как только
deshalb - поэтому
jedoch - однако, тем не менее
trotzdem - тем не менее, несмотря на это
entweder ... oder - либо ... либо
weder ... noch - ни ... ни
ab - с
von - от
aus - из, с
bei - у, при
durch - через, сквозь
für - для
gegen - против
hinter - за
in - в
mit - с, с помощью
nach - после, к
neben - рядом с
über - над, сверх
unter - под
vor - перед
zu - к
zwischen - между
das Geld - деньги
kostenlos - бесплатно
frei - бесплатно, свободно, свободный
Penny, Pennys - копейка, копейки
Münzen - монеты
null - 0
eins - 1
zwei - 2
drei - 3
vier - 4
fünf - 5
sechs - 6
sieben - 7
acht - 8
neun - 9
zehn - 10
elf - 11
zwölf - 12
dreizehn - 13
neunzehn - 19
zwanzig - 20
dreißig - 30
neunzig - 90
hundert - 100
tausend - тысяча
Million - миллион
Milliarde - миллиард
dreiundzwanzig - двадцать три. От 21 до 99 произносится так
sechshundertdreiundvierzig - 643
viertausendneunhundertsechsundachtzig - 4986
hunderttausend - 100 000
eine Million - 1 000 000
zehn Millionen - 10 000 000
eine Milliarde - 1 000 000 000
Все числительные в немецком пишутся слитно до миллиона. В миллионах и дельше — отдельно
Годы до 1999 разбиваются на 2 части
Годы с 2000 — как обычное числительное
eins plus zwei ist drei - 1 плюс 2 = 3 
fuenf minus eins ist vier - 5 минус 1 = 4
Порядковые числительные идут с точкой (1., 301.)
В порядковых числительных от 1 до 19 добавляется -te. С 20 и дальше добавляется -ste
erste (r/s) - первый
zweite (r/s) - второй
dritte (r/s) - третий
achte (r/s) - восьмой
neunzehnte (r/s) - девятнадцатый
zwanzigste (r/s) - двадцатый
dreißigste (r/s) - тридцатый
neunzigste (r/s) - девяностый
hundertste (r/s) - сотый
fünfzehnte - пятнадцатый
einundzwanzigste (r/s) - двадцать первый
neunundzwanzigste (r/s) - двадцать девятый
Порядковые числительные склоняются, как прилагательные, то есть добавляется -n
Дробь, где единица делится на число, образуется добавлением -tel до 19 и добавлением -stel с 20
drittel - 1/3
viertel - 1/4
achtel - 1/8
zwanzigstel - 1/20
Существительные после числительных идут во множественном числе
Десятичные дроби читаются через слово "кома" (Komma), то есть "запятая"
vier Komma eins vier eins - 4,141
В числах через дробь второе чилсо идёт как порядковое
elf Siebenundzwanzigstel - 11/27
ein Drittel - 1/3
Mathematik - математика
Plus (+) - плюс
Minus (-) - минус
Mal (x) - умножить на
Geteilt durch (/) - разделить на
Gleich (=) - равно
Größer als (>) - больше чем
Kleiner als (<) - меньше чем
Größer oder gleich (>=) - больше или равно
Kleiner oder gleich (<=) - меньше или равно
Prozent (%) - процент
Wurzel (√) - корень
Potenz (^) - в степени
nicht - не
sehr - очень
auch - также
dann - потом
jetzt - сейчас
doch - однако
wieder - снова
wiederum - вновь
fast - почти
nur - только
mal - раз
so - так
eben - просто
ganz - совсем
vielleicht - возможно
ziemlich - довольно
etwa - приблизительно, может быть
darum - поэтому
irgendwie - как-то
erst - только
viel - много
einfach - просто, простой
endlich - наконец
plötzlich - вдруг
eigentlich - на самом деле
zusammen - вместе
wahrscheinlich - вероятно
hoffentlich - надеюсь
dennoch - тем не менее
rund - около
schlecht - плохо, плохой
außerdem - кроме того
öfter - чаще
laut - громко
leise - тихо
schnell - быстро, быстрый
besser - лучше
vorher - раньше
jedenfalls - в любом случае
heute - сегодня (today)
gestern - вчера (yesterday)
morgen - завтра (tomorrow)
vorgestern - позавчера (the day before yesterday)
übermorgen - послезавтра (the day after tomorrow)
bald - скоро (soon)
schon - уже (already)
noch - еще (still/yet)
oft - часто (often)
manchmal - иногда (sometimes)
immer - всегда (always)
nie - никогда (never)
heute Abend - сегодня вечером (tonight)
gestern Abend - вчера вечером (last night)
heute Morgen - сегодня утром (this morning)
gestern Morgen - вчера утром (yesterday morning)
heute Nacht - сегодня ночью (tonight)
gestern Nacht - вчера ночью (last night)
am Wochenende - в выходные (on the weekend)
am Montag, Dienstag, etc. - в понедельник, вторник, и т.д. (on Monday, Tuesday, etc.)
Wochentage - дни недели
Wochenende - выходные
Montag - понедельник
Dienstag - вторник
Mittwoch - среда
Donnerstag - четверг
Freitag - пятница
Samstag - суббота
Sonntag - воскресенье
Freizeit - свободное время
Urlaub - отпуск
der  Morgen  -  утро
der  Vormittag  -  до полудня
der  Mittag  -  полдень
der  Nachmittag  -  после полудня
der  Abend  -  вечер
die  Nacht  -  ночь
das  Frühstück  -  завтрак
der  Brunch  -  бранч (поздний завтрак)
das  Mittagessen  -  обед
die  Kaffeepause  -  перерыв на кофе
das  Abendessen  -  ужин
der  Imbiss  -  перекус
die  Mahlzeit  -  приятного аппетита (может использоваться при любом приеме пищи)
die Uhrzeit - время
die Sekunde - секунда
die Minute - минута
die Stunde - час
Monat, Monate - месяц, месяцы
Januar - январь
Februar - февраль
März - март
April - апрель
Mai - май
Juni - июнь
Juli - июль
August - август
September - сентябрь
Oktober - октябрь
November - ноябрь
Dezember - декабрь
der Frühling - весна
der Sommer - лето
der Herbst - осень
der Winter - зима
sein - быть
haben - иметь
werden - становиться
machen - делать
geben - давать
kommen - приходить, приезжать
gehen - идти
können - уметь/мочь
wollen - хотеть
müssen - одалживать
sehen - видеть
lassen - позволять
finden - находить, считать
denken - думать
nehmen - брать
tun - делать
sprechen - говорить
halten - держать/останавливать
heißen - называться
kennen - знать
glauben - верить, думать, полагать
leben - жить
arbeiten - работать
brauchen - нуждаться
führen - вести, руководить
bekommen - получать
meinen - иметь в виду/считать
lassen - оставлять
setzen - ставить
stehen - стоять
bleiben - оставаться, задерживаться
scheinen - казаться
liegen - лежать
verstehen - понимать
stellen - ставить/устанавливать
laufen - бегать
spielen - играть
suchen - искать
bedeuten - значить
verlieren - терять
erzählen - рассказывать
halten - держать/останавливать
ziehen - тащить/перемещаться
tragen - носить
treffen - встречаться
verkaufen - продавать
kaufen - покупать
gehören - принадлежать
helfen - помогать
setzen - садиться, ставить
bringen - приносить
bieten - предлагать, давать
die Farbe (-n) - цвет
rot - красный
blau - синий
grün - зеленый
gelb - желтый
orange - оранжевый
schwarz - черный
weiß - белый
braun - коричневый
grau - серый
rosa - розовый
lila, violett - фиолетовый
gold - золотой
silber - серебряный
hellgrau - светло-серый
hellblau - светло-синий
dunkelblau - темно-синий
dunkelrot - темно-красный
rot-orange - красно-оранжевый
blau-grun - сине-зелёный
groß - большой
klein - маленький
gut - хороший
schlecht - плохой
schön - красивый
hässlich - уродливый
alt - старый
jung - молодой
einfach - простой
schwierig - сложный
schnell - быстрый
langsam - медленный
teuer - дорогой
billig - дешевый
leicht - легкий
schwer - тяжелый
voll - полный
leer - пустой
neu - новый
altmodisch - старомодный
warm - теплый
kalt - холодный
früh - рано
spät - поздно
frisch - свежий
müde - усталый
hungrig - голодный
durstig - жаждущий
reich - богатый
arm - бедный
glücklich - счастливый
traurig - грустный
nervös - нервный
ruhig - спокойный
sauber - чистый
schmutzig - грязный
interessant - интересный
langweilig - скучный
bekannt - известный
unbekannt - неизвестный
wichtig - важный
unwichtig - неважный
sicher - безопасный
unsicher - небезопасный
normal - нормальный
unnormal - не нормальный
stark - сильный
schwach - слабый
wahr - верный
falsch - ложный
das Jahr - год
der Tag - день
die Zeit - время
die Zeitung - газета
das Ende - конец
die Arbeit - работа
die Woche - неделя
der Ort - место
das Haus - дом
das Leben - жизнь
das Kind - ребенок
der Mensch - человек
die Frage - вопрос
die Frau - женщина
der Mann - мужчина
die Stadt - город
die Welt - мир
die Nacht - ночь
das Land - страна
die Liebe - любовь
die Seite - страница
die Hand - рука
das Wasser - вода
das Problem - проблема
der Weg - путь
der Freund - друг
die Familie - семья
die Möglichkeit - возможность
die Sache - вещь
das Auge - глаз
die Stunde - час
die Firma - фирма
die Antwort - ответ
das Ziel - цель
das Recht - право
das System - система
das Beispiel - пример
die Gruppe - группа
der Kopf - голова
die Geschichte - история
der Krieg - война
die Art - вид, тип
das Ergebnis - результат
der Augenblick - мгновение
der Gedanke - мысль
die Regierung - правительство
das Gesicht - лицо
der Fluss - река
der See - озеро
der Baum - дерево
die Blume - цветок
das Tier - животное
der Vogel - птица
die Kuh - корова
das Pferd - лошадь
der Hund - собака
die Katze - кошка
die Maus - мышь
das Brot - хлеб
der Käse - сыр
das Fleisch - мясо
der Fisch - рыба
der Apfel - яблоко
die Banane - банан
die Orange - апельсин
der Wein - вино
die Milch - молоко
der Zucker - сахар
das Salz - соль
die Butter - масло
das Ei - яйцо
der Reis - рис
die Nudeln - макароны
der Kaffee - кофе
der Tee - чай
die Suppe - суп
der Saft - сок
die Zitrone - лимон
die Tomate - помидор
die Gurke - огурец
die Paprika - болгарский перец
der Pilz - гриб
die Kartoffel - картофель
die Zwiebel - лук
der Knoblauch - чеснок
die Karotte - морковь
der Kohl - капуста
die Erdbeere - клубника
die Himbeere - малина
die Brombeere - ежевика
die Traube - виноград
die Melone - дыня
die Birne - груша
die Pfirsich - персик
die Kirsche - вишня
die Erdnuss - арахис
die Walnuss - грецкий орех
die Haselnuss - фундук
die Mandel - миндаль
das Eis - мороженое
die Schokolade - шоколад
der Kuchen - торт
das Bier - пиво
der Schnaps - крепкий алкоголь
die Musik - музыка
das Buch - книга
der Film - фильм
das Radio - радио
der Fernseher - телевизор
das Telefon - телефон
der Computer - компьютер
das Internet - интернет
das Auto - автомобиль
das Fahrrad - велосипед
das Rad - колесо
das Motorrad - мотоцикл
das Moped, das Mofa - мопед
Schönes Wochenende! - Хороших выходных!
Gute Besserung! - Быстрого выздоровления!
Alles Gute zum Geburtstag! - С днем рождения!
Prost! - На здоровье! (при тосте)
Frohe Weihnachten! - Счастливого Рождества!
Frohes Neues Jahr! - С Новым Годом!
Es tut mir leid. - Мне жаль.
Keine Ahnung. - Не имею понятия.
Es ist mir egal. - Мне все равно.
Ich habe keinen Bock. - Мне неохота.
Ich habe die Nase voll. - Мне надоело.
Ich habe keine Zeit. - У меня нет времени.
Das ist der Wahnsinn. - Это невероятно.
Ich bin sprachlos. - Я не могу ничего сказать.
Das ist der Hit. - Это шик.
''';

  String dic3 = '''
Oui [Уи] - Да
Non [Нон] - Нет
Merci (merci beaucoup) [Мерси (мерси боку)] - Спасибо (большое спасибо)
Je vous en prie. [Жё вузан при.] - Пожалуйста (ответ на спасибо)
De rien [До рьен] - Не за что
S’il vous plaît [Силь ву плэ] - Пожалуйста (просьба)
Pardon / excusez-moi [Пардон / экскюзе муа] - Извините
Bonjour [Бонжур] - Здравствуйте
Au revoir [О ревуар] - До свидания
A bientôt [А бьенто] - Пока
Je ne comprends pas. [Жё нё компран па] - Я не понимаю.
Parlez-vous … russe ? [Парле-ву … рюс?] - Вы говорите … по-русски?
…anglais ? […англэ?] - …по-английски?
…français ? […франсэ?] - …по-французски?
Je ne parle pas … français. [Жё нё парль па … франсэ.] - Я не говорю … по-французски.
Monsieur, madame… [Мёсьё, мадам…] - Господин, госпожа…
Plus lentement,s’il vous plaît. [Плю лянтман,силь ву плэ.] - Помедленнее,пожалуйста.
Aidez-moi, s’il vous plaît. [Эдэ-муа, силь ву плэ.] - Помогите мне, пожалуйста.
J’ai besoin de… [Жэ бёзуэн до] - Мне нужно…
 Как вас зовут?] - [Коман вузапле ву?] Comment vous appelez-vous?
Je m’appelle … [Жё мапель…] - Меня зовут…
Enchanté ! [Аншантэ!] - Очень приятно!
Comment allez-vous ? [Коман тале ву?] - Как у вас дела?
Bien / bon / ça va [Бьен / бон / са ва] - Хорошо.
Comme ci comme ça. [Ком си ком са.] - Так себе.
C’est mon / ma … [Сэ мон / ма…] - Это мой / моя…
…femme. […фам.] - …жена.
…mari. […мари.] - …муж.
…fille. […фий.] - …дочь.
…fils. […фис.] - …сын.
…mère / maman. […мэр / маман.] - …мать / мама.
…père / papa. […пэр / папа.] - …отец / папа.
…ami / amie. […ами / ами.] - ..друг / подруга.
Je viens de Russie. [Жё вьен де Рюси.] - Я из России.
Nous venons de Russie. [Ну венон де Рюси.] - Мы из России.
Où se trouve… ? [У сё трув…?] - Где находится…?
L’hôtel [Лётэль] - Отель
Le restaurant [Лё рэсторан] - Ресторан
Le magasin [Лё магазэн] - Магазин
Le musée [Лё мюзе] - Музей
La rue [Ля рю] - Улица
La place [Ля пляс] - Площадь
L’aéroport [Ляэропор] - Аэропорт
La gare [Ля гар] - Вокзал жд
La gare routière [Ля гар рутьер] - Автовокзал
L’arrêt [Лярэ] - Остановка
Le bus [Лё бюс] - Автобус
Le tram [Лё трам] - Трамвай
Le train [Лё трэн] - Поезд
L’avion [Лявьон] - Самолет
Le métro [Лё метро] - Метро
Le taxi [Лё такси] - Такси
La voiture [Ля вуатюр] - Автомобиль
Le départ [Лё дэпар] - Отправление
L’arrivée [Ляривэ] - Прибытие
Le billet [Лё бийе] - Билет
Quel est le prix d’un billet ? [Кэль э лё при дон бийе?] - Сколько стоит билет?
A gauche [А гош] - Налево
A droite [А друат] - Направо
Tout droit [Ту друа] - Прямо
Où sont les toilettes ? [У сон ле туалет?] - Где находятся туалеты?
Combien ça coûte ? [Комбьен са кут?] - Сколько это стоит?
Quel est le prix ? [Кэль э лё при?] - Какова цена?
Je voudrais acheter / commander… [Жё вудрэ аштэ / командэ…] - Я хотел(а) бы купить / заказать…
Avez-vous… ? [Аве ву?] - У вас есть…?
Je le prends. [Жё лё пран.] - Я это беру.
Acceptez-vous les cartes de crédit ? [Аксепте ву ле карт до креди?] - Вы принимаете кредитные карты?
Ouvert [Увер] - Открыто
Fermé [ферме] - Закрыто
Le petit déjeuner [Лё пти дежёне] - Завтрак
Le déjeuner [Лё дежёне] - Обед
Le dîner [Лё дине] - Ужин
L’addition, s’il vous plaît. [Лядисьон, силь ву плэ.] - Счет, пожалуйста.
Du pain [Дю пэн] - Хлеб
Du café [Дю кафе] - Кофе
Du thé [Дю тэ] - Чай
Du jus [Дю жю] - Сок
De l’eau [До лё] - Вода
De la bière [До ля бьер] - Пиво
Du vin [Дю вэн] - Вино
Du sel [Дю сэль] - Соль
Du poivre [Дю пуавр] - Перец
De la viande [До ля вьянд] - Мясо
Du boeuf [Дю бёф] - Говядина
Du porc [Дю пор] - Свинина
Du poisson [Дю пуасон] - Рыба
De la volaille [До ля волай] - Птица
Des légumes [Дэ легюм] - Овощи
Des fruits [Дэ фрюи] - Фрукты
Des pommes de terre [Дэ пом до тэр] - Картошка
Une glace [Юн гляс] - Мороженое
un , une [эн, юн] - 1 — один,одна
deux [дё] - 2 — два, две
trois [труа'] - 3 — три
quatre [катр] - 4 — четыре
cinq [сэнк] - 5 — пять
six [сис] - 6 — шесть
sept [сэт] - 7 — семь
huit [юи'т] - 8 — восемь
neuf [нёф] - 9 — девять
dix [дис] - 10 — десять
onze [онз] - 11 — одиннадцать
douze [дуз] - 12 — двенадцать
treize [трэз] - 13 — тринадцать
quatorze [като'рз] - 14 — четырнадцать
quinze [кэнз] - 15 — пятнадцать
seize [сэз] - 16 — шестнадцать
dix-sept [дис-сэт] - 17 — семнадцать
dix-huit [диз-юи'т] - 18 — восемнадцать
dix-neuf [диз-нёф] - 19 — девятнадцать
vingt [вэн] - 20 — двадцать
vingt-et-un (une) [вэн-т-э-эн (юн)] - 21 — двадцать один
vingt-deux [вэн-дё] - 22 — двадцать два
vingt-trois [вэн-труа'] - 23 — двадцать три
trente [трант] - 30 — тридцать
trente et un [тран-тэ-эн] - 31 — тридцать один
trente-deux [трант-дё] - 32 — тридцать два
quarante [кара'нт] - 40 — сорок
quarante et un [каран-тэ-эн] - 41 — сорок один
quarante-deux [карант-дё] - 42 — сорок два
cinquante [сэнка'нт] - 50 — пятьдесят
cinquante et un [сэнка'н-тэ-эн] - 51 — пятьдесят один
cinquante-deux [сэнкант-дё] - 52 — пятьдесят два
soixante [суаса'нт] - 60 — шестьдесят
soixante et un [суаса'н-тэ-эн] - 61 — шестьдесят один
soixante deux [суаса'нт-дё] - 62 — шестьдесят два
soixante-dix [суаса'нт-ди'с] - 70 — семьдесят
soixante et onze [суаса'нт-о'нз] - 71 — семьдесят один
soixante-douze [суаса'нт-ду'з] - 72 — семьдесят два
quatre-vingts [катрё-вэн] - 80 — восемьдесят
quatre-vingt et un [катрё-вэн-тэ-эн] - 81 — восемьдесят один
quatre-vingt-deux [катрё-вэн-дё] - 82 — восемьдесят два
quatre-vingt-dix [катрё-вэн-дис] - 90 — девяносто
quatre-vingt-onze [катрё-вэн-то'нз] - 91 — девяносто один
quatre-vingt-douze [катрё-вэн-ду'з] - 92 — девяносто два
cent [сан] - 100 —сто
cent un [сантэн] - 101 — сто один
cent deux [сан дё] - 102 — сто два
cent dix [сан дис] - 110 — сто десять
cent vingt [сан вэн] - 120 — сто двадцать
cent soixante-dix [сан суаса'нт-дис] - 170 — сто семьдесят
cent soixante-quinze [сан суаса'нт-кэнз] - 175 — сто семьдесят пять
cent soixante-dix-huit [сан суаса'нт-диз-юи'т] - 178 — сто семьдесят восемь
cent quatre-vingts [сан катрё-вэн] - 180 — сто восемьдесят
cent quatre-vingts six [сан катрё-вэн сие] - 186 — сто восемьдесят шесть
cent quatre-vingt-dix [сан катрё-вэн-дис] - 190 — сто девяносто
cent quatre-vingt-dix-sept [сан катрё-вэн-дис-еэт] - 197 — сто девяносто семь
deux cents [дё сан] - 200 — двести
deux cent un [дё сан-тэн] - 201 — двести один
deux cent deux [дё сан дё] - 202 — двести два
trois cents [труа сан] - 300 — триста
quatre cents [катрё са'н] - 400 — четыреста
cinq cents [сэнк са'н] - 500 — пятьсот
six cents [си са'н] - 600 — шестьсот
sept cents [сэт са'н] - 700 — семьсот
huit cents [юи са'н] - 800 — восемьсот
neuf cents [нёф са'н] - 900 — девятьсот
mille [миль] - 1000 — тысяча
deux mille [дё миль] - 2000 — две тысячи
un million [эн мильо'н] - 1 000 000 — миллион
un milliard [эн мильяр] - 1 000 000 000 — миллиард
''';
}
