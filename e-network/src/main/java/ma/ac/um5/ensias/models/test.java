package ma.ac.um5.ensias.models;

import ma.ac.um5.ensias.entities.Groupe;

import javax.swing.*;
import java.time.LocalDate;
import java.util.List;

public class test {
    public static void main(String[] args) {
        GroupeModel groupeModel = new GroupeModel();
        groupeModel.create(new Groupe("Test2", LocalDate.now()));
        List<Groupe> groupes = groupeModel.findALL();
    }
}
