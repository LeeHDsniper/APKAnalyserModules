.class Lcom/behance/sdk/senab/photoview/ScrollerProxy$PreGingerScroller;
.super Lcom/behance/sdk/senab/photoview/ScrollerProxy;
.source "ScrollerProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/senab/photoview/ScrollerProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PreGingerScroller"
.end annotation


# instance fields
.field private mScroller:Landroid/widget/Scroller;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/ScrollerProxy;-><init>()V

    .line 87
    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/ScrollerProxy$PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    .line 88
    return-void
.end method


# virtual methods
.method public computeScrollOffset()Z
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/ScrollerProxy$PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    return v0
.end method

.method public fling(IIIIIIIIII)V
    .registers 20
    .param p1, "startX"    # I
    .param p2, "startY"    # I
    .param p3, "velocityX"    # I
    .param p4, "velocityY"    # I
    .param p5, "minX"    # I
    .param p6, "maxX"    # I
    .param p7, "minY"    # I
    .param p8, "maxY"    # I
    .param p9, "overX"    # I
    .param p10, "overY"    # I

    .prologue
    .line 98
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/ScrollerProxy$PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 99
    return-void
.end method

.method public forceFinished(Z)V
    .registers 3
    .param p1, "finished"    # Z

    .prologue
    .line 103
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/ScrollerProxy$PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 104
    return-void
.end method

.method public getCurrX()I
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/ScrollerProxy$PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    return v0
.end method

.method public getCurrY()I
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/ScrollerProxy$PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    return v0
.end method
