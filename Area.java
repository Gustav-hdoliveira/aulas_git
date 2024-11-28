/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package RPG_simulador;

/**
 *
 * @author GUSTAVOHENRIQUEDEOLI
 */
public class Area {
    String nome;
    String descricao;
    Boolean atalho;
    Boolean bau;
    Inimigo inimigos;
    
    public Area(String nome_area, String descricao_area, Boolean atalho_presente,  Boolean bau_na_area){
        nome = nome_area;
        descricao = descricao_area;
        atalho = atalho_presente;
        bau = bau_na_area;
        inimigos = [];
    }
    
    
}
