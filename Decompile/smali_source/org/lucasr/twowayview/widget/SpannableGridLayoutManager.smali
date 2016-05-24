.class public Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;
.super Lorg/lucasr/twowayview/widget/GridLayoutManager;
.source "SpannableGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;,
        Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    }
.end annotation


# instance fields
.field private mMeasuring:Z


# direct methods
.method private getChildHeight(I)I
    .registers 3
    .param p1, "rowSpan"    # I

    .prologue
    .line 101
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLanes()Lorg/lucasr/twowayview/widget/Lanes;

    move-result-object v0

    invoke-virtual {v0}, Lorg/lucasr/twowayview/widget/Lanes;->getLaneSize()I

    move-result v0

    mul-int/2addr v0, p1

    return v0
.end method

.method private getChildWidth(I)I
    .registers 3
    .param p1, "colSpan"    # I

    .prologue
    .line 97
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLanes()Lorg/lucasr/twowayview/widget/Lanes;

    move-result-object v0

    invoke-virtual {v0}, Lorg/lucasr/twowayview/widget/Lanes;->getLaneSize()I

    move-result v0

    mul-int/2addr v0, p1

    return v0
.end method

.method private getHeightUsed(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 162
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    .line 163
    .local v0, "lp":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    iget v2, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    invoke-direct {p0, v2}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getChildHeight(I)I

    move-result v2

    sub-int/2addr v1, v2

    return v1
.end method

.method private static getLaneSpan(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;Z)I
    .registers 3
    .param p0, "lp"    # Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    .param p1, "isVertical"    # Z

    .prologue
    .line 105
    if-eqz p1, :cond_5

    iget v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    :goto_4
    return v0

    :cond_5
    iget v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    goto :goto_4
.end method

.method private static getLaneSpan(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;Z)I
    .registers 3
    .param p0, "entry"    # Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    .param p1, "isVertical"    # Z

    .prologue
    .line 109
    if-eqz p1, :cond_7

    # getter for: Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->colSpan:I
    invoke-static {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->access$000(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;)I

    move-result v0

    :goto_6
    return v0

    :cond_7
    # getter for: Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->rowSpan:I
    invoke-static {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->access$100(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;)I

    move-result v0

    goto :goto_6
.end method

.method private getWidthUsed(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 157
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    .line 158
    .local v0, "lp":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    iget v2, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    invoke-direct {p0, v2}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getChildWidth(I)I

    move-result v2

    sub-int/2addr v1, v2

    return v1
.end method


# virtual methods
.method cacheChildLaneAndSpan(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .registers 10
    .param p1, "child"    # Landroid/view/View;
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    .line 216
    .local v2, "position":I
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v3}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->setUndefined()V

    .line 218
    invoke-virtual {p0, v2}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;

    .line 219
    .local v0, "entry":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    if-eqz v0, :cond_1a

    .line 220
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v4, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->startLane:I

    iget v5, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->anchorLane:I

    invoke-virtual {v3, v4, v5}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->set(II)V

    .line 223
    :cond_1a
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v3}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->isUndefined()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 224
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {p0, v3, p1, p2}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLaneForChild(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 227
    :cond_27
    if-nez v0, :cond_44

    .line 228
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    .line 229
    .local v1, "lp":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    new-instance v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;

    .end local v0    # "entry":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v3, v3, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    iget-object v4, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v4, v4, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->anchorLane:I

    iget v5, v1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    iget v6, v1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    invoke-direct {v0, v3, v4, v5, v6}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;-><init>(IIII)V

    .line 231
    .restart local v0    # "entry":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    invoke-virtual {p0, v2, v0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->setItemEntryForPosition(ILorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;)V

    .line 236
    .end local v1    # "lp":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    :goto_43
    return-object v0

    .line 233
    :cond_44
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v0, v3}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->setLane(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;)V

    goto :goto_43
.end method

.method public canScrollHorizontally()Z
    .registers 2

    .prologue
    .line 114
    invoke-super {p0}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mMeasuring:Z

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public canScrollVertically()Z
    .registers 2

    .prologue
    .line 119
    invoke-super {p0}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->canScrollVertically()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mMeasuring:Z

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public checkLayoutParams(Landroid/support/v7/widget/RecyclerView$LayoutParams;)Z
    .registers 7
    .param p1, "lp"    # Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .prologue
    const/4 v4, -0x1

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 241
    iget v3, p1, Landroid/support/v7/widget/RecyclerView$LayoutParams;->width:I

    if-ne v3, v4, :cond_b

    iget v3, p1, Landroid/support/v7/widget/RecyclerView$LayoutParams;->height:I

    if-eq v3, v4, :cond_d

    :cond_b
    move v1, v2

    .line 258
    :cond_c
    :goto_c
    return v1

    .line 246
    :cond_d
    instance-of v3, p1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    if-eqz v3, :cond_3e

    move-object v0, p1

    .line 247
    check-cast v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    .line 249
    .local v0, "spannableLp":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->isVertical()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 250
    iget v3, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    if-lt v3, v1, :cond_2a

    iget v3, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    if-lt v3, v1, :cond_2a

    iget v3, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    .line 251
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLaneCount()I

    move-result v4

    if-le v3, v4, :cond_c

    :cond_2a
    move v1, v2

    goto :goto_c

    .line 253
    :cond_2c
    iget v3, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    if-lt v3, v1, :cond_3c

    iget v3, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    if-lt v3, v1, :cond_3c

    iget v3, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    .line 254
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLaneCount()I

    move-result v4

    if-le v3, v4, :cond_c

    :cond_3c
    move v1, v2

    goto :goto_c

    .end local v0    # "spannableLp":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    :cond_3e
    move v1, v2

    .line 258
    goto :goto_c
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 2

    .prologue
    .line 35
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->generateDefaultLayoutParams()Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateDefaultLayoutParams()Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 263
    new-instance v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    invoke-direct {v0, v1, v1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 3

    .prologue
    .line 35
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    .registers 4
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 288
    new-instance v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1, p2}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    .registers 7
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v3, -0x1

    const/4 v4, 0x1

    .line 268
    new-instance v1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    move-object v2, p1

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v1, v2}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 269
    .local v1, "spannableLp":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    iput v3, v1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->width:I

    .line 270
    iput v3, v1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->height:I

    .line 272
    instance-of v2, p1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    if-eqz v2, :cond_33

    move-object v0, p1

    .line 273
    check-cast v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    .line 274
    .local v0, "other":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->isVertical()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 275
    iget v2, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLaneCount()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    .line 276
    iget v2, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    .line 283
    .end local v0    # "other":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    :cond_33
    :goto_33
    return-object v1

    .line 278
    .restart local v0    # "other":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    :cond_34
    iget v2, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    .line 279
    iget v2, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLaneCount()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    goto :goto_33
.end method

.method getLaneForChild(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 6
    .param p1, "outInfo"    # Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 150
    invoke-super {p0, p1, p2, p3}, Lorg/lucasr/twowayview/widget/GridLayoutManager;->getLaneForChild(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 151
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->isUndefined()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 152
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLanes()Lorg/lucasr/twowayview/widget/Lanes;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLaneSpanForChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, p1, v1, p3}, Lorg/lucasr/twowayview/widget/Lanes;->findLane(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 154
    :cond_14
    return-void
.end method

.method getLaneForPosition(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 7
    .param p1, "outInfo"    # Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;
    .param p2, "position"    # I
    .param p3, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 139
    invoke-virtual {p0, p2}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;

    .line 140
    .local v0, "entry":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    if-eqz v0, :cond_10

    .line 141
    iget v1, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->startLane:I

    iget v2, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->anchorLane:I

    invoke-virtual {p1, v1, v2}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->set(II)V

    .line 146
    :goto_f
    return-void

    .line 145
    :cond_10
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->setUndefined()V

    goto :goto_f
.end method

.method getLaneSpanForChild(Landroid/view/View;)I
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 124
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->isVertical()Z

    move-result v1

    invoke-static {v0, v1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLaneSpan(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;Z)I

    move-result v0

    return v0
.end method

.method getLaneSpanForPosition(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 129
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;

    .line 130
    .local v0, "entry":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    if-nez v0, :cond_21

    .line 131
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

    .line 134
    :cond_21
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->isVertical()Z

    move-result v1

    invoke-static {v0, v1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLaneSpan(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;Z)I

    move-result v1

    return v1
.end method

.method measureChildWithMargins(Landroid/view/View;)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 170
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mMeasuring:Z

    .line 171
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getWidthUsed(Landroid/view/View;)I

    move-result v0

    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getHeightUsed(Landroid/view/View;)I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->measureChildWithMargins(Landroid/view/View;II)V

    .line 172
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mMeasuring:Z

    .line 173
    return-void
.end method

.method protected moveLayoutToPosition(IILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 16
    .param p1, "position"    # I
    .param p2, "offset"    # I
    .param p3, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 177
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->isVertical()Z

    move-result v10

    .line 178
    .local v10, "isVertical":Z
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLanes()Lorg/lucasr/twowayview/widget/Lanes;

    move-result-object v0

    .line 180
    .local v0, "lanes":Lorg/lucasr/twowayview/widget/Lanes;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/lucasr/twowayview/widget/Lanes;->reset(I)V

    .line 182
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_d
    if-gt v9, p1, :cond_71

    .line 183
    invoke-virtual {p0, v9}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v8

    check-cast v8, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;

    .line 184
    .local v8, "entry":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    if-nez v8, :cond_23

    .line 185
    invoke-virtual {p3, v9}, Landroid/support/v7/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object v7

    .line 186
    .local v7, "child":Landroid/view/View;
    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {p0, v7, v1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->cacheChildLaneAndSpan(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v8

    .end local v8    # "entry":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    check-cast v8, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;

    .line 189
    .end local v7    # "child":Landroid/view/View;
    .restart local v8    # "entry":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    :cond_23
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v2, v8, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->startLane:I

    iget v3, v8, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->anchorLane:I

    invoke-virtual {v1, v2, v3}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->set(II)V

    .line 193
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v1}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->isUndefined()Z

    move-result v1

    if-eqz v1, :cond_44

    .line 194
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {p0, v9}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLaneSpanForPosition(I)I

    move-result v2

    sget-object v3, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {v0, v1, v2, v3}, Lorg/lucasr/twowayview/widget/Lanes;->findLane(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 195
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v8, v1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->setLane(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;)V

    .line 198
    :cond_44
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    # getter for: Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->colSpan:I
    invoke-static {v8}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->access$000(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;)I

    move-result v2

    invoke-direct {p0, v2}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getChildWidth(I)I

    move-result v2

    .line 199
    # getter for: Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->rowSpan:I
    invoke-static {v8}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->access$100(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;)I

    move-result v3

    invoke-direct {p0, v3}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getChildHeight(I)I

    move-result v3

    iget-object v4, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    sget-object v5, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .line 198
    invoke-virtual/range {v0 .. v5}, Lorg/lucasr/twowayview/widget/Lanes;->getChildFrame(Landroid/graphics/Rect;IILorg/lucasr/twowayview/widget/Lanes$LaneInfo;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 201
    if-eq v9, p1, :cond_6e

    .line 202
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    iget v4, v8, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->startLane:I

    invoke-static {v8, v10}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->getLaneSpan(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;Z)I

    move-result v5

    sget-object v6, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    move-object v1, p0

    move-object v2, v8

    invoke-virtual/range {v1 .. v6}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->pushChildFrame(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;Landroid/graphics/Rect;IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 182
    :cond_6e
    add-int/lit8 v9, v9, 0x1

    goto :goto_d

    .line 207
    .end local v8    # "entry":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
    :cond_71
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v1, v1, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    iget-object v2, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v2}, Lorg/lucasr/twowayview/widget/Lanes;->getLane(ILandroid/graphics/Rect;)V

    .line 208
    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {v0, v1}, Lorg/lucasr/twowayview/widget/Lanes;->reset(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 209
    if-eqz v10, :cond_8b

    iget-object v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    :goto_85
    sub-int v1, p2, v1

    invoke-virtual {v0, v1}, Lorg/lucasr/twowayview/widget/Lanes;->offset(I)V

    .line 210
    return-void

    .line 209
    :cond_8b
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    goto :goto_85
.end method
