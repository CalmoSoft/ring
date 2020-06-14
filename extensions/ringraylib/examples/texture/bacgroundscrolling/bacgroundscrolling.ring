/*******************************************************************************************
*
*   raylib [textures] example - Background scrolling
*
*   This example has been created using raylib 2.0 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2019 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

#===================================================================#
# Based on Original Sample from RayLib (https://www.raylib.com/)
# Ported to RingRayLib by Ring Team
#===================================================================#

load "raylib.ring"

screenWidth = 800
screenHeight = 450

InitWindow(screenWidth, screenHeight, "Background Scrolling")

background = LoadTexture("resources/cyberpunk_street_background.png")
midground = LoadTexture("resources/cyberpunk_street_midground.png")
foreground = LoadTexture("resources/cyberpunk_street_foreground.png")

scrollingBack = 0.0
scrollingMid = 0.0
scrollingFore = 0.0

SetTargetFPS(60)

while !WindowShouldClose()

      scrollingBack -= 0.1
      scrollingMid -= 0.5
      scrollingFore -= 1.0

      if scrollingBack <= -background.width*2
         scrollingBack = 0
      ok
      if scrollingMid <= -midground.width*2
         scrollingMid = 0
      ok
      if scrollingFore <= -foreground.width*2
         scrollingFore = 0
      ok

      BeginDrawing()

           ClearBackground(RAYWHITE)

           DrawTextureEx(background, Vector2( scrollingBack, 20 ), 0.0, 2.0, WHITE)
           DrawTextureEx(background, Vector2( background.width*2 + scrollingBack, 20 ), 0.0, 2.0, WHITE)


           DrawTextureEx(midground, Vector2( scrollingMid, 20 ), 0.0, 2.0, WHITE)
           DrawTextureEx(midground, Vector2( midground.width*2 + scrollingMid, 20 ), 0.0, 2.0, WHITE)

           DrawTextureEx(foreground, Vector2( scrollingFore, 70 ), 0.0, 2.0, WHITE)
           DrawTextureEx(foreground, Vector2( foreground.width*2 + scrollingFore, 70 ), 0.0, 2.0, WHITE)

           DrawText("BACKGROUND SCROLLING & PARALLAX", 10, 10, 20, RED)
           DrawText("(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)", screenWidth - 330,
                    screenHeight - 20, 10, RAYWHITE)

      EndDrawing()
end

UnloadTexture(background) 
UnloadTexture(midground)   
UnloadTexture(foreground)  

CloseWindow()  
