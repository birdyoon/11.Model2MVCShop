package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> ��ǰ���� Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")	 // ��ü ���������� �ƹ� ���� �ȵǾ� �ִٸ� 3���� ����
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")	 // ������������ �ƹ� ������ �ȵǾ� �ִٸ� 2���� ���̰� ���� 
	int pageSize;
	
	private  String FILE_SERVER_PATH= "C:\\workspace\\11.Model2MVCShop\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
	
	//@RequestMapping("/addProductView.do")
	//public String addProductView() throws Exception {
	@RequestMapping( value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception{
		
		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
			
	//@RequestMapping("/addProduct.do")
	@RequestMapping( value="addProduct", method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product,
				@RequestParam("uploadFile")  MultipartFile file, ModelAndView mv, Model model) throws Exception {
		/*@RequestParam("uploadFile")  MultipartFile file, ModelAndView mv, Model model */
		System.out.println("/product/addProduct : POST");
					
			if(!file.getOriginalFilename().isEmpty()) {
				file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
				model.addAttribute("msg", "File uploaded successfully.");
			}else {
				model.addAttribute("msg", "Please select a valid mediaFile..");
			}
		
		
		
		product.setManuDate(product.getManuDate().replace("-",""));
		//	B/L
		productService.addProduct(product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	
	
	//@RequestMapping("/getProduct.do")
	@RequestMapping( value="getProduct", method=RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") int prodNo , Model model, HttpServletRequest request) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		
		String menu = request.getParameter("menu");
		
//		HttpSession session=request.getSession();
//		session.setAttribute("menu", menu);
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		if(menu == null || menu.equals("")) {
			menu = "menuoo";
		}
		
		if(menu.equals("manage")) {
			System.out.println(menu);
			return "forward:/product/updateProductView.jsp";
		}
		
		return "forward:/product/getProduct.jsp";
	 }
	
	//@RequestMapping("/updateProductView.do")
	@RequestMapping( value="updateProductView", method=RequestMethod.GET)
	public String updateProductView(@RequestParam("product") Product product, Model model ) throws Exception {
		
		System.out.println("/product/updateProductView : GET");
		
		productService.updateProduct(product);
		
		model.addAttribute(product);
		
		return "redirect:/product/updateProductView.jsp";
		
	}
	
	//@RequestMapping("/updateProduct.do")
	@RequestMapping( value="updateProduct", method=RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product, Model model, HttpServletRequest request ) throws Exception {
		
		System.out.println("/product/updateProduct : POST");
		
		productService.updateProduct(product);
		
		product.setProdNo(product.getProdNo());
		
		model.addAttribute(product);
		
		
	//	return "forward:/product/updateProduct.jsp";
	//	return "redirect:/getProduct.do?prodNo="+product.getProdNo();
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}
	
	
	
	
	//@RequestMapping("/listProduct.do")
	@RequestMapping( value="listProduct")
	public String listProduct(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {
		
		String menu=request.getParameter("menu");
		
		System.out.println("/product/listProduct : GET / POST");
		System.out.println("kkkkkk");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = productService.getProductList(search);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage ::"+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		System.out.println("menu : "+menu);
		return "forward:/product/listProduct.jsp";
	}
	
		
	
	
}