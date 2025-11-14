const std = @import("std");

fn padString(num: i32) []const u8 {
    if (num < 10) {
        return "  ";
    } else if (num < 100) {
        return " ";
    } else {
        return "";
    }
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var i: i32 = 1;
    while (i <= 100) : (i += 1) {
        const padding = padString(i);

        if (i % 15 == 0) {
            try stdout.print("{s}{d} - fizzbuzz\n", .{ padding, i });
        } else if (i % 3 == 0) {
            try stdout.print("{s}{d} - fizz\n", .{ padding, i });
        } else if (i % 5 == 0) {
            try stdout.print("{s}{d} -     buzz\n", .{ padding, i });
        } else {
            try stdout.print("{s}{d}\n", .{ padding, i });
        }
    }
}
