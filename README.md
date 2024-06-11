## ComputerCraft DDR Simulator

This README provides instructions on how to set up and run the ComputerCraft DDR Simulator using the provided Lua script.

### Requirements

- **Minecraft** with the **ComputerCraft** mod installed.
- A **ComputerCraft** computer with a connected **monitor** peripheral.

### Setup

1. **Place the Monitor:**
   - Ensure you have a multi-block monitor set up and connected to the computer.
   - The monitor should be large enough to display the arrows and game information clearly.

2. **Connect the Monitor to the Computer:**
   - Use a modem to connect the monitor to the computer if they are not directly adjacent.
   - Ensure the monitor is connected and recognized as a peripheral by the computer.

3. **Save the Script:**
   - Copy the Lua script provided in this README.
   - On the ComputerCraft computer, open a new file (e.g., `ddr.lua`) by typing `edit ddr.lua`.
   - Paste the script into the file and save it by pressing `Ctrl + S`, then exit with `Ctrl + E`.

4. **Run the Script:**
   - Execute the script by typing `ddr.lua` and pressing Enter.

### Script Overview

The script simulates a DDR (Dance Dance Revolution) game where arrows move up the screen, and the player must match them with corresponding key inputs to score points. Here's a breakdown of the main parts of the script:

- **Initialization:**
  - The script initializes the monitor, calculates positions, and sets initial values for score, HP, and arrow positions.

- **Input Configuration:**
  - The script sets up four inputs (`left`, `back`, `front`, `right`) corresponding to the DDR arrows (`<`, `^`, `v`, `>`).

- **Arrow Handling:**
  - Arrows are created at random intervals and move upwards.
  - If the player matches the arrow input correctly, the score increases, and HP is maintained or increased slightly.
  - If the player misses an arrow, HP decreases.

- **Game Over:**
  - The game ends when HP reaches 0, displaying a "Game Over" message.

- **Game Speed:**
  - The game speed increases based on the player's score, making it progressively more challenging.

### Controls

- **Left Arrow (`<`)**: Triggered by a redstone input on the left side of the computer.
- **Up Arrow (`^`)**: Triggered by a redstone input on the back side of the computer.
- **Down Arrow (`v`)**: Triggered by a redstone input on the front side of the computer.
- **Right Arrow (`>`)**: Triggered by a redstone input on the right side of the computer.

  ### Screenshots

  ![image](https://github.com/samanft/computercraft-ddr-simulator/assets/25375434/4a496eda-840a-4c5d-a0e7-947188caad0d)


### Notes

- The script uses redstone inputs to simulate player inputs. Ensure the correct redstone configuration around the ComputerCraft computer.
- The game difficulty increases as the player's score rises, with the arrows moving faster over time.

Enjoy your DDR simulator on ComputerCraft!
