import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // ENGLISH
        'en_US': {
          'current_language': 'en',
          'slogan': 'Learn while relaxing',
          'share_content': 'Share opened content with friends',
          'add_bookmark': 'Add opened content to bookmark',
          'delete_bookmark': 'Delete this link from bookmark',
          'clear_cache': 'Cache',
          'clear_cookies': 'Cookies',
          'backward_empty': 'Backward history is empty',
          'forward_empty': 'Forward history is empty',
          'cache_deleted': 'Cache is deleted',
          'cookies_deleted': 'Cookies are deleted',
          'cookies_clean': 'Cookies are clean',
          'learned': 'You\'ve learned',
          'of': 'of',
          'entries_in_dictionary': 'entries in this dictionary',
          'have_learned': 'I\'ve learned this entry (swipe entry up)',
          // 'skip_entry': 'Skip this entry (learned, rarely use or repeat later), swipe entry up',
          'skip_entry': 'Skip this entry (learned, rarely use or repeat later), double tap on entry',
          'move_later': 'Move this entry on later (double tap on entry)',
          'edit_entry': 'Edit this entry (long press on entry)',
          'add_entries': 'Add new entries',
          'delete_entry': 'Delete this entry',
          'create_dictionary': 'Create dictionary',
          'settings_page_title': 'Settings',
          'entries_in_lesson': 'Number of entries per lesson — ',
          'seconds_per_entry': 'Seconds before next entry — ',
          'save': 'Save',
          'cancel': 'Cancel',
          'delete': 'Delete',
          'title': 'Title',
          'link': 'Link',
          'just_one_line': 'Just one line.',
          'signs': 'signs',
          'too_long_title': 'Too long title',
          'too_small_title': 'Too small title',
          'yes': 'Yes',
          'no': 'No',
          'you_want_delete_dic': 'Are you sure you want to delete this dictionary?',
          'you_want_reset_dic': 'Are you sure you want to start learning this dictionary from the beginning',
          'add': 'Add',
          'add_to_end': 'To end',
          'create': 'Create',
          'enter_new_dic_title': 'Enter title for new dictionary',
          'empty_field': 'Field cannot be empty',
          'empty_dic': 'This dictionary is now empty. Tap here and add the first entries in this dictionary',
          'edit_save_entry': 'Edit and save this entry',
          'add_new_entry': 'Add each entry on a new line. Separate the translation with a hyphen with spaces " - "',
          'add_at_least_one_entry': 'Add at least one entry.',
          'how_add_new_entries':
              'Add each entry from a new line according to the principle: foreign word - translation',
          'word_translation': 'word - translation',
          'congratulation': 'Congratulation!',
          'you_learned': 'You have learned all entries in this dictionary. Now you can:',
          'add_new_entries': 'Add new entries',
          'repeat_from_beginning': 'Repeat from the beginning',
          'important_for_pronunciation': 'For correct sound',
          'translation_direction': 'Translation direction for correct sound',
          'important': 'Important',
          'from_language': 'From',
          'to_language': 'To',
          'read_words': 'Read words (experimental feature)',
          'reading_speed': 'Reading speed — ',
          'background_volume': 'Other content volume — ',
          'audio_player': 'Audio Player',
          'page_1_title': 'This is unordinary program',
          'page_1_body': '''
It allows you to learn foreign languages while you are relaxing with your phone.

It's perfect for cramming new words or repeating words you already know.
''',
          'page_2_title': 'In this program you can open any website',
          'page_2_body': 'It can be your favorite social networks, news, online games, movies or music.',
          'page_3_title': 'The most important thing is at the bottom of the program',
          'page_3_body': '''
There you will see a field where foreign words are scrolled in a circle until you learn them.

It happens while you watch what you want in the program.
''',
          'page_4_title': 'Click on the word when you have learned it',
          'page_4_body': '''
In the menu that appears, click Skip. The next word in the dictionary will be substituted for this word.

Do this until you learn all.
''',
          'page_5_title': 'Bookmark the sites where we spend the most time',
          'page_5_body': '''
Click on the heart to add a new bookmark.

To edit or delete your bookmark, simply long press on it.
''',
          'page_6_title': 'Choose a dictionary or create your own',
          'page_6_body': '''
Better to create your own dictionary.

Add to it those words that you yourself often say or meet in communication.
''',
          'page_7_title': 'Program features',
          'page_7_body': '''
We hope it is intuitive enough that you can understand it more.
*
It works with web versions of popular applications. Its have their own characteristics, which we cannot influence. Decide for yourself what is more important to you.
*
You can open this manual at any time by clicking the question mark in the menu.
''',
          'page_8_title': 'Spend your time on your phone productively',
          'page_8_body': 'Everything can be learned if you do it every day, as far as you are comfortable.',

          'skip': 'Later',
          'done': "Don't show",
          'update_page': 'Update Page',

          'extra_hyphen':
              'ⓘ Edit this entry. Leave 1 hyphen separating the translation. Replace the others with a dash.',

          'reading_times': 'How many times to read each entry — ',
          'reverse_order': 'Save in reverse order',
        },

        // RUSSIAN
        'ru_RU': {
          'current_language': 'ru',
          'slogan': 'Отдыхай и учись',
          'share_content': 'Переслать друзьям эту страницу',
          'add_bookmark': 'Добавить в закладки эту страницу',
          'delete_bookmark': 'Удалить из закладок эту страницу',
          'clear_cache': 'Кэш',
          'clear_cookies': 'Куки',
          'backward_empty': 'История назад пуста',
          'forward_empty': 'История вперёд пуста',
          'cache_deleted': 'Кэш удалён',
          'cookies_deleted': 'Куки удалены',
          'cookies_clean': 'Куки пусты',
          'learned': 'Вы выучили',
          'of': 'из',
          'entries_in_dictionary': 'записей в словаре',
          'have_learned': 'Я выучил эту запись (свайп вверх по записи)',
          // 'skip_entry': 'Пропустить эту запись (выучил, редко использую или повторю потом), свайп вверх по записи',
          'skip_entry': 'Пропустить эту запись (выучил, редко использую или повторю потом), двойной тап по записи',
          'move_later': 'Отложить эту запись на потом (двойной тап по записи)',
          'edit_entry': 'Редактировать эту запись (длинное нажатие)',
          'add_entries': 'Добавить новые записи',
          'delete_entry': 'Удалить эту запись',
          'create_dictionary': 'Создать словарь',
          'settings_page_title': 'Настройки',
          'entries_in_lesson': 'Количество записей в уроке — ',
          'seconds_per_entry': 'Секунд до следующей записи — ',
          'save': 'Сохранить',
          'cancel': 'Отмена',
          'delete': 'Удалить',
          'title': 'Название',
          'link': 'Ссылка',
          'too_long_title': 'Слишком длинный заголовок',
          'too_small_title': 'Слишком короткий заголовок',
          'yes': 'Да',
          'no': 'Нет',
          'you_want_delete_dic': 'Вы уверены, что хотите удалить этот словарь?',
          'you_want_reset_dic': 'Вы уверены, что хотите начать учить этот словарь сначала',
          'add': 'Добавить',
          'add_to_end': 'В конец',
          'create': 'Создать',
          'enter_new_dic_title': 'Введите название для нового словаря',
          'empty_field': 'Поле не может быть пустым',
          'empty_dic': 'Этот словарь сейчас пуст. Нажмите здесь, чтобы добавить первые записи в этот словарь',
          'edit_save_entry': 'Отредактируйте и сохраните эту запись',
          'add_new_entry': 'Каждую запись добавляйте с новой строки. Перевод отделите дефисом с пробелами " - "',
          'add_at_least_one_entry': 'Добавьте хотя бы одну запись.',
          'how_add_new_entries': 'Добавьте каждую запись с новой строчки по принципу: иностранное слово - перевод',
          'word_translation': 'слово - перевод',
          'congratulation': 'Поздравляем!',
          'you_learned': 'Вы выучили все записи в этом словаре. Теперь вы можете:',
          'add_new_entries': 'Добавить новые записи',
          'repeat_from_beginning': 'Повторить сначала',
          'important_for_pronunciation': 'Для корректной озвучки',
          'important': 'Важно',
          'translation_direction': 'Направление перевода для корректной озвучки',
          'from_language': 'С языка',
          'to_language': 'На язык',
          'read_words': 'Читать слова (экспериментальная функция)',
          'reading_speed': 'Скорость чтения — ',
          'background_volume': 'Громкость остального контента — ',
          'audio_player': 'Аудио плеер',
          'page_1_title': 'Это необычная программа',
          'page_1_body': '''
Она позволяет учить иностранные языки прямо во время твоего отдыха в телефоне.

Она идеально подходит, чтобы зубрить новые или повторять знакомые слова.
''',
          'page_2_title': 'В этой программе ты можешь открыть любой сайт',
          'page_2_body': 'Это могут быть твои любимые социальные сети, новости, онлайн-игры, фильмы или музыка.',
          'page_3_title': 'Самое главное — внизу программы',
          'page_3_body': '''
Там ты увидишь поле, где по кругу листаются иностранные слова, пока ты их не выучишь.

Это происходит прямо во время того, как ты смотришь в программе то, что хочешь.
''',
          'page_4_title': 'Нажми на слово, когда ты его выучил',
          'page_4_body': '''
В появившемся меню нажми Пропустить. На место этого слова подставится следующее из словаря. 

Делай так, пока всё не выучишь.
''',
          'page_5_title': 'Используй закладки тех сайтов, где мы тратим больше всего времени',
          'page_5_body': '''
Нажми на сердечко, чтобы добавить новую закладку.

Чтобы изменить или удалить свою закладку, просто нажми на неё долго.
''',
          'page_6_title': 'Выбери словарь или создай свой',
          'page_6_body': '''
Лучше создать свой собственный словарь. 

Добавляй в него те слова, которые ты сам часто говоришь или встречаешь в общении.
''',
          'page_7_title': 'Особенности программы',
          'page_7_body': '''
Надеемся, она достаточно интуитивна, и ты сможешь разобраться в ней больше.
*
Она работает с веб-версиями популярных приложений. Они имеют свои особенности, на которые мы не можем влиять. Тут решай сам, что тебе важнее.
*
Эту инструкцию ты можешь открыть в любой момент, нажав знак вопроса в меню.
''',
          'page_8_title': 'Трать своё время в телефоне продуктивно',
          'page_8_body': 'Всё можно выучить, если делать это каждый день, насколько тебе комфортно.',

          'skip': 'Потом',
          'done': 'Не показивать',
          'update_page': 'Страница обновления',

          'extra_hyphen':
              'ⓘ Отредактируйте эту запись. Оставьте 1 дефис, который отделяет перевод. Другие замените на тире.',

          'reading_times': 'Сколько раз читать каждую запись — ',
          'reverse_order': 'Сохранить в обратном порядке',
        },

        // UKRAINIAN
        'uk_UA': {
          'current_language': 'uk',
          'slogan': 'Відпочивай та навчайся',
          'share_content': 'Переслати друзям те, що відкрито',
          'add_bookmark': 'Додати в закладки те, що відкрито',
          'delete_bookmark': 'Видалити з закладок цю сторінку',
          'clear_cache': 'Кеш',
          'clear_cookies': 'Кукі',
          'backward_empty': 'Історія назад порожня',
          'forward_empty': 'Історія вперед порожня',
          'cache_deleted': 'Кеш видалено',
          'cookies_deleted': 'Кукі видалено',
          'cookies_clean': 'Кукі порожні',
          'learned': 'Ви вивчили',
          'of': 'з',
          'entries_in_dictionary': 'записів в словнику',
          'have_learned': 'Я вивчив цей запис (свайп вверх по запису)',
          // 'skip_entry': 'Пропустити цей запис (вивчив, рідко використовую або повторю потім), свайп вверх по запису',
          'skip_entry': 'Пропустити цей запис (вивчив, рідко використовую або повторю потім), подвійний тап по запису',
          'move_later': 'Відкласти цей запись на потім (подвійний тап по запису)',
          'edit_entry': 'Редагувати цей запис (довге натискання)',
          'add_entries': 'Додати нові записи',
          'delete_entry': 'Видалити цей запис',
          'create_dictionary': 'Створити словник',
          'settings_page_title': 'Налаштування',
          'entries_in_lesson': 'Кількість записів в уроці — ',
          'seconds_per_entry': 'Секунд до наступного запису — ',
          'save': 'Зберегти',
          'cancel': 'Відміна',
          'delete': 'Видалити',
          'title': 'Назва',
          'link': 'Посилання',
          'too_long_title': 'Дуже довга назва',
          'too_small_title': 'Дуже коротка назва',
          'yes': 'Так',
          'no': 'Ні',
          'you_want_delete_dic': 'Ви впевнені, що хочете видалити цей словник?',
          'you_want_reset_dic': 'Ви впевнені, що хочете почати вчити цей словник зпочатку?',
          'add': 'Додати',
          'add_to_end': 'В кінець',
          'create': 'Створити',
          'enter_new_dic_title': 'Введіть назву для нового словника',
          'empty_field': 'Поле не може бути порожнім',
          'empty_dic': 'Цей словник зараз порожній. Тапніть тут та додайте перші записи в цей словник',
          'edit_save_entry': 'Відредагуйте та збережіть цей запис',
          'add_new_entry': 'Кожен запис додавайте з нового рядка. Переклад відділіть дефісом з пробілами " - "',
          'add_at_least_one_entry': 'Додайте хоча б один запис.',
          'how_add_new_entries': 'Додайте кожен запис з нового рядка за таким принципом: іноземне слово - переклад',
          'word_translation': 'сово - переклад',
          'congratulation': 'Вітаємо!',
          'you_learned': 'Ви вивчили всі записи в цьому словнику. Тепер ви можете:',
          'add_new_entries': 'Додати нові записи',
          'repeat_from_beginning': 'Повторити зпочатку',
          'important_for_pronunciation': 'Для коректного вимовлення',
          'important': 'Важливо',
          'translation_direction': 'Напрямок перекладу для коректної озвучки',
          'from_language': 'З мови',
          'to_language': 'На мову',
          'read_words': 'Читати слова (експериментальна функція)',
          'reading_speed': 'Швидкість читання — ',
          'background_volume': 'Гучність іншого контенту — ',
          'audio_player': 'Аудіо плеєр',
          'page_1_title': 'Це — незвична програма',
          'page_1_body': '''
Вона дозволяє вчити іноземні мови прямо під час твого відпочинку в телефоні.

Вона ідеально підходить, щоб зубрити нові або повторювати знайомі слова.
''',
          'page_2_title': 'В цьому додатку ти можеш переглядати будь-які сайти',
          'page_2_body': 'Це можуть бути твої улюблені соціальні мережі, онлайн-ігри, фільми чи музика.',
          'page_3_title': 'Саме головне — внизу програми',
          'page_3_body': '''
Там ти побачиш поле, де по колу гортаються іноземні слова до тих пір, поки ти їх не вивчиш.

Це відбувається прямо під час того, як ти дивишся в додатку те, що хочеш.
''',
          'page_4_title': 'Натисни на слово, коли ти його вивчив',
          'page_4_body': '''
В меню, що з'явиться, натисни Пропустити. На місце цього слова підставиться наступне зі словника.

Роби так, поки все не вивчиш.
''',
          'page_5_title': 'Використовуй закладки на ті сайти, де ми витрачаєм більше всього часу',
          'page_5_body': '''
Натисни на сердечко, щоб додати нову закладку.

Щоб змінити чи видалити свою закладку, просто натисни на неї довго.
''',
          'page_6_title': 'Обери словник чи створи свій',
          'page_6_body': '''
Найкраще — створити власний словник.

Додавай до нього ті слова, які ти сам часто вживаєш чи зустрічаєш в розмові.
''',
          'page_7_title': 'Особливості програми',
          'page_7_body': '''
Сподіваємось, вона достатньо інтуїтивна, і ти зможеш розібратись в ній більше.
*
Вона працює з веб-версіями популярних сервісів. Вони мають свої особливості, на які ми не можемо впливати. Тут вирішуй сам, що тобі важливіше.
*
Цю інструкцію ти можеш відкрити в будь-який час, натиснувши в меню знак питання.
''',
          'page_8_title': 'Витрачай свій час в телефоні продуктивно',
          'page_8_body': 'Все можна вивчити, якщо робити це кожен день, наскільки тобі комфортно.',

          'skip': 'Потім',
          'done': 'Не показувати',
          'update_page': 'Сторінка оновлення',

          'extra_hyphen': 'ⓘ Відредагуйте цей запис. Залиште 1 дефіс, який відділяє переклад. Інші замініть на тире.',

          'reading_times': 'Скільки разів читати кожен запис — ',
          'reverse_order': 'Зберегти у зворотному порядку',
        },

        // GERMAN
        'de_DE': {
          'current_language': 'de',
          'slogan': 'Entspanne dich und studiere',
          'share_content': 'Schicke Freunden aktuelle Inhalte',
          'add_bookmark': 'Zu Lesezeichen hinzufügen',
          'delete_bookmark': 'Aus Lesezeichen entfernen',
          'clear_cache': 'Cache',
          'clear_cookies': 'Cookies',
          'backward_empty': 'Der Rückwärtsverlauf ist leer',
          'forward_empty': 'Weiterleitungsverlauf ist leer',
          'cache_deleted': 'Cache wird gelöscht',
          'cookies_deleted': 'Cookies werden gelöscht',
          'cookies_clean': 'Kekse sind sauber',
          'learned': 'Sie haben',
          'of': 'von',
          'entries_in_dictionary': 'Einträgen im Wörterbuch gelernt',
          'have_learned': 'Ich habe diesen Eintrag gelernt (Eintrag nach oben wischen)',
          // 'skip_entry': 'Diesen Eintrag überspringen (erlernt, selten verwenden oder später wiederholen), Eintrag nach oben wischen',
          'skip_entry': 'Diesen Eintrag überspringen (erlernt, selten verwenden oder später wiederholen), doppeltippen',
          'move_later': 'Verschieben Sie diesen Beitrag auf später (doppeltippen)',
          'edit_entry': 'Bearbeite diesen Eintrag (lange drücken)',
          'add_entries': 'Neue Einträge hinzufügen',
          'delete_entry': 'Löschen Sie diesen Eintrag',
          'create_dictionary': 'Wörterbuch erstellen',
          'settings_page_title': 'Einstellungen',
          'entries_in_lesson': 'Anzahl der Einträge pro Lektion — ',
          'seconds_per_entry': 'Sekunden bis zur nächsten Eintrags — ',
          'save': 'Speichern',
          'cancel': 'Stornieren',
          'delete': 'Löschen',
          'title': 'Titel',
          'link': 'Link',
          'too_long_title': 'Zu langer Titel',
          'too_small_title': 'Titel zu klein',
          'yes': 'Ja',
          'no': 'Nein',
          'you_want_delete_dic': 'Möchten Sie dieses Wörterbuch wirklich löschen?',
          'you_want_reset_dic': 'Sind Sie sicher, dass Sie dieses Vokabular von Anfang an lernen möchten?',
          'add': 'Hinzufügen',
          'add_to_end': 'Schließlich',
          'create': 'Erstellen',
          'enter_new_dic_title': 'Titel für neues Wörterbuch eingeben',
          'empty_field': 'Das Feld darf nicht leer sein',
          'empty_dic':
              'Dieses Wörterbuch ist jetzt leer. Tippen Sie hier und fügen Sie die ersten Einträge in diesem Wörterbuch hinzu',
          'edit_save_entry': 'Bearbeiten und speichern Sie diesen Eintrag',
          'add_new_entry':
              'Fügen Sie jeden Eintrag in einer neuen Zeile hinzu. Trennen Sie die Übersetzung mit einem Bindestrich mit Leerzeichen " - "',
          'add_at_least_one_entry': 'Fügen Sie mindestens einen Eintrag hinzu.',
          'how_add_new_entries':
              'Fügen Sie jeden Eintrag ab einer neuen Zeile nach dem Prinzip hinzu: Fremdwort - Übersetzung',
          'word_translation': 'Wort - Übersetzung',
          'congratulation': 'Glückwunsch!',
          'you_learned': 'Sie haben alle Einträge in diesem Wörterbuch gelernt. Jetzt kannst du:',
          'add_new_entries': 'Neue Einträge hinzufügen',
          'repeat_from_beginning': 'Wiederholen Sie von Anfang an',
          'important_for_pronunciation': 'Für den richtigen Klang',
          'important': 'Wichtig',
          'translation_direction': 'Übersetzungsrichtung für korrekten Ton',
          'from_language': 'Vom',
          'to_language': 'Ins',
          'read_words': 'Wörter lesen (experimentelle Funktion)',
          'reading_speed': 'Lesevolumen — ',
          'background_volume': 'Umfang anderer Inhalte — ',
          'audio_player': 'Audioplayer',
          'page_1_title': 'Das ist ein außergewöhnliches Programm',
          'page_1_body': '''
So können Sie Fremdsprachen lernen, während Sie entspannt am Telefon sitzen.

Dies ist ideal, um neue Wörter zu lernen oder bekannte Wörter zu wiederholen.
''',
          'page_2_title': 'In diesem Programm können Sie jede Website öffnen',
          'page_2_body':
              'Es können Ihre bevorzugten sozialen Netzwerke, Nachrichten, Online-Spiele, Filme oder Musik sein.',
          'page_3_title': 'Das Wichtigste steht ganz unten im Programm',
          'page_3_body': '''
Dort sehen Sie ein Feld, in dem Fremdwörter im Kreis gescrollt werden, bis Sie sie gelernt haben.

Dies geschieht, während Sie auf Ihrem Telefon sehen, was Sie möchten.
''',
          'page_4_title': 'Klicken Sie auf das Wort, wenn Sie es gelernt haben',
          'page_4_body': '''
Klicken Sie im angezeigten Menü auf Überspringen. Anstelle dieses Wortes wird das nächste Wort aus dem Wörterbuch ersetzt.

Tun Sie dies, bis Sie alles gelernt haben.
''',
          'page_5_title': 'Benutzen Sie ein Lesezeichen für die Websites, auf denen wir die meiste Zeit verbringen',
          'page_5_body': '''
Klicken Sie auf das Herz, um ein neues Lesezeichen hinzuzufügen.

Um Ihr Lesezeichen zu bearbeiten oder zu löschen, drücken Sie einfach lange darauf.
''',
          'page_6_title': 'Wählen Sie ein Wörterbuch oder erstellen Sie Ihr eigenes',
          'page_6_body': '''
Erstellen Sie besser Ihr eigenes Wörterbuch.

Fügen Sie Ihrem Wörterbuch die Wörter hinzu, die Sie selbst oft sagen oder in der Kommunikation treffen.
''',
          'page_7_title': 'Programmfunktionen',
          'page_7_body': '''
Wir hoffen, dass es so intuitiv ist, dass Sie es besser verstehen können.
*
Es funktioniert mit Webversionen beliebter Anwendungen. Sie haben ihre eigenen Eigenschaften, die wir nicht beeinflussen können. Entscheiden Sie selbst, was Ihnen wichtiger ist.
*
Sie können dieses Handbuch jederzeit öffnen, indem Sie im Menü auf das Fragezeichen klicken.
''',
          'page_8_title': 'Verbringen Sie Ihre Zeit produktiv am Telefon',
          'page_8_body':
              'Alles kann man lernen, wenn man es jeden Tag tut. Machen Sie es so, wie Sie sich wohl fühlen.',

          'skip': 'Nach',
          'done': 'Nicht zeigen',
          'update_page': 'Seite aktualisieren',

          'extra_hyphen':
              '(!) Lassen Sie 1 Bindestrich zwischen den Übersetzungen stehen. Ersetzen Sie den anderen durch einen Gedankenstrich.',

          'reading_times': 'Wie oft jeder Eintrag zu lesen ist — ',
          'reverse_order': 'In umgekehrter Reihenfolge speichern',
        },

        // 'fr_FR': {
        //   'slogan': 'Détendez-vous et étudiez',
        //   'share_content': 'Envoyer le contenu actuel à vos amis',
        //   'add_bookmark': 'Ajouter aux favoris',
        //   'clear_cache': 'Cache',
        //   'clear_cookies': 'Cookies',
        //   'backward_empty': 'L\'historique en arrière est vide',
        //   'forward_empty': 'L\'historique de transfert est vide',
        //   'cache_deleted': 'Le cache est supprimé',
        //   'cookies_deleted': 'Les cookies sont supprimés',
        //   'cookies_clean': 'Les cookies sont propres',
        //   'learned': 'Vous avez appris',
        //   'of': 'sur',
        //   'entries_in_dictionary': 'entrées dans le dictionnaire',
        // },
      };
}
