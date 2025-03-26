const rl = @import("raylib");
const std = @import("std");

pub const Player = struct {
    rect: rl.Rectangle,
    velocity: rl.Vector2,
    gravity: rl.Vector2,

    pub fn update(self: *Player, dt: f32) void {
        self.velocity = self.velocity.add(self.gravity.scale(dt));

        if (self.rect.y >= 256) {
            self.velocity.y = 0;
            if (rl.isKeyDown(.space)) {
                self.velocity.y = -256;
            }
        }

        if (rl.isKeyDown(.right)) {
            self.velocity.x += 1024 * dt;
        }
        if (rl.isKeyDown(.left)) {
            self.velocity.x -= 1024 * dt;
        }

        if (@abs(self.velocity.x) != 0) {
            self.velocity.x -= 4 * self.velocity.x * dt;
        }

        self.rect.x += self.velocity.x * dt;
        self.rect.y += self.velocity.y * dt;
    }

    pub fn render(self: Player) void {
        rl.drawRectangleRec(self.rect, rl.Color.red);
    }
};
