.class public abstract Lcom/behance/sdk/senab/photoview/ScrollerProxy;
.super Ljava/lang/Object;
.source "ScrollerProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/senab/photoview/ScrollerProxy$PreGingerScroller;,
        Lcom/behance/sdk/senab/photoview/ScrollerProxy$GingerScroller;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    return-void
.end method

.method public static getScroller(Landroid/content/Context;)Lcom/behance/sdk/senab/photoview/ScrollerProxy;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    if-ge v0, v1, :cond_c

    .line 29
    new-instance v0, Lcom/behance/sdk/senab/photoview/ScrollerProxy$PreGingerScroller;

    invoke-direct {v0, p0}, Lcom/behance/sdk/senab/photoview/ScrollerProxy$PreGingerScroller;-><init>(Landroid/content/Context;)V

    .line 31
    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Lcom/behance/sdk/senab/photoview/ScrollerProxy$GingerScroller;

    invoke-direct {v0, p0}, Lcom/behance/sdk/senab/photoview/ScrollerProxy$GingerScroller;-><init>(Landroid/content/Context;)V

    goto :goto_b
.end method


# virtual methods
.method public abstract computeScrollOffset()Z
.end method

.method public abstract fling(IIIIIIIIII)V
.end method

.method public abstract forceFinished(Z)V
.end method

.method public abstract getCurrX()I
.end method

.method public abstract getCurrY()I
.end method
