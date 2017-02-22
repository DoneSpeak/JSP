package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import entity.User;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("user");
//		确保返回的数据不乱码
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(user == null){
//			尚未登录
			out.print("{\"err\":\"error\",\"message\":\"您尚未登录\"}");  
	        out.flush();  
	        out.close();
			return;
		}
		String isbn = request.getParameter("isbn");
		String action = request.getParameter("action");
		
		String uid = user.getUid();
		
		if(action.equals("add")){
			CartDAO cartdao = new CartDAO();
			if(cartdao.addOneBook(uid, isbn)){
				out.print("{\"message\":\"添加成功\"}");
			}else{
				out.print("{\"message\":\"添加失败\"}");
			}
		}else if(action.equals("delete")){
			CartDAO cartdao = new CartDAO();
			if(cartdao.deleteBook(uid, isbn)){
				out.print("{\"err\":\"success\",\"message\":\"删除成功\"}");
			}else{
				out.print("{\"err\":\"fail\",\"message\":\"删除失败\"}");
			}
		}
		out.flush();  
        out.close();
//		不存在操作
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
