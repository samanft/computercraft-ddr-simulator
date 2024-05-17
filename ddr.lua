-- Get a reference to the monitor
local monitor = peripheral.find("monitor")

monitor.setTextScale(1.2)

-- Get the size of the monitor
local monitorWidth, monitorHeight = monitor.getSize()

-- Initialize arrow position at the bottom of the screen
local arrowPosY = monitorHeight

-- Initialize arrows
local arrows = {}

-- Calculate the center position
local centerPos = math.floor(monitorWidth / 2)

-- Initialize a counter
local counter = 0

-- Define a function that returns a random number between 5 and 20
local function randomBetweenFiveAndTwenty()
    local numbers = {5, 10, 15, 20}
    return numbers[math.random(#numbers)]
end

-- Initialize score and hp
local score = 0
local hp = 20

-- Initialize inputs
local inputs = {
    {pos = centerPos - 15, redStoneSide = "left", icon = "<"},
    {pos = centerPos - 5, redStoneSide = "back", icon = "^"},
    {pos = centerPos + 5, redStoneSide = "front", icon = "v"},
    {pos = centerPos + 15, redStoneSide = "right", icon = ">"},
}

-- Initialize arrow combinations
local jumpCombinations = {
    {"^", ">"}, 
    {">", "v"}, 
    {"<", "^"}, 
    {"v", "<"}
}


monitor.clear()

while true do
    -- Reset text color to white at the start of each loop iteration
    monitor.setTextColor(colors.white)

    -- Handle and print the inputs
    for _, input in ipairs(inputs) do
        local inputValue = redstone.getInput(input.redStoneSide)
        monitor.setCursorPos(input.pos, 2)
        if inputValue then
            monitor.setTextColor(colors.gray)
        end
        monitor.write(input.icon)
        monitor.setTextColor(colors.white)  -- Reset color after writing
    end

    -- Increment the counter
    counter = counter + 1

-- If the counter has reached 10, create a new arrow
if counter >= randomBetweenFiveAndTwenty() then
    -- Get a random combination
    local combination = jumpCombinations[math.random(#jumpCombinations)]

    -- Find the inputs that match the icons in the combination
    local input1, input2
    for _, input in ipairs(inputs) do
        if input.icon == combination[1] then
            input1 = input
        elseif input.icon == combination[2] then
            input2 = input
        end
    end

    -- Create a new arrow with the x-coordinate, y-coordinate, and icon from the first input
    table.insert(arrows, {x = input1.pos, y = arrowPosY, icon = input1.icon})

    -- 20% chance to create a second arrow
    if math.random(5) == 1 then
        -- Create a new arrow with the x-coordinate, y-coordinate, and icon from the second input
        table.insert(arrows, {x = input2.pos, y = arrowPosY, icon = input2.icon})
    end

    -- Reset the counter
    counter = 0
end
    
    -- Move the arrows
    for i, arrow in ipairs(arrows) do
        -- Clear the previous arrow
        monitor.setCursorPos(arrow.x, arrow.y + 1)
        monitor.write(" ")
    
        -- Print the arrow with its icon
        monitor.setCursorPos(arrow.x, arrow.y)
        monitor.write(arrow.icon)
    
        -- Move the arrow upwards
        arrow.y = arrow.y - 1
    
    -- If the arrow has reached the top of the monitor, remove it
    if arrow.y < 2 then
        -- Check each input
        for _, input in ipairs(inputs) do
            -- If the x-coordinate of the arrow matches the x-coordinate of the input
            if arrow.x == input.pos then
                -- Check if the redstone input on the side corresponding to the input is true
                if redstone.getInput(input.redStoneSide) then
                    -- Increment the score
                    score = score + 1
                    
                    if hp < 20 then
                        hp = hp + 1
                    end
                else
                    -- Decrement the hp
                    hp = hp - 2
                end

                break
            end
        end

        -- Remove the arrow
        table.remove(arrows, i)
    end
end -- This is the end of the for loop

local width, height = monitor.getSize()

-- Set the cursor position to the bottom right of the monitor
monitor.setCursorPos(width - 9, height - 2)

-- Print the score and the hp
monitor.write("Score: " .. score)
monitor.setCursorPos(width - 8, height - 1)
monitor.write("HP: " .. hp)

-- Check if the hp is 0
if hp <= 0 then
    -- Clear the monitor
    monitor.clear()

    local gameOverMessage = "game over lol"
    -- Set the cursor position to the middle of the monitor
    monitor.setCursorPos(width / 2 - #gameOverMessage / 2, height / 2)

    -- Print the "Game Over" message
    monitor.write(gameOverMessage)

    -- Break out of the loop
    break
end



-- Yield control back to the operating system
local sleepDuration = 0.8

if score >= 100 then
    sleepDuration = 0.05
elseif score >= 20 then
    sleepDuration = 0.1
elseif score >= 10 then
    sleepDuration = 0.2
elseif score >= 5 then
    sleepDuration = 0.4
end
os.sleep(sleepDuration)

end -- This is the end of the while loop