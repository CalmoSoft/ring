/*******************************************************************************************
*
*   raylib [text] example - Font filters
*
*   After font loading, font texture atlas filter could be configured for a softer
*   display of the font when scaling it to different sizes, that way, it's not required
*   to generate multiple fonts at multiple sizes (as long as the scaling is not very different)
*
*   This example has been created using raylib 1.3.0 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2015 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

#===================================================================#
# Based on Original Sample from RayLib (https://www.raylib.com/)
# Ported to RingRayLib by Ring Team
#===================================================================#

load "raylib.ring"

screenWidth = 800
screenHeight = 450

InitWindow(screenWidth, screenHeight, "Font Filters")

msg = "Loaded Font"

font = LoadFont("resources/KAISG.ttf")

GenTextureMipmaps(font.texture)

fontSize = font.baseSize
fontPosition = Vector2( 40, screenHeight/2 - 80 )
textSize = Vector2( 0.0, 0.0 )

SetTextureFilter(font.texture, FILTER_POINT)
currentFontFilter = 0  

SetTargetFPS(60)

while !WindowShouldClose()

      fontSize += GetMouseWheelMove()*4.0f

      if IsKeyPressed(KEY_ONE)

         SetTextureFilter(font.texture, FILTER_POINT)
         currentFontFilter = 0

      but IsKeyPressed(KEY_TWO)

         SetTextureFilter(font.texture, FILTER_BILINEAR)
         currentFontFilter = 1

      but IsKeyPressed(KEY_THREE)
          SetTextureFilter(font.texture, FILTER_TRILINEAR);
          currentFontFilter = 2;
      ok

      textSize = Vector2(20, 20)

      if IsKeyDown(KEY_LEFT)
         fontPosition.x -= 10
      but IsKeyDown(KEY_RIGHT)
          fontPosition.x += 10

          if IsFileDropped()
        
             int count = 0
             droppedFiles = GetDroppedFiles(count)

             if IsFileExtension(droppedFiles[0], ".ttf")
        
                UnloadFont(font)
                font = LoadFontEx(droppedFiles[0], fontSize, 0, 0)
                ClearDroppedFiles()
             ok
          ok
     ok

     BeginDrawing()
            
          ClearBackground(RAYWHITE)

          DrawText("Use mouse wheel to change font size", 20, 20, 10, GRAY)
          DrawText("Use KEY_RIGHT and KEY_LEFT to move text", 20, 40, 10, GRAY)
          DrawText("Use 1, 2, 3 to change texture filter", 20, 60, 10, GRAY)
          DrawText("Drop a new TTF font for dynamic loading", 20, 80, 10, DARKGRAY)

          DrawTextEx(font, msg, fontPosition, fontSize, 0, BLACK)

          DrawRectangle(0, screenHeight - 80, screenWidth, 80, LIGHTGRAY)
          DrawText("Font size: " + fontSize, 20, screenHeight - 50, 10, DARKGRAY)
          DrawText("Text size: " + textSize.x + "-" + textSize.y, 20, screenHeight - 30, 10, DARKGRAY)
          DrawText("CURRENT TEXTURE FILTER:", 250, 400, 20, GRAY)

          if currentFontFilter = 0
             DrawText("POINT", 570, 400, 20, BLACK)
          but currentFontFilter = 1
              DrawText("BILINEAR", 570, 400, 20, BLACK)
          but currentFontFilter = 2
              DrawText("TRILINEAR", 570, 400, 20, BLACK)
          ok

     EndDrawing()

end

ClearDroppedFiles()

UnloadFont(font)   

CloseWindow()  
