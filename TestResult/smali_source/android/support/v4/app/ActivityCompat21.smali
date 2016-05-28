.class Landroid/support/v4/app/ActivityCompat21;
.super Ljava/lang/Object;
.source "ActivityCompat21.java"


# direct methods
.method public static finishAfterTransition(Landroid/app/Activity;)V
    .registers 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 35
    invoke-virtual {p0}, Landroid/app/Activity;->finishAfterTransition()V

    .line 36
    return-void
.end method
