.class public Lcom/behance/sdk/senab/photoview/Compat;
.super Ljava/lang/Object;
.source "Compat.java"


# direct methods
.method public static postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 4
    .param p0, "view"    # Landroid/view/View;
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 12
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 13
    invoke-static {p0, p1}, Lcom/behance/sdk/senab/photoview/SDK16;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 17
    :goto_9
    return-void

    .line 15
    :cond_a
    const-wide/16 v0, 0x10

    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_9
.end method
