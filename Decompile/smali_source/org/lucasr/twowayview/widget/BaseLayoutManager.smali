.class public abstract Lorg/lucasr/twowayview/widget/BaseLayoutManager;
.super Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;
.source "BaseLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/lucasr/twowayview/widget/BaseLayoutManager$1;,
        Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;,
        Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;,
        Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    }
.end annotation


# instance fields
.field protected final mChildFrame:Landroid/graphics/Rect;

.field private mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

.field private mItemEntriesToRestore:Lorg/lucasr/twowayview/widget/ItemEntries;

.field private mLanes:Lorg/lucasr/twowayview/widget/Lanes;

.field private mLanesToRestore:Lorg/lucasr/twowayview/widget/Lanes;

.field protected final mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

.field protected final mTempRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)V
    .registers 3
    .param p1, "orientation"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    .prologue
    .line 154
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;-><init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)V

    .line 141
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mChildFrame:Landroid/graphics/Rect;

    .line 142
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mTempRect:Landroid/graphics/Rect;

    .line 143
    new-instance v0, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-direct {v0}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;-><init>()V

    iput-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    .line 155
    return-void
.end method

.method private canUseLanes(Lorg/lucasr/twowayview/widget/Lanes;)Z
    .registers 7
    .param p1, "lanes"    # Lorg/lucasr/twowayview/widget/Lanes;

    .prologue
    const/4 v2, 0x0

    .line 253
    if-nez p1, :cond_4

    .line 262
    :cond_3
    :goto_3
    return v2

    .line 257
    :cond_4
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLaneCount()I

    move-result v0

    .line 258
    .local v0, "laneCount":I
    invoke-static {p0, v0}, Lorg/lucasr/twowayview/widget/Lanes;->calculateLaneSize(Lorg/lucasr/twowayview/widget/BaseLayoutManager;I)I

    move-result v1

    .line 260
    .local v1, "laneSize":I
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/Lanes;->getOrientation()Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    move-result-object v3

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getOrientation()Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    move-result-object v4

    if-ne v3, v4, :cond_3

    .line 261
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/Lanes;->getCount()I

    move-result v3

    if-ne v3, v0, :cond_3

    .line 262
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/Lanes;->getLaneSize()I

    move-result v3

    if-ne v3, v1, :cond_3

    const/4 v2, 0x1

    goto :goto_3
.end method

.method private ensureLayoutState()Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 266
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLaneCount()I

    move-result v0

    .line 267
    .local v0, "laneCount":I
    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getWidth()I

    move-result v3

    if-eqz v3, :cond_1b

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getHeight()I

    move-result v3

    if-eqz v3, :cond_1b

    iget-object v3, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-direct {p0, v3}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->canUseLanes(Lorg/lucasr/twowayview/widget/Lanes;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 287
    :cond_1b
    :goto_1b
    return v2

    .line 271
    :cond_1c
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    .line 272
    .local v1, "oldLanes":Lorg/lucasr/twowayview/widget/Lanes;
    new-instance v3, Lorg/lucasr/twowayview/widget/Lanes;

    invoke-direct {v3, p0, v0}, Lorg/lucasr/twowayview/widget/Lanes;-><init>(Lorg/lucasr/twowayview/widget/BaseLayoutManager;I)V

    iput-object v3, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    .line 274
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->requestMoveLayout()V

    .line 276
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    if-nez v3, :cond_33

    .line 277
    new-instance v3, Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-direct {v3}, Lorg/lucasr/twowayview/widget/ItemEntries;-><init>()V

    iput-object v3, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    .line 280
    :cond_33
    if-eqz v1, :cond_52

    invoke-virtual {v1}, Lorg/lucasr/twowayview/widget/Lanes;->getOrientation()Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    move-result-object v3

    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v4}, Lorg/lucasr/twowayview/widget/Lanes;->getOrientation()Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    move-result-object v4

    if-ne v3, v4, :cond_52

    .line 281
    invoke-virtual {v1}, Lorg/lucasr/twowayview/widget/Lanes;->getLaneSize()I

    move-result v3

    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v4}, Lorg/lucasr/twowayview/widget/Lanes;->getLaneSize()I

    move-result v4

    if-ne v3, v4, :cond_52

    .line 282
    invoke-virtual {p0, v2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->invalidateItemLanesAfter(I)V

    .line 287
    :goto_50
    const/4 v2, 0x1

    goto :goto_1b

    .line 284
    :cond_52
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v2}, Lorg/lucasr/twowayview/widget/ItemEntries;->clear()V

    goto :goto_50
.end method

.method private getHeightUsed(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 464
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->isVertical()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 465
    const/4 v1, 0x0

    .line 469
    :goto_7
    return v1

    .line 468
    :cond_8
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLanes()Lorg/lucasr/twowayview/widget/Lanes;

    move-result-object v1

    invoke-virtual {v1}, Lorg/lucasr/twowayview/widget/Lanes;->getLaneSize()I

    move-result v1

    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLaneSpanForChild(Landroid/view/View;)I

    move-result v2

    mul-int v0, v1, v2

    .line 469
    .local v0, "size":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    sub-int/2addr v1, v0

    goto :goto_7
.end method

.method private getWidthUsed(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 455
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->isVertical()Z

    move-result v1

    if-nez v1, :cond_8

    .line 456
    const/4 v1, 0x0

    .line 460
    :goto_7
    return v1

    .line 459
    :cond_8
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLanes()Lorg/lucasr/twowayview/widget/Lanes;

    move-result-object v1

    invoke-virtual {v1}, Lorg/lucasr/twowayview/widget/Lanes;->getLaneSize()I

    move-result v1

    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLaneSpanForChild(Landroid/view/View;)I

    move-result v2

    mul-int v0, v1, v2

    .line 460
    .local v0, "size":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    sub-int/2addr v1, v0

    goto :goto_7
.end method

.method private handleUpdate(IILorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;)V
    .registers 7
    .param p1, "positionStart"    # I
    .param p2, "itemCountOrToPosition"    # I
    .param p3, "cmd"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    .prologue
    const/4 v2, 0x1

    .line 291
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->invalidateItemLanesAfter(I)V

    .line 293
    sget-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$1;->$SwitchMap$org$lucasr$twowayview$widget$BaseLayoutManager$UpdateOp:[I

    invoke-virtual {p3}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_32

    .line 310
    :goto_f
    add-int v0, p1, p2

    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getFirstVisiblePosition()I

    move-result v1

    if-gt v0, v1, :cond_27

    .line 317
    :cond_17
    :goto_17
    return-void

    .line 295
    :pswitch_18
    invoke-virtual {p0, p1, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->offsetForAddition(II)V

    goto :goto_f

    .line 299
    :pswitch_1c
    invoke-virtual {p0, p1, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->offsetForRemoval(II)V

    goto :goto_f

    .line 303
    :pswitch_20
    invoke-virtual {p0, p1, v2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->offsetForRemoval(II)V

    .line 304
    invoke-virtual {p0, p2, v2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->offsetForAddition(II)V

    goto :goto_f

    .line 314
    :cond_27
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLastVisiblePosition()I

    move-result v0

    if-gt p1, v0, :cond_17

    .line 315
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->requestLayout()V

    goto :goto_17

    .line 293
    nop

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_18
        :pswitch_1c
        :pswitch_20
    .end packed-switch
.end method

.method private popChildFrame(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;Landroid/graphics/Rect;IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 9
    .param p1, "entry"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .param p2, "childFrame"    # Landroid/graphics/Rect;
    .param p3, "lane"    # I
    .param p4, "laneSpan"    # I
    .param p5, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 179
    move v0, p3

    .local v0, "i":I
    :goto_1
    add-int v2, p3, p4

    if-ge v0, v2, :cond_1b

    .line 181
    if-eqz p1, :cond_19

    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-eq p5, v2, :cond_19

    .line 182
    sub-int v2, v0, p3

    # invokes: Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->getSpanMargin(I)I
    invoke-static {p1, v2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->access$100(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;I)I

    move-result v1

    .line 187
    .local v1, "spanMargin":I
    :goto_11
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v2, p2, v0, v1, p5}, Lorg/lucasr/twowayview/widget/Lanes;->popChildFrame(Landroid/graphics/Rect;IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 179
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 184
    .end local v1    # "spanMargin":I
    :cond_19
    const/4 v1, 0x0

    .restart local v1    # "spanMargin":I
    goto :goto_11

    .line 189
    .end local v1    # "spanMargin":I
    :cond_1b
    return-void
.end method

.method private requestMoveLayout()V
    .registers 6

    .prologue
    .line 241
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPendingScrollPosition()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_8

    .line 250
    :goto_7
    return-void

    .line 245
    :cond_8
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getFirstVisiblePosition()I

    move-result v2

    .line 246
    .local v2, "position":I
    invoke-virtual {p0, v2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 247
    .local v0, "firstChild":Landroid/view/View;
    if-eqz v0, :cond_1a

    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getChildStart(Landroid/view/View;)I

    move-result v1

    .line 249
    .local v1, "offset":I
    :goto_16
    invoke-virtual {p0, v2, v1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->setPendingScrollPositionWithOffset(II)V

    goto :goto_7

    .line 247
    .end local v1    # "offset":I
    :cond_1a
    const/4 v1, 0x0

    goto :goto_16
.end method


# virtual methods
.method cacheChildFrame(Landroid/view/View;Landroid/graphics/Rect;)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .registers 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "childFrame"    # Landroid/graphics/Rect;

    .prologue
    .line 529
    const/4 v0, 0x0

    return-object v0
.end method

.method cacheChildLaneAndSpan(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .registers 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 524
    const/4 v0, 0x0

    return-object v0
.end method

.method protected canAddMoreViews(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;I)Z
    .registers 6
    .param p1, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    .param p2, "limit"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 447
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p1, v2, :cond_11

    .line 448
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v2}, Lorg/lucasr/twowayview/widget/Lanes;->getInnerStart()I

    move-result v2

    if-le v2, p2, :cond_f

    .line 450
    :cond_e
    :goto_e
    return v0

    :cond_f
    move v0, v1

    .line 448
    goto :goto_e

    .line 450
    :cond_11
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v2}, Lorg/lucasr/twowayview/widget/Lanes;->getInnerEnd()I

    move-result v2

    if-lt v2, p2, :cond_e

    move v0, v1

    goto :goto_e
.end method

.method public checkLayoutParams(Landroid/support/v7/widget/RecyclerView$LayoutParams;)Z
    .registers 6
    .param p1, "lp"    # Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v3, -0x1

    .line 534
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->isVertical()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 535
    iget v2, p1, Landroid/support/v7/widget/RecyclerView$LayoutParams;->width:I

    if-ne v2, v3, :cond_e

    .line 537
    :cond_d
    :goto_d
    return v0

    :cond_e
    move v0, v1

    .line 535
    goto :goto_d

    .line 537
    :cond_10
    iget v2, p1, Landroid/support/v7/widget/RecyclerView$LayoutParams;->height:I

    if-eq v2, v3, :cond_d

    move v0, v1

    goto :goto_d
.end method

.method clearItemEntries()V
    .registers 2

    .prologue
    .line 217
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    if-eqz v0, :cond_9

    .line 218
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v0}, Lorg/lucasr/twowayview/widget/ItemEntries;->clear()V

    .line 220
    :cond_9
    return-void
.end method

.method protected detachChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 10
    .param p1, "child"    # Landroid/view/View;
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 502
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v6

    .line 503
    .local v6, "position":I
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {p0, v0, v6, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLaneForPosition(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 504
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mChildFrame:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getDecoratedChildFrame(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 506
    invoke-virtual {p0, v6}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v1

    iget-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mChildFrame:Landroid/graphics/Rect;

    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v3, v0, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    .line 507
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLaneSpanForChild(Landroid/view/View;)I

    move-result v4

    move-object v0, p0

    move-object v5, p2

    .line 506
    invoke-direct/range {v0 .. v5}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->popChildFrame(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;Landroid/graphics/Rect;IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 508
    return-void
.end method

.method public generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4

    .prologue
    const/4 v2, -0x1

    const/4 v1, -0x2

    .line 543
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->isVertical()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 544
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-direct {v0, v2, v1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    .line 546
    :goto_d
    return-object v0

    :cond_e
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    goto :goto_d
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 566
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 5
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v2, -0x1

    .line 552
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 553
    .local v0, "lanedLp":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->isVertical()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 554
    iput v2, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->width:I

    .line 555
    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->height:I

    .line 561
    :goto_15
    return-object v0

    .line 557
    :cond_16
    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->width:I

    .line 558
    iput v2, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->height:I

    goto :goto_15
.end method

.method getDecoratedChildFrame(Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "childFrame"    # Landroid/graphics/Rect;

    .prologue
    .line 192
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v0

    iput v0, p2, Landroid/graphics/Rect;->left:I

    .line 193
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v0

    iput v0, p2, Landroid/graphics/Rect;->top:I

    .line 194
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getDecoratedRight(Landroid/view/View;)I

    move-result v0

    iput v0, p2, Landroid/graphics/Rect;->right:I

    .line 195
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v0

    iput v0, p2, Landroid/graphics/Rect;->bottom:I

    .line 196
    return-void
.end method

.method getItemEntryForPosition(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 213
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v0, p1}, Lorg/lucasr/twowayview/widget/ItemEntries;->getItemEntry(I)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method abstract getLaneCount()I
.end method

.method getLaneForChild(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 5
    .param p1, "outInfo"    # Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 511
    invoke-virtual {p0, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, p1, v0, p3}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLaneForPosition(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 512
    return-void
.end method

.method abstract getLaneForPosition(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
.end method

.method getLaneSpanForChild(Landroid/view/View;)I
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 515
    const/4 v0, 0x1

    return v0
.end method

.method getLaneSpanForPosition(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 519
    const/4 v0, 0x1

    return v0
.end method

.method getLanes()Lorg/lucasr/twowayview/widget/Lanes;
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    return-object v0
.end method

.method invalidateItemLanesAfter(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 223
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    if-eqz v0, :cond_9

    .line 224
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v0, p1}, Lorg/lucasr/twowayview/widget/ItemEntries;->invalidateItemLanesAfter(I)V

    .line 226
    :cond_9
    return-void
.end method

.method isVertical()Z
    .registers 3

    .prologue
    .line 199
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getOrientation()Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    move-result-object v0

    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected layoutChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 11
    .param p1, "child"    # Landroid/view/View;
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 484
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {p0, v0, p1, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLaneForChild(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 486
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    iget-object v1, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mChildFrame:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    move-result v2

    .line 487
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    move-object v5, p2

    .line 486
    invoke-virtual/range {v0 .. v5}, Lorg/lucasr/twowayview/widget/Lanes;->getChildFrame(Landroid/graphics/Rect;IILorg/lucasr/twowayview/widget/Lanes$LaneInfo;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 488
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mChildFrame:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->cacheChildFrame(Landroid/view/View;Landroid/graphics/Rect;)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    move-result-object v6

    .line 490
    .local v6, "entry":Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mChildFrame:Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mChildFrame:Landroid/graphics/Rect;

    iget v3, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mChildFrame:Landroid/graphics/Rect;

    iget v4, v0, Landroid/graphics/Rect;->right:I

    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mChildFrame:Landroid/graphics/Rect;

    iget v5, v0, Landroid/graphics/Rect;->bottom:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 493
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 494
    .local v7, "lp":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    invoke-virtual {v7}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v0

    if-nez v0, :cond_4e

    .line 495
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mChildFrame:Landroid/graphics/Rect;

    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    iget v3, v0, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    .line 496
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getLaneSpanForChild(Landroid/view/View;)I

    move-result v4

    move-object v0, p0

    move-object v1, v6

    move-object v5, p2

    .line 495
    invoke-virtual/range {v0 .. v5}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->pushChildFrame(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;Landroid/graphics/Rect;IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 498
    :cond_4e
    return-void
.end method

.method protected measureChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 3
    .param p1, "child"    # Landroid/view/View;
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 478
    invoke-virtual {p0, p1, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->cacheChildLaneAndSpan(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    .line 479
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->measureChildWithMargins(Landroid/view/View;)V

    .line 480
    return-void
.end method

.method measureChildWithMargins(Landroid/view/View;)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 473
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getWidthUsed(Landroid/view/View;)I

    move-result v0

    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getHeightUsed(Landroid/view/View;)I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->measureChildWithMargins(Landroid/view/View;II)V

    .line 474
    return-void
.end method

.method abstract moveLayoutToPosition(IILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
.end method

.method public offsetChildrenHorizontal(I)V
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 321
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->isVertical()Z

    move-result v0

    if-nez v0, :cond_b

    .line 322
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v0, p1}, Lorg/lucasr/twowayview/widget/Lanes;->offset(I)V

    .line 325
    :cond_b
    invoke-super {p0, p1}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->offsetChildrenHorizontal(I)V

    .line 326
    return-void
.end method

.method public offsetChildrenVertical(I)V
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 330
    invoke-super {p0, p1}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->offsetChildrenVertical(I)V

    .line 332
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->isVertical()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 333
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v0, p1}, Lorg/lucasr/twowayview/widget/Lanes;->offset(I)V

    .line 335
    :cond_e
    return-void
.end method

.method offsetForAddition(II)V
    .registers 4
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 229
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    if-eqz v0, :cond_9

    .line 230
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v0, p1, p2}, Lorg/lucasr/twowayview/widget/ItemEntries;->offsetForAddition(II)V

    .line 232
    :cond_9
    return-void
.end method

.method offsetForRemoval(II)V
    .registers 4
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 235
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    if-eqz v0, :cond_9

    .line 236
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v0, p1, p2}, Lorg/lucasr/twowayview/widget/ItemEntries;->offsetForRemoval(II)V

    .line 238
    :cond_9
    return-void
.end method

.method public onItemsAdded(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 385
    sget-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->ADD:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    invoke-direct {p0, p2, p3, v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->handleUpdate(IILorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;)V

    .line 386
    invoke-super {p0, p1, p2, p3}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->onItemsAdded(Landroid/support/v7/widget/RecyclerView;II)V

    .line 387
    return-void
.end method

.method public onItemsChanged(Landroid/support/v7/widget/RecyclerView;)V
    .registers 2
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 409
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->clearItemEntries()V

    .line 410
    invoke-super {p0, p1}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->onItemsChanged(Landroid/support/v7/widget/RecyclerView;)V

    .line 411
    return-void
.end method

.method public onItemsMoved(Landroid/support/v7/widget/RecyclerView;III)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .param p4, "itemCount"    # I

    .prologue
    .line 403
    sget-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->MOVE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    invoke-direct {p0, p2, p3, v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->handleUpdate(IILorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;)V

    .line 404
    invoke-super {p0, p1, p2, p3, p4}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->onItemsMoved(Landroid/support/v7/widget/RecyclerView;III)V

    .line 405
    return-void
.end method

.method public onItemsRemoved(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 391
    sget-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->REMOVE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    invoke-direct {p0, p2, p3, v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->handleUpdate(IILorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;)V

    .line 392
    invoke-super {p0, p1, p2, p3}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->onItemsRemoved(Landroid/support/v7/widget/RecyclerView;II)V

    .line 393
    return-void
.end method

.method public onItemsUpdated(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 397
    sget-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->UPDATE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    invoke-direct {p0, p2, p3, v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->handleUpdate(IILorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;)V

    .line 398
    invoke-super {p0, p1, p2, p3}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->onItemsUpdated(Landroid/support/v7/widget/RecyclerView;II)V

    .line 399
    return-void
.end method

.method public onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 9
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v5, 0x0

    .line 339
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanesToRestore:Lorg/lucasr/twowayview/widget/Lanes;

    if-eqz v4, :cond_1d

    const/4 v3, 0x1

    .line 340
    .local v3, "restoringLanes":Z
    :goto_6
    if-eqz v3, :cond_14

    .line 341
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanesToRestore:Lorg/lucasr/twowayview/widget/Lanes;

    iput-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    .line 342
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntriesToRestore:Lorg/lucasr/twowayview/widget/ItemEntries;

    iput-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    .line 344
    iput-object v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanesToRestore:Lorg/lucasr/twowayview/widget/Lanes;

    .line 345
    iput-object v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntriesToRestore:Lorg/lucasr/twowayview/widget/ItemEntries;

    .line 348
    :cond_14
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->ensureLayoutState()Z

    move-result v2

    .line 352
    .local v2, "refreshingLanes":Z
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    if-nez v4, :cond_1f

    .line 374
    :goto_1c
    return-void

    .line 339
    .end local v2    # "refreshingLanes":Z
    .end local v3    # "restoringLanes":Z
    :cond_1d
    const/4 v3, 0x0

    goto :goto_6

    .line 356
    .restart local v2    # "refreshingLanes":Z
    .restart local v3    # "restoringLanes":Z
    :cond_1f
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    .line 358
    .local v1, "itemCount":I
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    if-eqz v4, :cond_2c

    .line 359
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v4, v1}, Lorg/lucasr/twowayview/widget/ItemEntries;->setAdapterSize(I)V

    .line 363
    :cond_2c
    invoke-virtual {p0, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->ensureLayoutStateDueToChildContentChange(Landroid/support/v7/widget/RecyclerView$State;)V

    .line 364
    invoke-virtual {p0, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getAnchorItemPosition(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    .line 367
    .local v0, "anchorItemPosition":I
    if-lez v0, :cond_40

    if-nez v2, :cond_39

    if-nez v3, :cond_40

    .line 368
    :cond_39
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPendingScrollOffset()I

    move-result v4

    invoke-virtual {p0, v0, v4, p1, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->moveLayoutToPosition(IILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 371
    :cond_40
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    sget-object v5, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {v4, v5}, Lorg/lucasr/twowayview/widget/Lanes;->reset(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 373
    invoke-super {p0, p1, p2}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    goto :goto_1c
.end method

.method protected onLayoutScrapList(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 4
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 378
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v0}, Lorg/lucasr/twowayview/widget/Lanes;->save()V

    .line 379
    invoke-super {p0, p1, p2}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->onLayoutScrapList(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 380
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v0}, Lorg/lucasr/twowayview/widget/Lanes;->restore()V

    .line 381
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 7
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 435
    move-object v0, p1

    check-cast v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;

    .line 437
    .local v0, "ss":Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;
    # getter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;
    invoke-static {v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$300(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)[Landroid/graphics/Rect;

    move-result-object v1

    if-eqz v1, :cond_28

    # getter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->laneSize:I
    invoke-static {v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$500(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)I

    move-result v1

    if-lez v1, :cond_28

    .line 438
    new-instance v1, Lorg/lucasr/twowayview/widget/Lanes;

    # getter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->orientation:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    invoke-static {v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$400(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    move-result-object v2

    # getter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;
    invoke-static {v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$300(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)[Landroid/graphics/Rect;

    move-result-object v3

    # getter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->laneSize:I
    invoke-static {v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$500(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)I

    move-result v4

    invoke-direct {v1, p0, v2, v3, v4}, Lorg/lucasr/twowayview/widget/Lanes;-><init>(Lorg/lucasr/twowayview/widget/BaseLayoutManager;Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;[Landroid/graphics/Rect;I)V

    iput-object v1, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanesToRestore:Lorg/lucasr/twowayview/widget/Lanes;

    .line 439
    # getter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->itemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;
    invoke-static {v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$600(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)Lorg/lucasr/twowayview/widget/ItemEntries;

    move-result-object v1

    iput-object v1, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntriesToRestore:Lorg/lucasr/twowayview/widget/ItemEntries;

    .line 442
    :cond_28
    invoke-virtual {v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 443
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 8

    .prologue
    const/4 v5, 0x0

    .line 415
    invoke-super {p0}, Lorg/lucasr/twowayview/widget/AdobeCSDKBaseLayoutManager;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v4

    .line 416
    .local v4, "superState":Landroid/os/Parcelable;
    new-instance v3, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;

    invoke-direct {v3, v4}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 418
    .local v3, "state":Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;
    iget-object v6, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    if-eqz v6, :cond_2f

    iget-object v6, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v6}, Lorg/lucasr/twowayview/widget/Lanes;->getCount()I

    move-result v1

    .line 419
    .local v1, "laneCount":I
    :goto_14
    new-array v6, v1, [Landroid/graphics/Rect;

    # setter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;
    invoke-static {v3, v6}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$302(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;[Landroid/graphics/Rect;)[Landroid/graphics/Rect;

    .line 420
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1a
    if-ge v0, v1, :cond_31

    .line 421
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 422
    .local v2, "laneRect":Landroid/graphics/Rect;
    iget-object v6, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v6, v0, v2}, Lorg/lucasr/twowayview/widget/Lanes;->getLane(ILandroid/graphics/Rect;)V

    .line 423
    # getter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->lanes:[Landroid/graphics/Rect;
    invoke-static {v3}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$300(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;)[Landroid/graphics/Rect;

    move-result-object v6

    aput-object v2, v6, v0

    .line 420
    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    .end local v0    # "i":I
    .end local v1    # "laneCount":I
    .end local v2    # "laneRect":Landroid/graphics/Rect;
    :cond_2f
    move v1, v5

    .line 418
    goto :goto_14

    .line 426
    .restart local v0    # "i":I
    .restart local v1    # "laneCount":I
    :cond_31
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getOrientation()Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    move-result-object v6

    # setter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->orientation:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    invoke-static {v3, v6}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$402(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    .line 427
    iget-object v6, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    if-eqz v6, :cond_42

    iget-object v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v5}, Lorg/lucasr/twowayview/widget/Lanes;->getLaneSize()I

    move-result v5

    :cond_42
    # setter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->laneSize:I
    invoke-static {v3, v5}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$502(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;I)I

    .line 428
    iget-object v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    # setter for: Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->itemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;
    invoke-static {v3, v5}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;->access$602(Lorg/lucasr/twowayview/widget/BaseLayoutManager$LanedSavedState;Lorg/lucasr/twowayview/widget/ItemEntries;)Lorg/lucasr/twowayview/widget/ItemEntries;

    .line 430
    return-object v3
.end method

.method protected pushChildFrame(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;Landroid/graphics/Rect;IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 12
    .param p1, "entry"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .param p2, "childFrame"    # Landroid/graphics/Rect;
    .param p3, "lane"    # I
    .param p4, "laneSpan"    # I
    .param p5, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    const/4 v4, 0x1

    .line 159
    sget-object v5, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p5, v5, :cond_31

    if-eqz p1, :cond_31

    .line 160
    # invokes: Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->hasSpanMargins()Z
    invoke-static {p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->access$000(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;)Z

    move-result v5

    if-nez v5, :cond_31

    move v2, v4

    .line 162
    .local v2, "shouldSetMargins":Z
    :goto_e
    move v0, p3

    .local v0, "i":I
    :goto_f
    add-int v5, p3, p4

    if-ge v0, v5, :cond_35

    .line 164
    if-eqz p1, :cond_33

    sget-object v5, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-eq p5, v5, :cond_33

    .line 165
    sub-int v5, v0, p3

    # invokes: Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->getSpanMargin(I)I
    invoke-static {p1, v5}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->access$100(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;I)I

    move-result v3

    .line 170
    .local v3, "spanMargin":I
    :goto_1f
    iget-object v5, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mLanes:Lorg/lucasr/twowayview/widget/Lanes;

    invoke-virtual {v5, p2, v0, v3, p5}, Lorg/lucasr/twowayview/widget/Lanes;->pushChildFrame(Landroid/graphics/Rect;IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)I

    move-result v1

    .line 171
    .local v1, "margin":I
    if-le p4, v4, :cond_2e

    if-eqz v2, :cond_2e

    .line 172
    sub-int v5, v0, p3

    # invokes: Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->setSpanMargin(III)V
    invoke-static {p1, v5, v1, p4}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->access$200(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;III)V

    .line 162
    :cond_2e
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 160
    .end local v0    # "i":I
    .end local v1    # "margin":I
    .end local v2    # "shouldSetMargins":Z
    .end local v3    # "spanMargin":I
    :cond_31
    const/4 v2, 0x0

    goto :goto_e

    .line 167
    .restart local v0    # "i":I
    .restart local v2    # "shouldSetMargins":Z
    :cond_33
    const/4 v3, 0x0

    .restart local v3    # "spanMargin":I
    goto :goto_1f

    .line 175
    .end local v3    # "spanMargin":I
    :cond_35
    return-void
.end method

.method setItemEntryForPosition(ILorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "entry"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    .prologue
    .line 207
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    if-eqz v0, :cond_9

    .line 208
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->mItemEntries:Lorg/lucasr/twowayview/widget/ItemEntries;

    invoke-virtual {v0, p1, p2}, Lorg/lucasr/twowayview/widget/ItemEntries;->putItemEntry(ILorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;)V

    .line 210
    :cond_9
    return-void
.end method
