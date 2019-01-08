
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.PhaseService;
import domain.Phase;

@Controller
@RequestMapping("/phase")
public class PhaseController extends AbstractController {

	//----------------Services------------------------
	@Autowired
	private PhaseService	phaseService;


	//-----------------List----------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Phase> phases;

		phases = this.phaseService.findAll();

		result = new ModelAndView("phase/list");
		result.addObject("requestURI", "phase/list.do");
		result.addObject("phase", phases);

		return result;
	}

}
