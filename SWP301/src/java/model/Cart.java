/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getpId() == id) {
                return i;
            }
        }

        return null;

    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getpId()) != null) {
            Item i = getItemById(t.getProduct().getpId());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void remove(Item t) {
        if (getItemById(t.getProduct().getpId()) != null) {
            Item i = getItemById(t.getProduct().getpId());
            items.remove(i);
        }
    }

    public long totalPrice() {
        long l = 0;
        for (Item i : items) {
            l += i.getPrice() * i.getQuantity();
        }
        return l;
    }

    private Product getProductById(int id, List<Product> list) {
        for (Product i : list) {
            if (i.getpId() == id) {
                return i;
            }
        }
        return null;
    }

    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    int price = Integer.parseInt(n[2]);
                    Product p = getProductById(id, list);
                    Item t = new Item(p, quantity, price);
                    addItem(t);
                }
            }
        } catch (NumberFormatException e) {

        }

    }

    public String cartToTxt(Cart c) {
        if (c == null) {
            return null;
        }
        List<Item> li = c.getItems();

        if (li.size() != 0) {
            String txt;
            if (li.size() == 1) {
                txt = li.get(0).getProduct().getpId() + ":" + li.get(0).getQuantity() + ":" + li.get(0).getPrice();
            } else {
                txt = li.get(0).getProduct().getpId() + ":" + li.get(0).getQuantity() + ":" + li.get(0).getPrice();
                for (int i = 1; i < li.size(); i++) {
                    txt += "/" + li.get(i).getProduct().getpId() + ":" + li.get(i).getQuantity() + ":" + li.get(i).getPrice();

                }
            }
            return txt;
        }

        return null;
    }

    public static void main(String[] args) {
        DAO d = new DAO();

        List<Item> li2 = new ArrayList<>();

        List<Product> p = d.getAllProd();
        for (int i = 0; i < 4; i++) {

            int quantity = 2;
            int price = 3;
            Item t = new Item(p.get(i), quantity, price);
            li2.add(t);
        }

        Cart c = new Cart(li2);

        String s = c.cartToTxt(c);
        System.out.println("" + s);
    }

}
