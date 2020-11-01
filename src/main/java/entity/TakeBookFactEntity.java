package entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "take_book_fact", schema = "public", catalog = "library")
public class TakeBookFactEntity {
    private long id;
    private Timestamp createTime;
    private Timestamp takeDate;
    private Timestamp returnDate;

    @Id
    @Column(name = "id", nullable = false)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "create_time", nullable = false)
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "take_date", nullable = false)
    public Timestamp getTakeDate() {
        return takeDate;
    }

    public void setTakeDate(Timestamp takeDate) {
        this.takeDate = takeDate;
    }

    @Basic
    @Column(name = "return_date", nullable = true)
    public Timestamp getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Timestamp returnDate) {
        this.returnDate = returnDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TakeBookFactEntity that = (TakeBookFactEntity) o;
        return id == that.id &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(takeDate, that.takeDate) &&
                Objects.equals(returnDate, that.returnDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, createTime, takeDate, returnDate);
    }
}
