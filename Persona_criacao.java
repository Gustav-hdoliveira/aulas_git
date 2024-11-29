/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package RPG_simulador;

/**
 *
 * @author GUSTAVOHENRIQUEDEOLI
 */
public class Persona_criacao {
    
    public Persona_criacao(){
        
    }
    
    public int calcular_dado(){
        int numDado = ((int)Math.random()*6) + 1;
        return numDado;
    }
    
    public int rodar_dados(int vezes){
        int roladas = 0;
        while(roladas < vezes){
            
        }
        return 0;
    }
}
