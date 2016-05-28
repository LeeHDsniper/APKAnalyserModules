.class public abstract Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;
.super Lorg/lucasr/twowayview/TwoWayLayoutManager;
.source "AdobeCSDKBaseLayoutManager.java"


# instance fields
.field private mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

.field private final mSmoothScrollbarEnabled:Z


# direct methods
.method public constructor <init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)V
    .registers 3
    .param p1, "orientation"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;-><init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)V

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->mSmoothScrollbarEnabled:Z

    .line 37
    return-void
.end method

.method private getChildClosestToEnd()Landroid/view/View;
    .registers 2

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private getChildClosestToStart()Landroid/view/View;
    .registers 2

    .prologue
    .line 100
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public computeVerticalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 8
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 86
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 87
    const/4 v0, 0x0

    .line 89
    :goto_7
    return v0

    :cond_8
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    .line 90
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v2

    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v3

    const/4 v5, 0x1

    move-object v0, p1

    move-object v4, p0

    .line 89
    invoke-static/range {v0 .. v5}, Lorg/lucasr/twowayview/widget/ScrollbarHelper;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v0

    goto :goto_7
.end method

.method public computeVerticalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 9
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v6, 0x0

    .line 105
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 108
    :goto_7
    return v6

    :cond_8
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v2

    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v3

    const/4 v5, 0x1

    move-object v0, p1

    move-object v4, p0

    invoke-static/range {v0 .. v6}, Lorg/lucasr/twowayview/widget/ScrollbarHelper;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;ZZ)I

    move-result v6

    goto :goto_7
.end method

.method public computeVerticalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 8
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 75
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 76
    const/4 v0, 0x0

    .line 78
    :goto_7
    return v0

    :cond_8
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    .line 79
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v2

    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v3

    const/4 v5, 0x1

    move-object v0, p1

    move-object v4, p0

    .line 78
    invoke-static/range {v0 .. v5}, Lorg/lucasr/twowayview/widget/ScrollbarHelper;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v0

    goto :goto_7
.end method

.method protected ensureLayoutStateDueToChildContentChange(Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 8
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v5, -0x1

    .line 50
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    if-nez v4, :cond_c

    .line 51
    const/4 v4, 0x1

    invoke-static {p0, v4}, Landroid/support/v7/widget/OrientationHelper;->createOrientationHelper(Landroid/support/v7/widget/RecyclerView$LayoutManager;I)Landroid/support/v7/widget/OrientationHelper;

    move-result-object v4

    iput-object v4, p0, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    .line 54
    :cond_c
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v2

    .line 55
    .local v2, "itemCount":I
    if-nez v2, :cond_13

    .line 71
    :cond_12
    :goto_12
    return-void

    .line 58
    :cond_13
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getPendingScrollPosition()I

    move-result v3

    .line 59
    .local v3, "pendingPosition":I
    if-ne v3, v5, :cond_12

    .line 60
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getFirstVisiblePosition()I

    move-result v1

    .line 61
    .local v1, "firstPosition":I
    if-ltz v1, :cond_12

    if-ge v1, v2, :cond_12

    .line 64
    invoke-virtual {p0, v1}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 65
    .local v0, "firstChild":Landroid/view/View;
    if-eqz v0, :cond_2f

    .line 66
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->getChildStart(Landroid/view/View;)I

    move-result v4

    invoke-virtual {p0, v1, v4}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->setPendingScrollPositionWithOffset(II)V

    goto :goto_12

    .line 68
    :cond_2f
    const/4 v4, 0x0

    invoke-virtual {p0, v5, v4}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->setPendingScrollPositionWithOffset(II)V

    goto :goto_12
.end method
