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

-- displays a background image with width and height
local backgroundImage = display.newImageRect("Images/background.png",2048,1536)

-- create text object, set its position and make it invisible
local PowerUpText 
PowerUpText = display.newText ("PowerUp!",725, 700, Arial, 70)
PowerUpText:setTextColor (1, 0, 1)
PowerUpText.isVisible = false



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

--Set the x and y co-ordinates of the sprites
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

-- Function: MoveblueGhost
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ghost
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

-- Function: Movepacman
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the y-value of pacman

local function Movepacman(event)
	-- add the scroll speed to the y-value of the ship
         pacman.y = pacman.y + scrollSpeed2

	-- changes the direction and speed when it reaches the end of screen
	if (pacman.y > 750) then
  		scrollSpeed2 = -5
  		pacman.yScale = -1
 	end

	if (pacman.y < 75) then
  		scrollSpeed2 = 5
  		pacman.yScale = 1
  	end

-- Makes certain objects visible and plays a sound if pacman's y is greater than that of
-- the fruit
  if (pacman.y > Fruit.y) then 
   powerUpSoundChannel = audio.play(powerUpSound)
   blueGhost.isVisible = false
   pinkGhost.isVisible = false
   blueEdibleGhost.isVisible = true
   pinkEdibleGhost.isVisible = true
   PowerUpText.isVisible = true
  else PowerUpText.isVisible = false
  end

end

-- Function: MovepinkGhost
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ghost
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

-- changes the direction and speed when it reaches the end of the screen
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

-- Function: MoveblueEdibleGhost
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ghost
local function MoveblueEdibleGhost(event)
  -- add the scroll speed to the y-value of the ship
  blueEdibleGhost.x = blueEdibleGhost.x + scrollSpeed4

  -- changes the direction and speed when it reaches the end of the screen
  if (blueEdibleGhost.x > 980) then
      scrollSpeed4 = -4
      blueEdibleGhost.yScale = blueEdibleGhost.yScale + 1
  end

  if (blueEdibleGhost.x < 85) then
      scrollSpeed4 = 4
      blueEdibleGhost.yScale = blueEdibleGhost.yScale - 2
    
    end
 
end

-- Function: MovepinkEdibleGhost
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ghost
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

-- Function: spinFruit
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ghost
local function spinFruit (event)

-- makes the fruit rotate clockwise
 Fruit.rotation = Fruit.rotation + 0.5

end




--MoveblueGhost will be called over and over again
Runtime:addEventListener("enterFrame", MoveblueGhost)

--MovepinkGhost will be called over and over again
Runtime:addEventListener("enterFrame", MovepinkGhost)

--Movepacman will be called over and over again
Runtime:addEventListener("enterFrame", Movepacman)

--MovepinkEdibleGhost will be called over and over again
Runtime:addEventListener("enterFrame", MovepinkEdibleGhost)

--MoveblueEdibleGhost will be called over and over again
Runtime:addEventListener("enterFrame", MoveblueEdibleGhost)

-- spinFruit will be called over and over again
Runtime:addEventListener("enterFrame", spinFruit)



