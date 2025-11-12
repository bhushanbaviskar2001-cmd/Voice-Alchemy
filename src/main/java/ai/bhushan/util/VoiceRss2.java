package ai.bhushan.util;

import static ai.bhushan.constant.VoiceRssConstant.API_kEY;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;

import com.voicerss.tts.AudioCodec;
import com.voicerss.tts.AudioFormat;
import com.voicerss.tts.Languages;
import com.voicerss.tts.VoiceParameters;
import com.voicerss.tts.VoiceProvider;

public class VoiceRss2 {   public static void main(String[] args) throws Exception {
    VoiceProvider tts = new VoiceProvider("8ce34faf0bb748f1b9fbd9c55c4954bf");

    VoiceParameters params = new VoiceParameters("Hello I am Bhushan I am testing the RSS Application", Languages.English_UnitedStates);
    params.setCodec(AudioCodec.WAV);
    params.setFormat(AudioFormat.Format_44KHZ.AF_44khz_16bit_stereo);
    params.setBase64(false);
    params.setSSML(false);
    params.setRate(0);

    byte[] voice = tts.speech(params);

    // Save the audio data to a file
    try (FileOutputStream fos = new FileOutputStream("Bhushan.wav")) {
        fos.write(voice);
    } catch (IOException e) {
        e.printStackTrace();
    }

    System.out.println("Audio file saved as output.wav");
}
}
