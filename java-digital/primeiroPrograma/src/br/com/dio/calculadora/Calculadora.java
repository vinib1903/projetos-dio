/* ctrl+shift+T abre arquivo 
 * ctrl+W fecha aba
 * ctrl+shift+W fecha todas as abas
 */

package br.com.dio.calculadora;

import java.util.Scanner;

public class Calculadora {

	public static void main(String[] args) {
		try (Scanner scan = new Scanner(System.in)) {
			double a, b;
			
			System.out.println("Digite o primeiro número:");
			a = scan.nextDouble();
			System.out.println("Digite o segundo número:");
			b = scan.nextDouble();
			
			double soma = soma (a, b);
			double subtracao = subtracao (a, b);
			double divisao = divisao(a, b);
			double multiplicacao = multiplicacao(a,b);
			
			System.out.println(soma);
			System.out.println(subtracao);
			System.out.println(divisao);
			System.out.println(multiplicacao);
		}
		
		
	}
	
	
	public static double soma(double a, double b) {
		return a + b;
	}
	
	/* 'ctrl+alt+seta para cima ou para baixo' copia a seleção na direção da seta */
	public static double subtracao(double a, double b) {
		return a - b;
	}
	
	public static double divisao(double a, double b) {
		return a / b;
	}
	
	public static double multiplicacao(double a, double b) {
		return a * b;
	}

}
