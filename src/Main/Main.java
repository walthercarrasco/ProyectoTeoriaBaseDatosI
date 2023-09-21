package Main;

import com.formdev.flatlaf.FlatDarkLaf;

/**
 *
 * @author Walther Carrasco
 */
public class Main {
    public static void main(String[] args) {
        try{
            javax.swing.UIManager.setLookAndFeel(new FlatDarkLaf());
            new DB_Login().setVisible(true);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
