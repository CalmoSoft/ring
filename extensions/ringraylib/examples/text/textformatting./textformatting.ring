/*******************************************************************************************
*
*   raylib [text] example - Text formatting
*
*   This example has been created using raylib 1.1 (www.raylib.com)
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

InitWindow(screenWidth, screenHeight, "Text Formatting")

score = 100020
hiscore = 200450
lives = 5

SetTargetFPS(60)

while !WindowShouldClose()

       BeginDrawing()

            ClearBackground(RAYWHITE)

            DrawText("Score: " + score, 200, 80, 20, RED)

            DrawText("HiScore: " + hiscore, 200, 120, 20, GREEN)

            DrawText("Lives: " + lives, 200, 160, 40, BLUE)

            DrawText("Elapsed Time: " + GetFrameTime()*1000, 200, 220, 20, BLACK)

       EndDrawing()

end

CloseWindow()
