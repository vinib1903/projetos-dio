package br.com.dio.model;

import java.util.Objects;

/* 'alt+seta' para mudar o bloco de lugar /*
/* 'ctrl+shift+f' organiza o cod */

public class Gato {
	
	/* criação doss atributos da classe Gato */
	private String nome;
	private String cor;
	private String idade;
	
	/* 'ctrl+3 constructor' para abrir o construtor e selecionar automaticamento os campos */
	public Gato() {
	
		this.nome = nome;
		this.cor = cor;
		this.idade = idade;
	}

	/* 'ctrl+3 ggas' para selecionar os getters e/ou setters */
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getIdade() {
		return idade;
	}

	public void setIdade(String idade) {
		this.idade = idade;
	}

	/* 'ctrl+3 equals' para criar equals e hashCode */
	@Override
	public int hashCode() {
		return Objects.hash(cor, idade, nome);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Gato other = (Gato) obj;
		return Objects.equals(cor, other.cor) && Objects.equals(idade, other.idade) && Objects.equals(nome, other.nome);
	}

	/* 'ctrl+3 tostring' para gerar toString */
	@Override
	public String toString() {
		return "Gato [nome=" + nome + ", cor=" + cor + ", idade=" + idade + "]";
	}
	
	
	
	
	
	
	
}
