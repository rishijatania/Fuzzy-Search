package com.fuzzy.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fuzzy.service.CheckDuplicatesService;
import com.fuzzy.utility.UtilityMethods;

@Controller
public class HelloController {

	@Autowired
	CheckDuplicatesService checkDuplicatesService;

	@Autowired
	UtilityMethods utility;
	
	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@PostMapping("/uploadFile")
	public String uploadFile(@RequestParam("file") MultipartFile file, Model model) {
		log.info("/uploadFile Called");
		File normalfile = utility.convertMultiPartToFile(file);
		List<Set<Map<String, String>>> finalList = checkDuplicatesService.checkDuplicates(normalfile);
		Set<Map<String, String>> setOfNonDuplicates = finalList.get(finalList.size() - 1);
		finalList.remove(finalList.size() - 1);
		List<String> listOfColumnHeaders = utility.getCloumnHeader();
		log.info("/Search completed");
		model.addAttribute("duplicates", finalList);
		model.addAttribute("nonDuplicates", setOfNonDuplicates);
		model.addAttribute("columnHeaders", listOfColumnHeaders);
		return "result";
	}

}
