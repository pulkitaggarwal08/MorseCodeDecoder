# 🔊 Morse Code Audio Decoder using Digital Signal Processing (DSP)

This project implements a Morse code decoder using MATLAB and core Digital Signal Processing (DSP) techniques. It processes a **pre-recorded `.wav` audio file** containing Morse beeps, filters the signal, detects tone durations, and decodes the message into human-readable text.

---

## 📌 Overview

The system performs the following steps:
1. Reads a `.wav` file containing Morse code tones.
2. Applies a **Butterworth IIR bandpass filter** to isolate the target tone frequency and reduce background noise.
3. Extracts amplitude envelope and converts the signal into a binary stream of 1s (tones) and 0s (silence).
4. Classifies pulses based on duration into **dots**, **dashes**, and **spaces**.
5. Decodes the resulting Morse sequence into readable alphanumeric text.

---

## 🚀 Features

- 📁 Offline decoding of Morse code from `.wav` audio files
- 🎚️ IIR Butterworth filter design and implementation
- 🧮 Duration-based classification (dot, dash, intra-letter space, inter-letter space, word gap)
- 🔠 Morse-to-text decoding using a lookup dictionary
- ✅ Fully written in MATLAB with modular scripts

---

## 🧠 DSP Concepts Used

- **IIR Butterworth Bandpass Filtering**
- **Envelope Extraction** via full-wave rectification
- **Thresholding & Pulse Duration Analysis**
- **Binary Signal Interpretation**
- **Morse Code Parsing and Mapping**

---

## 📁 Project Structure

📦 morse-code-decoder
├── audio_samples/
│ └── morse_input.wav # Sample Morse code audio input
├── morse_decoder.m # Main script: full decoding pipeline
├── butterworth_filter.m # Filter design and application
├── morse_dict.m # Morse code lookup table
├── README.md # This file


---
## ▶️ How to Run

1. Open MATLAB and set the project folder as the current directory.
2. Make sure your Morse code `.wav` file is inside the `audio_samples/` folder.
3. Run the following in the MATLAB console:

```matlab
morse_decoder('audio_samples/morse_input.wav')
