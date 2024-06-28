package controller;

import dal.OrderDBcontext;
import dal.OrderDetailDBcontext;
import dal.ShippingDBcontext;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Order;
import model.Shipping;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/checkout"})
public class CheckOutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        if (request.getSession().getAttribute("acc") != null) {
            HttpSession session = request.getSession();
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new LinkedHashMap<>();
            }

            double totalMoney = 0;
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer productId = entry.getKey();
                Cart cart = entry.getValue();
                totalMoney += cart.getQuantity() * cart.getProduct().getPrice();
            }
            request.setAttribute("totalMoney", totalMoney);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String name = request.getParameter("name").trim();
        String phone = request.getParameter("phone").trim();
        String address = request.getParameter("address").trim();
        String note = request.getParameter("note");

        if (name.isEmpty() || phone.isEmpty() || address.isEmpty()) {
            request.setAttribute("error", "Name, Phone number, and Address are required.");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
            return;
        }

        // Save to database
        Shipping shipping = new Shipping(name, phone, address);
        int shippingId = new ShippingDBcontext().createReturnId(shipping);

        HttpSession session = request.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        double totalPrice = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productId = entry.getKey();
            Cart cart = entry.getValue();
            totalPrice += cart.getQuantity() * cart.getProduct().getPrice();
        }

        Account a = (Account) request.getSession().getAttribute("acc");
        Order order = new Order(a.getUid(), totalPrice, note, shippingId);
        int orderId = new OrderDBcontext().createReturnId(order);

        new OrderDetailDBcontext().saveCart(orderId, carts);

        session.removeAttribute("carts");
        request.setAttribute("cartss", carts);
        request.setAttribute("totalPrice", totalPrice);
        request.getRequestDispatcher("thank").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
