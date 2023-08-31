package ma.ac.um5.ensias.servlest;

import ma.ac.um5.ensias.entities.*;
import ma.ac.um5.ensias.models.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@WebServlet("/homeGroupe")
public class HomeGroupeServlet extends HttpServlet {

    public HomeGroupeServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(true);
        PublicationModel publicationModel = new PublicationModel();
        UserModel userModel = new UserModel();
        LikeModel likeModel = new LikeModel();
        GroupeModel groupeModel = new GroupeModel();
        if (session != null) {
            String action = req.getParameter("action");
            if (action == null) {
                Set<Groupe> adheratesGroupes = userModel.findOneByID(((User) req.getSession().getAttribute("user")).getId()).getGroupesAdhesion();
                List<User> users = userModel.findALL().stream().filter(user -> user.getId() != ((User) req.getSession().getAttribute("user")).getId()).collect(Collectors.toList());
                req.setAttribute("users", users);
                req.setAttribute("tops", userModel.findToPTen());
                req.setAttribute("likes", likeModel.findALL());
                req.setAttribute("groupes", groupeModel.getOtherGroup(((User) req.getSession().getAttribute("user")).getId()));
                req.setAttribute("publications",req.getParameter("selectedGroupe")==null ? publicationModel.findALLByGroup(((User) req.getSession().getAttribute("user")).getId()):publicationModel.findPublicationsByGroup(Integer.parseInt(req.getParameter("selectedGroupe"))));
                req.setAttribute("totalFollowing", adheratesGroupes.size());
                req.setAttribute("adherateGroupes",adheratesGroupes);
                req.getRequestDispatcher("homeGroupe/index.jsp").forward(req, resp);
            }
        } else {
            resp.sendRedirect("login/");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        switch (action) {
            case "new-post": {
                doPost_newPost(req, resp);
            }
            ;
            break;
            case "new-comment": {
                doPost_newComment(req, resp);
            }
            break;
            case "like": {
                doPost_like(req, resp);
            }
            ;
            break;
            case "hide": {
                doPost_hide(req, resp);
            }

            break;
            case "adherer": {
                doPost_adherer(req, resp);
            }
            break;
            default:
                break;
        }

    }

    private void doPost_adherer(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        GroupeModel groupeModel = new GroupeModel();
        User user = (User) req.getSession().getAttribute("user");
        Groupe groupe = groupeModel.findOneByID(Integer.parseInt(req.getParameter("id")));
        groupe.getAdherents().add(user);
        groupeModel.update(groupe);
        resp.sendRedirect("homeGroupe");
    }

    private void doPost_hide(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PublicationModel publicationModel = new PublicationModel();
        Publication publication = publicationModel.findOneByID(Integer.parseInt(req.getParameter("id")));
        publication.setEstVisible(false);
        publicationModel.update(publication);
        resp.sendRedirect("homeGroupe");

    }

    private void doPost_newPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PublicationModel publicationModel = new PublicationModel();
        User user = (User) req.getSession().getAttribute("user");
        Publication publication = new Publication();
        GroupeModel groupeModel = new GroupeModel();
        publication.setContenu(req.getParameter("contenuPub"));
        publication.setUser(user);
        Groupe groupe = groupeModel.findOneByID(Integer.parseInt(req.getParameter("selectedGroupe")));
        publication.setDatePublication(LocalDateTime.now());
        publication.setGroupe(groupe);
        publicationModel.create(publication);
        resp.sendRedirect("homeGroupe");
    }

    private void doPost_like(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        LikeModel likeModel = new LikeModel();
        int idPublication = Integer.parseInt(req.getParameter("id"));
        User user = (User) req.getSession().getAttribute("user");
        Jaime like = likeModel.findOneUserAndPublication(user.getId(), idPublication);
        if (like == null) {
            // like
            PublicationModel publicationModel = new PublicationModel();
            likeModel.create(new Jaime(publicationModel.findOneByID(idPublication), user));
        } else {
            //unlike
            likeModel.delete(like);
        }
        resp.sendRedirect("homeGroupe");
    }

    private void doPost_newComment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CommentaireModel commentaireModel = new CommentaireModel();
        Commentaire commentaire = new Commentaire();
        PublicationModel publicationModel = new PublicationModel();
        User user = (User) req.getSession().getAttribute("user");// get user from session
        Publication publication = publicationModel.findOneByID(Integer.parseInt(req.getParameter("id")));
        commentaire.setContenu(req.getParameter("commentaire"));
        commentaire.setUser(user);
        commentaire.setPublication(publication);
        commentaireModel.create(commentaire);
        resp.sendRedirect("homeGroupe");
    }


}
