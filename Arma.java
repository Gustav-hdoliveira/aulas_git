/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package RPG_simulador;

/**
 *
 * @author GUSTAVOHENRIQUEDEOLI
 */
public class Arma {
    String nome_arma;
    int forca_min;
    int destreza_min;
    int inteligencia_min;
    int fe_min;
    int poder_ataque;

    public Arma(String nome_armas, int forca_mini, int destreza_mini, int inteligencia_mini, int fe_mini, int poder_ataquei){
        nome_arma = nome_armas;
        forca_min = forca_mini;
        destreza_min = destreza_mini;
        inteligencia_min = inteligencia_mini;
        fe_min = fe_mini;
        poder_ataque = poder_ataquei;
    }

    public Arma getArma(Arma arma){
        return arma;
    }
}