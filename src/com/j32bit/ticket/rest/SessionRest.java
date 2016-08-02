package com.j32bit.ticket.rest;

import java.io.IOException;

import javax.annotation.security.PermitAll;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.j32bit.ticket.bean.User;
import com.j32bit.ticket.service.ServiceFacade;

@Path("/session")
public class SessionRest {

	
	private static Logger logger = LogManager.getLogger();
	
	@Path("/login")
	@PermitAll
	@GET
	public void loginUser(@QueryParam("email") String email, @Context HttpServletRequest request,
				@Context HttpServletResponse response)
					throws IOException{
		
		User user = ServiceFacade.getInstance().getUser(email);
		
		HttpSession session = request.getSession();
		session.setAttribute("LOGIN_USER", user);
		
		response.sendRedirect("/Ticket_System/pages/dashboard.jsp");
		logger.debug("user saved in session:"+user);
	}

}