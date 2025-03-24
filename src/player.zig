const rl = @import("raylib");

pub const Player = struct {
    rect: rl.Rectangle,
    velocity: rl.Vector2,
    gravity: rl.Vector2,

    pub fn update(self: *Player, dt: f32) void {
        self.velocity = self.velocity.add(self.gravity.scale(dt));

        self.rect.x += self.velocity.x * dt;
        self.rect.y += self.velocity.y * dt;
    }

    pub fn render(self: Player) void {
        rl.drawRectangleRec(self.rect, rl.Color.red);
    }
};
