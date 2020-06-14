/*******************************************************************************************
*
*   raylib [textures] example - Image loading and texture creation
*
*   NOTE: Images are loaded in CPU memory (RAM); textures are loaded in GPU memory (VRAM)
*
*   This example has been created using raylib 1.3 (www.raylib.com)
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

InitWindow(screenWidth, screenHeight, "Image Loading")

image = LoadImage("resources/raylib_logo.png") 
texture = LoadTextureFromImage(image)  

UnloadImage(image)   

while !WindowShouldClose()

      BeginDrawing()

           ClearBackground(RAYWHITE)

           DrawTexture(texture, screenWidth/2 - texture.width/2, screenHeight/2 - texture.height/2, WHITE)

           DrawText("this IS a texture loaded from an image!", 300, 370, 10, GRAY)

      EndDrawing()
end

UnloadTexture(texture)   

CloseWindow()
