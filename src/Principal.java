import java.io.BufferedReader;
import java.io.Console;
import java.io.FileReader;
import java.io.InputStreamReader;

public class Principal {
	static Parse p;
	static BufferedReader arquivo;
	
	static void lerCaminho(){
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));  	
		String file = "";
		try{
			do{
				System.out.print("Digite o nome do arquivo: ");
				file = in.readLine();
				if(file.length() > 0){
					if(file.charAt(file.length() - 4) != '.' &&
							file.charAt(file.length() - 3) != 'o' &&
							file.charAt(file.length() - 2) != 'e' &&
							file.charAt(file.length() - 1) != 'l'){

						System.err.println("Extensão do arquivo invalida!");
						System.out.print("Digite o nome do arquivo: ");

						file = in.readLine();
					}
				}
				
			}while(file.length() == 0);
			
			arquivo = new BufferedReader(new FileReader(file));
		}catch (Exception e) {
			System.err.println("Arquivo nao existe");
			lerCaminho();
		}
	}
	
	public static void main(String[] args) throws Exception{
		try{
			lerCaminho();
			p = new Parse(arquivo);
			p.S();
			System.out.println("Compilado com sucesso!");
		}catch (Exception e) {
			System.err.println("Erro: " + e.getMessage());
			
		}
	}
}
