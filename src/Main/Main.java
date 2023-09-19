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
            new Interfaz_Admin().setVisible(true);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
