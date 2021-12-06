package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import time.TimeDAO;
import time.TimeDTO;


@WebServlet("/CalendarClickController")
public class CalendarClickController extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response); 
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		String date = request.getParameter("date");
		String roomId = request.getParameter("roomId");
		String movieId = request.getParameter("movieId");
		PrintWriter out = response.getWriter();
		TimeDAO dao = new TimeDAO();
		ArrayList<TimeDTO> arr = dao.calendarSelectAll(movieId, roomId, date);
		JSONArray jarray = new JSONArray();
		for(TimeDTO dto : arr)
		{
			JSONObject json = new JSONObject();
			json.put("timeid", dto.getTimeId());
			SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
			String da = sdf.format(dto.getDate());
			json.put("date", da);
			SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
			String time = sdf1.format(dto.getTime());
			json.put("time", time);
			json.put("id", dto.getId());
			json.put("rid", dto.getRid());
			jarray.add(json);
		}
		System.out.println(jarray.toJSONString());
		out.print(jarray.toJSONString());
	}
}
