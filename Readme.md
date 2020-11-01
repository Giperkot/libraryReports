

# Вступительное задание на курс Хранилища данных

## Необходимо
1. Postgre SQL 10 или выше
2. Java 8 (именно эта версия)
3. Maven 3.3.9 или более поздняя версия. Или Intellij Idea Built in.

## Инструкция по запуску 
1. Создать БД: library 
2. Войти src/main/resources/hibernate.cfg.xml \
    поменять **логин / пароль** на ваши (По умолчанию - owner: **postgres** password: **1**)
3. Накатить скрипты из файла src/sqlScripts/dump.sql (**структура и данные**)
4. Запустить команду \
    **mvn clean install**

5. **Запускать командой** \
    java -jar target/library-1.0-SNAPSHOT-jar-with-dependencies.jar
    
Либо запустить через Intellij Idea \
    **Main.java**
