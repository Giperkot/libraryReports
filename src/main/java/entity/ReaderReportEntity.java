package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ReaderReportEntity {

    @Id
    @Column(name="id")
    private long id;

    @Column(name="last_name")
    private String lastName;

    @Column(name="first_name")
    private String firstName;

    @Column(name="middle_name")
    private String middleName;

    @Column(name="book_taken_count")
    private String bookTakenCount;

    @Column(name="book_return_count")
    private String bookReturnCount;

    @Column(name="genre")
    private String genre;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getBookTakenCount() {
        return bookTakenCount;
    }

    public void setBookTakenCount(String bookTakenCount) {
        this.bookTakenCount = bookTakenCount;
    }

    public String getBookReturnCount() {
        return bookReturnCount;
    }

    public void setBookReturnCount(String bookReturnCount) {
        this.bookReturnCount = bookReturnCount;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}
