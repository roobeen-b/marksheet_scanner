# marksheet_scanner
Mark sheet scanner is a Flutter application where users can scan or choose their mark sheet from gallery and extract the data from that mark sheet. The extraction is done using OCR (Optical Character Recognition). The extracted data is also save in a CSV file. Then the replica of the scanned mark sheet is displayed using the extracted data.

# Packages used:
-	image_picker: ^1.1.2
-	google_ml_kit: ^0.18.0
-	csv: ^6.0.0
-	path_provider: ^2.1.4

# Instructions on running the application:
-	Initially, the clone the github repo in your device.
-	Then, open the code in VS Code or Android Studio. 
-	Run ‘flutter pub get’ to get all the required packages for the application.
-	Then, select target device to run the application as any installed android emulator or even your physical android phone by connecting it to the PC with a USB cable.
-	After selecting the target device, open the ‘main.dart’ file inside the ‘lib’ folder i.e. ‘lib/main.dart’.
-	We can then run the app by: Going to Run > Start Debugging or press F5 in VS code or directly pressing the run button in Android Studio.

# Using the application:
-	On running the application, initial screen is shown and two options are shown. The user can either use their phone camera to scan the mark sheet or choose Pick from Gallery option to choose the mark sheet from their gallery.
-	After selecting the mark sheet, the user can then press ‘Extract Text’ button to extract the mark sheet data. On doing so, the extracted data is saved as a CSV file and the user is redirected to the result page where the scanned mark sheet is shown.
