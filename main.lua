-----------------------------------------------------------------------------------------
--
-- main.lua
--
--Created by Ethan Bellem
--Created on march 2018
-----------------------------------------------------------------------------------------

local iterationsEntered
local answer = 0

local invalidText  = display.newText( '', display.contentCenterX, 900, native.systemFont, 110 )
invalidText.id = 'not a valid entry'

local instructions = display.newText( 'Enter # of iterations:', 700, 200, native.systemFont, 110 )
instructions.id = "instructions"

local iterationsTextField = native.newTextField( 1600, 200, 500, 128)
iterationsTextField.id = "Iterations Text Field"

local enterButton = display.newImageRect( "./assets/sprites/enterButton.png", 500, 500)
enterButton.x = 1000
enterButton.y = 1300

local function enterButtonClicked ( event )
	if ( event.phase == "ended" ) then
		if tonumber( iterationsTextField.text ) ~= nil then
			-- check if entry is number
			iterationsEntered = tonumber( iterationsTextField.text)
			if string.match(iterationsEntered, '%.') then --check if number entered is a decimal
   				-- if decimal, show invalid entry
   				invalidText  = display.newText( 'Invalid Entry', display.contentCenterX, 900, native.systemFont, 110 )			
			else
				for timesCalculated=0,iterationsEntered do
					answer = answer + (((-1)^timesCalculated) / ((2*timesCalculated)+1))*4
				end
				local answerText = display.newText( 'The answer is: ' .. answer, display.contentCenterX, 900, native.systemFont, 110)
				answerText.id  = 'Answer Text'
				print(answer)
			end				
		else
			-- if not a number, shwo invalid entry
			invalidText  = display.newText( 'Invalid Entry', display.contentCenterX, 900, native.systemFont, 110 )
		end
 	end
end

enterButton:addEventListener( 'touch', enterButtonClicked )