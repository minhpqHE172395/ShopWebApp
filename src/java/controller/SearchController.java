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

public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        final int PAGE_SIZE = 6;

        String keyword = request.getParameter("keyword");

        String pageStr = request.getParameter("page");
        int page = (pageStr != null && !pageStr.isEmpty()) ? Integer.parseInt(pageStr) : 1;
        if (page < 1) {
            page = 1;
        }

        ProductDBContext productDAO = new ProductDBContext();
        List<Product> listProducts = productDAO.search(keyword);
        int totalProducts = listProducts.size();
        int totalPages = (int) Math.ceil((double) totalProducts / PAGE_SIZE);

        if (page > totalPages) {
            page = totalPages;
        }

        int start = (page - 1) * PAGE_SIZE;
        int end = Math.min(page * PAGE_SIZE, totalProducts);
        List<Product> paginatedProducts = listProducts.subList(start, end);

        List<Category> listCategories = new CategoryDBContext().getAllCategories();
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("listProducts", paginatedProducts);
        request.setAttribute("keyword", keyword);
        request.setAttribute("page", page);
        request.setAttribute("totalPages", totalPages);

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
