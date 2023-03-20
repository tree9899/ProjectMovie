package com.MVReservation001.makeUp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MakeUpController {

	@RequestMapping(value = "/makeUpMain")
	public String makeUpMain() {
		return "makeUp/makeUpMain";
	}
	
	@RequestMapping(value = "/memJoinPage")
	public ModelAndView memJoinPage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("makeUp/MemberJoinPage");
		return mav;
	}
	
	
}
