package com.erika;

import java.util.*;
import java.util.stream.Collectors;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.annotation.WebServlet;
import com.vaadin.annotations.Theme;
import com.vaadin.annotations.VaadinServletConfiguration;
import com.vaadin.server.VaadinRequest;
import com.vaadin.server.VaadinServlet;
import com.vaadin.shared.ui.ContentMode;
import com.vaadin.shared.ui.slider.SliderOrientation;
import com.vaadin.ui.Button;
import com.vaadin.ui.ComboBox;
import com.vaadin.ui.Grid;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.MultiSelect;
import com.vaadin.ui.Notification;
import com.vaadin.ui.Slider;
import com.vaadin.ui.TextField;
import com.vaadin.ui.UI;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.Grid.SelectionMode;


/**
 * This UI is the application entry point. A UI may either represent a browser window 
 * (or tab) or some part of an HTML page where a Vaadin application is embedded.
 * <p>
 * The UI is initialized using {@link #init(VaadinRequest)}. This method is intended to be 
 * overridden to add component to the user interface and initialize non-component functionality.
 */
@Theme("mytheme")
public class MyUI extends UI {
    
    @Override
    protected void init(VaadinRequest vaadinRequest) {

        //Declare layout objects
        final HorizontalLayout horizontalLayout = new HorizontalLayout();
        final VerticalLayout layout = new VerticalLayout();

        //Declare Grid
        Grid<Room> myGrid = new Grid<>();
        myGrid.setWidth("1200px");

        //Declare variables
        Label headline = new Label(
            "<H1>Marty Party Planners</H1> <p/> <h3>Please enter the details below and click Book</h3>");
    headline.setContentMode(com.vaadin.shared.ui.ContentMode.HTML);

    final TextField name = new TextField();
    name.setCaption("Name of Party");

    Slider people = new Slider(0, 200);
    people.setValue(100.0);
    people.setCaption("How many people are invited to this party?");
    people.setOrientation(SliderOrientation.HORIZONTAL);
    people.setWidth("500px");
    Button button = new Button("Click to Book");
    final Label vertvalue = new Label();

    ComboBox<String> comboBox = new ComboBox<>("Children attending?");
        comboBox.setItems("Yes", "No");

    //  Set ???  EBr to update this
    people.addValueChangeListener(event -> {
        int value = event.getValue().intValue();
        vertvalue.setValue(String.valueOf(value));
    });

        // Create the connection object
        Connection connection = null;  
        
        //Set up the connection string to the Azure db:
    String connectionString = "jdbc:sqlserver://partybookingserver.database.windows.net:1433;database=PartyBookingDB;user=host@partybookingserver;password=MaitreD99;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;;";
    
    try {
        connection = DriverManager.getConnection(connectionString);
        ResultSet rs = connection.createStatement().executeQuery("SELECT * FROM Room;");
        List<Room> rm = new ArrayList<Room>();

        // While there are more records in the resultset
        while (rs.next()) {
            rm.add(new Room(rs.getString("room"), rs.getInt("capacity"), rs.getString("feature"),
                    rs.getString("alcoholAllowed")));
        }
        // Set the items (List)
        myGrid.setItems(rm);
        // Configure the order and the caption of the grid
        myGrid.addColumn(Room::getRoomName).setCaption("Room");
        myGrid.addColumn(Room::getCapacity).setCaption("Capacity");
        myGrid.addColumn(Room::getFeature).setCaption("Feature");
        myGrid.addColumn(Room::getAlcohol).setCaption("Alcohol Allowed?");

    } catch (Exception e) {
        // This will show an error message if something went wrong
        layout.addComponent(new Label(e.getMessage()));
    }
       
    Label message = new Label();
    message.setValue("Your party is not booked yet");
    message.setContentMode(ContentMode.HTML);

    
    myGrid.setSelectionMode(SelectionMode.MULTI);
    MultiSelect<Room> select = myGrid.asMultiSelect();
    myGrid.addSelectionListener(event -> {

        Notification.show(select.getValue().stream().map(Room::getRoomName).collect(Collectors.joining(","))
                + " selected");
        
    });


    button.addClickListener(e -> {
        String aString = select.getValue().stream().map(Room::getAlcohol).collect(Collectors.joining(","));
        int cap = select.getValue().stream().mapToInt(Room::getCapacity).sum();
        message.setValue(String.valueOf(cap));
        String match = "true";

        if (myGrid.getSelectedItems().size() == 0) {
            message.setValue("<strong>Please select at least one room!</strong>");
        } else if (name.isEmpty()) {
            message.setValue("<strong>Please enter party name.</strong>");
        } else if (comboBox.isEmpty()) {
            message.setValue("<strong>Please confirm if children attending your party</strong>");
        } else if ((comboBox.getValue() == "Yes") && (aString.equalsIgnoreCase(match))) {
            message.setValue(
                    "<strong>You cannot select any rooms serving alcohol if children are attending.</strong>");
        } else if (people.getValue().intValue() > cap) {
            message.setValue("<strong>You have selected rooms with a max capacity of " + cap
                    + " which is not enough to hold </strong>" + people.getValue().intValue());
        } else {
            message.setValue("<strong>Success! The party is booked now</strong>");
        }

    });

    // Student Number label
    Label studentNumber = new Label("B00766963");

    layout.addComponent(headline);
    horizontalLayout.addComponents(name, people, comboBox);
    layout.addComponent(horizontalLayout);
    layout.addComponent(button);

    layout.addComponent(message);
    layout.addComponent(myGrid);
    layout.addComponent(studentNumber);
    setContent(layout);
}

    @WebServlet(urlPatterns = "/*", name = "MyUIServlet", asyncSupported = true)
    @VaadinServletConfiguration(ui = MyUI.class, productionMode = false)
    public static class MyUIServlet extends VaadinServlet {
    }
}

