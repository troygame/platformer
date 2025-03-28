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
            if (rl.isKeyDown(.space)) {
                self.velocity.y = -256;
            }
        }

        const calc_vel = if (@abs(self.velocity.x) <= consts.initial_player_speed)
            consts.initial_player_speed
        else
            @abs(self.velocity.x);
        if (rl.isKeyDown(.right)) {
            self.velocity.x += (calc_vel) * (1 - calc_vel / consts.max_player_speed) * dt * consts.acceleration_multiplier;
        }

        if (rl.isKeyDown(.left)) {
            self.velocity.x -= (calc_vel) * (1 - calc_vel / consts.max_player_speed) * dt * consts.acceleration_multiplier;
        }

        // if (self.velocity.x > 0) {
        //     self.velocity.x -= 512 * dt;
        // }

        // if (self.velocity.x < 0) {
        //     self.velocity.x += 512 * dt;
        // }

        std.debug.print("{d}\n", .{self.velocity.x});

        self.rect.x += self.velocity.x * dt;
        self.rect.y += self.velocity.y * dt;
    }

    pub fn render(self: Player) void {
        rl.drawRectangleRec(self.rect, rl.Color.red);
    }
};
