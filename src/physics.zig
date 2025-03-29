const rl = @import("raylib");

const Object = struct {
    ptr: *anyopaque,
    vtable: *const VTable,

    pub const VTable = struct {
        render: *const fn (*anyopaque, dt: f32) void,
        update: *const fn (*anyopaque, dt: f32) void,
        getPos: *const fn (*anyopaque) rl.Vector2,
        setPos: *const fn (*anyopaque, v: rl.Vector2) void,
        getMass: *const fn (*anyopaque) f32,
        setMass: *const fn (*anyopaque, m: f32) void,
        getElasticity: *const fn (*anyopaque) f32,
        setElasticity: *const fn (*anyopaque, e: f32) void,
        getFriction: *const fn (*anyopaque) f32,
        setFriction: *const fn (*anyopaque, f: f32) void,
    };

    pub fn render(self: Object, dt: f32) void {
        self.vtable.render(self.ptr, dt);
    }

    pub fn update(self: Object, dt: f32) void {
        self.vtable.update(self.ptr, dt);
    }

    pub fn getPos(self: Object) rl.Vector2 {
        return self.vtable.getPos(self.ptr);
    }
    pub fn setPos(self: Object, v: rl.Vector2) void {
        self.vtable.setPos(self.ptr, v);
    }

    pub fn getMass(self: Object) f32 {
        return self.vtable.getMass(self.ptr);
    }
    pub fn setMass(self: Object, m: f32) void {
        self.vtable.setMass(self.ptr, m);
    }

    pub fn getElasticity(self: Object) f32 {
        return self.vtable.getElasticity(self.ptr);
    }
    pub fn setElasticity(self: Object, e: f32) void {
        self.vtable.setElasticity(self.ptr, e);
    }

    pub fn getFriction(self: Object) f32 {
        return self.vtable.getFriction(self.ptr);
    }
    pub fn setFriction(self: Object, f: f32) void {
        self.vtable.setFriction(self.ptr, f);
    }

    pub fn init(ptr: anytype) Object {
        const T = @TypeOf(ptr);
        const ptr_info = @typeInfo(T);

        const gen = struct {
            pub fn render(self: Object, dt: f32) void {
                self.vtable.render(self.ptr, dt);
            }

    pub fn update(self: Object, dt: f32) void {
        self.vtable.update(self.ptr, dt);
    }

    pub fn getPos(self: Object) rl.Vector2 {
        return self.vtable.getPos(self.ptr);
    }
    pub fn setPos(self: Object, v: rl.Vector2) void {
        self.vtable.setPos(self.ptr, v);
    }

    pub fn getMass(self: Object) f32 {
        return self.vtable.getMass(self.ptr);
    }
    pub fn setMass(self: Object, m: f32) void {
        self.vtable.setMass(self.ptr, m);
    }

    pub fn getElasticity(self: Object) f32 {
        return self.vtable.getElasticity(self.ptr);
    }
    pub fn setElasticity(self: Object, e: f32) void {
        self.vtable.setElasticity(self.ptr, e);
    }

    pub fn getFriction(self: Object) f32 {
        return self.vtable.getFriction(self.ptr);
    }
    pub fn setFriction(self: Object, f: f32) void {
        self.vtable.setFriction(self.ptr, f);
    }
        };
        return .{ .ptr = ptr, .vtable = .{} }
    }

};

const Square = struct {
    fn render(self: *anyopaque, dt: f32) void {
        const size = 10;
        rl.drawRectangleRec(rl.Rectangle.init(self.position.x - size / 2, self.position.y - size / 2, size, size), rl.Color.red);
    }

    fn object(self: *Square) *Object {
        var obj = Object{
            .ptr = &self,
            .vtable = .{},
        };
    }
};
