.class public Landroid/support/v4/app/ActivityCompat;
.super Landroid/support/v4/content/ContextCompat;
.source "ActivityCompat.java"


# direct methods
.method public static finishAffinity(Landroid/app/Activity;)V
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 141
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 142
    invoke-static {p0}, Landroid/support/v4/app/ActivityCompatJB;->finishAffinity(Landroid/app/Activity;)V

    .line 146
    :goto_9
    return-void

    .line 144
    :cond_a
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_9
.end method

.method public static finishAfterTransition(Landroid/app/Activity;)V
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 158
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_a

    .line 159
    invoke-static {p0}, Landroid/support/v4/app/ActivityCompat21;->finishAfterTransition(Landroid/app/Activity;)V

    .line 163
    :goto_9
    return-void

    .line 161
    :cond_a
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_9
.end method
