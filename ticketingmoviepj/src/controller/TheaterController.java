package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import room.RoomDAO;
import room.RoomDTO;


@WebServlet("TheaterController")
public class TheaterController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(req, resp);
	}

	protected void doHandle(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        
        String theaterid = req.getParameter("theatercheck");
        PrintWriter out = resp.getWriter();
        
        RoomDAO dao = new RoomDAO();
        System.out.println("theaterID :" + theaterid);
        ArrayList<RoomDTO> arr  = dao.theaterSelectOne(theaterid);
        
        JSONArray jarray = new JSONArray();
        for(RoomDTO dto : arr) {
        	JSONObject json = new JSONObject();
        	json.put("rid", dto.getRid());
        	json.put("rname", dto.getRname());
        	json.put("tseats", dto.getTseats());
        	json.put("tid", dto.getTid());
        	
        	jarray.add(json);
      
        }
        
        
        System.out.println(jarray.toJSONString());
        
        out.print(jarray.toJSONString());
	}
	
	
}
