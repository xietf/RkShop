package com.rkshop.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class publicfilter
 */
public class publicfilter implements Filter {

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		String http = httpServletRequest.getScheme();
		String servername = httpServletRequest.getServerName();
		int port = httpServletRequest.getServerPort();
		String productname = httpServletRequest.getContextPath();
		String url = http+"://"+servername+":"+port+productname;
		request.setAttribute("url", url);
		chain.doFilter(request, response);
		
		
		// øÁ”Ú
        String origin = httpServletRequest.getHeader("Origin");
        if (origin == null) {
        	httpServletResponse.addHeader("Access-Control-Allow-Origin", "*");
        } else {
        	httpServletResponse.addHeader("Access-Control-Allow-Origin", origin);
        }
        httpServletResponse.addHeader("Access-Control-Allow-Headers", "Origin, x-requested-with, Content-Type, Accept,X-Cookie");
        httpServletResponse.addHeader("Access-Control-Allow-Credentials", "true");
        httpServletResponse.addHeader("Access-Control-Allow-Methods", "GET,POST,PUT,OPTIONS,DELETE");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
