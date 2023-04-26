# Steel Member Finder iOS App

* An iOS app that takes user measurements as inputs and finds the closest AISC standard steel member matches. Results will display corresponding match percentages.
* The app:
  * Leverages UIKit framework
  * Employs the MVC design pattern to organize code structure
  * Communicates with a modified CSV file uploaded to the internet from the AISC (American Institute of Steel Construction) website

* Example:
  * App starts with a list of AISC standard shapes (it is assumed that the user is familiar with the AISC standard and corresponding shape designations).
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234703857-677d6095-7d21-4698-bf46-7ba19b662d3b.png" width="400" align="center">
  </p>

  * Selected a W (I-Beam) shape and prompted with user measurement inputs.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234704012-76e1fe1f-0cb9-4330-affb-b6dd58125c05.png" width="400">
  </p>

  * User inputs measurements into each of four fields. App will still work if any of the measurements are omitted.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234706786-61641c0a-015b-4024-8f20-7b417f689531.png" width="400">
  </p>
  
  * App runs calculations based on the users' inputs and presents closest matching sizes that are produced by the AISC.
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234707210-4ec8a1ff-d671-464a-9126-8a617a587e94.png" width="400">
  </p>

  * By selecting one of the matches (the top match was selected) a detailed report is shown that compares the users' measurements with the AISC specified dimensions
  <p align="center">
   <img src="https://user-images.githubusercontent.com/116110636/234707515-154a85fb-e4e7-47c1-8560-dc8b76390dfd.png" width="400">
   <img src="https://user-images.githubusercontent.com/116110636/234707560-000b068d-1502-421b-916e-52242b1f6a75.png" width="400">
  </p>
