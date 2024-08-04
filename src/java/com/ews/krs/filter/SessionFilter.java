package com.ews.krs.filter;

import com.ews.krs.model.SystemSetting;
import com.ews.krs.model.User;
import com.ews.krs.service.SystemSettingService;
import com.ews.krs.service.impl.SystemSettingServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebFilter({"/dashboard/*"})
public class SessionFilter implements Filter {

    private SystemSettingService systemSettingService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        systemSettingService = new SystemSettingServiceImpl();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;

        HttpSession session = httpRequest.getSession(false);
        String requestURI = httpRequest.getRequestURI();

        if(requestURI.contains("/dashboard/") && !requestURI.endsWith("/login")) {
            if (session != null && session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");

                String role = getUserRole(user.getSetting_id());
                boolean checkAuthenticated = checkRoleAccess(role, requestURI);

                if (checkAuthenticated) {
                    filterChain.doFilter(servletRequest, servletResponse);
                } else {
                    handleUnauthorizedAccess(httpResponse, requestURI);
                }
            } else {
                httpResponse.sendRedirect("login");
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    private String getUserRole(int settingId) {
        List<SystemSetting> systemSettingList = systemSettingService.getAllSystem_setting();
        for (SystemSetting systemSetting : systemSettingList) {
            if (systemSetting.getSetting_id() == settingId &&
                    "user_role".equals(systemSetting.getSetting_name()) &&
                    "user".equals(systemSetting.getSetting_type())) {
                return systemSetting.getSetting_value();
            }
        }
        return "";
    }

    private boolean checkRoleAccess(String role, String requestURI) {
        return switch (role) {
            case "admin" -> requestURI.contains("/dashboard/admin");
            case "manager" -> requestURI.contains("/dashboard/manager");
            case "teacher" -> requestURI.contains("/dashboard/teacher");
            case "student" -> requestURI.contains("/dashboard/student");
            default -> false;
        };
    }

    private void handleUnauthorizedAccess(HttpServletResponse httpResponse, String requestURI) throws IOException {
        httpResponse.sendError(HttpServletResponse.SC_UNAUTHORIZED);
    }

    @Override
    public void destroy() {
    }
}
