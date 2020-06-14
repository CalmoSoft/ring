/*******************************************************************************************
*
*   raylib [textures] example - Texture loading and drawing
*
*   This example has been created using raylib 1.0 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2014 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

#===================================================================#
# Based on Original Sample from RayLib (https://www.raylib.com/)
# Ported to RingRayLib by Ring Team
#===================================================================#

load "raylib.ring"

screenWidth = 800
screenHeight = 450

InitWindow(screenWidth, screenHeight, "Texture Loading and Drawing")

texture = LoadTexture("resources/raylib_logo.png")

while !WindowShouldClose()

      BeginDrawing()

           ClearBackground(RAYWHITE)

           DrawTexture(texture, screenWidth/2 - texture.width/2, screenHeight/2 - texture.height/2, WHITE)

           DrawText("this IS a texture!", 360, 370, 10, GRAY)

      EndDrawing()

end

UnloadTexture(texture)   

CloseWindow()  


