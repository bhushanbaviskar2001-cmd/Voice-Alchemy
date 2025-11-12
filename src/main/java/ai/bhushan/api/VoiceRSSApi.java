package ai.bhushan.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ai.bhushan.util.VoiceRss;

@Controller
public class VoiceRSSApi {
	@PostMapping("/voiceRSSHandler")
	public String generateSpeech(@RequestParam String src, // Text input
			@RequestParam String hl, // Language code
			@RequestParam String v, // Voice
			@RequestParam(required = false) String r, // Rate
			@RequestParam String c, // Codec
			@RequestParam String f, // Audio format
			Model model) {

		try {
			// Set default value for rate if not provided
			String rate = r != null ? r : "0"; // Default rate to 0 if not provided

			// Call the VoiceRss utility to get the speech as base64 string
			String audioBase64 = VoiceRss.convertToAudioBase64(src, hl, v, rate, c, f);

			// Prepare the response data to send to the view
			Map<String, Object> response = new HashMap<>();
			response.put("audioBase64", audioBase64);
			response.put("text", src);
			response.put("language", hl);
			response.put("voice", v);
			response.put("rate", rate);
			response.put("codec", c);
			response.put("format", f);

			// Add the data to the model
			model.addAllAttributes(response);

			// Return the view with the speech result
			return "index"; // The name of the view to show the result

		} catch (Exception e) {
			model.addAttribute("error", "Error generating speech: " + e.getMessage());
			return "error"; // Show an error page if there is any issue
		}
	}
}
