# Simon Says SwiftUI App

Simon Says is an iOS 17 app developed using SwiftUI, featuring a classic memory and pattern recognition game.<br>
The project employs the SwiftUI coordinator pattern to manage navigation within the app and follows the repository pattern for efficient model data retrieval. Below are technical details for developers interested in understanding its structure and key components.

### Introduction
Watch a brief demonstration of the Simon Says app in action: <br>
[Video]

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

![Screenshot 1](path/to/image1.png) &ensp;&ensp;&ensp;&ensp; ![Screenshot 2](path/to/image2.png)  &ensp;&ensp;&ensp;&ensp; ![Screenshot 3](path/to/image3.png)  
*Image 1* &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; *Image 2* &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; *Image 3*


## Getting Started

To set up the Simon Says app on your development environment:

1. Clone the repository.
  
2. Open the project in Xcode.
  
3. Build and run the app on an iOS 17 device or simulator.

## License

This project is licensed under the [MIT License](LICENSE).
