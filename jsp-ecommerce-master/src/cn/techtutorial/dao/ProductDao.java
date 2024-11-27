package cn.techtutorial.dao;

import java.sql.*;
import java.util.*;

import cn.techtutorial.model.Cart;
import cn.techtutorial.model.Product;

public class ProductDao {
    private final Connection con;

    public ProductDao(Connection con) {
        this.con = con;
    }

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM products";
        try (PreparedStatement pst = con.prepareStatement(query); ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error fetching all products: " + e.getMessage());
        }
        return productList;
    }

    public Product getSingleProduct(int id) {
        Product product = null;
        String query = "SELECT * FROM products WHERE id=?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, id);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setCategory(rs.getString("category"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImage(rs.getString("image"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error fetching product with ID " + id + ": " + e.getMessage());
        }
        return product;
    }

    public double getTotalCartPrice(List<Cart> cartList) {
        double total = 0;
        String query = "SELECT price FROM products WHERE id=?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            for (Cart cartItem : cartList) {
                pst.setInt(1, cartItem.getId());
                try (ResultSet rs = pst.executeQuery()) {
                    if (rs.next()) {
                        total += rs.getDouble("price") * cartItem.getQuantity();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error calculating total cart price: " + e.getMessage());
        }
        return total;
    }

    public List<Cart> getCartProducts(List<Cart> cartList) {
        List<Cart> cartProducts = new ArrayList<>();
        String query = "SELECT * FROM products WHERE id=?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            for (Cart cartItem : cartList) {
                pst.setInt(1, cartItem.getId());
                try (ResultSet rs = pst.executeQuery()) {
                    if (rs.next()) {
                        Cart cart = new Cart();
                        cart.setId(rs.getInt("id"));
                        cart.setName(rs.getString("name"));
                        cart.setCategory(rs.getString("category"));
                        cart.setPrice(rs.getDouble("price") * cartItem.getQuantity());
                        cart.setQuantity(cartItem.getQuantity());
                        cartProducts.add(cart);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error fetching cart products: " + e.getMessage());
        }
        return cartProducts;
    }
}
