
public class Main {

	public static void main(String[] args) {
		Cliente venilton = new Cliente();
		venilton.setNome("Venilton");
		
		Cliente vinicius = new Cliente();
		vinicius.setNome("Vinícius");
		
		Cliente barbara = new Cliente();
		barbara.setNome("Bárbara");
		
		Conta ccVenilton = new ContaCorrente(venilton);
		Conta poupancaVenilton = new ContaPoupanca(venilton);
		Conta ccVinicius = new ContaCorrente (vinicius);
		Conta poupancaBarbara = new ContaPoupanca (barbara);

		ccVenilton.depositar(100);
		ccVenilton.transferir(100, poupancaVenilton);
		poupancaVenilton.transferir(80, ccVinicius);
		
		ccVenilton.imprimirExtrato();
		poupancaVenilton.imprimirExtrato();
		ccVinicius.imprimirExtrato();
		
	}

}
