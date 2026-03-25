package com.fsad;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;




@RestController
@RequestMapping("/products")
public class ProductController {
	

    @Autowired
    ProductService productService;
    
    @GetMapping("/search")
    public Product getByName(@RequestParam String name) {
        List<Product> products = productService.getAllProducts();
        for(Product p : products) {
            if(p.getName().equalsIgnoreCase(name)) {
                return p;
            }
        }
        return null;
    }

    @PostMapping
    public Product addProduct(@RequestBody Product product) {
        return productService.saveProduct(product);
    }

    @GetMapping
    public List<Product> getAllProducts() {
        return productService.getAllProducts();
    }

    @GetMapping("/{id}")
    public Product getProductById(@PathVariable int id) {
        return productService.getProductById(id);
    }

    @PutMapping("/{id}")
    public Product updateProduct(@PathVariable int id, @RequestBody Product product) {
        return productService.updateProduct(id, product);
    }

    @DeleteMapping("/{id}")
    public String deleteProduct(@PathVariable int id) {
        productService.deleteProduct(id);
        return "Product deleted successfully!";
    }
}
