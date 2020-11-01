/**
    Да, тут пригодились бы индексы. Но кому они нужны?
 */

/**
    DDL
 */

create table author (
    id bigserial not null primary key,
    create_time timestamp not null default now(),
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    middle_name varchar(255)
);

create table book (
    id bigserial not null primary key,
    create_time timestamp not null default now(),
    title varchar(255) not null,
    author_id bigint not null
                  references author(id)
);

alter table book
    add column genre varchar(255) not null default 'Художественная';

create table reader (
    id bigserial not null primary key,
    create_time timestamp not null default now(),
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    middle_name varchar(255)
);

create table take_book_fact (
    id bigserial not null primary key,
    create_time timestamp not null default now(),
    take_date timestamp not null,
    return_date timestamp,
    book_id bigint not null
                            references book(id),
    reader_id bigint not null
                            references reader(id)
);


/**
    DATA
 */

INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (1, '2020-10-31 13:59:47.692161', 'Брюс', 'Эккель', null);
INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (2, '2020-10-31 13:59:47.692161', 'Эдгар', 'Берроуз', null);
INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (3, '2020-10-31 13:59:47.692161', 'Дж.', 'Ронни', null);
INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (4, '2020-10-31 13:59:47.692161', 'Аллан', 'Пиз', null);
INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (5, '2020-10-31 13:59:47.692161', 'Артур Конан', 'Дойл', null);
INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (6, '2020-10-31 13:59:47.692161', 'Аркадий, Борис', 'Стригацкие', null);
INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (7, '2020-10-31 13:59:47.692161', 'Роберт', 'Киосаки', null);
INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (8, '2020-10-31 13:59:47.692161', 'Джордж', 'Мартин', null);
INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (9, '2020-10-31 13:59:47.692161', 'Энтони', 'Бёрджес', null);
INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (10, '2020-10-31 13:59:47.692161', 'А.', 'Чертов', null);
INSERT INTO public.author (id, create_time, first_name, last_name, middle_name) VALUES (11, '2020-10-31 13:59:47.692161', 'Jeanne', 'Boyarsky', null);

INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (2, '2020-10-31 14:08:04.395253', 'Принцесса Марса', 2, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (3, '2020-10-31 14:08:04.395253', 'Борьба за огонь', 3, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (5, '2020-10-31 14:08:04.395253', 'Загадка Старка Монро', 5, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (6, '2020-10-31 14:08:04.395253', 'Тружно быть богом', 6, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (8, '2020-10-31 14:08:04.395253', 'Игра престоволо', 8, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (9, '2020-10-31 14:08:04.395253', 'Битва королей', 8, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (10, '2020-10-31 14:08:04.395253', 'Буря мечей', 8, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (11, '2020-10-31 14:08:04.395253', 'Пир стервятников', 8, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (12, '2020-10-31 14:08:04.395253', 'Танец с драконами', 8, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (13, '2020-10-31 14:08:04.395253', 'Ветра зимы =(', 8, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (14, '2020-10-31 14:08:04.395253', 'Заводной апельсин', 9, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (16, '2020-10-31 14:08:04.395253', 'Шерлок холмс', 5, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (17, '2020-10-31 14:08:04.395253', 'Межевой рыцарь', 8, 'Художественная');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (1, '2020-10-31 14:08:04.395253', 'Философия Java', 1, 'Java');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (7, '2020-10-31 14:08:04.395253', 'Богатый папа, бедный папа', 7, 'Финансы');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (18, '2020-10-31 14:08:04.395253', 'Oracle Certified Associate Java SE 8 Programmer I', 11, 'Java');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (4, '2020-10-31 14:08:04.395253', 'Язык телодолвижений', 4, 'Обучающее');
INSERT INTO public.book (id, create_time, title, author_id, genre) VALUES (15, '2020-10-31 14:08:04.395253', 'Задачник по Физике', 10, 'Физика');

INSERT INTO public.reader (id, create_time, first_name, last_name, middle_name) VALUES (1, '2020-10-31 14:09:45.034129', 'Петя', 'Иванов', null);
INSERT INTO public.reader (id, create_time, first_name, last_name, middle_name) VALUES (2, '2020-10-31 14:09:45.034129', 'Илья', 'Костицин', null);
INSERT INTO public.reader (id, create_time, first_name, last_name, middle_name) VALUES (3, '2020-10-31 14:09:45.034129', 'Маша', 'Метёлкина', null);

INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (1, '2020-10-31 14:21:42.679317', '2020-01-31 14:11:05.206000', '2020-02-05 14:11:05.206000', 1, 1);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (2, '2020-10-31 14:21:42.679317', '2020-01-31 14:11:05.206000', '2020-02-04 14:11:05.206000', 2, 2);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (3, '2020-10-31 14:21:42.679317', '2020-02-05 14:11:05.206000', '2020-02-27 14:11:05.206000', 1, 3);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (4, '2020-10-31 14:21:42.679317', '2020-02-05 14:11:05.206000', '2020-05-05 14:11:05.206000', 2, 1);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (5, '2020-10-31 14:21:42.679317', '2020-02-05 14:11:05.206000', '2020-02-10 14:11:05.206000', 3, 2);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (6, '2020-10-31 14:21:42.679317', '2020-02-15 14:11:05.206000', '2020-02-25 14:11:05.206000', 3, 3);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (7, '2020-10-31 14:21:42.679317', '2020-01-31 14:11:05.206000', '2020-08-31 14:11:05.206000', 4, 1);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (8, '2020-10-31 14:21:42.679317', '2020-07-31 14:12:39.836000', '2020-03-31 14:11:05.206000', 2, 2);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (9, '2020-10-31 14:21:42.679317', '2020-02-15 14:11:05.206000', '2020-03-31 14:11:05.206000', 6, 3);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (10, '2020-10-31 14:21:42.679317', '2020-02-29 14:11:05.206000', '2020-03-31 14:11:05.206000', 1, 1);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (11, '2020-10-31 14:21:42.679317', '2020-10-31 14:13:35.337000', '2020-07-31 14:11:05.206000', 7, 2);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (12, '2020-10-31 14:21:42.679317', '2020-04-30 14:11:05.206000', '2020-06-30 14:11:05.206000', 8, 3);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (13, '2020-10-31 14:21:42.679317', '2020-04-30 14:11:05.206000', '2020-06-30 14:11:05.206000', 9, 1);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (14, '2020-10-31 14:21:42.679317', '2020-04-30 14:11:05.206000', '2020-06-30 14:11:05.206000', 10, 2);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (15, '2020-10-31 14:21:42.679317', '2020-04-30 14:11:05.206000', '2020-06-30 14:11:05.206000', 11, 3);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (16, '2020-10-31 14:21:42.679317', '2020-04-30 14:11:05.206000', '2020-06-30 14:11:05.206000', 12, 1);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (17, '2020-10-31 14:21:42.679317', '2020-09-15 14:11:05.206000', '2020-10-15 14:11:05.206000', 3, 2);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (18, '2020-10-31 14:21:42.679317', '2020-08-31 14:11:05.206000', '2020-11-30 14:11:05.206000', 14, 3);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (19, '2020-10-31 14:21:42.679317', '2020-08-31 14:11:05.206000', null, 12, 1);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (20, '2020-10-31 14:21:42.679317', '2020-04-29 14:11:05.206000', '2020-11-30 14:11:05.206000', 1, 2);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (21, '2020-10-31 14:21:42.679317', '2020-10-31 14:12:39.836000', null, 2, 3);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (22, '2020-10-31 14:21:42.679317', '2020-10-16 14:11:05.206000', null, 3, 1);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (23, '2020-10-31 14:21:42.679317', '2020-10-31 14:11:05.206000', '2020-11-30 14:11:05.206000', 4, 2);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (24, '2020-10-31 14:21:42.679317', '2020-08-31 14:11:05.206000', null, 5, 3);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (25, '2020-10-31 14:21:42.679317', '2020-08-31 14:11:05.206000', '2020-11-30 14:11:05.206000', 6, 1);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (26, '2020-10-31 14:21:42.679317', '2020-08-31 14:11:05.206000', null, 7, 2);
INSERT INTO public.take_book_fact (id, create_time, take_date, return_date, book_id, reader_id) VALUES (27, '2020-10-31 14:21:42.679317', '2020-08-31 14:11:05.206000', '2020-11-30 14:11:05.206000', 8, 3);




-- Отчёт по местонахождению книг.
/*select
       b.id,
       b.title,
       case
        when t2.return_date is not null then
            'Библиотека'
        when t2.take_date is not null and t2.return_date is null then
            r.last_name || ' ' || r.first_name || ' ' || coalesce(r.middle_name, '')
        when t2.return_date is null and t2.take_date is null then
            'Библиотека'
        end as current_place
from book b
    left join (select * from
    (select *, row_number() over (partition by tbf.book_id order by take_date desc) row_number
     from take_book_fact tbf) t1
          where row_number = 1) t2 on t2.book_id = b.id
    left join reader r on r.id = t2.reader_id
order by b.id;



select
    r.id, r.last_name, r.first_name, r.middle_name,
    count(tbf.take_date) book_taken_count,
    count(tbf.return_date) book_taken_count,
    (select genre from (
           select b2.genre, count(b2.id) as genre_count
           from take_book_fact tbf2
                    join book b2 on b2.id = tbf2.book_id
           where tbf2.reader_id = r.id
           group by b2.genre
           order by genre_count desc
           limit 1
       ) t3)
from reader r
    left join take_book_fact tbf on r.id = tbf.reader_id
    left join book b on b.id = tbf.book_id
group by
    r.id, r.last_name, r.first_name, r.middle_name
order by r.id;*/

























