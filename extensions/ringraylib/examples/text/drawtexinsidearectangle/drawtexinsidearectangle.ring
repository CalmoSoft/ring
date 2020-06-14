/*******************************************************************************************
*
*   raylib [text] example - Draw text inside a rectangle
*
*   This example has been created using raylib 2.3 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Example contributed by Vlad Adrian (@demizdor) and reviewed by Ramon Santamaria (@raysan5)
*
*   Copyright (c) 2018 Vlad Adrian (@demizdor) and Ramon Santamaria (@raysan5)
*
********************************************************************************************/

#===================================================================#
# Based on Original Sample from RayLib (https://www.raylib.com/)
# Ported to RingRayLib by Ring Team
#===================================================================#

load "raylib.ring"

screenWidth = 800
screenHeight = 450

InitWindow(screenWidth, screenHeight, "raylib [text] example - draw text inside a rectangle")

text = "Text cannot escape\tthis container\t...word wrap also works when active so here's 
a long text for testing.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Nec ullamcorper sit amet risus nullam eget felis eget."

resizing = false
wordWrap = true

container = Rectangle( 25, 25, screenWidth - 50, screenHeight - 250)
resizer = Rectangle( container.x + container.width - 17, container.y + container.height - 17, 14, 14 )

minWidth = 60
minHeight = 60
maxWidth = screenWidth - 50
maxHeight = screenHeight - 160

lastMouse = Vector2( 0.0, 0.0 )
borderColor = MAROON 
font = GetFontDefault() 

SetTargetFPS(60)

while !WindowShouldClose()

      if IsKeyPressed(KEY_SPACE) 
         wordWrap = !wordWrap
      ok

         mouse = GetMousePosition()

         if CheckCollisionPointRec(mouse, container)
            borderColor = Fade(MAROON, 0.4)
         but !resizing
            borderColor = MAROON
         ok

         if resizing
            
           if IsMouseButtonReleased(MOUSE_LEFT_BUTTON)
              resizing = false

              width = container.width + (mouse.x - lastMouse.x)
              //container.width = (width > minWidth)? ((width < maxWidth)? width : maxWidth) : minWidth

              if width > minWidth
                 container.width = maxWidth
              else
                 container.width = minWidth
              ok

              height = container.height + (mouse.y - lastMouse.y)
              //container.height = (height > minHeight)? ((height < maxHeight)? height : maxHeight) : minHeight
              if height > minWidth
                 container.height = maxHeight
              else
                 container.height = minHeight
              ok
           ok
         else
           if IsMouseButtonDown(MOUSE_LEFT_BUTTON) & CheckCollisionPointRec(mouse, resizer)
              resizing = true
           ok
         ok
      //ok

         resizer.x = container.x + container.width - 17
         resizer.y = container.y + container.height - 17

         lastMouse = mouse 

         BeginDrawing()

              ClearBackground(RAYWHITE)

              DrawRectangleLinesEx(container, 3, borderColor) 

              DrawTextRec(font, text,
                         Rectangle( container.x + 4, container.y + 4, container.width - 4, container.height - 4 ),
                         20.0, 2.0, wordWrap, GRAY)

              DrawRectangleRec(resizer, borderColor) 

              DrawRectangle(0, screenHeight - 54, screenWidth, 54, GRAY)
              DrawRectangleRec(Rectangle( 382, screenHeight - 34, 12, 12 ), MAROON)

              DrawText("Word Wrap: ", 313, screenHeight-115, 20, BLACK)
              if wordWrap
                 DrawText("ON", 447, screenHeight - 115, 20, RED)
              else
                 DrawText("OFF", 447, screenHeight - 115, 20, BLACK)
              ok

              DrawText("Press [SPACE] to toggle word wrap", 218, screenHeight - 86, 20, GRAY)

              DrawText("Click hold & drag theto resize the container", 155, screenHeight - 38, 20, RAYWHITE)

         EndDrawing()

end

CloseWindow()
