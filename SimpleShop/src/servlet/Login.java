package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import entity.User;
import util.SHA;

/**
 * Servlet implementation class Login
 */
@WebServlet(name="loginservlet",urlPatterns={"/login","/loginto"})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 用户通过url的方式访问该servlet，重定向到登陆页面
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user") != null){
//			用户已经登录，此时不能再注册
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}
//		设置编码，放置表单中非字符输入乱码
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("name");
		String password = request.getParameter("password");
		String uid = "";
		
		if(username == null || username.length() == 0){
			request.setAttribute("error", "用户名不能为空");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		if(password == null || username.length() == 0){
			request.setAttribute("error", "密码不能为空");
			request.getRequestDispatcher("/login.jsp").forward(request,response);
			return;
		}
		password = SHA.encrypt(password);
		User user = new User();
		user.setName(username);
		user.setPassword(password);
		
		UserDAO userdao = new UserDAO();
		uid = userdao.userLogin(user);
		if(uid == "false"){
			request.setAttribute("error", "用户名或者密码错误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}

		user.setUid(uid);
		
//		登陆成功，将用户信息设置到session中，并设置有效时间为4小时(4 * 60 * 60 = 14400s)
//		注意这里是servlet，所以不能直接用jsp的内置对象session
		user.setPassword("");
		request.getSession().setAttribute("user", user);
		request.getSession().setMaxInactiveInterval(14400);
		System.out.println(request.getSession().getAttribute("user"));
		// 重定向到主页
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}

}
