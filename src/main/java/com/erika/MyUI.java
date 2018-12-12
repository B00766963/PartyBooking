package com.erika;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import java.util.*;

import javax.servlet.annotation.WebServlet;

import com.vaadin.annotations.Theme;
import com.vaadin.annotations.VaadinServletConfiguration;
import com.vaadin.server.VaadinRequest;
import com.vaadin.server.VaadinServlet;
import com.vaadin.shared.ui.Connect;
import com.vaadin.ui.Layout;
import com.vaadin.ui.*;
import com.vaadin.server.communication.*;
import com.vaadin.data.util.*;


/**
 * This UI is the application entry point. A UI may either represent a browser window 
 * (or tab) or some part of an HTML page where a Vaadin application is embedded.
 * <p>
 * The UI is initialized using {@link #init(VaadinRequest)}. This method is intended to be 
 * overridden to add component to the user interface and initialize non-component functionality.
 */
@Theme("mytheme")
public class MyUI extends UI {

    Connection connection = null;  
    @Override
    protected void init(VaadinRequest vaadinRequest) {

        final VerticalLayout layout = new VerticalLayout();

        // Create the connection object
    
    String connectionString = "jdbc:sqlserver://partybookingserver.database.windows.net:1433;database=PartyBookingDB;user=host@partybookingserver;password=MaitreD99;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;;";
	
    try 
{
	// Connect with JDBC driver to a database
	connection = DriverManager.getConnection(connectionString);
	// Add a label to the web app with the message and name of the database we connected to 
	layout.addComponent(new Label("Connected to database: " + connection.getCatalog()));
} 
catch (Exception e) 
{
	// This will show an error message if something went wrong
	layout.addComponent(new Label(e.getMessage()));
}
       
        
        final TextField name = new TextField();
        name.setCaption("Type your name here:");

        Button button = new Button("Testing, Testing, 1 2 3...");
        button.addClickListener(e -> {
            layout.addComponent(new Label("Thanks " + name.getValue() 
                    + ", it works!"));
        });
   
  
        layout.addComponents(name, button);
        
        setContent(layout);
    }

    @WebServlet(urlPatterns = "/*", name = "MyUIServlet", asyncSupported = true)
    @VaadinServletConfiguration(ui = MyUI.class, productionMode = false)
    public static class MyUIServlet extends VaadinServlet {
    }
}

