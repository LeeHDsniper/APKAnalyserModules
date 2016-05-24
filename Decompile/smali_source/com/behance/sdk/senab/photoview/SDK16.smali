.class public Lcom/behance/sdk/senab/photoview/SDK16;
.super Ljava/lang/Object;
.source "SDK16.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation


# direct methods
.method public static postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 26
    return-void
.end method
