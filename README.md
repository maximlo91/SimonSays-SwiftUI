# Simon Says SwiftUI App

Simon Says is an iOS 17 app developed using SwiftUI, featuring a classic memory and pattern recognition game.<br>
The project employs the SwiftUI coordinator pattern to manage navigation within the app and follows the repository pattern for efficient model data retrieval. Below are technical details for developers interested in understanding its structure and key components.

### Project Structure

- The app initiates with a brief Splash View, lasting one second, before transitioning via the app coordinator to the main Game View.

### Game View

- **Title and Subtitle:** The main screen features a title ("Simon Says") and a subtitle that dynamically updates based on the current turn (Simon's or the player's).
  
- **Scores Display:** The current scores are prominently presented on the screen.

- **Navigation Buttons:** Two navigation buttons, employing the SwiftUI coordinator pattern, facilitate seamless transitions to the Leaderboards View and the Settings View.<br>
Note: These buttons are disabled during gameplay.

- **Simon Says Buttons:** Four buttons (red, yellow, green, blue) trigger distinct sounds (do, re, mi, fa). User interaction with these buttons is disabled during Simon's turn.

- **Start Button:** Initially visible, the start button disappears once the game commences.

- **Haptic Feedback and Sound Effects:** Buttons provide haptic feedback and play sounds, even when the player is inactive.

### Gameplay

- Players follow Simon's sequence by tapping the correct buttons in the correct order.
  
- Failures result in a pop-up displaying the final score, prompting the player to enter their name for the leaderboards.
  
- The pop-up dismisses after the player submits their name.

### Leaderboards View

- Player data, including names, scores, and timestamps, is displayed in a list retrieved from UserDefaults with High Scores Repository.

### Settings View

- Two toggle switches allow users to enable/disable sound and haptic feedback, which will affect gameplay, settings persist even after terminating app.

### Screenshots

<img style="border:2px solid black;" src="https://github.com/maximlo91/SimonSays-SwiftUI/assets/58986034/5d3ff7e3-01b9-45a7-be57-9349a6385e58" width="200" height="450"> 
&ensp;&ensp;&ensp;&ensp; <img style="border:2px solid black;" src="https://github.com/maximlo91/SimonSays-SwiftUI/assets/58986034/71f4ca2b-eaee-47a8-b2f4-e821cfe8953b" width="225" height="450">
&ensp;&ensp;&ensp;&ensp; <img  style="border:2px solid black;" src="https://github.com/maximlo91/SimonSays-SwiftUI/assets/58986034/5f5d637c-2568-4511-897e-34e5becbb25e" width="225" height="450">


## Getting Started

To set up the Simon Says app on your development environment:

1. Clone the repository.
  
2. Open the project in Xcode.
  
3. Build and run the app on an iOS 17 device or simulator.

## License

This project is licensed under the [MIT License](LICENSE).
