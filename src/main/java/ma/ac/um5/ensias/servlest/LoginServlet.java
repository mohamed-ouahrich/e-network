package ma.ac.um5.ensias.servlest;

import ma.ac.um5.ensias.entities.User;
import ma.ac.um5.ensias.models.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public UserServlet userServlet = new UserServlet();

    public LoginServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login/index.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action").trim();
        switch (action) {
            case "login": {
                doPost_login(req,resp);
            }
            break;
            case "logout": {
                doPost_logout(req,resp);
            }
            break;
            default:
                break;
        }
    }
    protected void doPost_login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mail = req.getParameter("loginemail");
        String pass = req.getParameter("loginPassword");
        HttpSession session=req.getSession();
        UserModel userModel= new UserModel();
        User user = userModel.findOneByEmail(mail);
        if(user != null)
        {
            if(pass.equals(UserServlet.decrypt(user.getPassWord())))
            {
                resp.sendRedirect("home");
                session.setAttribute("user",user);
            }else {
                req.setAttribute("errorMessage","adress email ou password erronée");
                req.getRequestDispatcher("login/index.jsp").forward(req,resp);
            }
        }
        else {
            req.setAttribute("errorMessage","adress email ou password erronée");
            req.getRequestDispatcher("login/index.jsp").forward(req,resp);
        }
//        session.setAttribute("user","test");
//        resp.sendRedirect("home/");
    }
    protected void doPost_logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect(req.getContextPath());
    }
}
