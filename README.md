# The School magazine
## Гайд по налаштуванню і запуску проекту
### База даних

Для коректної роботи бази даних необхідно встановити **MySql**(бажано останю версію) і MySql WorkBanch.

Після встановлення MySql потрібно імпортувати базу даних із папки DataBase. Ость відео гайд по імпорту (https://youtu.be/fX4-YiXxTn0?si=KbNfpu4lsepkIoAS).

Потім створити нового користувача в MySql за допомогою команди:
    CREATE USER "NewUser"@"localhost" IDENTIFIED BY "12345";
i:
    GRANT ALL ON * TO "NewUser"@"localhost";

Вітаю ти встановив і налаштував базу даних, але це ще не кінець.

### Налаштування проекту

Відкрийте скачаний проект в Intellij IDEA. Теперки необхадно завантижити необхадні пакети. Як це зробити показано у відео 1 **1 як завантажити пакети.mp4** в папці Video Tutorial.

В Intellij IDEA змініть Global encoding на windows-1251 або UTF-16

### Запуск програми

Коли необхідні пакети завантижаться, відкрийте термінал за допосогою клавіш **alt+f12**, або натисніть на кнопку в лівому нижньому кутку Terminal.

В терміналі введать таку команду:
    mvn clean javafx:run

Вона запустить програму.
Перед початком роботи з програмою, раджу ознийомитись із файлом **ВАЖЛИВІ нюанси в програмі.txt**