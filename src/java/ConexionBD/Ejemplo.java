package ConexionBD;

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
    
    public Ejemplo(){
        
    }
    //Esta metodo fue creado para facilitar y ahorrar lineas de codigo al momento de mostrar el catalogo de ganado
    //Cada  linea de nuestra pagina tendra espacio para 4 fotos de los ganados
    public String catalogo(){
        
        String HtmlCode = "<div class=\"row\">";//Creo una variable para almcenar nuestro codigo de html
        int cont = 0;//Este contrador nos ayudara a verificar cuantos elementos van por cada linea
        
            for(int i=0; i<40;i++){ //Este ciclo recorrera todos los elementos de la base de datos
                cont++;
                if(cont==4){//Evaluo si ya hay cuatro filas en la pagina, si es asi me salto a la siguente linea
                    System.err.println(cont);
                    cont=0;//Le asigno el valor a cero para que vuelva a contar

                    //Si la condicion se cumple, pongo el codigo html de una de las fotos(seria la ultima(4)),mas el cierre del div que teniamos hasta arriba
                   
                    HtmlCode+="<div class=\"3u\">\n" +
"                                   <section>\n" +
"					<a href=\"#\" class=\"image full\"><img src=\"images/pics13.jpg\" alt=\"\" /></a>\n" +
"					<p>Tristique ante ut risus. Quisque dictum. Integer nisl risus, sagittis convallis elementum.</p>\n" +
"					<a href=\"#\" class=\"button\">Read More</a>\n" +
"              			</section>\n" +
"			</div>"
                            + "</div>"//Cierre del div de arriba
                            + "<div class=\"row\">"; //Y volvemos a abrir otro div con un row para la siguiente linea
                }
                else{
                    //Si no es asi, unicamente agregamos a la cadena el codigo html de una foto
                    HtmlCode+="<div class=\"3u\">\n" +
"						<section>\n" +
"							<a href=\"#\" class=\"image full\"><img src=\"images/pics13.jpg\" alt=\"\" /></a>\n" +
"							<p>Tristique ante ut risus. Quisque dictum. Integer nisl risus, sagittis convallis elementum.</p>\n" +
"							<a href=\"#\" class=\"button\">Read More</a>\n" +
"						</section>\n" +
"					</div>";
                }
                
            
            
        }
        
        return HtmlCode;
    }
    
}
