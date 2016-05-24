.class public Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;
.super Lorg/lucasr/twowayview/widget/GridLayoutManager;
.source "StaggeredGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;,
        Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    }
.end annotation


# direct methods
.method public constructor <init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;II)V
    .registers 4
    .param p1, "orientation"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    .param p2, "numColumns"    # I
    .param p3, "numRows"    # I

    .prologue
    .line 93
    invoke-direct {p0, p1, p2, p3}, Lorg/lucasr/twowayview/widget/GridLayoutManager;-><init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;II)V

    .line 94
    return-void
.end method


# virtual methods
.method cacheChildFrame(Landroid/view/View;Landroid/graphics/Rect;)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "childFrame"    # Landroid/graphics/Rect;

    .prologue
    .line 217
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;

    .line 218
    .local v0, "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    if-nez v0, :cond_14

    .line 219
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Tried to cache frame on undefined item"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 222
    :cond_14
    invoke-virtual {p0, v0, p2}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->cacheItemFrame(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;Landroid/graphics/Rect;)V

    .line 223
    return-object v0
.end method

.method cacheChildLaneAndSpan(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .registers 8
    .param p1, "child"    # Landroid/view/View;
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 186
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    .line 188
    .local v1, "position":I
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v2}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->setUndefined()V

    .line 190
    invoke-virtual {p0, v1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;

    .line 191
    .local v0, "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    if-eqz v0, :cond_1a

    .line 192
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v3, v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->startLane:I

    iget v4, v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->anchorLane:I

    invoke-virtual {v2, v3, v4}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->set(II)V

    .line 195
    :cond_1a
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v2}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->isUndefined()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 196
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {p0, v2, p1, p2}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getLaneForChild(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 199
    :cond_27
    if-nez v0, :cond_3e

    .line 200
    new-instance v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;

    .end local v0    # "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v2, v2, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    iget-object v3, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v3, v3, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->anchorLane:I

    .line 201
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getLaneSpanForChild(Landroid/view/View;)I

    move-result v4

    invoke-direct {v0, v2, v3, v4}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;-><init>(III)V

    .line 202
    .restart local v0    # "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    invoke-virtual {p0, v1, v0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->setItemEntryForPosition(ILorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;)V

    .line 207
    :goto_3d
    return-object v0

    .line 204
    :cond_3e
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v0, v2}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->setLane(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;)V

    goto :goto_3d
.end method

.method cacheItemFrame(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;Landroid/graphics/Rect;)V
    .registers 5
    .param p1, "entry"    # Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    .param p2, "childFrame"    # Landroid/graphics/Rect;

    .prologue
    .line 211
    iget v0, p2, Landroid/graphics/Rect;->right:I

    iget v1, p2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v1

    # setter for: Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->width:I
    invoke-static {p1, v0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->access$102(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;I)I

    .line 212
    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    iget v1, p2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v0, v1

    # setter for: Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->height:I
    invoke-static {p1, v0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->access$202(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;I)I

    .line 213
    return-void
.end method

.method public checkLayoutParams(Landroid/support/v7/widget/RecyclerView$LayoutParams;)Z
    .registers 7
    .param p1, "lp"    # Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .prologue
    const/4 v2, 0x1

    .line 228
    invoke-super {p0, p1}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->checkLayoutParams(Landroid/support/v7/widget/RecyclerView$LayoutParams;)Z

    move-result v0

    .line 229
    .local v0, "result":Z
    instance-of v3, p1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    if-eqz v3, :cond_19

    move-object v1, p1

    .line 230
    check-cast v1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 231
    .local v1, "staggeredLp":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    iget v3, v1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    if-lt v3, v2, :cond_1a

    iget v3, v1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getLaneCount()I

    move-result v4

    if-gt v3, v4, :cond_1a

    :goto_18
    and-int/2addr v0, v2

    .line 234
    .end local v1    # "staggeredLp":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    :cond_19
    return v0

    .line 231
    .restart local v1    # "staggeredLp":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    :cond_1a
    const/4 v2, 0x0

    goto :goto_18
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 2

    .prologue
    .line 35
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->generateDefaultLayoutParams()Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateDefaultLayoutParams()Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    .registers 4

    .prologue
    const/4 v2, -0x1

    const/4 v1, -0x2

    .line 239
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->isVertical()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 240
    new-instance v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, v2, v1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(II)V

    .line 242
    :goto_d
    return-object v0

    :cond_e
    new-instance v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, v1, v2}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(II)V

    goto :goto_d
.end method

.method public bridge synthetic generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 3

    .prologue
    .line 35
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    .registers 4
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 267
    new-instance v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1, p2}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    .registers 7
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v3, -0x1

    .line 248
    new-instance v1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    move-object v2, p1

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v1, v2}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 249
    .local v1, "staggeredLp":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->isVertical()Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 250
    iput v3, v1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->width:I

    .line 251
    iget v2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v2, v1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->height:I

    .line 257
    :goto_15
    instance-of v2, p1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    if-eqz v2, :cond_2d

    move-object v0, p1

    .line 258
    check-cast v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 259
    .local v0, "other":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    const/4 v2, 0x1

    iget v3, v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getLaneCount()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    .line 262
    .end local v0    # "other":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    :cond_2d
    return-object v1

    .line 253
    :cond_2e
    iget v2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v2, v1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->width:I

    .line 254
    iput v3, v1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->height:I

    goto :goto_15
.end method

.method getLaneForChild(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 6
    .param p1, "outInfo"    # Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 125
    invoke-super {p0, p1, p2, p3}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->getLaneForChild(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 126
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->isUndefined()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 127
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getLanes()Lorg/lucasr/twowayview/widget/Lanes;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getLaneSpanForChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, p1, v1, p3}, Lorg/lucasr/twowayview/widget/Lanes;->findLane(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 129
    :cond_14
    return-void
.end method

.method getLaneForPosition(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 7
    .param p1, "outInfo"    # Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;
    .param p2, "position"    # I
    .param p3, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 114
    invoke-virtual {p0, p2}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;

    .line 115
    .local v0, "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    if-eqz v0, :cond_10

    .line 116
    iget v1, v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->startLane:I

    iget v2, v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->anchorLane:I

    invoke-virtual {p1, v1, v2}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->set(II)V

    .line 121
    :goto_f
    return-void

    .line 120
    :cond_10
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->setUndefined()V

    goto :goto_f
.end method

.method getLaneSpanForChild(Landroid/view/View;)I
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 98
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 99
    .local v0, "lp":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    iget v1, v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    return v1
.end method

.method getLaneSpanForPosition(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 104
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;

    .line 105
    .local v0, "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    if-nez v0, :cond_21

    .line 106
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not find span for position "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 109
    :cond_21
    # getter for: Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->span:I
    invoke-static {v0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->access$000(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;)I

    move-result v1

    return v1
.end method

.method moveLayoutToPosition(IILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 16
    .param p1, "position"    # I
    .param p2, "offset"    # I
    .param p3, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 133
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->isVertical()Z

    move-result v10

    .line 134
    .local v10, "isVertical":Z
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getLanes()Lorg/lucasr/twowayview/widget/Lanes;

    move-result-object v0

    .line 136
    .local v0, "lanes":Lorg/lucasr/twowayview/widget/Lanes;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/lucasr/twowayview/widget/Lanes;->reset(I)V

    .line 138
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_d
    if-gt v9, p1, :cond_8d

    .line 139
    invoke-virtual {p0, v9}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v8

    check-cast v8, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;

    .line 141
    .local v8, "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    if-eqz v8, :cond_5d

    .line 142
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v3, v8, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->startLane:I

    iget v4, v8, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->anchorLane:I

    invoke-virtual {v1, v3, v4}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->set(II)V

    .line 146
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v1}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->isUndefined()Z

    move-result v1

    if-eqz v1, :cond_38

    .line 147
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {p0, v9}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getLaneSpanForPosition(I)I

    move-result v3

    sget-object v4, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {v0, v1, v3, v4}, Lorg/lucasr/twowayview/widget/Lanes;->findLane(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 148
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v8, v1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->setLane(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;)V

    .line 151
    :cond_38
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    # getter for: Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->width:I
    invoke-static {v8}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->access$100(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;)I

    move-result v2

    # getter for: Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->height:I
    invoke-static {v8}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->access$200(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;)I

    move-result v3

    iget-object v4, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    sget-object v5, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual/range {v0 .. v5}, Lorg/lucasr/twowayview/widget/Lanes;->getChildFrame(Landroid/graphics/Rect;IILorg/lucasr/twowayview/widget/Lanes$LaneInfo;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    move-object v2, v8

    .line 174
    .end local v8    # "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    .local v2, "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    :goto_4a
    if-eq v9, p1, :cond_5a

    .line 175
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    iget v4, v2, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->startLane:I

    # getter for: Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->span:I
    invoke-static {v2}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->access$000(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;)I

    move-result v5

    sget-object v6, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->pushChildFrame(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;Landroid/graphics/Rect;IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 138
    :cond_5a
    add-int/lit8 v9, v9, 0x1

    goto :goto_d

    .line 154
    .end local v2    # "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    .restart local v8    # "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    :cond_5d
    invoke-virtual {p3, v9}, Landroid/support/v7/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object v7

    .line 161
    .local v7, "child":Landroid/view/View;
    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {p0, v7, v1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->measureChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 165
    invoke-virtual {p0, v9}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v8

    .end local v8    # "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    check-cast v8, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;

    .line 167
    .restart local v8    # "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v3, v8, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->startLane:I

    iget v4, v8, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;->anchorLane:I

    invoke-virtual {v1, v3, v4}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->set(II)V

    .line 168
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v7}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    move-result v2

    .line 169
    invoke-virtual {p0, v7}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    sget-object v5, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .line 168
    invoke-virtual/range {v0 .. v5}, Lorg/lucasr/twowayview/widget/Lanes;->getChildFrame(Landroid/graphics/Rect;IILorg/lucasr/twowayview/widget/Lanes$LaneInfo;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 171
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v8, v1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->cacheItemFrame(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;Landroid/graphics/Rect;)V

    move-object v2, v8

    .end local v8    # "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    .restart local v2    # "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    goto :goto_4a

    .line 179
    .end local v2    # "entry":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$StaggeredItemEntry;
    .end local v7    # "child":Landroid/view/View;
    :cond_8d
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v1, v1, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    iget-object v3, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v3}, Lorg/lucasr/twowayview/widget/Lanes;->getLane(ILandroid/graphics/Rect;)V

    .line 180
    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {v0, v1}, Lorg/lucasr/twowayview/widget/Lanes;->reset(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 181
    if-eqz v10, :cond_a7

    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    :goto_a1
    sub-int v1, p2, v1

    invoke-virtual {v0, v1}, Lorg/lucasr/twowayview/widget/Lanes;->offset(I)V

    .line 182
    return-void

    .line 181
    :cond_a7
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    goto :goto_a1
.end method
