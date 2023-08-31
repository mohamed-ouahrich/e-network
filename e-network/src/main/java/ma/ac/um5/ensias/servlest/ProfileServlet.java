package ma.ac.um5.ensias.servlest;

import ma.ac.um5.ensias.entities.User;
import ma.ac.um5.ensias.models.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    public ProfileServlet() {

    }


    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            doGEt_index(req, resp);
        }

    }

    private void doGEt_index(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserModel userModel = new UserModel();
        req.setAttribute("profiles",userModel.findALL());
        req.getRequestDispatcher("profile.jsp").forward(req,resp);
    }
}
