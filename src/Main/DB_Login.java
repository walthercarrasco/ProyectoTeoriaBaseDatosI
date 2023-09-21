/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import com.formdev.flatlaf.FlatDarkLaf;
import java.awt.Color;
import javax.swing.UIManager;

/**
 *
 * @author emile
 */
public class DB_Login extends javax.swing.JFrame {

    /**
     * Creates new form NewJFrame
     */
    public DB_Login() {
        initComponents();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jSeparator2 = new javax.swing.JSeparator();
        L_Titulo = new javax.swing.JLabel();
        jSeparator1 = new javax.swing.JSeparator();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        L_Usuario = new javax.swing.JLabel();
        TF_Usuario = new javax.swing.JTextField();
        jSeparator7 = new javax.swing.JSeparator();
        BT_Ingresar = new javax.swing.JButton();
        L_Contraseña = new javax.swing.JLabel();
        PF_Password = new javax.swing.JPasswordField();
        jSeparator9 = new javax.swing.JSeparator();
        BT_VerPassword = new javax.swing.JButton();
        Login_BG = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setLocation(new java.awt.Point(200, 100));
        setResizable(false);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jSeparator2.setBackground(new java.awt.Color(0, 102, 255));
        jSeparator2.setForeground(new java.awt.Color(0, 102, 255));
        jSeparator2.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jSeparator2.setOpaque(true);
        getContentPane().add(jSeparator2, new org.netbeans.lib.awtextra.AbsoluteConstraints(680, 90, 11, 74));

        L_Titulo.setFont(new java.awt.Font("Microsoft JhengHei", 1, 55)); // NOI18N
        L_Titulo.setForeground(new java.awt.Color(204, 204, 204));
        L_Titulo.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        L_Titulo.setText("BD");
        getContentPane().add(L_Titulo, new org.netbeans.lib.awtextra.AbsoluteConstraints(380, 90, 300, -1));

        jSeparator1.setBackground(new java.awt.Color(0, 102, 255));
        jSeparator1.setForeground(new java.awt.Color(0, 102, 255));
        jSeparator1.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jSeparator1.setOpaque(true);
        getContentPane().add(jSeparator1, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 90, 11, 74));

        jLabel1.setFont(new java.awt.Font("Microsoft JhengHei", 1, 30)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Iniciar Sesión");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(430, 200, 210, -1));

        jLabel2.setFont(new java.awt.Font("Microsoft JhengHei", 0, 14)); // NOI18N
        jLabel2.setText("Acceda a su Cuenta");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 250, -1, -1));
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 90, 80, 80));

        L_Usuario.setFont(new java.awt.Font("Microsoft JhengHei", 0, 18)); // NOI18N
        L_Usuario.setText("Nombre de Usuario");
        getContentPane().add(L_Usuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 340, -1, -1));

        TF_Usuario.setBackground(new java.awt.Color(33, 33, 33));
        TF_Usuario.setFont(new java.awt.Font("Microsoft JhengHei", 0, 16)); // NOI18N
        TF_Usuario.setForeground(java.awt.Color.darkGray);
        TF_Usuario.setText("Ingrese su nombre de usuario");
        TF_Usuario.setActionCommand("<Not Set>");
        TF_Usuario.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(33, 33, 33)));
        TF_Usuario.setOpaque(true);
        TF_Usuario.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                TF_UsuarioFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                TF_UsuarioFocusLost(evt);
            }
        });
        TF_Usuario.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TF_UsuarioKeyPressed(evt);
            }
        });
        getContentPane().add(TF_Usuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 340, 370, 31));

        jSeparator7.setBackground(new java.awt.Color(153, 153, 153));
        jSeparator7.setForeground(new java.awt.Color(204, 204, 204));
        jSeparator7.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jSeparator7.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        getContentPane().add(jSeparator7, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 330, -1, 50));

        BT_Ingresar.setBackground(new java.awt.Color(0, 0, 204));
        BT_Ingresar.setFont(new java.awt.Font("Microsoft JhengHei", 1, 18)); // NOI18N
        BT_Ingresar.setForeground(new java.awt.Color(193, 193, 193));
        BT_Ingresar.setText("Ingresar");
        BT_Ingresar.setBorderPainted(false);
        BT_Ingresar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        BT_Ingresar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                BT_IngresarMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                BT_IngresarMouseExited(evt);
            }
        });
        BT_Ingresar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BT_IngresarActionPerformed(evt);
            }
        });
        getContentPane().add(BT_Ingresar, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 500, 330, -1));

        L_Contraseña.setFont(new java.awt.Font("Microsoft JhengHei", 0, 18)); // NOI18N
        L_Contraseña.setText("Contraseña");
        getContentPane().add(L_Contraseña, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 420, -1, -1));

        PF_Password.setBackground(new java.awt.Color(33, 33, 33));
        PF_Password.setFont(new java.awt.Font("Microsoft JhengHei", 0, 16)); // NOI18N
        PF_Password.setForeground(java.awt.Color.white);
        PF_Password.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(33, 33, 33)));
        PF_Password.setOpaque(true);
        PF_Password.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                PF_PasswordFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                PF_PasswordFocusLost(evt);
            }
        });
        PF_Password.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                PF_PasswordActionPerformed(evt);
            }
        });
        PF_Password.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                PF_PasswordKeyPressed(evt);
            }
        });
        getContentPane().add(PF_Password, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 420, 340, 31));

        jSeparator9.setBackground(new java.awt.Color(153, 153, 153));
        jSeparator9.setForeground(new java.awt.Color(204, 204, 204));
        jSeparator9.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jSeparator9.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        getContentPane().add(jSeparator9, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 410, -1, 50));

        BT_VerPassword.setBackground(new java.awt.Color(33, 33, 33));
        BT_VerPassword.setFont(new java.awt.Font("Microsoft JhengHei", 0, 18)); // NOI18N
        BT_VerPassword.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/Eye Icon.png"))); // NOI18N
        BT_VerPassword.setToolTipText("Ver Contraseña");
        BT_VerPassword.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(33, 33, 33)));
        BT_VerPassword.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        BT_VerPassword.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                BT_VerPasswordMousePressed(evt);
            }
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                BT_VerPasswordMouseReleased(evt);
            }
        });
        getContentPane().add(BT_VerPassword, new org.netbeans.lib.awtextra.AbsoluteConstraints(690, 420, 30, 31));

        Login_BG.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/Login BG.jpg"))); // NOI18N
        getContentPane().add(Login_BG, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1060, 620));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void TF_UsuarioFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_TF_UsuarioFocusGained
        if (TF_Usuario.getText().contains("Ingrese su nombre de usuario")) {
            TF_Usuario.setForeground(Color.white);
            TF_Usuario.setText("");
        } else if (!TF_Usuario.getText().isEmpty() && !TF_Usuario.getText().contains("Ingrese su nombre de usuario")) {
            TF_Usuario.setForeground(Color.white);
        }
    }//GEN-LAST:event_TF_UsuarioFocusGained

    private void TF_UsuarioFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_TF_UsuarioFocusLost
        if (TF_Usuario.getText().isEmpty()) {
            TF_Usuario.setForeground(Color.DARK_GRAY);
            TF_Usuario.setText("Ingrese su nombre de usuario");
        } else if (!TF_Usuario.getText().isEmpty() && !TF_Usuario.getText().contains("Ingrese su nombre de usuario")) {
            TF_Usuario.setForeground(Color.white);
        }
    }//GEN-LAST:event_TF_UsuarioFocusLost

    private void TF_UsuarioKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TF_UsuarioKeyPressed
        if (evt.getKeyCode() == evt.VK_ENTER) {

            PF_Password.requestFocusInWindow();

            if (PF_Password.getText().equals(" Ingrese su contraseña")) {
                PF_Password.setForeground(Color.white);
                PF_Password.setText("");
                PF_Password.setEchoChar('•');
            }
            if (TF_Usuario.getText().isEmpty()) {
                TF_Usuario.setForeground(Color.DARK_GRAY);
                TF_Usuario.setText("Ingrese su nombre de usuario");
            } else if (!TF_Usuario.getText().isEmpty() && !TF_Usuario.getText().contains("Ingrese su nombre de usuario")) {
                TF_Usuario.setForeground(Color.white);
            }
        }
    }//GEN-LAST:event_TF_UsuarioKeyPressed

    private void BT_IngresarMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_BT_IngresarMouseEntered
        BT_Ingresar.setBackground(new Color(0, 216, 224));
        BT_Ingresar.setForeground(new Color(51, 51, 51));
    }//GEN-LAST:event_BT_IngresarMouseEntered

    private void BT_IngresarMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_BT_IngresarMouseExited
        BT_Ingresar.setBackground(new Color(0, 0, 204));
        BT_Ingresar.setForeground(new Color(193, 193, 193));
    }//GEN-LAST:event_BT_IngresarMouseExited

    private void BT_IngresarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BT_IngresarActionPerformed
        /*
        Personal_Interfaz_Admin Interfaz = new Personal_Interfaz_Admin();
        Interfaz.setVisible(true);

        this.setVisible(false);
        this.dispose();        
        */
    }//GEN-LAST:event_BT_IngresarActionPerformed

    private void PF_PasswordFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_PF_PasswordFocusGained
        if (PF_Password.getText().equals(" Ingrese su contraseña")) {
            PF_Password.setForeground(Color.white);
            PF_Password.setText("");
            PF_Password.setEchoChar('•');
        }
    }//GEN-LAST:event_PF_PasswordFocusGained

    private void PF_PasswordFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_PF_PasswordFocusLost
        if (PF_Password.getText().isEmpty()) {
            PF_Password.setForeground(Color.DARK_GRAY);
            PF_Password.setText(" Ingrese su contraseña");
            PF_Password.setEchoChar((char) 0);
        }
    }//GEN-LAST:event_PF_PasswordFocusLost

    private void PF_PasswordKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_PF_PasswordKeyPressed

        if (evt.getKeyCode() == evt.VK_ENTER) {
            BT_Ingresar.doClick();
        }
    }//GEN-LAST:event_PF_PasswordKeyPressed

    private void BT_VerPasswordMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_BT_VerPasswordMousePressed
        PF_Password.setEchoChar((char) 0);
    }//GEN-LAST:event_BT_VerPasswordMousePressed

    private void BT_VerPasswordMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_BT_VerPasswordMouseReleased
        PF_Password.setEchoChar('•');
    }//GEN-LAST:event_BT_VerPasswordMouseReleased

    private void PF_PasswordActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_PF_PasswordActionPerformed

    }//GEN-LAST:event_PF_PasswordActionPerformed

    /*
    public static void main(String args[]) {
        try {
            UIManager.setLookAndFeel(new FlatDarkLaf());
        } catch (Exception e) {
            e.printStackTrace();
        }

        /* Create and display the form *
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Personal_DB_Login().setVisible(true);
            }
        });
    }
    */

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton BT_Ingresar;
    private javax.swing.JButton BT_VerPassword;
    private javax.swing.JLabel L_Contraseña;
    private javax.swing.JLabel L_Titulo;
    private javax.swing.JLabel L_Usuario;
    private javax.swing.JLabel Login_BG;
    private javax.swing.JPasswordField PF_Password;
    private javax.swing.JTextField TF_Usuario;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JSeparator jSeparator7;
    private javax.swing.JSeparator jSeparator9;
    // End of variables declaration//GEN-END:variables
private void T_Visible_Inventario() {

    }

}
