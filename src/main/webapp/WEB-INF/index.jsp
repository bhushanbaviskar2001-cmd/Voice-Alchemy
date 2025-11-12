<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Voice RSS API Form</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8f9fa;
    }
    .form-container {
        max-width: 800px;
        margin: 30px auto;
        background: white;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        padding: 30px;
    }
    .btn-custom {
        background-color: #0d6efd;
        color: white;
        border: none;
    }
    .btn-custom:hover {
        background-color: #084298;
    }
    .profile-section {
        text-align: center;
        margin-bottom: 20px;
    }
    .profile-section img {
        border-radius: 50%;
        width: 100px;
        height: 100px;
        object-fit: cover;
    }
    .profile-section h4 {
        margin-top: 10px;
    }
    .profile-section p {
        font-size: 1.2rem;
        color: #6c757d;
    }
    .form-header {
        font-weight: bold;
        color: #0d6efd;
    }
</style>
</head>
<body>

<div class="container">
    <div class="form-container">
     
        <!-- Form Section -->
        <h3 class="text-center mb-4 form-header">Voice RSS API Form</h3>
        <form method="POST" action="voiceRSSHandler">

            <!-- Text to Speech -->
            <div class="mb-3">
                <label for="textInput" class="form-label">Text</label>
                <textarea class="form-control" id="textInput" name="src" rows="4" placeholder="Enter the text to convert to speech..." required><%= request.getAttribute("text") %></textarea>
            </div>

            <!-- Language -->
            <div class="mb-3">
                <label for="languageSelect" class="form-label">Language</label>
                <select class="form-select" id="languageSelect" name="hl" required>
                    <option value="" disabled>Select Language</option>
                    <option value="en-us" <%= "en-us".equals(request.getAttribute("language")) ? "selected" : "" %>>English (United States)</option>
                    <option value="fr-fr" <%= "fr-fr".equals(request.getAttribute("language")) ? "selected" : "" %>>French (France)</option>
                    <option value="de-de" <%= "de-de".equals(request.getAttribute("language")) ? "selected" : "" %>>German (Germany)</option>
                    <option value="es-es" <%= "es-es".equals(request.getAttribute("language")) ? "selected" : "" %>>Spanish (Spain)</option>
                </select>
            </div>

            <!-- Voice -->
            <div class="mb-3">
                <label for="voiceSelect" class="form-label">Voice</label>
                <select class="form-select" id="voiceSelect" name="v" required>
                    <option value="" disabled>Select Voice</option>
                    <!-- Voices will be populated dynamically based on language -->
                    <option value="Linda" <%= "Linda".equals(request.getAttribute("voice")) ? "selected" : "" %>>Linda (Female, English US)</option>
                    <option value="John" <%= "John".equals(request.getAttribute("voice")) ? "selected" : "" %>>John (Male, English US)</option>
                    <option value="Hanna" <%= "Hanna".equals(request.getAttribute("voice")) ? "selected" : "" %>>Hanna (Female, French)</option>
                    <option value="Paul" <%= "Paul".equals(request.getAttribute("voice")) ? "selected" : "" %>>Paul (Male, French)</option>
                    <option value="Markus" <%= "Markus".equals(request.getAttribute("voice")) ? "selected" : "" %>>Markus (Male, German)</option>
                    <option value="Marlene" <%= "Marlene".equals(request.getAttribute("voice")) ? "selected" : "" %>>Marlene (Female, German)</option>
                    <option value="Sofia" <%= "Sofia".equals(request.getAttribute("voice")) ? "selected" : "" %>>Sofia (Female, Spanish)</option>
                    <option value="Antonio" <%= "Antonio".equals(request.getAttribute("voice")) ? "selected" : "" %>>Antonio (Male, Spanish)</option>
                </select>
            </div>

            <!-- Speech Rate -->
            <div class="mb-3">
                <label for="rateInput" class="form-label">Speech Rate (Speed)</label>
                <input type="number" class="form-control" id="rateInput" name="r" min="-10" max="10" placeholder="Enter a value between -10 (slowest) to 10 (fastest)" value="<%= request.getAttribute("rate") %>">
            </div>

            <!-- Audio Codec -->
            <div class="mb-3">
                <label for="codecSelect" class="form-label">Audio Codec</label>
                <select class="form-select" id="codecSelect" name="c" required>
                    <option value="" disabled>Select Codec</option>
                    <option value="mp3" <%= "mp3".equals(request.getAttribute("codec")) ? "selected" : "" %>>MP3</option>
                    <option value="wav" <%= "wav".equals(request.getAttribute("codec")) ? "selected" : "" %>>WAV</option>
                    <option value="aac" <%= "aac".equals(request.getAttribute("codec")) ? "selected" : "" %>>AAC</option>
                    <option value="ogg" <%= "ogg".equals(request.getAttribute("codec")) ? "selected" : "" %>>OGG</option>
                </select>
            </div>

            <!-- Audio Format -->
            <div class="mb-3">
                <label for="formatSelect" class="form-label">Audio Format</label>
                <select class="form-select" id="formatSelect" name="f">
                    <option value="8khz_8bit_mono" <%= "8khz_8bit_mono".equals(request.getAttribute("format")) ? "selected" : "" %>>8 kHz, 8 Bit, Mono</option>
                    <option value="16khz_16bit_stereo" <%= "16khz_16bit_stereo".equals(request.getAttribute("format")) ? "selected" : "" %>>16 kHz, 16 Bit, Stereo</option>
                    <option value="44khz_16bit_mono" <%= "44khz_16bit_mono".equals(request.getAttribute("format")) ? "selected" : "" %>>44 kHz, 16 Bit, Mono</option>
                </select>
            </div>

            <!-- Submit Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-custom">Generate Speech</button>
            </div>
        </form>

        <!-- Audio Playback -->
      <% String audioBase64 = (String) request.getAttribute("audioBase64"); %>
        <% if (audioBase64 != null && !audioBase64.isEmpty()) { %>
            <div class="audio-output">
            <br><br>
                <h4>Your Generated Audio</h4>
                <audio controls>
                    <source src="data:audio/wav;base64,<%= audioBase64 %>" type="audio/wav">
                    Your browser does not support the audio element.
                </audio>
            </div>
        <% } %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const languageSelect = document.getElementById("languageSelect");
        const voiceSelect = document.getElementById("voiceSelect");
        const codecSelect = document.getElementById("codecSelect");

        const languageVoices = {
            'en-us': [
                { value: 'Linda', label: 'Linda (Female, English US)' },
                { value: 'John', label: 'John (Male, English US)' }
            ],
            'fr-fr': [
                { value: 'Hanna', label: 'Hanna (Female, French)' },
                { value: 'Paul', label: 'Paul (Male, French)' }
            ],
            'de-de': [
                { value: 'Markus', label: 'Markus (Male, German)' },
                { value: 'Marlene', label: 'Marlene (Female, German)' }
            ],
            'es-es': [
                { value: 'Sofia', label: 'Sofia (Female, Spanish)' },
                { value: 'Antonio', label: 'Antonio (Male, Spanish)' }
            ]
        };

        const languageCodecs = {
            'en-us': ['mp3', 'wav'],
            'fr-fr': ['mp3', 'aac'],
            'de-de': ['mp3', 'ogg'],
            'es-es': ['wav', 'aac']
        };

        languageSelect.addEventListener('change', function () {
            const selectedLanguage = languageSelect.value;

            // Clear previous selections
            voiceSelect.innerHTML = '<option value="" disabled selected>Select Voice</option>';
            codecSelect.innerHTML = '<option value="" disabled selected>Select Codec</option>';

            // Populate voices based on selected language
            const voices = languageVoices[selectedLanguage] || [];
            voices.forEach(voice => {
                const option = document.createElement("option");
                option.value = voice.value;
                option.textContent = voice.label;
                voiceSelect.appendChild(option);
            });

            // Populate codecs based on selected language
            const codecs = languageCodecs[selectedLanguage] || [];
            codecs.forEach(codec => {
                const option = document.createElement("option");
                option.value = codec;
                option.textContent = codec.toUpperCase();
                codecSelect.appendChild(option);
            });
        });
    });
</script>

</body>
</html>
