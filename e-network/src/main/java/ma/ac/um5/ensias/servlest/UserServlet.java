package ma.ac.um5.ensias.servlest;

import ma.ac.um5.ensias.entities.User;
import ma.ac.um5.ensias.models.UserModel;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.spec.KeySpec;
import java.time.LocalDate;
import java.util.Base64;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private static final String SECRET_KEY = "ENSIAS";
    private static final String SALT = "ENSIAS";

    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

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
        UserModel userModel = new UserModel();
        User user = new User(req.getParameter("username"),encrypt(req.getParameter("password")),req.getParameter("emailAdress"),req.getParameter("filiere"),LocalDate.now());
        if(userModel.findOneByEmail(req.getParameter("emailAdress")) != null)
        {
            req.setAttribute("errorMessage","Adress email existe");
        }
        else {
            User newUser =userModel.create(user);
            if(newUser!=null)
            {
                req.setAttribute("succesMessage","Vous êtes inscrits avec succés");
            }else {
                req.setAttribute("errorMessage","Inscription échouée");
            }
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login/index.jsp");
        dispatcher.forward(req,resp);
//        req.getRequestDispatcher("login/index.jsp").forward(req,resp);
    }

    protected void doPost_edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    protected void doPost_delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public static String encrypt(String strToEncrypt) {
        try {
            byte[] iv = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            IvParameterSpec ivspec = new IvParameterSpec(iv);

            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(SECRET_KEY.toCharArray(), SALT.getBytes(), 65536, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivspec);
            return Base64.getEncoder()
                    .encodeToString(cipher.doFinal(strToEncrypt.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception e) {
            System.out.println("Error while encrypting: " + e.toString());
        }
        return null;
    }
    public static String decrypt(String strToDecrypt) {
        try {
            byte[] iv = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            IvParameterSpec ivspec = new IvParameterSpec(iv);

            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(SECRET_KEY.toCharArray(), SALT.getBytes(), 65536, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey, ivspec);
            return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
        } catch (Exception e) {
            System.out.println("Error while decrypting: " + e.toString());
        }
        return null;
    }
}
