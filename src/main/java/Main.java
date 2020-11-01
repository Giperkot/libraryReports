import fx.MainController;
import javafx.application.Application;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import utils.HibernateSessionFactory;



/**
 * Created by istvolov on 28.06.19.
 */
public class Main extends Application {



    public static void main (String... args) {

        Main main = new Main();

        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("userForm.fxml"));

        Parent root = loader.load();
        primaryStage.setTitle("LibraryReport");
        primaryStage.setScene(new Scene(root, 800, 600));
        primaryStage.show();

        MainController controller = loader.getController();
        controller.init();

        primaryStage.setOnCloseRequest((new EventHandler<WindowEvent>() {
            public void handle(WindowEvent we) {
                HibernateSessionFactory.shutdown();
            }
        }));
    }
}
