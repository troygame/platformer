// raylib-zig (c) Nikolas Wipper 2023

const rl = @import("raylib");
const player = @import("player.zig");

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    var plr: player.Player = .{
        .gravity = rl.Vector2.init(0, 128),
        .velocity = rl.Vector2.init(0, -128),
        .rect = rl.Rectangle.init(100, 200, 32, 32),
    };

    rl.initWindow(screenWidth, screenHeight, "platformer");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(256);

    // Main game loop
    while (!rl.windowShouldClose()) {
        plr.update(rl.getFrameTime());

        {
            rl.beginDrawing();
            defer rl.endDrawing();

            rl.clearBackground(.white);
            plr.render();
            rl.drawFPS(0, 0);
        }
    }
}
