.class public Landroid/support/v4/view/WindowInsetsCompat;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getSystemWindowInsetBottom()I
    .registers 2

    .prologue
    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method public getSystemWindowInsetLeft()I
    .registers 2

    .prologue
    .line 43
    const/4 v0, 0x0

    return v0
.end method

.method public getSystemWindowInsetRight()I
    .registers 2

    .prologue
    .line 69
    const/4 v0, 0x0

    return v0
.end method

.method public getSystemWindowInsetTop()I
    .registers 2

    .prologue
    .line 56
    const/4 v0, 0x0

    return v0
.end method

.method public isConsumed()Z
    .registers 2

    .prologue
    .line 121
    const/4 v0, 0x0

    return v0
.end method

.method public replaceSystemWindowInsets(IIII)Landroid/support/v4/view/WindowInsetsCompat;
    .registers 5
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 158
    return-object p0
.end method
