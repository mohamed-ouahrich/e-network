package ma.ac.um5.ensias.servlest;

import ma.ac.um5.ensias.entities.Groupe;
import ma.ac.um5.ensias.entities.User;
import ma.ac.um5.ensias.models.GroupeModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/groupe")
public class GroupeServlet extends HttpServlet {
    public GroupeServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action= req.getParameter("action");
        if(action == null)
        {
            doGet_index(req,resp);
        }
    }

    protected void doGet_index(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GroupeModel groupeModel= new GroupeModel();
        req.setAttribute("groupes",groupeModel.getAllMyGroup(((User) req.getSession().getAttribute("user")).getId()));
        req.getRequestDispatcher("groupe/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action= req.getParameter("action");
        switch (action)
        {
            case "new":{doPost_new(req,resp);};break;
            case "edit":{doPost_edit(req,resp);};break;
            case "delete":{doPost_delete(req,resp);};break;
            default:break;
        }
    }
    protected void doPost_new(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GroupeModel groupeModel = new GroupeModel();
        Groupe groupe = new Groupe(req.getParameter("name").trim(), LocalDate.now());
        groupe.setUser((User) req.getSession().getAttribute("user"));
        groupeModel.create(groupe);
        resp.sendRedirect("groupe");
    }

    protected void doPost_edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GroupeModel groupeModel = new GroupeModel();
        Groupe existedGroupe = groupeModel.findOneByID(Integer.parseInt(req.getParameter("id")));
        existedGroupe.setName(req.getParameter("name"));
        groupeModel.update(existedGroupe);
        resp.sendRedirect("groupe");
    }
    protected void doPost_delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idGroupe = Integer.parseInt(req.getParameter("groupeID"));
        GroupeModel groupeModel = new GroupeModel();
        groupeModel.delete(groupeModel.findOneByID(idGroupe));
        resp.sendRedirect("groupe");
    }
}
