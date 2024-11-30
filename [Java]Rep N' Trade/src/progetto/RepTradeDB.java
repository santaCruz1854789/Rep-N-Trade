package progetto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class RepTradeDB {
	private static Statement stmt;
	RepTradeDB() throws ClassNotFoundException, SQLException
	{
		System.out.println("Retrieving Drivers...");
		Class.forName("com.mysql.cj.jdbc.Driver");  
		String username = "root";
		String password = "ProgettoBD2";
		String database = "repn'trade";
		System.out.println("Attempting Connection to Rep N'Trade...");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database+"?user="+username+"&password="+password+"&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Europe/Rome&allowMultiQueries=true");
		System.out.println("Connected to Rep N'Trade Database!");
		stmt = conn.createStatement();
	}
	
	//QUERY senza parametri
	public static void Query(String s) throws SQLException
	{
		switch(s) {
			case "1" -> { execute("DROP VIEW IF EXISTS FatturatiDelMese; CREATE VIEW FatturatiDelMese(Agente, Prez, Prov) AS "
					+ "SELECT Agente, Totale, Provvigione\r\n"
					+ "FROM Ordine, Fattura AS F\r\n"
					+ "WHERE CodOrdine = F.Ordine AND\r\n"
					+ "MONTH(DataErogazione) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH) AND \r\n"
					+ "YEAR(DataErogazione) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) AND\r\n"
					+ "Pagato = 1;"
					+ "SELECT CodAgente, Nome, Cognome, GuadagnoTot\r\n"
					+ "FROM GuadagnoDelMese\r\n"
					+ "WHERE GuadagnoTot = (SELECT Max(GuadagnoTot) FROM GuadagnoDelMese);", stmt);
				
			}
			case "3" -> { execute("SELECT *\r\n"
					+ "FROM `repn'trade`.`sede operativa`\r\n"
					+ "WHERE CodCliente IN (SELECT SedeOperativaSC\r\n"
					+ "					 FROM Sconto_Categoria\r\n"
					+ "					 WHERE ValorePercentuale > 10 AND\r\n"
					+ "                     DataDiFine < (SELECT AVG(DataDiFine) FROM Sconto_Categoria));",stmt);
			}
			case "4" -> { execute("DROP VIEW IF EXISTS NumCittà;\r\n"
					+ "CREATE VIEW NumCittà as\r\n"
					+ "SELECT CodAgente, Nome, Cognome, Count(*) AS Città\r\n"
					+ "FROM Agente, Appartenenza_Geografica\r\n"
					+ "WHERE CodAgente = AgenteApp AND Tipo = \"subagente\"\r\n"
					+ "GROUP BY CodAgente;\r\n"
					+ "\r\n"
					+ "SELECT * FROM Agente\r\n"
					+ "WHERE (SELECT Città FROM NumCittà WHERE NumCittà.CodAgente=Agente.CodAgente) > 1;",stmt);
				
			}
			case "5" -> { execute("DROP VIEW IF EXISTS BestDeals;\r\n"
					+ "CREATE VIEW BestDeals(CodProd, Sconto, Fornitore) AS\r\n"
					+ "SELECT CodProdotto, ValorePercentuale, Fornitore\r\n"
					+ "FROM Prodotto, Sconto_Prodotto\r\n"
					+ "WHERE CodProdotto = ProdottoS AND \r\n"
					+ "ValorePercentuale >= All(SELECT ValorePercentuale FROM Sconto_Prodotto \r\n"
					+ "							WHERE CodProdotto = ProdottoS);\r\n"
					+ "                            \r\n"
					+ "SELECT CodProdotto AS Prod, Fornitore, ScontoGenerale FROM Prodotto\r\n"
					+ "WHERE ScontoGenerale IS NOT NULL \r\n"
					+ "AND ScontoGenerale >= ALL(SELECT Sconto FROM BestDeals WHERE CodProdotto = CodProd)\r\n"
					+ "AND CodProdotto IN (SELECT CodProd FROM BestDeals);\r\n",stmt);
				
			}
			case "6" -> { execute("DROP VIEW IF EXISTS prodot3m;\r\n"
					+ "CREATE VIEW prodot3M(Cliente, Prod, Descr, DataE) AS \r\n"
					+ "SELECT SedeOperativa, CodProdotto, Descrizione, DataErogazione\r\n"
					+ "FROM Prodotto, Inserimento, Ordine, Fattura AS F\r\n"
					+ "WHERE CodProdotto = ProdottoIns AND OrdineIns = CodOrdine AND CodOrdine = F.Ordine\r\n"
					+ "AND DataErogazione >= CURRENT_DATE-interval 3 month;"
					+ "SELECT DISTINCT Cliente, Nome AS Prodotto FROM `sede operativa`, prodot3m\r\n"
					+ "WHERE CodCliente = Cliente\r\n"
					+ "GROUP BY CodCliente, Prod\r\n"
					+ "HAVING Count(*) > 1;",stmt);
				
			}
			case "8" -> { execute("SELECT CodCliente, SO.Nome, Count(*) AS Responsabili\r\n"
					+ "FROM  Responsabile_Sede, Lavoro_S,  `repn'trade`.`sede operativa` AS SO\r\n"
					+ "WHERE CodCliente = SedeOperativaRes AND CodResSede = Responsabile\r\n"
					+ "GROUP BY CodCliente;",stmt);
			
			}
		}
		System.out.println("Query n°"+s+" successfully executed!");
	}
	
	//QUERY con 1 parametro
	public static void Query(String s, String P1) throws SQLException
	{
		switch(s) {
		// P1 = POLLO
			case "2" -> { execute("DROP VIEW IF EXISTS CategProdott;\r\n"
					+ "CREATE VIEW CategProdott(Categoria, Descrizione, Prodotto, DataScadenza) AS\r\n"
					+ "SELECT CategoriaEt, Descrizione, CodProdotto, DataScadenza\r\n"
					+ "FROM Prodotto, Categoria, Etichetta\r\n"
					+ "WHERE Nome = CategoriaEt AND ProdottoEt = CodProdotto AND CategoriaEt = '"+P1+"';\r\n"
					+ "\r\n"
					+ "SELECT  Categoria, Prodotto, DataScadenza\r\n"
					+ "FROM CategProdott     \r\n"
					+ "WHERE DataScadenza <= all(SELECT DataScadenza FROM CategProdott);", stmt);
				
			}
			// P1 = POLLO
			case "9" -> { execute("SELECT CategoriaEt, Descrizione, CodProdotto\r\n"
					+ "FROM Prodotto, Categoria, Etichetta\r\n"
					+ "WHERE Nome = CategoriaEt AND ProdottoEt = CodProdotto AND CategoriaEt = '"+P1+"';",stmt);
			}
			//P1 = 000014
			case "10" -> { execute("DROP VIEW ProdMese;\r\n"
					+ "CREATE VIEW ProdMese(Cliente, CodProd, Quant, Descriz) AS\r\n"
					+ "SELECT DISTINCT O.SedeOperativa, CodProdotto, P.Quantità, Descrizione\r\n"
					+ "FROM Fattura AS F, Ordine AS O, Inserimento AS I, Prodotto AS P\r\n"
					+ "WHERE F.Ordine = CodOrdine AND O.CodOrdine = OrdineIns AND ProdottoIns = CodProdotto\r\n"
					+ "AND MONTH(DataErogazione) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH) AND YEAR(DataErogazione) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH);\r\n"
					+ "\r\n"
					+ "SELECT CodProd, Descriz, CodCliente, Nome\r\n"
					+ "FROM `repn'trade`.`sede operativa` AS SO, ProdMese\r\n"
					+ "WHERE Cliente = CodCliente AND CodCliente = "+P1+";",stmt);
				
			}
			//P1 = 002
			case "11" -> { execute("DROP VIEW CittàGestita;\r\n"
					+ "CREATE VIEW CittàGestita AS\r\n"
					+ "SELECT C.Nome, Comune\r\n"
					+ "FROM Agente, Appartenenza_Geografica As AG, Citta AS C\r\n"
					+ "WHERE CodAgente = AgenteApp AND Tipo = TipoAgenteApp\r\n"
					+ "AND CittàApp = C.Nome AND ComuneApp = Comune \r\n"
					+ "AND CodAgente = \""+P1+"\" AND Tipo = \"capo area\";"
					+ "SELECT DISTINCT CodAgente, Agente.Nome, Cognome, Telefono, Email\r\n"
					+ "FROM Agente, Appartenenza_Geografica AS AG, CittàGestita AS C\r\n"
					+ "WHERE CodAgente = AgenteApp AND Tipo = TipoAgenteApp\r\n"
					+ "AND CittàApp = C.Nome AND ComuneApp = Comune \r\n"
					+ "AND Tipo = \"subagente\";",stmt);
				
			}
			//P1 = PollosRestaurant
			case "12" -> { execute("select CodResSede, `responsabile_sede`.Nome, Cognome, `responsabile_sede`.Telefono, `responsabile_sede`.Email, Ruolo, CodCliente, `sede operativa`.Nome, Azienda, Città, Via, Civico\r\n"
					+ "from responsabile_sede join lavoro_s on CodResSede=Responsabile join `sede operativa` on SedeOperativaRes=CodCliente\r\n"
					+ "where `sede operativa`.nome='"+P1+"';",stmt);
				
			}
			//P1 = 01037
			case "13" -> { execute("select CodAgente, Nome, Cognome, Telefono, Email from agente\r\n"
					+ "where CodAgente in (select SubAgente from appartenenza_zona \r\n"
					+ "where CAP="+P1+");",stmt);
			
			}
			// P1 = 10
			case "14" -> { execute("drop view if exists res;\r\n"
					+ "create view res as\r\n"
					+ "select Responsabile from lavoro_s\r\n"
					+ "where SedeOperativaRes="+P1+";\r\n"
					+ "\r\n"
					+ "select * from responsabile_sede\r\n"
					+ "where  CodResSede in (select * from res);",stmt);
				
			}
			//P1 = POLLO
			case "15" -> { execute("select * from prodotto\r\n"
					+ "where ScontoGenerale is not null and \r\n"
					+ "CodProdotto in (select ProdottoEt from etichetta where CategoriaEt='"+P1+"');",stmt);
			
			}
		}
		System.out.println("Query n°"+s+" successfully executed!");
	}
	
	//QUERY con 2 parametri
	public static void Query(String s, String P1, String P2) throws SQLException
	{ 
		//P1 = Malaysia
		//P2 = Pesce
		execute("SELECT Nome, Provenienza, AVG(Prezzo)\r\n"
				+ "FROM Prodotto, Etichetta, Categoria\r\n"
				+ "WHERE CodProdotto = ProdottoEt AND Nome = CategoriaEt AND Provenienza = '"+P1+"' AND Nome = '"+P2+"';", stmt);			
	}
	
	//Stampa il risultato
	private static void execute(String q, Statement stmt) throws SQLException {
		ResultSet rs;
		ResultSetMetaData rsmd;
		boolean hasMoreResultSets = stmt.execute(q);
		while ( hasMoreResultSets || stmt.getUpdateCount() != -1 ) {
			if(hasMoreResultSets) {
				rs = stmt.getResultSet();
				rsmd = rs.getMetaData();
				for(int i=1; i<=rsmd.getColumnCount(); i++) {
					System.out.print("|--"+rsmd.getColumnName(i)+"\t\t--|");
				}
				System.out.println();
			
				while(rs.next()) {
					System.out.print("|");
					for(int i=1; i<=rsmd.getColumnCount();i++) {
						System.out.print("   "+rs.getString(i));
						if(rs.getString(i)!=null)
							System.out.print(" ".repeat(rsmd.getColumnName(i).length()- rs.getString(i).length()>0?rsmd.getColumnName(i).length()-rs.getString(i).length():0) + "\t\t  |");
						else
							System.out.print(" ".repeat(rsmd.getColumnName(i).length()- 4>0?rsmd.getColumnName(i).length()-4:0) + "\t\t  |");
					}
					System.out.println();
				}
			}
	        else { // if ddl/dml/...
	            int queryResult = stmt.getUpdateCount();  
	            if ( queryResult == -1 ) { // no more queries processed  
	                break;  
	            } 
	        } 
	        hasMoreResultSets = stmt.getMoreResults();  
	    }
	}
	
	//Main di esecuzione
	public static void main(String[] args) throws ClassNotFoundException, SQLException 
	{
		boolean continua = true;
		RepTradeDB p = new RepTradeDB();
		while(continua)
		{			
			Scanner sc = new Scanner(System.in);
			System.out.println("Cosa vuoi fare?\na) query\nb) insert\nc) delete\nd) update");
			String q = sc.nextLine();
			if(q.equals("b") || q.equals("insert"))
			{
				System.out.print("Inserisci il tuo insert: ");
				q = sc.nextLine();
				stmt.execute(q);
				System.out.println("L'insert è avvenuta con successo");
			}
			else if(q.equals("c") || q.equals("delete"))
			{
				System.out.print("Inserisci il tuo delete: ");
				q = sc.nextLine();
				stmt.execute(q);
				System.out.println("delete è avvenuta con successo");
			}
			else if(q.equals("d") || q.equals("update"))
			{
				System.out.print("Inserisci il tuo update: ");
				q = sc.nextLine();
				stmt.execute(q);
				System.out.println("update è avvenuta con successo");
			}	
			else if(q.equals("a") || q.equals("query"))
				{
				System.out.print("Inserisci il numero della query che vorresti eseguire(1-15): ");
				q = sc.nextLine();
				List<String> zero = new ArrayList<String>(List.of("1", "3", "4", "5","6","8"));
				List<String> uno = new ArrayList<String>(List.of("2","9","10","11","12","13","14","15"));
				if(zero.contains(q))
					Query(q);
				else if(uno.contains(q)) 
				{
					System.out.print("Inserisci il parametro: ");
					String p1 = sc.nextLine();
					Query(q, p1);
				}
				
				else if(q.equals("7"))
				{
					System.out.print("Inserisci il parametro provenienza: ");
					String p1 = sc.nextLine();
					System.out.print("Inserisci il parametro categoria: ");
					String p2 = sc.nextLine();
					Query(q, p1, p2);
				}
				else
					throw new SQLException();
			}
	
			else 
			{
				System.out.println("Scrivi la cosa giusta!");
				throw new SQLException();
			}
			System.out.println("Vuoi continuare? (si | no)");
			q = sc.nextLine();
			if(q.equals("no"))
				continua = false;
		}
		String delete = "DELETE FROM `repn'trade`.`appartenenza_zona` WHERE (`SubAgente` = '005') and (`CAP` = '00197') and (`TipoSubAgente` = 'subagente');";
		String insert = "INSERT INTO `repn'trade`.`appartenenza_zona` (`CAP`, `SubAgente`, `TipoSubAgente`) VALUES ('197', '5', 'subagente');";
		String update = "UPDATE `repn'trade`.`appartenenza_zona` SET `SubAgente` = '004' WHERE (`SubAgente` = '005') and (`CAP` = '06310') and (`TipoSubAgente` = 'subagente');";
	}
}
