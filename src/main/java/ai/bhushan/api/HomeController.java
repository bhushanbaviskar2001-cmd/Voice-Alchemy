package ai.bhushan.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping
	public String test() {
		System.out.println("Called ");
		return "index";
	}
}
