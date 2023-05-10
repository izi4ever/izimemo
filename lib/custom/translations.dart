import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
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
          'skip_entry': 'Skip this entry (learned, rarely use or repeat later), swipe entry up',
          'move_later': 'Move this entry on later (double tap on entry)',
          'edit_entry': 'Edit this entry (long press on entry)',
          'add_entries': 'Add new entries',
          'delete_entry': 'Delete this entry',
          'create_dictionary': 'Create dictionary',
          'settings_page_title': 'Settings',
          'entries_in_lesson': 'Number of entries per lesson — ',
          'seconds_per_entry': 'Seconds for showing entry — ',
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
          'read_words': 'Read words (with speech synthesizer in phone)',
          'reading_speed': 'Reading speed — ',
          'background_volume': 'Other content volume — ',
          'audio_player': 'Audio Player',
        },
        'ru_RU': {
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
          'skip_entry': 'Пропустить эту запись (выучил, редко использую или повторю потом), свайп вверх по записи',
          'move_later': 'Отложить эту запись на потом (двойной тап по записи)',
          'edit_entry': 'Редактировать эту запись (длинное нажатие)',
          'add_entries': 'Добавить новые записи',
          'delete_entry': 'Удалить эту запись',
          'create_dictionary': 'Создать словарь',
          'settings_page_title': 'Настройки',
          'entries_in_lesson': 'Количество записей в уроке — ',
          'seconds_per_entry': 'Секунд для показа одной записи — ',
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
          'read_words': 'Читать слова (с помощью синтезатора речи в телефоне)',
          'reading_speed': 'Скорость чтения — ',
          'background_volume': 'Громкость остального контента — ',
          'audio_player': 'Аудио плеер',
        },
        'uk_UA': {
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
          'skip_entry': 'Пропустити цей запис (вивчив, рідко використовую або повторю потім), свайп вверх по запису',
          'move_later': 'Відкласти цей запись на потім (подвійний тап по запису)',
          'edit_entry': 'Редагувати цей запис (довге натискання)',
          'add_entries': 'Додати нові записи',
          'delete_entry': 'Видалити цей запис',
          'create_dictionary': 'Створити словник',
          'settings_page_title': 'Налаштування',
          'entries_in_lesson': 'Кількість записів в уроці — ',
          'seconds_per_entry': 'Секунд для показу кожного запису — ',
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
          'read_words': 'Читати слова (за допомогою синтезатору мови в телефоні)',
          'reading_speed': 'Швидкість читання — ',
          'background_volume': 'Гучність іншого контенту — ',
          'audio_player': 'Аудіо плеєр',
        },
        'de_DE': {
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
          'skip_entry': 'Diesen Eintrag überspringen (erlernt, selten verwenden oder später wiederholen), Eintrag nach oben wischen',
          'move_later': 'Verschieben Sie diesen Beitrag auf später (doppeltippen)',
          'edit_entry': 'Bearbeite diesen Eintrag (lange drücken)',
          'add_entries': 'Neue Einträge hinzufügen',
          'delete_entry': 'Löschen Sie diesen Eintrag',
          'create_dictionary': 'Wörterbuch erstellen',
          'settings_page_title': 'Einstellungen',
          'entries_in_lesson': 'Anzahl der Einträge pro Lektion — ',
          'seconds_per_entry': 'Sekunden zum Anzeigen des Eintrags — ',
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
          'read_words': 'Wörter lesen (mit dem Sprachsynthesizer Ihres Telefons)',
          'reading_speed': 'Lesevolumen — ',
          'background_volume': 'Umfang anderer Inhalte — ',
          'audio_player': 'Audioplayer',
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
