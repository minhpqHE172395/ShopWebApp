/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class CategorySorter extends Category{
    // Phương thức để sắp xếp danh sách thể loại theo bảng chữ cái
    public static void sortCategories(List<Category> categories) {
        Collections.sort(categories, new Comparator<Category>() {
            @Override
            public int compare(Category c1, Category c2) {
                return c1.getCname().compareTo(c2.getCname());
            }
        });
    }
}
