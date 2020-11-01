package service;

import entity.BookReportEntity;
import entity.ReaderReportEntity;
import org.hibernate.Session;
import org.hibernate.query.Query;
import utils.HibernateSessionFactory;

import java.time.LocalDate;
import java.util.List;

public class Service {

    private static Service instance = new Service();

    public static Service getInstance () {
        return instance;
    }

    private Service() {
    }

    public List<BookReportEntity> getBookReport () {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();

        String sql = "select\n" +
                "       b.id,\n" +
                "       b.title,\n" +
                "       case\n" +
                "        when t2.return_date is not null then\n" +
                "            'Библиотека'\n" +
                "        when t2.take_date is not null and t2.return_date is null then\n" +
                "            r.last_name || ' ' || r.first_name || ' ' || coalesce(r.middle_name, '')\n" +
                "        when t2.return_date is null and t2.take_date is null then\n" +
                "            'Библиотека'\n" +
                "        end as current_place\n" +
                "from book b\n" +
                "    left join (select * from\n" +
                "    (select *, row_number() over (partition by tbf.book_id order by take_date desc) row_number\n" +
                "     from take_book_fact tbf) t1\n" +
                "          where row_number = 1) t2 on t2.book_id = b.id\n" +
                "    left join reader r on r.id = t2.reader_id\n" +
                "order by b.id;";

        Query<BookReportEntity> query = session.createNativeQuery(sql, BookReportEntity.class);

        return query.getResultList();
    }

    public List<ReaderReportEntity> getReaderRepert (LocalDate dateFrom, LocalDate dateTo) {

        Session session = HibernateSessionFactory.getSessionFactory().openSession();

        String whereClause = "";

        if (dateFrom != null || dateTo != null) {
//            whereClause = " where ";

            if (dateTo == null ) {
                whereClause = " where (tbf.take_date >= :dateFrom)";
            }

            if (dateFrom == null) {
                whereClause = " where (tbf.take_date <= :dateTo)";
            }

            if (dateFrom != null && dateTo != null) {
                whereClause = " where (tbf.take_date >= :dateFrom) and (tbf.take_date <= :dateTo)";
            }
        }

        String sql = "select\n" +
                "    r.id, r.last_name, r.first_name, r.middle_name,\n" +
                "    count(tbf.take_date) book_taken_count,\n" +
                "    count(tbf.return_date) book_return_count,\n" +
                "    (select genre from (\n" +
                "           select b2.genre, count(b2.id) as genre_count\n" +
                "           from take_book_fact tbf2\n" +
                "                    join book b2 on b2.id = tbf2.book_id\n" +
                "           where tbf2.reader_id = r.id\n" +
                "           group by b2.genre\n" +
                "           order by genre_count desc\n" +
                "           limit 1\n" +
                "       ) t3) as genre\n" +
                "from reader r\n" +
                "    left join take_book_fact tbf on r.id = tbf.reader_id\n" +
                "    left join book b on b.id = tbf.book_id\n" +
                whereClause +
                " group by\n" +
                "    r.id, r.last_name, r.first_name, r.middle_name\n" +
                "order by r.id;";

        Query<ReaderReportEntity> query = session.createNativeQuery(sql, ReaderReportEntity.class);

        if (dateFrom != null) {
            query.setParameter("dateFrom", dateFrom);
        }

        if (dateTo != null) {
            query.setParameter("dateTo", dateTo);
        }

        return query.getResultList();
    }

}
