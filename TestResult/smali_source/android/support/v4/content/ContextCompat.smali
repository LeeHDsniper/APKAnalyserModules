.class public Landroid/support/v4/content/ContextCompat;
.super Ljava/lang/Object;
.source "ContextCompat.java"


# direct methods
.method public static final getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 317
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 318
    .local v0, "version":I
    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 319
    invoke-static {p0, p1}, Landroid/support/v4/content/ContextCompatApi21;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 321
    :goto_a
    return-object v1

    :cond_b
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_a
.end method

.method public static startActivities(Landroid/content/Context;[Landroid/content/Intent;Landroid/os/Bundle;)Z
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intents"    # [Landroid/content/Intent;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x1

    .line 103
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 104
    .local v0, "version":I
    const/16 v2, 0x10

    if-lt v0, v2, :cond_b

    .line 105
    invoke-static {p0, p1, p2}, Landroid/support/v4/content/ContextCompatJellybean;->startActivities(Landroid/content/Context;[Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 111
    :goto_a
    return v1

    .line 107
    :cond_b
    const/16 v2, 0xb

    if-lt v0, v2, :cond_13

    .line 108
    invoke-static {p0, p1}, Landroid/support/v4/content/ContextCompatHoneycomb;->startActivities(Landroid/content/Context;[Landroid/content/Intent;)V

    goto :goto_a

    .line 111
    :cond_13
    const/4 v1, 0x0

    goto :goto_a
.end method
