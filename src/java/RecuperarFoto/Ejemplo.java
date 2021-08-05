package RecuperarFoto;

import ConexionBD.BDConexion;
import java.awt.Image;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author EDDY
 */
public class Ejemplo {
    Connection conex;
    PreparedStatement Pst;
    ResultSet Rs;
    Image data;
    byte[] bite=null;
    public Ejemplo(){
        conex = BDConexion.Singleton().ConectarBD();
        
        
    }
    //Esta metodo fue creado para facilitar y ahorrar lineas de codigo al momento de mostrar el catalogo de ganado
    //Cada  linea de nuestra pagina tendra espacio para 4 fotos de los ganados
    
    
    
        //metodo que dada una cadena de bytes la convierte en una imagen con extension jpeg
    private Image ConvertirImagen(byte[] bytes) throws IOException {
        ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
        Iterator readers = ImageIO.getImageReadersByFormatName("jpeg");
        ImageReader reader = (ImageReader) readers.next();
        Object source = bis; // File or InputStream
        ImageInputStream iis = ImageIO.createImageInputStream(source);
        reader.setInput(iis, true);
        ImageReadParam param = reader.getDefaultReadParam();
        return reader.read(0, param);
    }
    
    public Image recuperarfotos() {

        try {
            String Query = "SELECT * FROM ganado where IdGanado=4005";
            Pst = conex.prepareStatement(Query);
            Rs = Pst.executeQuery();
            int i = 0;
                while (Rs.next()) {
                    // se lee la cadena de bytes de la base de datos
                    byte[] b = Rs.getBytes("Imagen");
                    //esta cadena de bytes sera convertida en una imagen
                    data = ConvertirImagen(b);                   
                    i++;
                }
            Rs.close();
        } catch (IOException | SQLException ex) {
            
        }
        return data;

    }
     public ImageIcon cargarfoto() {
        ConexionBD.Ejemplo f = new ConexionBD.Ejemplo();
        Image dtCat = recuperarfotos();
        ImageIcon icon = new ImageIcon(dtCat);
        //Se extrae la imagen del icono
        Image img = icon.getImage();
        //Se modifica su tamaño
        Image newimg = img.getScaledInstance(400, 300, java.awt.Image.SCALE_SMOOTH);
        //SE GENERA EL IMAGE ICON CON LA NUEVA IMAGEN
        ImageIcon newIcon = new ImageIcon(newimg);
        //Se coloca el nuevo icono modificado
        if (newIcon == null) 
            JOptionPane.showMessageDialog(null, "no tiene imagen","ADVERTENCIA",JOptionPane.ERROR);
        
        return newIcon;
     }
     
     
      public byte[] Foto() {

        try {
            String Query = "SELECT * FROM ganado where IdGanado=4005";
            Pst = conex.prepareStatement(Query);
            Rs = Pst.executeQuery();
            
            int i = 0;
                while (Rs.next()) {
                    // se lee la cadena de bytes de la base de datos
                    bite = Rs.getBytes("Imagen");
                    //esta cadena de bytes sera convertida en una imagen
                    data = ConvertirImagen(bite);                   
                    i++;
                }
            Rs.close();
        } catch (IOException | SQLException ex) {
            
        }
        return bite;

    }
    
}
