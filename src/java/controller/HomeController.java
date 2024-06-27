package controller;

import dal.CategoryDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        final int PAGE_SIZE = 6;

        List<Category> listCategories = new CategoryDBContext().getAllCategories();
        request.setAttribute("listCategories", listCategories);

        String categoryIdStr = request.getParameter("categoryId");
        Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty()) ? Integer.parseInt(categoryIdStr) : null;

        String pageStr = request.getParameter("page");
        int page = (pageStr != null && !pageStr.isEmpty()) ? Integer.parseInt(pageStr) : 1;
        if (page < 1) {
            page = 1;
        }

        ProductDBContext productDAO = new ProductDBContext();
        int totalProducts;
        if (categoryId != null) {
            totalProducts = productDAO.getTotalProductsByCategory(categoryId);
        } else {
            totalProducts = productDAO.getTotalProducts();
        }
        int totalPages = (int) Math.ceil((double) totalProducts / PAGE_SIZE);
        if (page > totalPages) {
            page = totalPages;
        }

        List<Product> listProducts;
        if (categoryId != null) {
            listProducts = productDAO.getProductsByCategoryAndPage(categoryId, page, PAGE_SIZE);
        } else {
            listProducts = productDAO.getProductsWithPagging(page, PAGE_SIZE);
        }

        request.setAttribute("page", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("listProducts", listProducts);
        request.setAttribute("categoryId", categoryId);

        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
