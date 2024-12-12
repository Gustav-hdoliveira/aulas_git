/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package RPG_simulador;
import java.util.Scanner;  // Import the Scanner class

/**
 *
 * @author GUSTAVOHENRIQUEDEOLI
 */
public class Persona_criacao {
    
    public Persona_criacao(){
        Scanner myClasseeInicial = new Scanner(System.in);  // Create a Scanner object
        System.out.println("Classes iniciais:
        Nome:      |          Numero de rodadas no dado    | Armas iniciais
                   lvl| Vit| Res| Vit| sint| for| des| vel| int|  fe|
        Guerreiro   3 |   7|   6|   6|	  5|  15|  11|	 5|	  5|   5| Broken Straight Sword, Iron Parma
        Cavaleiro,	13|	 12|   6|	7|	  4|  11|   8|	 9|	  3|   6| Broadsword, nenhuma
        Espadachim,	12|	  4|   8|	4|	  6|   9|  16|	 6|	  7|   5| scimitar +1, shortsword +1
        Bandido,    11|   9|   7|  11|	  2|   9|  14|   3|	  1|   8| Hand axe, Short bow
        Clerigo,	14|	 10|   3|	8|   10|  11|	5|	 4|	  4|  12| Mace, Sino sagrado do clérigo
        Feiticeiro, 11|	  5|   6|	5|   12|   3|	7|	 8|	 14|   4| Adaga, Cajado do feiticeiro
        Explorador, 10|	  7|   6|	9|	  7|   6|	6|  12|   5|   5| Adaga, nenhuma
        Depravado, 	1 |	  6|   6|	6|	  6|   6|	6|	 6|	  6|   6| Nenhuma, Nenhuma");

        String classe = myClasseeInicial.nextLine();  // Read user input
    }
    
}
