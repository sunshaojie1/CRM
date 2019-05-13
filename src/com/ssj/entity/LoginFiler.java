package com.ssj.entity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "loginFilter", urlPatterns= {"*.jsp"})
public class LoginFiler implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	/**
	 * getRequestURI:/��Ŀ��/��ҳ
	 * getRequestURL:http://localhost:8080/��Ŀ��/��ҳ
	 * 
	 * getContextPath:/test 
	 * getServletPath:/test.jsp 
	 * getRequestURI:/test/test.jsp 
	 * getRequestURL:http://localhost:8080/test/test.jsp 
	 * getRealPath:D:\Tomcat 6.0\webapps\test\ 
	 * getServletContext().getRealPath:D:\Tomcat 6.0\webapps\test\ 
	 * getQueryString:p=fuck
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req= (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session=req.getSession(true);
		resp.setContentType("text/html;");
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		String request_uri = req.getRequestURI();//��Ŀ��/��ҳ
		String ctxPath = req.getContextPath();//��Ŀ��
		String uri = request_uri.substring(ctxPath.length());
		if (uri.contains("login.jsp") || uri.contains("login")) {
			chain.doFilter(request, response);
		} else {
			if (session.getAttribute("uname") != null) {
				chain.doFilter(request, response);
			} else {
				out.println("��û�е�¼�����ȵ�¼��3���ص���¼ҳ�档");
				resp.setHeader("refresh", "3;url=" + ctxPath + "/login.jsp");
				return;
			}
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
