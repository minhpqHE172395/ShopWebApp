/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class SessionListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Khởi tạo
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Thực hiện các thao tác khi context kết thúc, như làm sạch các dữ liệu session
        // Xoá các dữ liệu cần reset
        sce.getServletContext().removeAttribute("totalQuantity");
    }
}
