.class public Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;
.super Ljava/lang/Object;
.source "HeaderPositionCalculator.java"


# instance fields
.field private final mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

.field private final mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

.field private final mHeaderProvider:Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

.field private final mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;


# direct methods
.method public constructor <init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;)V
    .registers 5
    .param p1, "adapter"    # Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;
    .param p2, "headerProvider"    # Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;
    .param p3, "orientationProvider"    # Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;
    .param p4, "dimensionCalculator"    # Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    .line 26
    iput-object p2, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mHeaderProvider:Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

    .line 27
    iput-object p3, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    .line 28
    iput-object p4, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    .line 29
    return-void
.end method

.method private getDefaultHeaderOffset(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Landroid/view/View;I)Landroid/graphics/Rect;
    .registers 11
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "header"    # Landroid/view/View;
    .param p3, "firstView"    # Landroid/view/View;
    .param p4, "orientation"    # I

    .prologue
    .line 98
    iget-object v3, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-virtual {v3, p2}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMargins(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    .line 99
    .local v0, "headerMargins":Landroid/graphics/Rect;
    const/4 v3, 0x1

    if-ne p4, v3, :cond_38

    .line 100
    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result v3

    iget v4, v0, Landroid/graphics/Rect;->left:I

    add-int v1, v3, v4

    .line 101
    .local v1, "translationX":I
    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v4

    sub-int/2addr v3, v4

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v3, v4

    invoke-direct {p0, p1}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->getListTop(Landroid/support/v7/widget/RecyclerView;)I

    move-result v4

    iget v5, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 111
    .local v2, "translationY":I
    :goto_28
    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v5, v2

    invoke-direct {v3, v1, v2, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v3

    .line 105
    .end local v1    # "translationX":I
    .end local v2    # "translationY":I
    :cond_38
    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    move-result v3

    iget v4, v0, Landroid/graphics/Rect;->top:I

    add-int v2, v3, v4

    .line 106
    .restart local v2    # "translationY":I
    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v4

    sub-int/2addr v3, v4

    iget v4, v0, Landroid/graphics/Rect;->right:I

    sub-int/2addr v3, v4

    invoke-direct {p0, p1}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->getListLeft(Landroid/support/v7/widget/RecyclerView;)I

    move-result v4

    iget v5, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .restart local v1    # "translationX":I
    goto :goto_28
.end method

.method private getFirstViewUnobscuredByHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Landroid/view/View;
    .registers 6
    .param p1, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "firstHeader"    # Landroid/view/View;

    .prologue
    .line 171
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1b

    .line 172
    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 173
    .local v0, "child":Landroid/view/View;
    iget-object v2, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    invoke-interface {v2, p1}, Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;->getOrientation(Landroid/support/v7/widget/RecyclerView;)I

    move-result v2

    invoke-direct {p0, p1, v0, p2, v2}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->itemIsObscuredByHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Landroid/view/View;I)Z

    move-result v2

    if-nez v2, :cond_18

    .line 177
    .end local v0    # "child":Landroid/view/View;
    :goto_17
    return-object v0

    .line 171
    .restart local v0    # "child":Landroid/view/View;
    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 177
    .end local v0    # "child":Landroid/view/View;
    :cond_1b
    const/4 v0, 0x0

    goto :goto_17
.end method

.method private getListLeft(Landroid/support/v7/widget/RecyclerView;)I
    .registers 3
    .param p1, "view"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 227
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getClipToPadding()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 228
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v0

    .line 230
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private getListTop(Landroid/support/v7/widget/RecyclerView;)I
    .registers 3
    .param p1, "view"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 219
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getClipToPadding()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 220
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v0

    .line 222
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private indexOutOfBounds(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 78
    if-ltz p1, :cond_a

    iget-object v0, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    invoke-interface {v0}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;->getItemCount()I

    move-result v0

    if-lt p1, v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private isStickyHeaderBeingPushedOffscreen(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Z
    .registers 16
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "stickyHeader"    # Landroid/view/View;

    .prologue
    const/4 v9, 0x0

    const/4 v10, 0x1

    .line 116
    invoke-direct {p0, p1, p2}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->getFirstViewUnobscuredByHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Landroid/view/View;

    move-result-object v8

    .line 117
    .local v8, "viewAfterHeader":Landroid/view/View;
    invoke-virtual {p1, v8}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v1

    .line 118
    .local v1, "firstViewUnderHeaderPosition":I
    const/4 v11, -0x1

    if-ne v1, v11, :cond_e

    .line 142
    :cond_d
    :goto_d
    return v9

    .line 122
    :cond_e
    if-lez v1, :cond_d

    invoke-virtual {p0, v1}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->hasNewHeader(I)Z

    move-result v11

    if-eqz v11, :cond_d

    .line 123
    iget-object v11, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mHeaderProvider:Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

    invoke-interface {v11, p1, v1}, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;->getHeader(Landroid/support/v7/widget/RecyclerView;I)Landroid/view/View;

    move-result-object v4

    .line 124
    .local v4, "nextHeader":Landroid/view/View;
    iget-object v11, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-virtual {v11, v4}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMargins(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v5

    .line 125
    .local v5, "nextHeaderMargins":Landroid/graphics/Rect;
    iget-object v11, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-virtual {v11, p2}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMargins(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v2

    .line 127
    .local v2, "headerMargins":Landroid/graphics/Rect;
    iget-object v11, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    invoke-interface {v11, p1}, Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;->getOrientation(Landroid/support/v7/widget/RecyclerView;)I

    move-result v11

    if-ne v11, v10, :cond_54

    .line 128
    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v11

    iget v12, v5, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v11, v12

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v12

    sub-int/2addr v11, v12

    iget v12, v5, Landroid/graphics/Rect;->top:I

    sub-int v7, v11, v12

    .line 129
    .local v7, "topOfNextHeader":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v11

    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v12

    add-int/2addr v11, v12

    iget v12, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v11, v12

    iget v12, v2, Landroid/graphics/Rect;->bottom:I

    add-int v0, v11, v12

    .line 130
    .local v0, "bottomOfThisHeader":I
    if-ge v7, v0, :cond_d

    move v9, v10

    .line 131
    goto :goto_d

    .line 134
    .end local v0    # "bottomOfThisHeader":I
    .end local v7    # "topOfNextHeader":I
    :cond_54
    invoke-virtual {v8}, Landroid/view/View;->getLeft()I

    move-result v11

    iget v12, v5, Landroid/graphics/Rect;->right:I

    sub-int/2addr v11, v12

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v12

    sub-int/2addr v11, v12

    iget v12, v5, Landroid/graphics/Rect;->left:I

    sub-int v3, v11, v12

    .line 135
    .local v3, "leftOfNextHeader":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v11

    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v12

    add-int/2addr v11, v12

    iget v12, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v11, v12

    iget v12, v2, Landroid/graphics/Rect;->right:I

    add-int v6, v11, v12

    .line 136
    .local v6, "rightOfThisHeader":I
    if-ge v3, v6, :cond_d

    move v9, v10

    .line 137
    goto :goto_d
.end method

.method private itemIsObscuredByHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Landroid/view/View;I)Z
    .registers 16
    .param p1, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "item"    # Landroid/view/View;
    .param p3, "header"    # Landroid/view/View;
    .param p4, "orientation"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 191
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 192
    .local v6, "layoutParams":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    iget-object v9, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-virtual {v9, p3}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMargins(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v2

    .line 194
    .local v2, "headerMargins":Landroid/graphics/Rect;
    invoke-virtual {p1, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    .line 195
    .local v0, "adapterPosition":I
    const/4 v9, -0x1

    if-eq v0, v9, :cond_1d

    iget-object v9, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mHeaderProvider:Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

    invoke-interface {v9, p1, v0}, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;->getHeader(Landroid/support/v7/widget/RecyclerView;I)Landroid/view/View;

    move-result-object v9

    if-eq v9, p3, :cond_1e

    .line 215
    :cond_1d
    :goto_1d
    return v7

    .line 201
    :cond_1e
    if-ne p4, v8, :cond_37

    .line 202
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v9

    iget v10, v6, Landroid/support/v7/widget/RecyclerView$LayoutParams;->topMargin:I

    sub-int v5, v9, v10

    .line 203
    .local v5, "itemTop":I
    invoke-virtual {p3}, Landroid/view/View;->getBottom()I

    move-result v9

    iget v10, v2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v9, v10

    iget v10, v2, Landroid/graphics/Rect;->top:I

    add-int v1, v9, v10

    .line 204
    .local v1, "headerBottom":I
    if-gt v5, v1, :cond_1d

    .end local v1    # "headerBottom":I
    .end local v5    # "itemTop":I
    :cond_35
    move v7, v8

    .line 215
    goto :goto_1d

    .line 208
    :cond_37
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v9

    iget v10, v6, Landroid/support/v7/widget/RecyclerView$LayoutParams;->leftMargin:I

    sub-int v4, v9, v10

    .line 209
    .local v4, "itemLeft":I
    invoke-virtual {p3}, Landroid/view/View;->getRight()I

    move-result v9

    iget v10, v2, Landroid/graphics/Rect;->right:I

    add-int/2addr v9, v10

    iget v10, v2, Landroid/graphics/Rect;->left:I

    add-int v3, v9, v10

    .line 210
    .local v3, "headerRight":I
    if-le v4, v3, :cond_35

    goto :goto_1d
.end method

.method private translateHeaderWithNextHeader(Landroid/support/v7/widget/RecyclerView;ILandroid/graphics/Rect;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .registers 14
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "orientation"    # I
    .param p3, "translation"    # Landroid/graphics/Rect;
    .param p4, "currentHeader"    # Landroid/view/View;
    .param p5, "viewAfterNextHeader"    # Landroid/view/View;
    .param p6, "nextHeader"    # Landroid/view/View;

    .prologue
    .line 147
    iget-object v5, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-virtual {v5, p6}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMargins(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    .line 148
    .local v1, "nextHeaderMargins":Landroid/graphics/Rect;
    iget-object v5, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-virtual {v5, p4}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMargins(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v3

    .line 149
    .local v3, "stickyHeaderMargins":Landroid/graphics/Rect;
    const/4 v5, 0x1

    if-ne p2, v5, :cond_38

    .line 150
    invoke-direct {p0, p1}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->getListTop(Landroid/support/v7/widget/RecyclerView;)I

    move-result v5

    iget v6, v3, Landroid/graphics/Rect;->top:I

    add-int/2addr v5, v6

    iget v6, v3, Landroid/graphics/Rect;->bottom:I

    add-int v4, v5, v6

    .line 151
    .local v4, "topOfStickyHeader":I
    invoke-virtual {p5}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {p6}, Landroid/view/View;->getHeight()I

    move-result v6

    sub-int/2addr v5, v6

    iget v6, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v5, v6

    iget v6, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v5, v6

    invoke-virtual {p4}, Landroid/view/View;->getHeight()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int v2, v5, v4

    .line 152
    .local v2, "shiftFromNextHeader":I
    if-ge v2, v4, :cond_37

    .line 153
    iget v5, p3, Landroid/graphics/Rect;->top:I

    add-int/2addr v5, v2

    iput v5, p3, Landroid/graphics/Rect;->top:I

    .line 162
    .end local v4    # "topOfStickyHeader":I
    :cond_37
    :goto_37
    return-void

    .line 156
    .end local v2    # "shiftFromNextHeader":I
    :cond_38
    invoke-direct {p0, p1}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->getListLeft(Landroid/support/v7/widget/RecyclerView;)I

    move-result v5

    iget v6, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr v5, v6

    iget v6, v3, Landroid/graphics/Rect;->right:I

    add-int v0, v5, v6

    .line 157
    .local v0, "leftOfStickyHeader":I
    invoke-virtual {p5}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {p6}, Landroid/view/View;->getWidth()I

    move-result v6

    sub-int/2addr v5, v6

    iget v6, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v5, v6

    iget v6, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v6

    invoke-virtual {p4}, Landroid/view/View;->getWidth()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int v2, v5, v0

    .line 158
    .restart local v2    # "shiftFromNextHeader":I
    if-ge v2, v0, :cond_37

    .line 159
    iget v5, p3, Landroid/graphics/Rect;->left:I

    add-int/2addr v5, v2

    iput v5, p3, Landroid/graphics/Rect;->left:I

    goto :goto_37
.end method


# virtual methods
.method public getHeaderBounds(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Landroid/view/View;Z)Landroid/graphics/Rect;
    .registers 14
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "header"    # Landroid/view/View;
    .param p3, "firstView"    # Landroid/view/View;
    .param p4, "firstHeader"    # Z

    .prologue
    .line 82
    iget-object v0, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    invoke-interface {v0, p1}, Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;->getOrientation(Landroid/support/v7/widget/RecyclerView;)I

    move-result v8

    .line 83
    .local v8, "orientation":I
    invoke-direct {p0, p1, p2, p3, v8}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->getDefaultHeaderOffset(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Landroid/view/View;I)Landroid/graphics/Rect;

    move-result-object v3

    .line 85
    .local v3, "bounds":Landroid/graphics/Rect;
    if-eqz p4, :cond_2c

    invoke-direct {p0, p1, p2}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->isStickyHeaderBeingPushedOffscreen(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 86
    invoke-direct {p0, p1, p2}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->getFirstViewUnobscuredByHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Landroid/view/View;

    move-result-object v5

    .line 87
    .local v5, "viewAfterNextHeader":Landroid/view/View;
    invoke-virtual {p1, v5}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v7

    .line 88
    .local v7, "firstViewUnderHeaderPosition":I
    iget-object v0, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mHeaderProvider:Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

    invoke-interface {v0, p1, v7}, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;->getHeader(Landroid/support/v7/widget/RecyclerView;I)Landroid/view/View;

    move-result-object v6

    .line 89
    .local v6, "secondHeader":Landroid/view/View;
    iget-object v0, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    invoke-interface {v0, p1}, Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;->getOrientation(Landroid/support/v7/widget/RecyclerView;)I

    move-result v2

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v6}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->translateHeaderWithNextHeader(Landroid/support/v7/widget/RecyclerView;ILandroid/graphics/Rect;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 93
    .end local v5    # "viewAfterNextHeader":Landroid/view/View;
    .end local v6    # "secondHeader":Landroid/view/View;
    .end local v7    # "firstViewUnderHeaderPosition":I
    :cond_2c
    return-object v3
.end method

.method public hasNewHeader(I)Z
    .registers 8
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x0

    .line 64
    invoke-direct {p0, p1}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->indexOutOfBounds(I)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 74
    :cond_7
    :goto_7
    return v2

    .line 68
    :cond_8
    iget-object v3, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    invoke-interface {v3, p1}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;->getHeaderId(I)J

    move-result-wide v0

    .line 70
    .local v0, "headerId":J
    const-wide/16 v4, 0x0

    cmp-long v3, v0, v4

    if-ltz v3, :cond_7

    .line 74
    if-eqz p1, :cond_22

    iget-object v3, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    add-int/lit8 v4, p1, -0x1

    invoke-interface {v3, v4}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;->getHeaderId(I)J

    move-result-wide v4

    cmp-long v3, v0, v4

    if-eqz v3, :cond_7

    :cond_22
    const/4 v2, 0x1

    goto :goto_7
.end method

.method public hasStickyHeader(Landroid/view/View;II)Z
    .registers 12
    .param p1, "itemView"    # Landroid/view/View;
    .param p2, "orientation"    # I
    .param p3, "position"    # I

    .prologue
    const/4 v2, 0x1

    .line 44
    if-ne p2, v2, :cond_1e

    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    .line 46
    .local v1, "offset":I
    iget-object v3, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-virtual {v3, p1}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMargins(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v3

    iget v0, v3, Landroid/graphics/Rect;->top:I

    .line 52
    .local v0, "margin":I
    :goto_f
    if-gt v1, v0, :cond_2b

    iget-object v3, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    invoke-interface {v3, p3}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;->getHeaderId(I)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-ltz v3, :cond_2b

    :goto_1d
    return v2

    .line 48
    .end local v0    # "margin":I
    .end local v1    # "offset":I
    :cond_1e
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    .line 49
    .restart local v1    # "offset":I
    iget-object v3, p0, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-virtual {v3, p1}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMargins(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v3

    iget v0, v3, Landroid/graphics/Rect;->left:I

    .restart local v0    # "margin":I
    goto :goto_f

    .line 52
    :cond_2b
    const/4 v2, 0x0

    goto :goto_1d
.end method
