.class Landroid/support/v4/content/ContextCompatHoneycomb;
.super Ljava/lang/Object;
.source "ContextCompatHoneycomb.java"


# direct methods
.method static startActivities(Landroid/content/Context;[Landroid/content/Intent;)V
    .registers 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intents"    # [Landroid/content/Intent;

    .prologue
    .line 30
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivities([Landroid/content/Intent;)V

    .line 31
    return-void
.end method
