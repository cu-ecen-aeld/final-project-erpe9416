# Overview
The goal of this project is to create a smart alarm clock / heads-up display using a Raspberry Pi, a graphical display, a speaker, pushbuttons, and network collection. 

Ideally, it will be capable of connecting to the internet to obtain weather data and sync its clock, then convey this information to the user on the display. The user will be able to input an alarm time using a pushbutton array, and the speaker will play a sound when the time comes. It may even play soothing sounds for the user at their bedtime.

My motivation behind this project is that I wanted to create something that is modular and uses protocols and hardware that interest me. Network connection, graphical displays, and audio in particular seem like they would be exciting to implement. Additionally--since the project is modular--if I get stuck on one piece of hardware or specific aspect of the project I can use a fallback plan or save it as future work without inhibiting the rest of the project.


<img src="https://github.com/user-attachments/assets/f1155fc0-6e41-467f-9f03-85a659c20d35" width="800" alt="Final Project Diagram (1)">

System block diagram


# Target Build System
This project will use buildroot as the target build system.

# Hardware Platform
For this project I plan to use a Raspberry Pi 4B, which is included in the list of [supported Hardware](https://github.com/cu-ecen-aeld/aesd-assignments/wiki/Supported-Hardware-Platforms). I will use one board that is to be sourced myself. 

I plan to use the [following 5-inch display](https://www.amazon.com/dp/B0CXTFN8K9?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1), which is designed specifically for the Raspberry Pi. The display is likely the most important extra hardware component, so as a fallback if I cannot get this display to work, I will use a [simpler SPI display](https://www.adafruit.com/product/618).

Next, I have the [following USB speaker](https://www.amazon.com/dp/B075M7FHM1?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1) which I intend to implement for audio feedback. If I cannot get the speaker to work, a simple [piezo element](https://www.adafruit.com/product/160) will be the fallback.

Lastly, I plan to use [simple pushbuttons](https://www.adafruit.com/product/367) to accept user input using GPIO. As a stretch goal, the pushbuttons can be replaced by the display's capacitive touchscreen, though that is likely out of the scope of this iteration of the project.


# Open Source Projects Used
TBD: Mention any open source project content you intend to use with the project, beyond the base platform buildroot/yocto packages already used in assignments.

# Previously Discussed Content
TBD: Mention any content covered in previous assignments, lectures, or book sections you plan to use with the project as a basis. For instance, if you plan to use the aesdsocket or aesdchar componets either partially or completely.

# New Content
TBD: Mention the new content you plan to cover with your assignment, separating between items we've discussed in class already but not included in previous assignments and items we have not yet discussed in class.

# Shared Material
TBD: Detail any portion of the project leveraged from other coursework or using [components from previous semesters](https://github.com/cu-ecen-5013/buildroot-assignments-base/wiki) by yourself or others.

# Source Code Organization
TBD: Modify the content below:

Buildroot or Yocto Repository will be hosted at [TBD]

ApplicationX code will be hosted in in a repository at [TBD]

We request X additional repositories for application Y and Z.

## Team project members:

Eric Percin

# Schedule Page
TBD: Include link to shared schedule wiki page below.
