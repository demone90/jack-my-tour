package develop.com.jackmytour.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import develop.com.jackmytour.servlet.PdfGenerator.Day;
import develop.com.jackmytour.servlet.PdfGenerator.Itemday;

/**
 * Servlet implementation class ExportTrip
 */
@WebServlet("/exportTrip")
public class ExportTrip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportTrip() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuffer jb = new StringBuffer();
	    String line = null;
		
		BufferedReader reader = request.getReader();
	        //RequestMaker.requestProcess();
	        while ((line = reader.readLine()) != null) { 
	        	//if(line.contains("jsondata"))
	        	jb.append(line);
	        }
	        
	       
	        String jsonstring = jb.toString(); 
	        System.out.println(jsonstring);
	        
	        Type listType = new TypeToken<List<Day>>() {}.getType();

	        Gson g = new Gson();
	        List<Day> list = g.fromJson(jsonstring, listType);
	        session.setAttribute("trip",list);
		
		StringBuffer jb = new StringBuffer();
	    String line = null;
		
		BufferedReader reader = request.getReader();
	        //RequestMaker.requestProcess();
	        while ((line = reader.readLine()) != null) { 
	        	//if(line.contains("jsondata"))
	        	jb.append(line);
	        }
	        
	       
	        String jsonstring = jb.toString(); 
	        System.out.println(jsonstring);
	        
	        Type listType = new TypeToken<List<Day>>() {}.getType();

	        Gson g = new Gson();
	        List<Day> list = g.fromJson(jsonstring, listType);
	        session.setAttribute("trip",list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		
		StringBuffer jb = new StringBuffer();
	    String line = null;
		
		BufferedReader reader = request.getReader();
	        //RequestMaker.requestProcess();
	        while ((line = reader.readLine()) != null) { 
	        	//if(line.contains("jsondata"))
	        	jb.append(line);
	        }
	        
	       
	        String jsonstring = jb.toString(); 
	        System.out.println(jsonstring);
	        
	        Type listType = new TypeToken<List<Day>>() {}.getType();

	        Gson g = new Gson();
	        List<Day> list = g.fromJson(jsonstring, listType);
	        session.setAttribute("trip",list);
	        
  
	     
	}

}
