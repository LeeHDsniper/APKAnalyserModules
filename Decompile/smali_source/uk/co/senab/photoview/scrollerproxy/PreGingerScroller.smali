.class public Luk/co/senab/photoview/scrollerproxy/PreGingerScroller;
.super Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;
.source "PreGingerScroller.java"


# instance fields
.field private final mScroller:Landroid/widget/Scroller;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;-><init>()V

    .line 26
    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Luk/co/senab/photoview/scrollerproxy/PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    .line 27
    return-void
.end method


# virtual methods
.method public computeScrollOffset()Z
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Luk/co/senab/photoview/scrollerproxy/PreGingerScroller;->mScroller:Landroid/widget/Scroller;

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
    .line 37
    iget-object v0, p0, Luk/co/senab/photoview/scrollerproxy/PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 38
    return-void
.end method

.method public forceFinished(Z)V
    .registers 3
    .param p1, "finished"    # Z

    .prologue
    .line 42
    iget-object v0, p0, Luk/co/senab/photoview/scrollerproxy/PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 43
    return-void
.end method

.method public getCurrX()I
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Luk/co/senab/photoview/scrollerproxy/PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    return v0
.end method

.method public getCurrY()I
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Luk/co/senab/photoview/scrollerproxy/PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    return v0
.end method

.method public isFinished()Z
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Luk/co/senab/photoview/scrollerproxy/PreGingerScroller;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    return v0
.end method
