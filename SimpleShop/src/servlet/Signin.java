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
 * Servlet implementation class Signin
 */
//该servlet在web.xml中进行了配置
//@WebServlet("/signin")
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 用户通过url的方式访问该servlet，重定向到注册页面
		request.getRequestDispatcher("/signin.jsp").forward(request, response);
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
//		防止表单中非字符输入乱码
		request.setCharacterEncoding("utf-8");
		String username = (String) request.getParameter("name");
		String password = (String) request.getParameter("password");
		String repassword = (String) request.getParameter("repassword");
//		用户名和密码验证
		if(username == null || username.length() == 0){
			request.setAttribute("error", "用户名不能为空");
			request.getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
		if( username.length() > 10){
			request.setAttribute("error", "用户名长度不能大于10");
			request.getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
		if(password == null || password.length() == 0){
			request.setAttribute("error", "密码不能为空");
			request.getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
		if(password.length() < 6 || password.length() > 16){
			request.setAttribute("error", "密码长度应该在6到16之间");
			request.getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
		if(repassword == null || repassword.length() == 0){
			request.setAttribute("error", "重复密码不能为空");
			request.getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
		if(!password.equals(repassword)){
			request.setAttribute("error", "两次输入密码不同");
			request.getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
		User user = new User();
		user.setName(username);
		// 通过SHA加密之后再写入数据库
		user.setPassword(SHA.encrypt(password));

		UserDAO userdao = new UserDAO();
		String uid = userdao.addUser(user);
		if(uid.equals("exist")){
			request.setAttribute("error", "用户名已存在");
			request.getRequestDispatcher("/signin.jsp").forward(request, response);
			return;
		}
//		将用户信息写入到session中，并设置有效时间为4小时(14400s)
		user.setPassword("");
		request.getSession().setAttribute("user", user);
		request.getSession().setMaxInactiveInterval(14400);
//		重定向到首页
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		
	}

}
