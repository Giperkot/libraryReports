package fx;

import entity.BookReportEntity;
import entity.ReaderReportEntity;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.DatePicker;
import javafx.scene.control.SelectionMode;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import service.Service;

import java.time.LocalDate;
import java.util.List;

public class MainController {

    @FXML
    private TableView bookReportTableView;

    @FXML
    private TableView readerReportTableView;

    @FXML
    private DatePicker periodFromDateField;

    @FXML
    private DatePicker periodToDateField;


    public void init () {
        ObservableList<TableColumn> columnList = bookReportTableView.getColumns();

        for (int i = 0; i < columnList.size(); i++) {

            TableColumn tableColumn = columnList.get(i);

            switch (i) {
                case 0:
                    tableColumn.setCellValueFactory(new PropertyValueFactory<>("id"));
                    break;
                case 1:
                    tableColumn.setCellValueFactory(new PropertyValueFactory<>("title"));
                    break;
                case 2:
                    tableColumn.setCellValueFactory(new PropertyValueFactory<>("currentPlace"));
                    break;
            }
        }

        ObservableList<TableColumn> columnList2 = readerReportTableView.getColumns();

        for (int i = 0; i < columnList2.size(); i++) {

            TableColumn tableColumn = columnList2.get(i);

            switch (i) {
                case 0:
                    tableColumn.setCellValueFactory(new PropertyValueFactory<>("id"));
                    break;
                case 1:
                    tableColumn.setCellValueFactory(new PropertyValueFactory<>("lastName"));
                    break;
                case 2:
                    tableColumn.setCellValueFactory(new PropertyValueFactory<>("firstName"));
                    break;
                case 3:
                    tableColumn.setCellValueFactory(new PropertyValueFactory<>("middleName"));
                    break;
                case 4:
                    tableColumn.setCellValueFactory(new PropertyValueFactory<>("bookTakenCount"));
                    break;
                case 5:
                    tableColumn.setCellValueFactory(new PropertyValueFactory<>("bookReturnCount"));
                    break;
                case 6:
                    tableColumn.setCellValueFactory(new PropertyValueFactory<>("genre"));
                    break;
            }
        }


//        bookReportTableView.getSelectionModel().setCellSelectionEnabled(true);
//        bookReportTableView.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
    }


    @FXML
    private void getBooksReport () {
        System.out.println("getBooksReport");
        bookReportTableView.setVisible(true);
//        readerReportTableView.setDisable(true);
        readerReportTableView.setVisible(false);

        List<BookReportEntity> reportList = Service.getInstance().getBookReport();

        ObservableList<BookReportEntity> taskTableList = FXCollections.observableArrayList(reportList);

        bookReportTableView.setItems(taskTableList);
    }

    @FXML
    private void getReaderReport () {
        bookReportTableView.setVisible(false);
        readerReportTableView.setVisible(true);

        LocalDate dateFrom = periodFromDateField.getValue();

        LocalDate dateTo = periodToDateField.getValue();

        List<ReaderReportEntity> reportList = Service.getInstance().getReaderRepert(dateFrom, dateTo);

        ObservableList<ReaderReportEntity> taskTableList = FXCollections.observableArrayList(reportList);

        readerReportTableView.setItems(taskTableList);
    }

}
