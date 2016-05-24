.class Landroid/support/v4/view/WindowInsetsCompatApi21;
.super Landroid/support/v4/view/WindowInsetsCompat;
.source "WindowInsetsCompatApi21.java"


# instance fields
.field private final mSource:Landroid/view/WindowInsets;


# direct methods
.method constructor <init>(Landroid/view/WindowInsets;)V
    .registers 2
    .param p1, "source"    # Landroid/view/WindowInsets;

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/support/v4/view/WindowInsetsCompat;-><init>()V

    .line 27
    iput-object p1, p0, Landroid/support/v4/view/WindowInsetsCompatApi21;->mSource:Landroid/view/WindowInsets;

    .line 28
    return-void
.end method


# virtual methods
.method public getSystemWindowInsetBottom()I
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Landroid/support/v4/view/WindowInsetsCompatApi21;->mSource:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v0

    return v0
.end method

.method public getSystemWindowInsetLeft()I
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Landroid/support/v4/view/WindowInsetsCompatApi21;->mSource:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v0

    return v0
.end method

.method public getSystemWindowInsetRight()I
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Landroid/support/v4/view/WindowInsetsCompatApi21;->mSource:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v0

    return v0
.end method

.method public getSystemWindowInsetTop()I
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Landroid/support/v4/view/WindowInsetsCompatApi21;->mSource:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v0

    return v0
.end method

.method public isConsumed()Z
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Landroid/support/v4/view/WindowInsetsCompatApi21;->mSource:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->isConsumed()Z

    move-result v0

    return v0
.end method

.method public replaceSystemWindowInsets(IIII)Landroid/support/v4/view/WindowInsetsCompat;
    .registers 7
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 77
    new-instance v0, Landroid/support/v4/view/WindowInsetsCompatApi21;

    iget-object v1, p0, Landroid/support/v4/view/WindowInsetsCompatApi21;->mSource:Landroid/view/WindowInsets;

    invoke-virtual {v1, p1, p2, p3, p4}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(IIII)Landroid/view/WindowInsets;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/view/WindowInsetsCompatApi21;-><init>(Landroid/view/WindowInsets;)V

    return-object v0
.end method

.method unwrap()Landroid/view/WindowInsets;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Landroid/support/v4/view/WindowInsetsCompatApi21;->mSource:Landroid/view/WindowInsets;

    return-object v0
.end method
