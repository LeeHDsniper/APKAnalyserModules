.class Landroid/support/v4/view/MotionEventCompatHoneycombMr1;
.super Ljava/lang/Object;
.source "MotionEventCompatHoneycombMr1.java"


# direct methods
.method static getAxisValue(Landroid/view/MotionEvent;I)F
    .registers 3
    .param p0, "event"    # Landroid/view/MotionEvent;
    .param p1, "axis"    # I

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v0

    return v0
.end method
