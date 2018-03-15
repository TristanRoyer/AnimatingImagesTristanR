-- Title: AnimatingImages
-- Name: Tristan Royer
-- Course: ICS2O/3C
-- This program displays 3 images moving in different directions, 
-- with some coloured text and a background.


-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables for the speeds of the characters
scrollSpeed1 = 5
scrollSpeed2 = 4
scrollSpeed3 = 5
scrollSpeed4 = 5
scrollSpeed5 = 5

-- create text object, set its position and make it invisible
local PowerUpText 
PowerUpText = display.newText ("PowerUp!",725, 700, nil, 70)
PowerUpText:setTextColor (1, 1, 0)
PowerUpText.isVisible = false

-- background image with width and height 
display.setDefault("background", 167/255, 180/255,240/255)

--character image with width and height
local blueGhost = display.newImageRect("Images/blue.png", 200, 100)

-- 2nd character image with width and height
local pinkGhost = display.newImageRect("Images/pink.png", 200, 100)

-- 3rd character image with width and height
local pacman = display.newImageRect("Images/pacman.png", 200,100)

-- 4th image with width and height
local Fruit = display.newImageRect("Images/Fruit.png", 200,100)

-- local variables for the edible ghosts
pinkEdibleGhost = display.newImageRect("Images/EdibleGhost.png", 200, 100)
blueEdibleGhost = display.newImageRect("Images/EdibleGhost.png", 200, 100)


-- makes the edible ghost characters invisible
pinkEdibleGhost.isVisible = false
blueEdibleGhost.isVisible = false
-- local variables for sound
local originalSound = audio.loadSound("Sounds/PacMan - Original.mp3")
local OriginalSoundChannel
local powerUpSound = audio.loadSound("Sounds/Pacman Power Sound Effect.mp3")
local powerUpSoundChannel
OriginalSoundChannel = audio.play(originalSound)

pinkGhost.x = 100
pinkGhost.y = 50
blueGhost.x = 900
blueGhost.y = 350
pacman.x = 500
pacman.y = 0
Fruit.x = 500
Fruit.y = 700
pinkEdibleGhost.x = 100
pinkEdibleGhost.y = 50
blueEdibleGhost.x = 900
blueEdibleGhost.y = 350

--change the direction where the blueGhost is facing
blueGhost:scale (-1, 1)

--make the pink ghost transparent
pinkGhost.alpha = 1

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the y-value of the ship
local function MoveblueGhost(event)
	-- add the scroll speed to the y-value of the ship
	blueGhost.x = blueGhost.x + scrollSpeed1

	-- changes the direction when it reaches the end of the screen
	if (blueGhost.x > 900) then
  		scrollSpeed1 = -4
  		blueGhost.xScale = -1
  		blueGhost.yScale = blueGhost.yScale + 0.25
 	end

	if (blueGhost.x < 84) then
  		scrollSpeed1 = 2
  		blueGhost.xScale = 1
  		blueGhost.yScale = blueGhost.yScale - 0.42
  	end
 
end

local function Movepacman(event)
	-- add the scroll speed to the y-value of the ship
         pacman.y = pacman.y + scrollSpeed2

	-- changes the direction when it reaches the end of screen
	if (pacman.y > 750) then
  		scrollSpeed2 = -5
  		pacman.yScale = -1
 	end

	if (pacman.y < 75) then
  		scrollSpeed2 = 5
  		pacman.yScale = 1
  	end

  if (pacman.y > Fruit.y) then 
 powerUpSoundChannel = audio.play(powerUpSound)
blueGhost.isVisible = false
pinkGhost.isVisible = false
blueEdibleGhost.isVisible = true
pinkEdibleGhost.isVisible = true
PowerUpText.isVisible = true
end

end

local function MovepinkGhost(event)
	-- add the scroll speed to the y-value of the ship
	pinkGhost.x = pinkGhost.x + scrollSpeed3

	-- changes the direction when it reaches the end of the screen
	if (pinkGhost.x > 900) then
  		scrollSpeed3 = -5
  		pinkGhost.xScale =  -1
  		
  --makes it fade out when it reaches the end of the screen
  		pinkGhost.alpha = pinkGhost.alpha - 0.25
 	end

-- changes the direction when it reaches the end of the screen
	if (pinkGhost.x < 85) then
  		scrollSpeed3 = 5
  		pinkGhost.xScale = 1
  		--makes it fade in when it reaches the end of the screen
  		pinkGhost.alpha = pinkGhost.alpha + 0.15
  	end
     -- sets it to be opaque
  	if (pinkGhost.alpha == 0) then
  		pinkGhost.alpha = 1
    end

 end

local function MoveblueEdibleGhost(event)
  -- add the scroll speed to the y-value of the ship
  blueEdibleGhost.x = blueEdibleGhost.x + scrollSpeed4

  -- changes the direction when it reaches the end of the screen
  if (blueEdibleGhost.x > 980) then
      scrollSpeed4 = -4
      blueEdibleGhost.yScale = blueEdibleGhost.yScale + 1
  end

  if (blueEdibleGhost.x < 85) then
      scrollSpeed4 = 4
      blueEdibleGhost.yScale = blueEdibleGhost.yScale - 2
    
    end
 
end




local function MovepinkEdibleGhost(event)
  -- add the scroll speed to the y-value of the ship
  pinkEdibleGhost.x = pinkEdibleGhost.x + scrollSpeed5

  -- changes the direction when it reaches the end of the screen
  if (pinkEdibleGhost.x > 900) then
      scrollSpeed5 = -5
      pinkEdibleGhost.xScale = -1
      --makes it fade out when it reaches the end of the screen
      pinkEdibleGhost.alpha = pinkEdibleGhost.alpha - 0.25
  end
-- changes the direction when it reaches the end of the screen
  if (pinkEdibleGhost.x < 85) then
      scrollSpeed5 = 5
      pinkEdibleGhost.xScale = 1
      --makes it fade in when it reaches the end of the screen
      pinkEdibleGhost.alpha = pinkEdibleGhost.alpha + 0.10
    end
     -- sets it to be opaque
    if (pinkEdibleGhost.alpha == 0) then
      pinkEdibleGhost.alpha = 1
    end

end

local function spinFruit (event)
 
 Fruit.rotation = Fruit.rotation + 0.5

end




--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveblueGhost)

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MovepinkGhost)

--MoveRocketShip will be called over and over again
Runtime:addEventListener("enterFrame", Movepacman)

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MovepinkEdibleGhost)

--MoveRocketShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveblueEdibleGhost)

--MoveRocketShip will be called over and over again
Runtime:addEventListener("enterFrame", spinFruit)



