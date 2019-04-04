package com.fuzzy.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.opencsv.CSVReader;

@Service
public class UtilityMethods {

	static List<String> fieldNames = null;
	public static final String UTF8_BOM = "\uFEFF";

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * @param Multipart file
	 * @return File
	 */
	public File convertMultiPartToFile(MultipartFile file) {
		File convFile = new File(file.getOriginalFilename());
		FileOutputStream fos;
		try {
			fos = new FileOutputStream(convFile);

			fos.write(file.getBytes());
			fos.close();
		} catch (FileNotFoundException e) {
			log.error(e.getMessage());

		} catch (IOException e) {
			log.error(e.getMessage());
		}
		return convFile;
	}

	/**
	 * @param File
	 * @return The csv representation in List of Maps with label and value as key
	 *         value pair
	 */
	public static List<Map<String, String>> readAll(File file) {
		List<Map<String, String>> jsonArray = new ArrayList<>();
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, StandardCharsets.UTF_8);
				CSVReader reader = new CSVReader(isr)) {
			String[] fieldNamesString;
			if ((fieldNamesString = reader.readNext()) != null) {
				if (fieldNamesString[0].startsWith(UTF8_BOM)) {
					fieldNamesString[0] = fieldNamesString[0].substring(1);
				}
				fieldNames = Arrays.asList(fieldNamesString);
			}
			String[] nextLine;
			int counter = 0;
			while ((nextLine = reader.readNext()) != null) {

				List<String> list = Arrays.asList(nextLine);
				Map<String, String> obj = new LinkedHashMap<>();
				obj.put("index", String.valueOf(++counter));
				for (int i = 0; i < list.size(); i++) {
					obj.put(fieldNames.get(i), list.get(i).isEmpty() ? "" : list.get(i));
				}
				jsonArray.add(obj);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}

	/**
	 * @param
	 * @return List of Column Headers
	 */
	public static List<String> getCloumnHeader() {
		return fieldNames;
	}
}
