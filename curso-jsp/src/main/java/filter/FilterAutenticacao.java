package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import connection.SingleConnectionBanco;

@WebFilter(urlPatterns = { "/principal/*" }) /* intercepta todas as requisicoes que vierem do projeto ou mapeamento */
public class FilterAutenticacao implements Filter {

	private static Connection connection;

	public FilterAutenticacao() {

	}

	/* Encerra os processos quando o servidor é parado */
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/* intercepta as requisicoes e da as resposta no sistema */
	/* tudo que fizer no sistema vai fazer por aqui */
	/* validacao de autenticacao */
	/* commit e rollback de transacoes do bd */
	/**/
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		/**/ System.out.println("ENTROU NO FILTRO");

		try {

			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();

			String usuarioLogado = (String) session.getAttribute("usuario");

			String urlParaAutenticar = req.getServletPath();
			/* url que esta sendo acessada */
			/**/ System.out.println(usuarioLogado + "  " + urlParaAutenticar);

			/* Validar se esta logado senao redireciona para a tela de login */
			if (usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/principal/ServletLogin")) {
				/* NAO ESTA LOGADO */
				/**/ System.out.println(usuarioLogado + "  " + urlParaAutenticar);
				RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
				request.setAttribute("msg", "Por favor, Realize o login");
				redireciona.forward(request, response);
				return; /* Para a execucao e redireciona para o login */

			} else {
				chain.doFilter(request, response);
			}
			
			connection.commit(); //Commit as alteracoes no banco
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

	/* inicia os processos ou recursos quando o servidor sobe o projeto */
	/* ex: iniciar conexao com o banco */
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnectionBanco.getConnection(); // Conexao com banco
	}

}
