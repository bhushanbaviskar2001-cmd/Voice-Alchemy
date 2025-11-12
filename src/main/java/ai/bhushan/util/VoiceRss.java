package ai.bhushan.util;

import static ai.bhushan.constant.VoiceRssConstant.API_kEY;

import java.util.Base64;

import com.voicerss.tts.AudioCodec;
import com.voicerss.tts.Languages;
import com.voicerss.tts.VoiceParameters;
import com.voicerss.tts.VoiceProvider;

public class VoiceRss {

	/**
	 * Converts the provided text to speech and returns the audio as a
	 * Base64-encoded string.
	 * 
	 */
	public static String convertToAudioBase64(String text, String language, String voice, String rate, String codec,
			String format) throws Exception {
		// Initialize the VoiceProvider with the API key
		VoiceProvider tts = new VoiceProvider(API_kEY);

		// Convert the language code to the appropriate Languages enum value

		// Set up the VoiceParameters with the provided parameters
		VoiceParameters params = new VoiceParameters(text, getLanguage(language));
		params.setVoice(voice); // Set the voice (e.g., Linda, John, etc.)
		params.setRate(Integer.parseInt(rate)); // Set the speech rate (speed)
	    params.setBase64(false);
	    params.setSSML(false);
		// Set up the codec and audio format
		setAudioCodec(params, codec);
		setAudioFormat(params, format);

		// Generate the audio from text-to-speech
		byte[] voiceBytes = tts.speech(params);

		// Return the audio as a Base64 encoded string
		return Base64.getEncoder().encodeToString(voiceBytes);
	}

	// Helper method to convert the language code to the appropriate Languages enum
	private static String getLanguage(String languageCode) {
		switch (languageCode) {
		case "ar-eg":
			return Languages.Arabic_Egypt;
		case "ar-sa":
			return Languages.Arabic_SaudiArabia;
		case "bg-bg":
			return Languages.Bulgarian;
		case "ca-es":
			return Languages.Catalan;
		case "zh-cn":
			return Languages.Chinese_China;
		case "zh-hk":
			return Languages.Chinese_HongKong;
		case "zh-tw":
			return Languages.Chinese_Taiwan;
		case "hr-hr":
			return Languages.Croatian;
		case "cs-cz":
			return Languages.Czech;
		case "da-dk":
			return Languages.Danish;
		case "nl-be":
			return Languages.Dutch_Belgium;
		case "nl-nl":
			return Languages.Dutch_Netherlands;
		case "en-au":
			return Languages.English_Australia;
		case "en-ca":
			return Languages.English_Canada;
		case "en-gb":
			return Languages.English_GreatBritain;
		case "en-ie":
			return Languages.English_Ireland;
		case "en-us":
			return Languages.English_UnitedStates;
		case "fi-fi":
			return Languages.Finnish;
		case "fr-ca":
			return Languages.French_Canada;
		case "fr-fr":
			return Languages.French_France;
		case "fr-ch":
			return Languages.French_Switzerland;
		case "de-at":
			return Languages.German_Austria;
		case "de-de":
			return Languages.German_Germany;
		case "de-ch":
			return Languages.German_Switzerland;
		case "el-gr":
			return Languages.Greek;
		case "he-il":
			return Languages.Hebrew;
		case "hi-in":
			return Languages.Hindi;
		case "hu-hu":
			return Languages.Hungarian;
		case "id-id":
			return Languages.Indonesian;
		case "it-it":
			return Languages.Italian;
		case "ja-jp":
			return Languages.Japanese;
		case "ko-kr":
			return Languages.Korean;
		case "ms-my":
			return Languages.Malay;
		case "nb-no":
			return Languages.Norwegian;
		case "pl-pl":
			return Languages.Polish;
		case "pt-br":
			return Languages.Portuguese_Brazil;
		case "pt-pt":
			return Languages.Portuguese_Portugal;
		case "ro-ro":
			return Languages.Romanian;
		case "ru-ru":
			return Languages.Russian;
		case "sk-sk":
			return Languages.Slovak;
		case "sl-si":
			return Languages.Slovenian;
		case "es-mx":
			return Languages.Spanish_Mexico;
		case "es-es":
			return Languages.Spanish_Spain;
		case "sv-se":
			return Languages.Swedish;
		case "ta-in":
			return Languages.Tamil;
		case "th-th":
			return Languages.Thai;
		case "tr-tr":
			return Languages.Turkish;
		case "vi-vn":
			return Languages.Vietnamese;
		default:
			return Languages.English_UnitedStates;
		}
	}

	// Helper method to set the audio codec based on user input
	private static void setAudioCodec(VoiceParameters params, String codec) {
		switch (codec.toLowerCase()) {
		case "mp3":
			params.setCodec(AudioCodec.MP3);
			break;
		case "wav":
			params.setCodec(AudioCodec.WAV);
			break;
		case "aac":
			params.setCodec(AudioCodec.AAC);
			break;
		case "ogg":
			params.setCodec(AudioCodec.OGG);
			break;
		case "caf":
			params.setCodec(AudioCodec.CAF);
			break;
		default:
			params.setCodec(AudioCodec.MP3); // Default to MP3 codec
		}
	}

	// Helper method to set the audio format based on user input
	private static void setAudioFormat(VoiceParameters params, String format) {
		switch (format) {
		case "8khz_8bit_mono":
			params.setFormat("8khz_8bit_mono");
			break;
		case "16khz_16bit_stereo":
			params.setFormat("16khz_16bit_stereo");
			break;
		case "44khz_16bit_mono":
			params.setFormat("44khz_16bit_mono");
			break;
		default:
			params.setFormat("44khz_16bit_mono"); // Default to 44 kHz format
		}
	}
}
