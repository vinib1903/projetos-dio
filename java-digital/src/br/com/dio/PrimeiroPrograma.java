package br.com.dio;

import br.com.dio.model.Gato;

public class PrimeiroPrograma {
	
	
	public static void main(String[] args) {
		
		/* precisa importar a classe 'ctrl+shif+o' pois ela está em outro arquivo */
		Gato gato = new Gato();
		Livros livros = new Livros();
		
		System.out.println(gato);
		System.out.println(livros);
			/* System.out.println("Hello World!"); */
	}

}

/* não precisa importar pois está no mesmo arquivo, mas fora do script do programa */
class Livros {
	private String titulo;
	private String npag;
	private String autor;
}
