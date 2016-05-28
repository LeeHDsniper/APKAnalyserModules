.class Lorg/lucasr/twowayview/widget/Lanes;
.super Ljava/lang/Object;
.source "Lanes.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;
    }
.end annotation


# instance fields
.field private mInnerEnd:Ljava/lang/Integer;

.field private mInnerStart:Ljava/lang/Integer;

.field private final mIsVertical:Z

.field private final mLaneSize:I

.field private final mLanes:[Landroid/graphics/Rect;

.field private final mLayout:Lorg/lucasr/twowayview/widget/BaseLayoutManager;

.field private final mSavedLanes:[Landroid/graphics/Rect;

.field private final mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

.field private final mTempRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lorg/lucasr/twowayview/widget/BaseLayoutManager;I)V
    .registers 14
    .param p1, "layout"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager;
    .param p2, "laneCount"    # I

    .prologue
    const/4 v9, 0x0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    iput-object v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mTempRect:Landroid/graphics/Rect;

    .line 34
    new-instance v8, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-direct {v8}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;-><init>()V

    iput-object v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    .line 71
    iput-object p1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLayout:Lorg/lucasr/twowayview/widget/BaseLayoutManager;

    .line 72
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->isVertical()Z

    move-result v8

    iput-boolean v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    .line 74
    new-array v8, p2, [Landroid/graphics/Rect;

    iput-object v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    .line 75
    new-array v8, p2, [Landroid/graphics/Rect;

    iput-object v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mSavedLanes:[Landroid/graphics/Rect;

    .line 76
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_23
    if-ge v1, p2, :cond_3a

    .line 77
    iget-object v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    aput-object v10, v8, v1

    .line 78
    iget-object v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mSavedLanes:[Landroid/graphics/Rect;

    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    aput-object v10, v8, v1

    .line 76
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    .line 81
    :cond_3a
    invoke-static {p1, p2}, Lorg/lucasr/twowayview/widget/Lanes;->calculateLaneSize(Lorg/lucasr/twowayview/widget/BaseLayoutManager;I)I

    move-result v8

    iput v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLaneSize:I

    .line 83
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPaddingLeft()I

    move-result v4

    .line 84
    .local v4, "paddingLeft":I
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPaddingTop()I

    move-result v5

    .line 86
    .local v5, "paddingTop":I
    const/4 v1, 0x0

    :goto_49
    if-ge v1, p2, :cond_7d

    .line 87
    iget v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLaneSize:I

    mul-int v3, v1, v8

    .line 89
    .local v3, "laneStart":I
    iget-boolean v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v8, :cond_74

    move v8, v3

    :goto_54
    add-int v2, v4, v8

    .line 90
    .local v2, "l":I
    iget-boolean v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v8, :cond_5b

    move v3, v9

    .end local v3    # "laneStart":I
    :cond_5b
    add-int v7, v5, v3

    .line 91
    .local v7, "t":I
    iget-boolean v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v8, :cond_76

    iget v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLaneSize:I

    add-int v6, v2, v8

    .line 92
    .local v6, "r":I
    :goto_65
    iget-boolean v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v8, :cond_78

    move v0, v7

    .line 94
    .local v0, "b":I
    :goto_6a
    iget-object v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v8, v8, v1

    invoke-virtual {v8, v2, v7, v6, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 86
    add-int/lit8 v1, v1, 0x1

    goto :goto_49

    .end local v0    # "b":I
    .end local v2    # "l":I
    .end local v6    # "r":I
    .end local v7    # "t":I
    .restart local v3    # "laneStart":I
    :cond_74
    move v8, v9

    .line 89
    goto :goto_54

    .end local v3    # "laneStart":I
    .restart local v2    # "l":I
    .restart local v7    # "t":I
    :cond_76
    move v6, v2

    .line 91
    goto :goto_65

    .line 92
    .restart local v6    # "r":I
    :cond_78
    iget v8, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLaneSize:I

    add-int v0, v7, v8

    goto :goto_6a

    .line 96
    .end local v2    # "l":I
    .end local v6    # "r":I
    .end local v7    # "t":I
    :cond_7d
    return-void
.end method

.method public constructor <init>(Lorg/lucasr/twowayview/widget/BaseLayoutManager;Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;[Landroid/graphics/Rect;I)V
    .registers 8
    .param p1, "layout"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager;
    .param p2, "orientation"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    .param p3, "lanes"    # [Landroid/graphics/Rect;
    .param p4, "laneSize"    # I

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mTempRect:Landroid/graphics/Rect;

    .line 34
    new-instance v1, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-direct {v1}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;-><init>()V

    iput-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    .line 59
    iput-object p1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLayout:Lorg/lucasr/twowayview/widget/BaseLayoutManager;

    .line 60
    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    if-ne p2, v1, :cond_37

    const/4 v1, 0x1

    :goto_18
    iput-boolean v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    .line 61
    iput-object p3, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    .line 62
    iput p4, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLaneSize:I

    .line 64
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v1, v1

    new-array v1, v1, [Landroid/graphics/Rect;

    iput-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mSavedLanes:[Landroid/graphics/Rect;

    .line 65
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_26
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v1, v1

    if-ge v0, v1, :cond_39

    .line 66
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mSavedLanes:[Landroid/graphics/Rect;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    aput-object v2, v1, v0

    .line 65
    add-int/lit8 v0, v0, 0x1

    goto :goto_26

    .line 60
    .end local v0    # "i":I
    :cond_37
    const/4 v1, 0x0

    goto :goto_18

    .line 68
    .restart local v0    # "i":I
    :cond_39
    return-void
.end method

.method public static calculateLaneSize(Lorg/lucasr/twowayview/widget/BaseLayoutManager;I)I
    .registers 9
    .param p0, "layout"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager;
    .param p1, "laneCount"    # I

    .prologue
    .line 99
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->isVertical()Z

    move-result v6

    if-eqz v6, :cond_18

    .line 100
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPaddingLeft()I

    move-result v2

    .line 101
    .local v2, "paddingLeft":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPaddingRight()I

    move-result v3

    .line 102
    .local v3, "paddingRight":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getWidth()I

    move-result v6

    sub-int/2addr v6, v2

    sub-int v5, v6, v3

    .line 103
    .local v5, "width":I
    div-int v6, v5, p1

    .line 108
    .end local v2    # "paddingLeft":I
    .end local v3    # "paddingRight":I
    .end local v5    # "width":I
    :goto_17
    return v6

    .line 105
    :cond_18
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPaddingTop()I

    move-result v4

    .line 106
    .local v4, "paddingTop":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getPaddingBottom()I

    move-result v1

    .line 107
    .local v1, "paddingBottom":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager;->getHeight()I

    move-result v6

    sub-int/2addr v6, v4

    sub-int v0, v6, v1

    .line 108
    .local v0, "height":I
    div-int v6, v0, p1

    goto :goto_17
.end method

.method private findLaneThatFitsSpan(IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)I
    .registers 14
    .param p1, "anchorLane"    # I
    .param p2, "laneSpan"    # I
    .param p3, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    const/4 v9, 0x1

    .line 245
    const/4 v0, 0x0

    sub-int v1, p1, p2

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 246
    .local v7, "findStart":I
    add-int v0, v7, p2

    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v1, v1

    sub-int/2addr v1, p2

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 247
    .local v6, "findEnd":I
    move v8, v7

    .local v8, "l":I
    :goto_17
    if-ge v8, v6, :cond_47

    .line 248
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    invoke-virtual {v0, v8, p1}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->set(II)V

    .line 250
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mTempRect:Landroid/graphics/Rect;

    iget-boolean v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v0, :cond_3d

    iget v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLaneSize:I

    mul-int v2, p2, v0

    :goto_28
    iget-boolean v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v0, :cond_3f

    move v3, v9

    :goto_2d
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/Lanes;->mTempLaneInfo:Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    move-object v0, p0

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lorg/lucasr/twowayview/widget/Lanes;->getChildFrame(Landroid/graphics/Rect;IILorg/lucasr/twowayview/widget/Lanes$LaneInfo;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 253
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v8, p2, v0}, Lorg/lucasr/twowayview/widget/Lanes;->intersects(IILandroid/graphics/Rect;)Z

    move-result v0

    if-nez v0, :cond_44

    .line 258
    .end local v8    # "l":I
    :goto_3c
    return v8

    .restart local v8    # "l":I
    :cond_3d
    move v2, v9

    .line 250
    goto :goto_28

    :cond_3f
    iget v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLaneSize:I

    mul-int v3, p2, v0

    goto :goto_2d

    .line 247
    :cond_44
    add-int/lit8 v8, v8, 0x1

    goto :goto_17

    .line 258
    :cond_47
    const/4 v8, -0x1

    goto :goto_3c
.end method

.method private intersects(IILandroid/graphics/Rect;)Z
    .registers 6
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "r"    # Landroid/graphics/Rect;

    .prologue
    .line 235
    move v0, p1

    .local v0, "l":I
    :goto_1
    add-int v1, p1, p2

    if-ge v0, v1, :cond_14

    .line 236
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v1, v1, v0

    invoke-static {v1, p3}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 237
    const/4 v1, 0x1

    .line 241
    :goto_10
    return v1

    .line 235
    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 241
    :cond_14
    const/4 v1, 0x0

    goto :goto_10
.end method

.method private invalidateEdges()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 113
    iput-object v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerStart:Ljava/lang/Integer;

    .line 114
    iput-object v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerEnd:Ljava/lang/Integer;

    .line 115
    return-void
.end method

.method private offsetLane(II)V
    .registers 7
    .param p1, "lane"    # I
    .param p2, "offset"    # I

    .prologue
    const/4 v1, 0x0

    .line 142
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v2, v0, p1

    iget-boolean v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v0, :cond_12

    move v0, v1

    :goto_a
    iget-boolean v3, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v3, :cond_14

    .end local p2    # "offset":I
    :goto_e
    invoke-virtual {v2, v0, p2}, Landroid/graphics/Rect;->offset(II)V

    .line 144
    return-void

    .restart local p2    # "offset":I
    :cond_12
    move v0, p2

    .line 142
    goto :goto_a

    :cond_14
    move p2, v1

    goto :goto_e
.end method


# virtual methods
.method public findLane(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 9
    .param p1, "outInfo"    # Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;
    .param p2, "laneSpan"    # I
    .param p3, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 262
    invoke-virtual {p1}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->setUndefined()V

    .line 264
    sget-object v4, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p3, v4, :cond_38

    const v2, 0x7fffffff

    .line 265
    .local v2, "targetEdge":I
    :goto_a
    const/4 v0, 0x0

    .local v0, "l":I
    :goto_b
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v4, v4

    if-ge v0, v4, :cond_54

    .line 267
    iget-boolean v4, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v4, :cond_42

    .line 268
    sget-object v4, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p3, v4, :cond_3b

    iget-object v4, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v4, v4, v0

    iget v1, v4, Landroid/graphics/Rect;->bottom:I

    .line 273
    .local v1, "laneEdge":I
    :goto_1e
    sget-object v4, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p3, v4, :cond_24

    if-lt v1, v2, :cond_2a

    :cond_24
    sget-object v4, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p3, v4, :cond_35

    if-le v1, v2, :cond_35

    .line 276
    :cond_2a
    invoke-direct {p0, v0, p2, p3}, Lorg/lucasr/twowayview/widget/Lanes;->findLaneThatFitsSpan(IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)I

    move-result v3

    .line 277
    .local v3, "targetLane":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_35

    .line 278
    move v2, v1

    .line 279
    invoke-virtual {p1, v3, v0}, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->set(II)V

    .line 265
    .end local v3    # "targetLane":I
    :cond_35
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 264
    .end local v0    # "l":I
    .end local v1    # "laneEdge":I
    .end local v2    # "targetEdge":I
    :cond_38
    const/high16 v2, -0x80000000

    goto :goto_a

    .line 268
    .restart local v0    # "l":I
    .restart local v2    # "targetEdge":I
    :cond_3b
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v4, v4, v0

    iget v1, v4, Landroid/graphics/Rect;->top:I

    goto :goto_1e

    .line 270
    :cond_42
    sget-object v4, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p3, v4, :cond_4d

    iget-object v4, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v4, v4, v0

    iget v1, v4, Landroid/graphics/Rect;->right:I

    .restart local v1    # "laneEdge":I
    :goto_4c
    goto :goto_1e

    .end local v1    # "laneEdge":I
    :cond_4d
    iget-object v4, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v4, v4, v0

    iget v1, v4, Landroid/graphics/Rect;->left:I

    goto :goto_4c

    .line 283
    :cond_54
    return-void
.end method

.method public getChildFrame(Landroid/graphics/Rect;IILorg/lucasr/twowayview/widget/Lanes$LaneInfo;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 11
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "childWidth"    # I
    .param p3, "childHeight"    # I
    .param p4, "laneInfo"    # Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;
    .param p5, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 211
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    iget v4, p4, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    aget-object v2, v3, v4

    .line 216
    .local v2, "startRect":Landroid/graphics/Rect;
    sget-object v3, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p5, v3, :cond_2b

    iget v0, p4, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->anchorLane:I

    .line 218
    .local v0, "anchorLane":I
    :goto_c
    iget-object v3, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v1, v3, v0

    .line 220
    .local v1, "anchorRect":Landroid/graphics/Rect;
    iget-boolean v3, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v3, :cond_32

    .line 221
    iget v3, v2, Landroid/graphics/Rect;->left:I

    iput v3, p1, Landroid/graphics/Rect;->left:I

    .line 222
    sget-object v3, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p5, v3, :cond_2e

    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    :goto_1e
    iput v3, p1, Landroid/graphics/Rect;->top:I

    .line 230
    :goto_20
    iget v3, p1, Landroid/graphics/Rect;->left:I

    add-int/2addr v3, p2

    iput v3, p1, Landroid/graphics/Rect;->right:I

    .line 231
    iget v3, p1, Landroid/graphics/Rect;->top:I

    add-int/2addr v3, p3

    iput v3, p1, Landroid/graphics/Rect;->bottom:I

    .line 232
    return-void

    .line 216
    .end local v0    # "anchorLane":I
    .end local v1    # "anchorRect":Landroid/graphics/Rect;
    :cond_2b
    iget v0, p4, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    goto :goto_c

    .line 222
    .restart local v0    # "anchorLane":I
    .restart local v1    # "anchorRect":Landroid/graphics/Rect;
    :cond_2e
    iget v3, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, p3

    goto :goto_1e

    .line 225
    :cond_32
    iget v3, v2, Landroid/graphics/Rect;->top:I

    iput v3, p1, Landroid/graphics/Rect;->top:I

    .line 226
    sget-object v3, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p5, v3, :cond_3f

    iget v3, v1, Landroid/graphics/Rect;->right:I

    :goto_3c
    iput v3, p1, Landroid/graphics/Rect;->left:I

    goto :goto_20

    :cond_3f
    iget v3, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v3, p2

    goto :goto_3c
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v0, v0

    return v0
.end method

.method public getInnerEnd()I
    .registers 5

    .prologue
    .line 338
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerEnd:Ljava/lang/Integer;

    if-eqz v2, :cond_b

    .line 339
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerEnd:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 348
    :goto_a
    return v2

    .line 342
    :cond_b
    const v2, 0x7fffffff

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerEnd:Ljava/lang/Integer;

    .line 343
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v2, v2

    if-ge v0, v2, :cond_3a

    .line 344
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v1, v2, v0

    .line 345
    .local v1, "laneRect":Landroid/graphics/Rect;
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerEnd:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-boolean v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v2, :cond_37

    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    :goto_2a
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerEnd:Ljava/lang/Integer;

    .line 343
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 345
    :cond_37
    iget v2, v1, Landroid/graphics/Rect;->right:I

    goto :goto_2a

    .line 348
    .end local v1    # "laneRect":Landroid/graphics/Rect;
    :cond_3a
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerEnd:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_a
.end method

.method public getInnerStart()I
    .registers 5

    .prologue
    .line 324
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerStart:Ljava/lang/Integer;

    if-eqz v2, :cond_b

    .line 325
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerStart:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 334
    :goto_a
    return v2

    .line 328
    :cond_b
    const/high16 v2, -0x80000000

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerStart:Ljava/lang/Integer;

    .line 329
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v2, v2

    if-ge v0, v2, :cond_39

    .line 330
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v1, v2, v0

    .line 331
    .local v1, "laneRect":Landroid/graphics/Rect;
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerStart:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-boolean v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v2, :cond_36

    iget v2, v1, Landroid/graphics/Rect;->top:I

    :goto_29
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerStart:Ljava/lang/Integer;

    .line 329
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 331
    :cond_36
    iget v2, v1, Landroid/graphics/Rect;->left:I

    goto :goto_29

    .line 334
    .end local v1    # "laneRect":Landroid/graphics/Rect;
    :cond_39
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mInnerStart:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_a
.end method

.method public getLane(ILandroid/graphics/Rect;)V
    .registers 4
    .param p1, "lane"    # I
    .param p2, "laneRect"    # Landroid/graphics/Rect;

    .prologue
    .line 160
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v0, v0, p1

    invoke-virtual {p2, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 161
    return-void
.end method

.method public getLaneSize()I
    .registers 2

    .prologue
    .line 134
    iget v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLaneSize:I

    return v0
.end method

.method public getOrientation()Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    .registers 2

    .prologue
    .line 118
    iget-boolean v0, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v0, :cond_7

    sget-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->HORIZONTAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    goto :goto_6
.end method

.method public offset(I)V
    .registers 4
    .param p1, "offset"    # I

    .prologue
    .line 147
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v1, v1

    if-ge v0, v1, :cond_c

    .line 148
    invoke-virtual {p0, v0, p1}, Lorg/lucasr/twowayview/widget/Lanes;->offset(II)V

    .line 147
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 151
    :cond_c
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/Lanes;->invalidateEdges()V

    .line 152
    return-void
.end method

.method public offset(II)V
    .registers 3
    .param p1, "lane"    # I
    .param p2, "offset"    # I

    .prologue
    .line 155
    invoke-direct {p0, p1, p2}, Lorg/lucasr/twowayview/widget/Lanes;->offsetLane(II)V

    .line 156
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/Lanes;->invalidateEdges()V

    .line 157
    return-void
.end method

.method public popChildFrame(Landroid/graphics/Rect;IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 7
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "lane"    # I
    .param p3, "margin"    # I
    .param p4, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 191
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v0, v1, p2

    .line 192
    .local v0, "laneRect":Landroid/graphics/Rect;
    iget-boolean v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v1, :cond_1b

    .line 193
    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p4, v1, :cond_15

    .line 194
    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, p3

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 206
    :goto_11
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/Lanes;->invalidateEdges()V

    .line 207
    return-void

    .line 196
    :cond_15
    iget v1, p1, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, p3

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    goto :goto_11

    .line 199
    :cond_1b
    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p4, v1, :cond_25

    .line 200
    iget v1, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v1, p3

    iput v1, v0, Landroid/graphics/Rect;->left:I

    goto :goto_11

    .line 202
    :cond_25
    iget v1, p1, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, p3

    iput v1, v0, Landroid/graphics/Rect;->right:I

    goto :goto_11
.end method

.method public pushChildFrame(Landroid/graphics/Rect;IILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)I
    .registers 9
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "lane"    # I
    .param p3, "margin"    # I
    .param p4, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 166
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v1, v2, p2

    .line 167
    .local v1, "laneRect":Landroid/graphics/Rect;
    iget-boolean v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v2, :cond_27

    .line 168
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p4, v2, :cond_1b

    .line 169
    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    sub-int v0, v2, v3

    .line 170
    .local v0, "delta":I
    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v2, p3

    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 185
    :goto_17
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/Lanes;->invalidateEdges()V

    .line 187
    return v0

    .line 172
    .end local v0    # "delta":I
    :cond_1b
    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    iget v3, v1, Landroid/graphics/Rect;->top:I

    sub-int v0, v2, v3

    .line 173
    .restart local v0    # "delta":I
    iget v2, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v2, p3

    iput v2, v1, Landroid/graphics/Rect;->top:I

    goto :goto_17

    .line 176
    .end local v0    # "delta":I
    :cond_27
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p4, v2, :cond_37

    .line 177
    iget v2, p1, Landroid/graphics/Rect;->left:I

    iget v3, v1, Landroid/graphics/Rect;->right:I

    sub-int v0, v2, v3

    .line 178
    .restart local v0    # "delta":I
    iget v2, p1, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, p3

    iput v2, v1, Landroid/graphics/Rect;->right:I

    goto :goto_17

    .line 180
    .end local v0    # "delta":I
    :cond_37
    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget v3, v1, Landroid/graphics/Rect;->left:I

    sub-int v0, v2, v3

    .line 181
    .restart local v0    # "delta":I
    iget v2, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, p3

    iput v2, v1, Landroid/graphics/Rect;->left:I

    goto :goto_17
.end method

.method public reset(I)V
    .registers 6
    .param p1, "offset"    # I

    .prologue
    .line 307
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v2, v2

    if-ge v0, v2, :cond_2d

    .line 308
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v1, v2, v0

    .line 310
    .local v1, "laneRect":Landroid/graphics/Rect;
    iget-boolean v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v2, :cond_23

    iget v2, v1, Landroid/graphics/Rect;->left:I

    :goto_10
    iget-boolean v3, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v3, :cond_25

    move v3, p1

    :goto_15
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 313
    iget-boolean v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v2, :cond_28

    .line 314
    iget v2, v1, Landroid/graphics/Rect;->top:I

    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 307
    :goto_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_23
    move v2, p1

    .line 310
    goto :goto_10

    :cond_25
    iget v3, v1, Landroid/graphics/Rect;->top:I

    goto :goto_15

    .line 316
    :cond_28
    iget v2, v1, Landroid/graphics/Rect;->left:I

    iput v2, v1, Landroid/graphics/Rect;->right:I

    goto :goto_20

    .line 320
    .end local v1    # "laneRect":Landroid/graphics/Rect;
    :cond_2d
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/Lanes;->invalidateEdges()V

    .line 321
    return-void
.end method

.method public reset(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 5
    .param p1, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 286
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v2, v2

    if-ge v0, v2, :cond_2c

    .line 287
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v1, v2, v0

    .line 288
    .local v1, "laneRect":Landroid/graphics/Rect;
    iget-boolean v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mIsVertical:Z

    if-eqz v2, :cond_1e

    .line 289
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p1, v2, :cond_19

    .line 290
    iget v2, v1, Landroid/graphics/Rect;->top:I

    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 286
    :goto_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 292
    :cond_19
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    iput v2, v1, Landroid/graphics/Rect;->top:I

    goto :goto_16

    .line 295
    :cond_1e
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p1, v2, :cond_27

    .line 296
    iget v2, v1, Landroid/graphics/Rect;->left:I

    iput v2, v1, Landroid/graphics/Rect;->right:I

    goto :goto_16

    .line 298
    :cond_27
    iget v2, v1, Landroid/graphics/Rect;->right:I

    iput v2, v1, Landroid/graphics/Rect;->left:I

    goto :goto_16

    .line 303
    .end local v1    # "laneRect":Landroid/graphics/Rect;
    :cond_2c
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/Lanes;->invalidateEdges()V

    .line 304
    return-void
.end method

.method public restore()V
    .registers 4

    .prologue
    .line 128
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v1, v1

    if-ge v0, v1, :cond_14

    .line 129
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mSavedLanes:[Landroid/graphics/Rect;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 128
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 131
    :cond_14
    return-void
.end method

.method public save()V
    .registers 4

    .prologue
    .line 122
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    array-length v1, v1

    if-ge v0, v1, :cond_14

    .line 123
    iget-object v1, p0, Lorg/lucasr/twowayview/widget/Lanes;->mSavedLanes:[Landroid/graphics/Rect;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/lucasr/twowayview/widget/Lanes;->mLanes:[Landroid/graphics/Rect;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 122
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 125
    :cond_14
    return-void
.end method
