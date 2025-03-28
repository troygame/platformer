const rl = @import("raylib");
const std = @import("std");
const consts = @import("constants.zig");

pub const Player = struct {
    rect: rl.Rectangle,
    velocity: rl.Vector2,
    gravity: rl.Vector2,

    pub fn update(self: *Player, dt: f32) void {
        self.velocity = self.velocity.add(self.gravity.scale(dt));

        if (self.rect.y >= 256) {
            self.velocity.y = 0;

            // apply friction
            if (self.velocity.x > 0) {
                self.velocity.x -= @min(consts.friction * dt, @abs(self.velocity.x));
            }

            if (self.velocity.x < 0) {
                self.velocity.x += @min(consts.friction * dt, @abs(self.velocity.x));
            }
            if (rl.isKeyDown(.space)) {
                self.velocity.y = -256;
            }
        }

        if (rl.isKeyDown(.right)) {
            if (self.velocity.x <= consts.max_player_speed) {
                self.velocity.x += consts.player_acceleration * dt;
            }
        }

        if (rl.isKeyDown(.left)) {
            if (self.velocity.x >= -consts.max_player_speed) {
                self.velocity.x -= consts.player_acceleration * dt;
            }
        }

        std.debug.print("{d}\n", .{self.velocity.x});

        self.rect.x += self.velocity.x * dt;
        self.rect.y += self.velocity.y * dt;
    }

    pub fn render(self: Player) void {
        rl.drawRectangleRec(self.rect, rl.Color.red);
    }
};
