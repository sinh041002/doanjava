package MyCustom;

import java.awt.LayoutManager;
import javax.swing.JPanel;

public class Transparent extends JPanel {

    public Transparent() {
        this.setOpaque(false);
    }
    
    public Transparent(LayoutManager layout) {
        this.setLayout(layout);
    }

}
