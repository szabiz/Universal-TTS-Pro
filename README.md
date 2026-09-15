# Universal TTS Pro - v1.3.4

A portable, fully offline Text-to-Speech (TTS) client built with Python and Tkinter. This application combines the power of **Piper TTS** and **Supertonic TTS** engines to deliver high-quality, lightning-fast speech synthesis directly on your device, without requiring an internet connection, cloud services, or external API keys.

---

## 🌟 Key Features & Smart Capabilities

* **100% Offline & Private:** All processing happens locally on your machine. Your data never leaves your device.
* **Dual TTS Engine Architecture:**
  * **Piper TTS:** High-quality, neural text-to-speech utilizing optimized ONNX models.
  * **Supertonic TTS:** Extremely fast, lightweight, on-device multilingual speech engine.
* **Intelligent Text Normalization (FIX Button):**
  * Automatically expands common abbreviations and correctly formats **Bible verses**.
  * Advanced number-to-words conversion supporting **Hungarian (HU), English (EN), and Romanian (RO)**!
  * Allows raw conversion without text correction via the *Output* section.
* **Click-to-Jump Navigation:** Click on any sentence inside the text area while speech is active to instantly skip or resume playback from that exact point.
* **Instant Smart STOP:** Pressing STOP instantly kills both the audio playback AND the background file generation process.
* **Flexible Audio Outputs:** Export speech to studio-quality **WAV** or space-efficient, high-fidelity **OPUS** files.
* **Built-in License Compliance Screens:** The first time you actually use the Supertonic engine, and separately the first time you use a Piper/Sherpa-ONNX voice, the app shows a scrollable window with the complete, original license text of every third-party component tied to that engine. You must scroll to the end before you can accept — after that, your decision is remembered (per engine) and you won't be asked again unless the bundled license texts are later updated.

---

## 💻 System Requirements

Since **Universal TTS Pro** runs entirely offline and processes neural AI speech models locally on your hardware, your system should meet the following minimum specifications:

| Component | Minimum Requirement | Recommended Specification |
| :--- | :--- | :--- |
| **Operating System** | Windows 10 / 11 (64-bit) | Windows 10 / 11 (64-bit) |
| **Processor (CPU)** | Intel Core i3 / AMD Ryzen 3 (Dual-Core) | Intel Core i5 / AMD Ryzen 5 or better (Quad-Core+) |
| **Memory (RAM)** | 4 GB RAM | 16 GB RAM or more |
| **Storage Space** | ~100 MB (Client + Tools) | Up to 2-5 GB (Depending on downloaded `.onnx` voices) |
| **Audio** | Any standard Windows-compatible sound card / output device |

### ℹ️ Hardware Performance Note:
* **CPU-Bound:** The speech synthesis process relies heavily on your processor's single-core and multi-core performance.
* **Generation Speed:** On recommended hardware, text generation is faster than real-time (the audio is ready almost instantly). On older or lower-end dual-core processors, you might experience a brief 1-3 second delay before the playback starts while the engine pre-renders the first sentences.

---

## 🛠️ Tech Stack & Open-Source Credits

Universal TTS Pro is built upon and distributed with a number of excellent open-source technologies, runtime components, audio tools, and voice/model assets. The applicable licenses, copyright notices, and attribution requirements of these components are respected.

### 🎙️ Voice & Speech Technologies

- **Piper Voice Engine:** Piper TTS Engine / Code by Michael Hansen / Rhasspy — **MIT License**
- **Piper Runtime:** [Sherpa-ONNX Runtime](https://github.com/k2-fsa/sherpa-onnx) by k2-fsa / Next-gen Kaldi — **Apache License 2.0**
- **Piper Voice Models:** Community-contributed models from [rhasspy/piper-voices](https://huggingface.co/rhasspy/piper-voices) — **repository: MIT License**. Individual voice/model and dataset licenses vary and are identified separately for each model.
- **Text-to-Phoneme Processing:** [eSpeak NG](https://github.com/espeak-ng/espeak-ng) — **GNU GPL v3.0 or later**
- **Supertonic Voice Engine:** [Supertonic TTS 3](https://github.com/supertone-inc/supertonic) by Supertone Inc. — **MIT License (code)** / **OpenRAIL-M (model weights)**

### 🔊 Audio & Signal Processing

- **Audio Playback:** [SoundDevice](https://python-sounddevice.readthedocs.io/) by Matthias Geier — **MIT License**
- **Audio Backend:** PortAudio by Ross Bencina and Phil Burk — **MIT License**
- **Audio Compression:** [Opus Tools (opusenc)](https://gitlab.xiph.org/xiph/opus-tools) by Xiph.Org Foundation — **BSD 3-Clause License**
- **Numerical Processing:** [NumPy](https://numpy.org/) — **BSD 3-Clause License**
- **ONNX Runtime:** Microsoft ONNX Runtime — **MIT License**

### 🖥️ Application & Runtime

- **GUI Framework:** Python / Tkinter — **Python Software Foundation License 2.0**
- **Python Runtime:** Python Software Foundation — **PSF License 2.0**

### 🗣️ Voice & Model Assets

- **HU & RO Piper Voice Models:** Anna, Berta, Imre and Mihai — **CC0 1.0 (Public Domain)**, as applicable to the distributed model assets.
- **English Piper Voice Model:** `en_US-libritts_r-medium` — based on the **LibriTTS-R** corpus; the underlying LibriTTS-R dataset is licensed under **CC BY 4.0**.
- **LibriTTS-R Attribution:**  
  *Yuma Koizumi, Heiga Zen, Shigeki Karita, Yifan Ding, Kohei Yatabe, Nobuyuki Morioka, Michiel Bacchiani, Yu Zhang, Wei Han, and Ankur Bapna,*  
  *"LibriTTS-R: A Restored Multi-Speaker Text-to-Speech Corpus".*
- **Supertonic 3 Model Weights:** **OpenRAIL-M License**

### 🤖 Other

- **Development Assistance:** AI-assisted software engineering.

---

### 📄 Licensing & Attribution

For complete license texts, copyright notices, attribution information, and additional model/data licensing details, please see **[`THIRD-PARTY-LICENSES.txt`](THIRD-PARTY-LICENSES.txt)** included with this distribution.

> **Important:** Repository-level licenses do not necessarily determine the license of an individual voice model or its underlying dataset. Model-specific licensing information takes precedence and should be checked against the corresponding model card and dataset attribution.

## 🚀 Getting the Application

### ✅ Option 1 — Ready-to-Use Portable Package (Recommended)

**No installation, no compilation needed.**

Download the fully pre-compiled, portable ZIP from the [**Releases**](https://github.com/szabiz/Universal-TTS-pro/releases) section. The package contains everything required to run the application immediately:

* The compiled `UniversalTTS_Pro.exe`
* All required Opus binaries (`opusenc.exe`)
* Default Piper voice models (HU / EN / RO)
* Supertonic 3 model weights
* Language normalization dictionaries
* `license_texts/` — the full, original license texts shown by the in-app license acceptance screens (**required** for the app's license gates to work; do not delete)
* `LICENSE.txt` and `THIRD_PARTY_LICENSES.txt` — full project and third-party license documentation

Simply extract the ZIP to any folder or USB drive and run `UniversalTTS_Pro.exe`.

---

### 🔧 Option 2 — Build from Source (Developers)

The files in this GitHub repository represent the **raw source code only**. The repository intentionally does **not** include binary tools or large model files.

To compile a working executable from source, you must manually obtain and place the following components before running PyInstaller:

#### Required components not included in this repository:

| Component | Where to get it | Place it in |
| :--- | :--- | :--- |
| `opusenc.exe` | [opus-codec.org](https://opus-codec.org/downloads/) or [GitLab](https://gitlab.xiph.org/xiph/opus-tools) | Root folder |
| Piper voice models (`.onnx`) | [rhasspy/piper-voices](https://huggingface.co/rhasspy/piper-voices) | `models/` folder |
| Supertonic 3 weights | [Supertone/supertonic-3](https://huggingface.co/Supertone/supertonic-3) | `models/supertonic3/` folder |

#### Python dependencies:
```bash
pip install sherpa-onnx sounddevice numpy supertonic

#### Build command:
```bash
build_UniversalTTS_Pro_1_3_4.bat
```

> **Note:** The `UniversalTTS_Pro.spec` file contains the full PyInstaller configuration. Adjust paths if your folder structure differs.

---

## 📂 Repository Structure

### 📁 Source Repository (this GitHub repo)

```text
Universal-TTS-pro/
│
├── UniversalTTS_pro.py                 # Main Python source code
├── UniversalTTS_Pro.spec               # PyInstaller build configuration
├── build_UniversalTTS_Pro_1_3_4.bat    # Automated build script
├── LICENSE.txt                         # GNU General Public License v3.0 (GPLv3) + license summary
├── THIRD_PARTY_LICENSES.txt            # Full third-party licenses & copyright notices
├── license_texts/                      # Individual full license texts, read at runtime by the
│   ├── MIT.txt                         #   in-app license acceptance screens (see "Built-in
│   ├── OpenRAIL-M.txt                  #   License Compliance Screens" above). Required at build
│   ├── Apache-2.0.txt                  #   time — the build script copies this next to the exe.
│   ├── GPL-3.0.txt
│   ├── CC-BY-4.0.txt
│   ├── CC0-1.0.txt
│   └── BSD-3-Clause.txt
│   └── PSF-2.0
├── README.md                           # This documentation
├── javitasok_HU.txt                    # Hungarian normalization dictionary
├── javitasok_EN.txt                    # English normalization dictionary
├── javitasok_RO.txt                    # Romanian normalization dictionary
├── UTTsp_0.jpg                         # Screenshot — Main interface
├── UTTsp_1.jpg                         # Screenshot — Voice models
├── UTTsp_2.jpg                         # Screenshot — Piper settings
└── UTTsp_3.jpg                         # Screenshot — Supertonic settings
```

> ⚠️ **The following components are NOT included in the repository** and must be added manually before building, or are included in the compiled release package:
> `opusenc.exe`, `.onnx` voice models, Supertonic 3 model weights.

---

### 📦 Compiled Portable Package (from Releases)

```text
UniversalTTS_Pro_v1.3.4_Portable/
│
├── UniversalTTS_Pro.exe          # Compiled executable (PyInstaller)
├── LICENSE.txt
├── README.md
├── THIRD_PARTY_LICENSES.txt
├── license_texts/                # Full license texts used by the in-app license
│                                  #   acceptance screens (see above) — required, do not delete
├── license_acceptance.json       # Auto-created on first run once you accept a license
│                                  #   screen; delete it to make that screen reappear
│
├── _internal/                    # PyInstaller runtime bundle (auto-generated)
│   ├── opusenc.exe               # Opus encoder          (BSD 3-Clause)
│   ├── javitasok_HU.txt          # Hungarian normalization dictionary
│   ├── javitasok_EN.txt          # English normalization dictionary
│   ├── javitasok_RO.txt          # Romanian normalization dictionary
│   ├── sherpa_onnx/              # Sherpa-ONNX runtime   (Apache 2.0)
│   ├── onnxruntime/              # ONNX Runtime          (MIT)
│   ├── numpy/                    # NumPy                 (BSD 3-Clause)
│   ├── _sounddevice_data/        # SoundDevice / PortAudio (MIT)
│   ├── _tcl_data/                # Tcl/Tk                (BSD-style)
│   ├── _tk_data/                 # Tkinter               (PSF)
│   ├── python3.dll               # Python runtime        (PSF)
│   ├── python314.dll             # Python runtime        (PSF)
│   └── [other PyInstaller runtime files]
│
models/                            # Voice model files
│   ├── hu_HU-berta-medium.onnx    # Hungarian voice — Berta    (MIT / CC0)
│   ├── hu_HU-berta-medium.onnx.json
│   ├── hu_HU-berta-medium.onnx.tokens
│   ├── hu_HU-anna-medium.onnx     # Hungarian voice — Anna     (MIT / CC0)
│   ├── hu_HU-anna-medium.onnx.json
│   ├── hu_HU-anna-medium.onnx.tokens
│   ├── hu_HU-imre-medium.onnx     # Hungarian voice — Imre     (MIT / CC0)
│   ├── hu_HU-imre-medium.onnx.json
│   ├── hu_HU-imre-medium.onnx.tokens
│   ├── en_US-libritts_r-medium.onnx  # English voice — LibriTTS-R (CC BY 4.0)
│   ├── en_US-libritts_r-medium.onnx.json
│   ├── en_US-libritts_r-medium.onnx.tokens
│   ├── ro_RO-mihai-medium.onnx    # Romanian voice — Mihai     (MIT / CC0)
│   ├── ro_RO-mihai-medium.onnx.json
│   ├── ro_RO-mihai-medium.onnx.token
│   └── supertonic3/                # Supertonic 3 weights  (OpenRAIL-M)
```

---

## 📄 Third-Party Licenses

Universal TTS Pro is built entirely on open-source components. The following section provides a complete overview of all third-party dependencies, their authors, and their applicable licenses. Full license texts are available at the linked repositories.

---

### 🔧 Runtime Libraries & Tools

| Component | Author / Organization | License | Source |
| :--- | :--- | :--- | :--- |
| **Sherpa-ONNX** (Piper runtime) | k2-fsa / Next-gen Kaldi | Apache License 2.0 | [GitHub](https://github.com/k2-fsa/sherpa-onnx) |
| **Piper TTS** (voice engine) | Michael Hansen / Rhasspy | MIT License | [GitHub](https://github.com/rhasspy/piper) |
| **espeak-ng** (Text-to-phoneme data) | espeak-ng contributors | GNU GPL v3.0 | [GitHub](https://github.com/espeak-ng/espeak-ng) |
| **Supertonic 3** (runtime code) | Supertone Inc. | MIT License | [GitHub](https://github.com/supertone-inc/supertonic) |
| **Supertonic 3** (model weights) | Supertone Inc. | OpenRAIL-M License | [Hugging Face](https://huggingface.co/Supertone/supertonic-3) |
| **opusenc** (Opus encoder) | Xiph.Org Foundation | BSD 3-Clause License | [GitLab](https://gitlab.xiph.org/xiph/opus-tools) |
| **SoundDevice** | Matthias Geier | MIT License | [GitHub](https://github.com/spatialaudio/python-sounddevice) |
| **PortAudio** (SoundDevice dependency) | Ross Bencina & Phil Burk | MIT License | [Website](http://www.portaudio.com/) |
| **NumPy** | NumPy Contributors | BSD 3-Clause License | [GitHub](https://github.com/numpy/numpy) |
| **Python / Tkinter** | Python Software Foundation | PSF License | [python.org](https://www.python.org/) |

---

### 🎙️ Voice Models — Piper (`rhasspy/piper-voices`)

All Piper voice models are distributed via the [`rhasspy/piper-voices`](https://huggingface.co/rhasspy/piper-voices) repository on Hugging Face (repository-level license: **MIT**). Each individual model contains its own `MODEL_CARD` file specifying dataset-level licensing terms.

#### Default Models (included in Releases package)

| Voice | Language | Model ID | Repo License | Dataset License | Model Card |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Anna** | Hungarian (hu_HU) | `hu_HU-anna-medium` | MIT | **CC0** (Public Domain) | [MODEL_CARD](https://huggingface.co/rhasspy/piper-voices/tree/main/hu/hu_HU/anna/medium) |
| **Imre** | Hungarian (hu_HU) | `hu_HU-imre-medium` | MIT | **CC0** (Public Domain) | [MODEL_CARD](https://huggingface.co/rhasspy/piper-voices/tree/main/hu/hu_HU/imre/medium) |
| **Berta** | Hungarian (hu_HU) | `hu_HU-berta-medium` | MIT | **CC0** (Public Domain) | [MODEL_CARD](https://huggingface.co/rhasspy/piper-voices/tree/main/hu/hu_HU/berta/medium) |
| **LibriTTS-R** | English (en_US) | `en_US-libritts_r-medium` | MIT | **CC BY 4.0** | [MODEL_CARD](https://huggingface.co/rhasspy/piper-voices/tree/main/en/en_US/libritts_r/medium) |
| **Mihai** | Romanian (ro_RO) | `ro_RO-mihai-medium` | MIT | **CC0** (Public Domain) | [MODEL_CARD](https://huggingface.co/rhasspy/piper-voices/tree/main/ro/ro_RO/mihai/medium) |

> **Note:** Voice models may have been trained on datasets with their own upstream licensing terms. The `MODEL_CARD` file for each voice is the authoritative source for dataset-level attribution. Always review it before commercial deployment.

---

### ℹ️ License Notes

- **OpenRAIL-M** *(Supertonic 3 model weights):* This is **not** equivalent to a standard MIT or BSD license. It permits both personal and commercial use, but includes specific use-based restrictions (Attachment A of the license) — e.g. prohibiting impersonation without consent, generating deceptive or defamatory content, or using the model in ways that discriminate against or harm individuals or groups. Copyright, patent, and attribution notices must be preserved whenever the model itself (or a derivative of it) is redistributed. Read the full text in `license_texts/OpenRAIL-M.txt` (also shown in-app on first use of the Supertonic engine) before deployment in any commercial or public-facing product.

- **CC BY 4.0** *(en_US-libritts_r-medium dataset):* This model is fully compatible with commercial use. The only requirement is proper attribution to the dataset creators. Attribution: **LibriTTS-R**, derived from LibriTTS, corpus by Yuma Koizumi, Heiga Zen, Shigeki Karita, Yifan Ding, Kohei Yatabe, Nobuyuki Morioka, Michiel Bacchiani, Yu Zhang, Wei Han, Ankur Bapna — distributed via [OpenSLR 141](https://openslr.org/141/) and [rhasspy/piper-voices](https://huggingface.co/rhasspy/piper-voices). No modifications were made to the underlying dataset beyond training the bundled Piper voice model.

- **Apache 2.0** *(Sherpa-ONNX):* Requires preservation of copyright notices and the `NOTICE` file when redistributing. Compatible with most commercial and open-source uses.

- **BSD 3-Clause** *(Opus Tools, NumPy):* Requires retention of copyright notice and disclaimer in documentation when redistributing. Commercial use is freely permitted.

- **MIT** *(Piper, Supertonic code, SoundDevice, PortAudio, piper-voices repo):* Highly permissive. Commercial and private use, modification, and redistribution are freely permitted with attribution.

- **PSF License** *(Python / Tkinter):* Compatible with commercial use. Attribution required.

- **GNU GPL v3.0** *(espeak-ng-data):* This is a copyleft license. Because the portable package includes espeak-ng data for phonetic conversion, the combined distribution is subject to GPLv3 terms, requiring open-source availability. Since the Universal TTS Pro source code is itself freely available under the **GNU GPL v3.0** on GitHub, this requirement is naturally fulfilled.

Universal TTS Pro itself is released under the **GNU General Public License v3.0** — see `LICENSE.txt` for the full text, and `THIRD_PARTY_LICENSES.txt` / `license_texts/` for every third-party license in full.

---

## 📖 USER GUIDE (v1.3.4 PORTABLE)

### 1. Text Input & Hotkeys
* **Copy/Paste:** Standard `Ctrl+C` / `Ctrl+V` or Right-click context menu.
* **Importing:** Load `.txt` files directly using the **'Import .txt'** gomb / button.

### 2. Fix & Convert
* Click the blue **FIX** button to prepare text for speech (expands abbreviations, processes Bible citations, and converts numbers to words).
* If you wish to convert text without applying linguistic corrections, bypass the fix step and use the *Output* section options directly.

### 3. Find & Replace
* Use the built-in **Find & Replace** tool to search for any word, phrase, or character sequence within the loaded text.
* Instantly replace single occurrences or all matches at once — ideal for correcting recurring words, names, or abbreviations before synthesis.

### 4. Portable Mode (USB Drive Execution)
The software is fully optimized to run portably. To deploy on a USB drive:
1. Download the compiled package from the [**Releases**](https://github.com/szabiz/Universal-TTS-pro/releases) section.
2. Extract the ZIP to any folder on your desktop, laptop, or USB flash drive.
3. Run `UniversalTTS_Pro.exe` directly — no installation required.

---

### Screenshots

![Main Interface](UTTsp_0.jpg)

![Voice Models](UTTsp_1.jpg)

![Piper Settings](UTTsp_2.jpg)

![Supertonic Settings](UTTsp_3.jpg)
