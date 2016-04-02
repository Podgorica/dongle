local core     = require 'core';
local language = require 'LanguageMgr';

function menu_logic()
	if core.states.menu_selected == 1 then 			-- EHHHHHHHHHH
		ax = 55
		ay = 200
	elseif core.states.menu_selected == 2 then
		ax = 55
		ay = 250
	elseif core.states.menu_selected == 3 then
		ax = 55
		ay = 300
	elseif core.states.menu_selected == 4 then
		ax = 55
		ay = 350
	end
  
	if playedintrosound == true then
		love.graphics.setColor(255, 255, 255, 255)
		playedintrosound = false
	end

  function love.keypressed(key)
      -- MAIN MENU
      if key == 'up' then
        core.states.menu_selected = (core.states.menu_selected - 1)
        TEsound.play(core.Sound.blip3)
      elseif key == 'down' then
        TEsound.play(core.Sound.blip3)
        core.states.menu_selected = (core.states.menu_selected + 1)
      end
    
      if key == 'return' then			-- Thanks Torin
        TEsound.play(core.Sound.blip3)
        if core.states.menu_selected == 1 then
          state = 'game'
          TEsound.stop("all")
          print('Entered state '..state)
        elseif core.states.menu_selected == 2 then
          state = 'options'
          print('Entered state '..state)
        elseif core.states.menu_selected == 3 then
          state = 'credits'
          print('Entered state '..state)
        elseif core.states.menu_selected == 4 then
          print('Entered state '..state)
          love.event.quit()         -- exit game code
        end
      end
  end
	
	if core.states.menu_selected > 4 then
		core.states.menu_selected = 1
	elseif core.states.menu_selected < 1 then
		core.states.menu_selected = 4
	end
end

function options_logic()				-- OPTIONS
  if core.states.options_selected == 1 then
    ax = 55
    ay = 200
  elseif core.states.options_selected == 2 then
    ax = 55
		ay = 250
	elseif core.states.options_selected == 3 then
    ax = 55
    ay = 300
  elseif core.states.options_selected == 4 then
    ax = 55
    ay = 560
  end
  
  function love.keypressed(key)  
    if key == 'up' then
      TEsound.play(core.Sound.blip3)
      core.states.options_selected = (core.states.options_selected - 1)
    elseif key == 'down' then
      TEsound.play(core.Sound.blip3)
      core.states.options_selected = (core.states.options_selected + 1)
    end
    
    if key == 'return' then 
      TEsound.play(core.Sound.blip3)
      if core.states.options_selected == 1 then
        state = 'options_display'
      elseif core.states.options_selected == 2 then
        state = 'options_sound'
      elseif core.states.options_selected == 3 then
        state = 'options_language'
      elseif core.states.options_selected == 4 then
        state = 'menu'
      end
    end
  end
  
  if core.states.options_selected > 4 then
    core.states.options_selected = 1
	elseif core.states.options_selected < 1 then
    core.states.options_selected = 4
  end
end
 
function credits_logic()						-- CREDITS
  if core.states.credits_selected == 1 then
    ax = 55
    ay = 560
  end

  function love.keypressed(key)
    if key == 'return' and core.states.credits_selected == 1 then
      TEsound.play(core.Sound.blip3)
      state = 'menu'
    end	
  end
end

function options_display_logic()   -- DISPLAY OPTIONS
	if core.states.options_display_selected == 1 then
		ax = 55
		ay = 200
	elseif core.states.options_display_selected == 2 then
		ax = 55
		ay = 250
	elseif core.states.options_display_selected == 3 then
		ax = 55
		ay = 300
	elseif core.states.options_display_selected == 4 then
		ax = 55
		ay = 350
	elseif core.states.options_display_selected == 5 then
		ax = 55
		ay = 560
	end
	
	if core.states.options_display_selected > 5 then
		core.states.options_display_selected = 1
	elseif core.states.options_display_selected < 1 then
		core.states.options_display_selected = 5
	end
	
	if core.Graphics.mode.aa > 4 then
		core.Graphics.mode.aa = 0
	end
	
	if core.states.options_display_selected == 3 then
		hint1 = true
	else hint1 = false
	end
	
	function love.keypressed(key)
    if key == 'up' then
      TEsound.play(core.Sound.blip3)
			core.states.options_display_selected = (core.states.options_display_selected - 1)
		elseif key == 'down' then
      TEsound.play(core.Sound.blip3)
			core.states.options_display_selected = (core.states.options_display_selected + 1)
		end

		if key == 'return' then 
      TEsound.play(core.Sound.blip3)
			if core.states.options_display_selected == 1 then			-- FSAA
				core.Graphics.mode.full = not core.Graphics.mode.full;
			elseif core.states.options_display_selected == 2 then		-- Vsync
				core.Graphics.mode.vsync = not core.Graphics.mode.vsync;
			elseif core.states.options_display_selected == 3 then		-- Fullscreen
        core.Graphics.mode.aa = (core.Graphics.mode.aa + 4);
			elseif core.states.options_display_selected == 4 then    -- Save
				core.update_settings();
			elseif core.states.options_display_selected == 5 then		-- Back
				state = 'options';
			end
		end
	end
end

function options_sound_logic()
  if core.states.options_sound_selected == 1 then
    ax = 55
		ay = 560
	elseif core.states.options_display_selected == 2 then
		ax = 55
		ay = 350
	elseif core.states.options_display_selected == 3 then
		ax = 55
		ay = 560
	end
  
  function love.keypressed(key)
    if key == 'return' then
      TEsound.play(core.Sound.blip3)
      if core.states.options_sound_selected == 1 then
        state = 'options'
      end
    end
  end
end

function options_language_logic()
  if core.states.options_language_selected == 1 then
    ax = 55
		ay = 180
	elseif core.states.options_language_selected == 2 then
		ax = 55
		ay = 560
	end
  
  function love.keypressed(key)
    if key == 'up' then     -- MENU NAVIGATION
      TEsound.play(core.Sound.blip3)
      core.states.options_language_selected = (core.states.options_language_selected + 1)
    elseif key == 'down' then     -- MENU NAVIGATION
      TEsound.play(core.Sound.blip3)
      core.states.options_language_selected = (core.states.options_language_selected - 1)
    elseif key == 'left' then      
      TEsound.play(core.Sound.blip3)
      if core.states.options_language_selected == 1 then   -- LANGUAGE SELECTION
        if (core.Language.language - 1) >= 1 then
          core.Language.language = core.Language.language - 1;
        end
      end
    elseif key == 'right' then
      TEsound.play(core.Sound.blip3)
      if core.states.options_language_selected == 1 then   -- LANGUAGE SELECTION
        if (core.Language.language + 1) <= #language then
          core.Language.language = core.Language.language + 1;
        end
      end
    elseif key == 'return' then
      TEsound.play(core.Sound.blip3)
      if core.states.options_language_selected == 2 then
        state = 'options';
      end
    end
  end
  
  if core.states.options_language_selected > 2 then
		core.states.options_language_selected = 1
	elseif core.states.options_language_selected < 1 then
		core.states.options_language_selected = 2
	end
end

--					//  START DRAWING STUFF  \\

function draw_menu()
	love.graphics.draw(core.Graphics.dlogo, 150, 10)
	love.graphics.print(language[core.Language.language].MENU_PLAY, 70, 200)
	love.graphics.print(language[core.Language.language].MENU_OPTIONS, 70, 250)
	love.graphics.print(language[core.Language.language].MENU_CREDITS, 70, 300)
	love.graphics.print(language[core.Language.language].MENU_QUIT, 70, 350)
end

function draw_options()
	love.graphics.print(language[core.Language.language].OPTIONS_DISPLAY, 70, 200)
	love.graphics.print(language[core.Language.language].OPTIONS_SOUND, 70, 250)
  love.graphics.print(language[core.Language.language].OPTIONS_LANGUAGE, 70, 300)
	love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560)
end

function draw_credits()		
	love.graphics.draw(core.Graphics.plogo, 178, 28)
	love.graphics.print(language[core.Language.language].CREDITS_1, 70, 95)
	love.graphics.print(language[core.Language.language].CREDITS_2, 70, 135)
	love.graphics.print(language[core.Language.language].CREDITS_3, 70, 155)
	love.graphics.print(language[core.Language.language].CREDITS_4, 70, 175)
	love.graphics.print(language[core.Language.language].CREDITS_5, 70, 195)
	love.graphics.print(language[core.Language.language].CREDITS_6, 70, 215)
	love.graphics.print(language[core.Language.language].CREDITS_7, 70, 235)
	love.graphics.print(language[core.Language.language].CREDITS_8, 70, 255)
	love.graphics.print(language[core.Language.language].CREDITS_9, 70, 275)
	love.graphics.print(language[core.Language.language].CREDITS_10, 70, 315)
	love.graphics.print(language[core.Language.language].CREDITS_11, 70, 335)
	love.graphics.print(language[core.Language.language].CREDITS_12, 70, 355)
	love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560)
end

function draw_options_display()
  if core.Graphics.mode.full then
    love.graphics.print(language[core.Language.language].OPTIONS_FULLSCREEN_Y, 70, 200)
    else love.graphics.print(language[core.Language.language].OPTIONS_FULLSCREEN_N, 70, 200)
  end

  if core.Graphics.mode.aa then
    love.graphics.print(language[core.Language.language].OPTIONS_AA_N, 70, 300) -- 0 FSAA or x4 FSAA
  elseif core.Graphics.mode.aa == 4 then
    love.graphics.print(language[core.Language.language].OPTIONS_AA_Y, 70, 300)
  end
    
  if core.Graphics.mode.vsync then
    love.graphics.print(language[core.Language.language].OPTIONS_VSYNC_Y, 70, 250) -- vsync on or off
  else love.graphics.print(language[core.Language.language].OPTIONS_VSYNC_N , 70, 250)
  end
  
  if hint1 then
    love.graphics.print(language[core.Language.language].OPTIONS_HINT1, 325, 560)
  end
  love.graphics.print(language[core.Language.language].OPTIONS_APPLY, 70, 350)
  love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560)
end

function draw_options_sound()
	love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560)
end

function draw_options_language()
  love.graphics.print(language[core.Language.language].OPTIONS_LANGUAGE .. ": ", 70, 180)
  love.graphics.print(core.Language.options_language_name_selected[core.Language.language], 240, 180)
  love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560)
end

function draw_arrow()
  love.graphics.print(">", ax, ay)
end