.class public Lorg/lucasr/twowayview/widget/GridLayoutManager;
.super Lorg/lucasr/twowayview/widget/BaseLayoutManager;
.source "GridLayoutManager.java"


# instance fields
.field private mNumColumns:I

.field private mNumRows:I


# direct methods
.method public constructor <init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;II)V
    .registers 6
    .param p1, "orientation"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    .param p2, "numColumns"    # I
    .param p3, "numRows"    # I

    .prologue
    const/4 v1, 0x1

    .line 63
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;-><init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)V

    .line 64
    iput p2, p0, Lorg/lucasr/twowayview/widget/GridLayoutManager;->mNumColumns:I

    .line 65
    iput p3, p0, Lorg/lucasr/twowayview/widget/GridLayoutManager;->mNumRows:I

    .line 67
    iget v0, p0, Lorg/lucasr/twowayview/widget/GridLayoutManager;->mNumColumns:I

    if-ge v0, v1, :cond_14

    .line 68
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "GridLayoutManager must have at least 1 column"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_14
    iget v0, p0, Lorg/lucasr/twowayview/widget/GridLayoutManager;->mNumRows:I

    if-ge v0, v1, :cond_20

    .line 72
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "GridLayoutManager must have at least 1 row"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_20
    return-void
.end method


# virtual methods
.method getLaneCount()I
    .registers 2

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->isVertical()Z

    move-result v0

    if-eqz v0, :cond_9

    iget v0, p0, Lorg/lucasr/twowayview/widget/GridLayoutManager;->mNumColumns:I

    :goto_8
    return v0

    :cond_9
    iget v0, p0, Lorg/lucasr/twowayview/widget/GridLayoutManager;->mNumRows:I

    goto :goto_8
.end method

.method getLaneForPosition(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 6
    .param p1, "outInfo"    # Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;
    .param p2, "position"    # I
    .param p3, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->getLaneCount()I

    move-result v1

    rem-int v0, p2, v1

    .line 84
    .local v0, "lane":I
    invoke-virtual {p1, v0, v0}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->set(II)V

    .line 85
    return-void
.end method

.method public getNumColumns()I
    .registers 2

    .prologue
    .line 110
    iget v0, p0, Lorg/lucasr/twowayview/widget/GridLayoutManager;->mNumColumns:I

    return v0
.end method

.method moveLayoutToPosition(IILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 12
    .param p1, "position"    # I
    .param p2, "offset"    # I
    .param p3, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 89
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->getLanes()Lorg/lucasr/twowayview/widget/Lanes;

    move-result-object v4

    .line 90
    .local v4, "lanes":Lorg/lucasr/twowayview/widget/Lanes;
    invoke-virtual {v4, p2}, Lorg/lucasr/twowayview/widget/Lanes;->reset(I)V

    .line 92
    iget-object v5, p0, Lorg/lucasr/twowayview/widget/GridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    sget-object v6, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {p0, v5, p1, v6}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->getLaneForPosition(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 93
    iget-object v5, p0, Lorg/lucasr/twowayview/widget/GridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v3, v5, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    .line 94
    .local v3, "lane":I
    if-nez v3, :cond_15

    .line 107
    :cond_14
    return-void

    .line 98
    :cond_15
    invoke-virtual {p3, p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object v0

    .line 99
    .local v0, "child":Landroid/view/View;
    sget-object v5, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {p0, v0, v5}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->measureChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 102
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->isVertical()Z

    move-result v5

    if-eqz v5, :cond_32

    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v1

    .line 104
    .local v1, "dimension":I
    :goto_28
    add-int/lit8 v2, v3, -0x1

    .local v2, "i":I
    :goto_2a
    if-ltz v2, :cond_14

    .line 105
    invoke-virtual {v4, v2, v1}, Lorg/lucasr/twowayview/widget/Lanes;->offset(II)V

    .line 104
    add-int/lit8 v2, v2, -0x1

    goto :goto_2a

    .line 102
    .end local v1    # "dimension":I
    .end local v2    # "i":I
    :cond_32
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    move-result v1

    goto :goto_28
.end method
