.class public Lcom/etsy/android/grid/StaggeredGridView;
.super Lcom/etsy/android/grid/ExtendableListView;
.source "StaggeredGridView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;,
        Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;,
        Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;
    }
.end annotation


# instance fields
.field private mColumnBottoms:[I

.field private mColumnCount:I

.field private mColumnCountLandscape:I

.field private mColumnCountPortrait:I

.field private mColumnLefts:[I

.field private mColumnTops:[I

.field private mColumnWidth:I

.field private mDistanceToTop:I

.field private mGridPaddingBottom:I

.field private mGridPaddingLeft:I

.field private mGridPaddingRight:I

.field private mGridPaddingTop:I

.field private mItemMargin:I

.field private mNeedSync:Z

.field private mPositionData:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 144
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/etsy/android/grid/StaggeredGridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 145
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 148
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/etsy/android/grid/StaggeredGridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 149
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 152
    invoke-direct {p0, p1, p2, p3}, Lcom/etsy/android/grid/ExtendableListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    iput v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountPortrait:I

    .line 55
    iput v4, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountLandscape:I

    .line 154
    if-eqz p2, :cond_51

    .line 156
    sget-object v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->StaggeredGridView:[I

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 159
    .local v0, "typedArray":Landroid/content/res/TypedArray;
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->StaggeredGridView_column_count:I

    .line 158
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    .line 161
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-lez v1, :cond_67

    .line 162
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountPortrait:I

    .line 163
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountLandscape:I

    .line 175
    :goto_26
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->StaggeredGridView_item_margin:I

    .line 174
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mItemMargin:I

    .line 177
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->StaggeredGridView_grid_paddingLeft:I

    .line 176
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mGridPaddingLeft:I

    .line 179
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->StaggeredGridView_grid_paddingRight:I

    .line 178
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mGridPaddingRight:I

    .line 181
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->StaggeredGridView_grid_paddingTop:I

    .line 180
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mGridPaddingTop:I

    .line 183
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->StaggeredGridView_grid_paddingBottom:I

    .line 182
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mGridPaddingBottom:I

    .line 185
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 188
    .end local v0    # "typedArray":Landroid/content/res/TypedArray;
    :cond_51
    iput v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    .line 190
    new-array v1, v2, [I

    iput-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    .line 191
    new-array v1, v2, [I

    iput-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    .line 192
    new-array v1, v2, [I

    iput-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnLefts:[I

    .line 193
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mPositionData:Landroid/util/SparseArray;

    .line 194
    return-void

    .line 167
    .restart local v0    # "typedArray":Landroid/content/res/TypedArray;
    :cond_67
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->StaggeredGridView_column_count_portrait:I

    .line 166
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountPortrait:I

    .line 170
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->StaggeredGridView_column_count_landscape:I

    .line 169
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountLandscape:I

    goto :goto_26
.end method

.method private alignTops()V
    .registers 9

    .prologue
    .line 774
    iget v6, p0, Lcom/etsy/android/grid/StaggeredGridView;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHeaderViewsCount()I

    move-result v7

    if-ne v6, v7, :cond_17

    .line 776
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestNonHeaderTops()[I

    move-result-object v4

    .line 779
    .local v4, "nonHeaderTops":[I
    const/4 v3, 0x1

    .line 780
    .local v3, "isAligned":Z
    const/4 v0, -0x1

    .line 781
    .local v0, "highestColumn":I
    const v1, 0x7fffffff

    .line 782
    .local v1, "highestTop":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_12
    array-length v6, v4

    if-lt v2, v6, :cond_18

    .line 795
    if-eqz v3, :cond_2b

    .line 807
    .end local v0    # "highestColumn":I
    .end local v1    # "highestTop":I
    .end local v2    # "i":I
    .end local v3    # "isAligned":Z
    .end local v4    # "nonHeaderTops":[I
    :cond_17
    :goto_17
    return-void

    .line 784
    .restart local v0    # "highestColumn":I
    .restart local v1    # "highestTop":I
    .restart local v2    # "i":I
    .restart local v3    # "isAligned":Z
    .restart local v4    # "nonHeaderTops":[I
    :cond_18
    if-eqz v3, :cond_21

    if-lez v2, :cond_21

    aget v6, v4, v2

    if-eq v6, v1, :cond_21

    .line 785
    const/4 v3, 0x0

    .line 788
    :cond_21
    aget v6, v4, v2

    if-ge v6, v1, :cond_28

    .line 789
    aget v1, v4, v2

    .line 790
    move v0, v2

    .line 782
    :cond_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 798
    :cond_2b
    const/4 v2, 0x0

    :goto_2c
    array-length v6, v4

    if-lt v2, v6, :cond_33

    .line 805
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->invalidate()V

    goto :goto_17

    .line 799
    :cond_33
    if-eq v2, v0, :cond_3c

    .line 801
    aget v6, v4, v2

    sub-int v5, v1, v6

    .line 802
    .local v5, "offset":I
    invoke-virtual {p0, v5, v2}, Lcom/etsy/android/grid/StaggeredGridView;->offsetChildrenTopAndBottom(II)V

    .line 798
    .end local v5    # "offset":I
    :cond_3c
    add-int/lit8 v2, v2, 0x1

    goto :goto_2c
.end method

.method private calculateColumnLeft(I)I
    .registers 5
    .param p1, "colIndex"    # I

    .prologue
    .line 929
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getRowPaddingLeft()I

    move-result v0

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mItemMargin:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mItemMargin:I

    iget v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnWidth:I

    add-int/2addr v1, v2

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    return v0
.end method

.method private calculateColumnWidth(I)I
    .registers 6
    .param p1, "gridWidth"    # I

    .prologue
    .line 924
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getRowPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getRowPaddingRight()I

    move-result v2

    add-int v0, v1, v2

    .line 925
    .local v0, "listPadding":I
    sub-int v1, p1, v0

    iget v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mItemMargin:I

    iget v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    add-int/lit8 v3, v3, 0x1

    mul-int/2addr v2, v3

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    div-int/2addr v1, v2

    return v1
.end method

.method private getChildBottomMargin()I
    .registers 2

    .prologue
    .line 570
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mItemMargin:I

    return v0
.end method

.method private getChildColumn(IZ)I
    .registers 5
    .param p1, "position"    # I
    .param p2, "flowDown"    # Z

    .prologue
    .line 1067
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getPositionColumn(I)I

    move-result v0

    .line 1069
    .local v0, "column":I
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    .line 1070
    .local v1, "columnCount":I
    if-ltz v0, :cond_a

    if-lt v0, v1, :cond_10

    .line 1074
    :cond_a
    if-eqz p2, :cond_11

    .line 1075
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedBottomColumn()I

    move-result v0

    .line 1082
    :cond_10
    :goto_10
    return v0

    .line 1078
    :cond_11
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedTopColumn()I

    move-result v0

    goto :goto_10
.end method

.method private getChildHeight(Landroid/view/View;)I
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 561
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    return v0
.end method

.method private getChildTopMargin(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x0

    .line 565
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHeaderViewsCount()I

    move-result v2

    iget v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    add-int/2addr v2, v3

    if-ge p1, v2, :cond_10

    const/4 v0, 0x1

    .line 566
    .local v0, "isFirstRow":Z
    :goto_b
    if-eqz v0, :cond_f

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mItemMargin:I

    :cond_f
    return v1

    .end local v0    # "isFirstRow":Z
    :cond_10
    move v0, v1

    .line 565
    goto :goto_b
.end method

.method private getHighestNonHeaderTops()[I
    .registers 8

    .prologue
    .line 810
    iget v5, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    new-array v4, v5, [I

    .line 811
    .local v4, "nonHeaderTops":[I
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildCount()I

    move-result v1

    .line 812
    .local v1, "childCount":I
    if-lez v1, :cond_d

    .line 813
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    if-lt v2, v1, :cond_e

    .line 828
    .end local v2    # "i":I
    :cond_d
    return-object v4

    .line 814
    .restart local v2    # "i":I
    :cond_e
    invoke-virtual {p0, v2}, Lcom/etsy/android/grid/StaggeredGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 815
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_3f

    .line 816
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    if-eqz v5, :cond_3f

    .line 817
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    instance-of v5, v5, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    if-eqz v5, :cond_3f

    .line 819
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    .line 821
    .local v3, "lp":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    iget v5, v3, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->viewType:I

    const/4 v6, -0x2

    if-eq v5, v6, :cond_3f

    .line 822
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v5

    iget v6, v3, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->column:I

    aget v6, v4, v6

    if-ge v5, v6, :cond_3f

    .line 823
    iget v5, v3, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->column:I

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v6

    aput v6, v4, v5

    .line 813
    .end local v3    # "lp":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    :cond_3f
    add-int/lit8 v2, v2, 0x1

    goto :goto_b
.end method

.method private getHighestPositionedBottom()I
    .registers 3

    .prologue
    .line 1110
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedBottomColumn()I

    move-result v0

    .line 1111
    .local v0, "column":I
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v1, v1, v0

    return v1
.end method

.method private getHighestPositionedBottomColumn()I
    .registers 6

    .prologue
    .line 1120
    const/4 v1, 0x0

    .line 1121
    .local v1, "columnFound":I
    const v2, 0x7fffffff

    .line 1123
    .local v2, "highestPositionedBottom":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getMinColumnCount()I

    move-result v4

    if-lt v3, v4, :cond_c

    .line 1132
    return v1

    .line 1124
    :cond_c
    iget-object v4, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v0, v4, v3

    .line 1127
    .local v0, "bottom":I
    const/high16 v4, -0x80000000

    if-eq v4, v0, :cond_18

    if-ge v0, v2, :cond_18

    .line 1128
    move v2, v0

    .line 1129
    move v1, v3

    .line 1123
    :cond_18
    add-int/lit8 v3, v3, 0x1

    goto :goto_5
.end method

.method private getHighestPositionedTop()I
    .registers 3

    .prologue
    .line 1182
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedTopColumn()I

    move-result v0

    .line 1183
    .local v0, "column":I
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v1, v1, v0

    return v1
.end method

.method private getHighestPositionedTopColumn()I
    .registers 6

    .prologue
    .line 1187
    const/4 v0, 0x0

    .line 1188
    .local v0, "columnFound":I
    const v1, 0x7fffffff

    .line 1190
    .local v1, "highestPositionedTop":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getMinColumnCount()I

    move-result v4

    if-lt v2, v4, :cond_c

    .line 1197
    return v0

    .line 1191
    :cond_c
    iget-object v4, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v3, v4, v2

    .line 1192
    .local v3, "top":I
    const v4, 0x7fffffff

    if-eq v4, v3, :cond_19

    if-ge v3, v1, :cond_19

    .line 1193
    move v1, v3

    .line 1194
    move v0, v2

    .line 1190
    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method private getLowestPositionedBottom()I
    .registers 3

    .prologue
    .line 1136
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedBottomColumn()I

    move-result v0

    .line 1137
    .local v0, "column":I
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v1, v1, v0

    return v1
.end method

.method private getLowestPositionedBottomColumn()I
    .registers 6

    .prologue
    .line 1141
    const/4 v1, 0x0

    .line 1142
    .local v1, "columnFound":I
    const/high16 v3, -0x80000000

    .line 1144
    .local v3, "lowestPositionedBottom":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getMinColumnCount()I

    move-result v4

    if-lt v2, v4, :cond_b

    .line 1153
    return v1

    .line 1145
    :cond_b
    iget-object v4, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v0, v4, v2

    .line 1148
    .local v0, "bottom":I
    const/high16 v4, -0x80000000

    if-eq v4, v0, :cond_17

    if-le v0, v3, :cond_17

    .line 1149
    move v3, v0

    .line 1150
    move v1, v2

    .line 1144
    :cond_17
    add-int/lit8 v2, v2, 0x1

    goto :goto_4
.end method

.method private getLowestPositionedTop()I
    .registers 3

    .prologue
    .line 1161
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedTopColumn()I

    move-result v0

    .line 1162
    .local v0, "column":I
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v1, v1, v0

    return v1
.end method

.method private getLowestPositionedTopColumn()I
    .registers 6

    .prologue
    .line 1166
    const/4 v0, 0x0

    .line 1169
    .local v0, "columnFound":I
    const/high16 v2, -0x80000000

    .line 1171
    .local v2, "lowestPositionedTop":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getMinColumnCount()I

    move-result v4

    if-lt v1, v4, :cond_b

    .line 1178
    return v0

    .line 1172
    :cond_b
    iget-object v4, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v3, v4, v1

    .line 1173
    .local v3, "top":I
    const v4, 0x7fffffff

    if-eq v4, v3, :cond_18

    if-le v3, v2, :cond_18

    .line 1174
    move v2, v3

    .line 1175
    move v0, v1

    .line 1171
    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method private getMinColumnCount()I
    .registers 3

    .prologue
    .line 1115
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getCount()I

    move-result v0

    .line 1116
    .local v0, "itemCount":I
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    return v1
.end method

.method private getOrCreateRecord(I)Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 1041
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mPositionData:Landroid/util/SparseArray;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;

    .line 1042
    .local v0, "rec":Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    if-nez v0, :cond_15

    .line 1043
    new-instance v0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;

    .end local v0    # "rec":Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    invoke-direct {v0}, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;-><init>()V

    .line 1044
    .restart local v0    # "rec":Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mPositionData:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 1046
    :cond_15
    return-object v0
.end method

.method private getPositionColumn(I)I
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 1050
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mPositionData:Landroid/util/SparseArray;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;

    .line 1051
    .local v0, "rec":Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    if-eqz v0, :cond_e

    iget v1, v0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->column:I

    :goto_d
    return v1

    :cond_e
    const/4 v1, -0x1

    goto :goto_d
.end method

.method private getSafeBottom(I)I
    .registers 4
    .param p1, "column"    # I

    .prologue
    .line 425
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v0, v1, p1

    .line 426
    .local v0, "value":I
    const/high16 v1, -0x80000000

    if-eq v1, v0, :cond_9

    .line 429
    .end local v0    # "value":I
    :goto_8
    return v0

    .restart local v0    # "value":I
    :cond_9
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedBottom()I

    move-result v0

    goto :goto_8
.end method

.method private getSafeTop(I)I
    .registers 4
    .param p1, "column"    # I

    .prologue
    .line 433
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v0, v1, p1

    .line 434
    .local v0, "value":I
    const v1, 0x7fffffff

    if-eq v1, v0, :cond_a

    .line 437
    .end local v0    # "value":I
    :goto_9
    return v0

    .restart local v0    # "value":I
    :cond_a
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedTop()I

    move-result v0

    goto :goto_9
.end method

.method private initColumnBottoms()V
    .registers 4

    .prologue
    .line 1095
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getPaddingTop()I

    move-result v1

    iget v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mGridPaddingTop:I

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 1096
    return-void
.end method

.method private initColumnLefts()V
    .registers 4

    .prologue
    .line 1099
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-lt v0, v1, :cond_6

    .line 1102
    return-void

    .line 1100
    :cond_6
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnLefts:[I

    invoke-direct {p0, v0}, Lcom/etsy/android/grid/StaggeredGridView;->calculateColumnLeft(I)I

    move-result v2

    aput v2, v1, v0

    .line 1099
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private initColumnTops()V
    .registers 4

    .prologue
    .line 1091
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getPaddingTop()I

    move-result v1

    iget v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mGridPaddingTop:I

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 1092
    return-void
.end method

.method private initColumnTopsAndBottoms()V
    .registers 1

    .prologue
    .line 1086
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->initColumnTops()V

    .line 1087
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->initColumnBottoms()V

    .line 1088
    return-void
.end method

.method private isHeaderOrFooter(I)Z
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 1060
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1, p1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v0

    .line 1061
    .local v0, "viewType":I
    const/4 v1, -0x2

    if-ne v0, v1, :cond_b

    const/4 v1, 0x1

    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method private layoutGridChild(Landroid/view/View;IZII)V
    .registers 14
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "flowDown"    # Z
    .param p4, "childrenLeft"    # I
    .param p5, "childRight"    # I

    .prologue
    .line 444
    invoke-direct {p0, p2}, Lcom/etsy/android/grid/StaggeredGridView;->getPositionColumn(I)I

    move-result v2

    .line 449
    .local v2, "column":I
    invoke-direct {p0, p2}, Lcom/etsy/android/grid/StaggeredGridView;->getChildTopMargin(I)I

    move-result v1

    .line 450
    .local v1, "childTopMargin":I
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildBottomMargin()I

    move-result v0

    .line 451
    .local v0, "childBottomMargin":I
    add-int v6, v1, v0

    .line 453
    .local v6, "verticalMargins":I
    if-eqz p3, :cond_2f

    .line 455
    invoke-direct {p0, v2}, Lcom/etsy/android/grid/StaggeredGridView;->getSafeBottom(I)I

    move-result v4

    .line 456
    .local v4, "gridChildTop":I
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildHeight(Landroid/view/View;)I

    move-result v7

    add-int/2addr v7, v6

    add-int v3, v4, v7

    .line 471
    .local v3, "gridChildBottom":I
    :goto_1b
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    .line 472
    .local v5, "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    iput v2, v5, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->column:I

    .line 474
    invoke-direct {p0, v2, v3}, Lcom/etsy/android/grid/StaggeredGridView;->updateColumnBottomIfNeeded(II)V

    .line 475
    invoke-direct {p0, v2, v4}, Lcom/etsy/android/grid/StaggeredGridView;->updateColumnTopIfNeeded(II)V

    .line 478
    add-int/2addr v4, v1

    .line 479
    sub-int/2addr v3, v0

    .line 481
    invoke-virtual {p1, p4, v4, p5, v3}, Landroid/view/View;->layout(IIII)V

    .line 482
    return-void

    .line 460
    .end local v3    # "gridChildBottom":I
    .end local v4    # "gridChildTop":I
    .end local v5    # "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    :cond_2f
    invoke-direct {p0, v2}, Lcom/etsy/android/grid/StaggeredGridView;->getSafeTop(I)I

    move-result v3

    .line 461
    .restart local v3    # "gridChildBottom":I
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildHeight(Landroid/view/View;)I

    move-result v7

    add-int/2addr v7, v6

    sub-int v4, v3, v7

    .restart local v4    # "gridChildTop":I
    goto :goto_1b
.end method

.method private layoutGridHeaderFooter(Landroid/view/View;IZIIII)V
    .registers 17
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "flowDown"    # Z
    .param p4, "childrenLeft"    # I
    .param p5, "childTop"    # I
    .param p6, "childRight"    # I
    .param p7, "childBottom"    # I

    .prologue
    .line 404
    if-eqz p3, :cond_1b

    .line 405
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedBottom()I

    move-result v5

    .line 406
    .local v5, "gridChildTop":I
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildHeight(Landroid/view/View;)I

    move-result v0

    add-int v7, v5, v0

    .line 413
    .local v7, "gridChildBottom":I
    :goto_c
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_d
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-lt v8, v0, :cond_26

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v6, p6

    .line 418
    invoke-super/range {v0 .. v7}, Lcom/etsy/android/grid/ExtendableListView;->onLayoutChild(Landroid/view/View;IZIIII)V

    .line 420
    return-void

    .line 409
    .end local v5    # "gridChildTop":I
    .end local v7    # "gridChildBottom":I
    .end local v8    # "i":I
    :cond_1b
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedTop()I

    move-result v7

    .line 410
    .restart local v7    # "gridChildBottom":I
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildHeight(Landroid/view/View;)I

    move-result v0

    sub-int v5, v7, v0

    .restart local v5    # "gridChildTop":I
    goto :goto_c

    .line 414
    .restart local v8    # "i":I
    :cond_26
    invoke-direct {p0, v8, v5}, Lcom/etsy/android/grid/StaggeredGridView;->updateColumnTopIfNeeded(II)V

    .line 415
    invoke-direct {p0, v8, v7}, Lcom/etsy/android/grid/StaggeredGridView;->updateColumnBottomIfNeeded(II)V

    .line 413
    add-int/lit8 v8, v8, 0x1

    goto :goto_d
.end method

.method private offsetAllColumnsTopAndBottom(I)V
    .registers 4
    .param p1, "offset"    # I

    .prologue
    .line 741
    if-eqz p1, :cond_7

    .line 742
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-lt v0, v1, :cond_8

    .line 746
    .end local v0    # "i":I
    :cond_7
    return-void

    .line 743
    .restart local v0    # "i":I
    :cond_8
    invoke-direct {p0, p1, v0}, Lcom/etsy/android/grid/StaggeredGridView;->offsetColumnTopAndBottom(II)V

    .line 742
    add-int/lit8 v0, v0, 0x1

    goto :goto_3
.end method

.method private offsetColumnTopAndBottom(II)V
    .registers 5
    .param p1, "offset"    # I
    .param p2, "column"    # I

    .prologue
    .line 749
    if-eqz p1, :cond_21

    .line 754
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v0, v0, p2

    const v1, 0x7fffffff

    if-eq v0, v1, :cond_12

    .line 755
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v1, v0, p2

    add-int/2addr v1, p1

    aput v1, v0, p2

    .line 757
    :cond_12
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v0, v0, p2

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_21

    .line 758
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v1, v0, p2

    add-int/2addr v1, p1

    aput v1, v0, p2

    .line 761
    :cond_21
    return-void
.end method

.method private offsetDistanceToTop(I)V
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 732
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mDistanceToTop:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mDistanceToTop:I

    .line 734
    return-void
.end method

.method private offsetGridChild(Landroid/view/View;IZII)V
    .registers 19
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "flowDown"    # Z
    .param p4, "childrenLeft"    # I
    .param p5, "childTop"    # I

    .prologue
    .line 523
    invoke-direct {p0, p2}, Lcom/etsy/android/grid/StaggeredGridView;->getPositionColumn(I)I

    move-result v8

    .line 528
    .local v8, "column":I
    invoke-direct {p0, p2}, Lcom/etsy/android/grid/StaggeredGridView;->getChildTopMargin(I)I

    move-result v7

    .line 529
    .local v7, "childTopMargin":I
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildBottomMargin()I

    move-result v6

    .line 530
    .local v6, "childBottomMargin":I
    add-int v12, v7, v6

    .line 532
    .local v12, "verticalMargins":I
    if-eqz p3, :cond_36

    .line 534
    invoke-direct {p0, v8}, Lcom/etsy/android/grid/StaggeredGridView;->getSafeBottom(I)I

    move-result v10

    .line 535
    .local v10, "gridChildTop":I
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildHeight(Landroid/view/View;)I

    move-result v0

    add-int/2addr v0, v12

    add-int v9, v10, v0

    .line 551
    .local v9, "gridChildBottom":I
    :goto_1b
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    .line 552
    .local v11, "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    iput v8, v11, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->column:I

    .line 554
    invoke-direct {p0, v8, v9}, Lcom/etsy/android/grid/StaggeredGridView;->updateColumnBottomIfNeeded(II)V

    .line 555
    invoke-direct {p0, v8, v10}, Lcom/etsy/android/grid/StaggeredGridView;->updateColumnTopIfNeeded(II)V

    .line 557
    add-int v5, v10, v7

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    invoke-super/range {v0 .. v5}, Lcom/etsy/android/grid/ExtendableListView;->onOffsetChild(Landroid/view/View;IZII)V

    .line 558
    return-void

    .line 539
    .end local v9    # "gridChildBottom":I
    .end local v10    # "gridChildTop":I
    .end local v11    # "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    :cond_36
    invoke-direct {p0, v8}, Lcom/etsy/android/grid/StaggeredGridView;->getSafeTop(I)I

    move-result v9

    .line 540
    .restart local v9    # "gridChildBottom":I
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildHeight(Landroid/view/View;)I

    move-result v0

    add-int/2addr v0, v12

    sub-int v10, v9, v0

    .restart local v10    # "gridChildTop":I
    goto :goto_1b
.end method

.method private offsetGridHeaderFooter(Landroid/view/View;IZII)V
    .registers 14
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "flowDown"    # Z
    .param p4, "childrenLeft"    # I
    .param p5, "childTop"    # I

    .prologue
    .line 504
    if-eqz p3, :cond_1a

    .line 505
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedBottom()I

    move-result v5

    .line 506
    .local v5, "gridChildTop":I
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildHeight(Landroid/view/View;)I

    move-result v0

    add-int v6, v5, v0

    .line 513
    .local v6, "gridChildBottom":I
    :goto_c
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_d
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-lt v7, v0, :cond_25

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 518
    invoke-super/range {v0 .. v5}, Lcom/etsy/android/grid/ExtendableListView;->onOffsetChild(Landroid/view/View;IZII)V

    .line 519
    return-void

    .line 509
    .end local v5    # "gridChildTop":I
    .end local v6    # "gridChildBottom":I
    .end local v7    # "i":I
    :cond_1a
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedTop()I

    move-result v6

    .line 510
    .restart local v6    # "gridChildBottom":I
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildHeight(Landroid/view/View;)I

    move-result v0

    sub-int v5, v6, v0

    .restart local v5    # "gridChildTop":I
    goto :goto_c

    .line 514
    .restart local v7    # "i":I
    :cond_25
    invoke-direct {p0, v7, v5}, Lcom/etsy/android/grid/StaggeredGridView;->updateColumnTopIfNeeded(II)V

    .line 515
    invoke-direct {p0, v7, v6}, Lcom/etsy/android/grid/StaggeredGridView;->updateColumnBottomIfNeeded(II)V

    .line 513
    add-int/lit8 v7, v7, 0x1

    goto :goto_d
.end method

.method private onColumnSync()V
    .registers 22

    .prologue
    .line 939
    move-object/from16 v0, p0

    iget v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mSyncPosition:I

    move/from16 v16, v0

    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/StaggeredGridView;->getCount()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 941
    .local v13, "syncPosition":I
    new-instance v10, Landroid/util/SparseArray;

    invoke-direct {v10, v13}, Landroid/util/SparseArray;-><init>(I)V

    .line 942
    .local v10, "positionHeightRatios":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/Double;>;"
    const/4 v9, 0x0

    .local v9, "pos":I
    :goto_16
    if-lt v9, v13, :cond_68

    .line 951
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mPositionData:Landroid/util/SparseArray;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/util/SparseArray;->clear()V

    .line 958
    const/4 v9, 0x0

    :goto_22
    if-lt v9, v13, :cond_ad

    .line 999
    invoke-direct/range {p0 .. p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedBottomColumn()I

    move-result v12

    .line 1000
    .local v12, "syncColumn":I
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v12}, Lcom/etsy/android/grid/StaggeredGridView;->setPositionColumn(II)V

    .line 1004
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    move-object/from16 v16, v0

    aget v14, v16, v12

    .line 1005
    .local v14, "syncToBottom":I
    neg-int v0, v14

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mSpecificTop:I

    move/from16 v17, v0

    add-int v8, v16, v17

    .line 1007
    .local v8, "offset":I
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/etsy/android/grid/StaggeredGridView;->offsetAllColumnsTopAndBottom(I)V

    .line 1010
    neg-int v0, v14

    move/from16 v16, v0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/etsy/android/grid/StaggeredGridView;->mDistanceToTop:I

    .line 1013
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    move/from16 v20, v0

    invoke-static/range {v16 .. v20}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1014
    return-void

    .line 944
    .end local v8    # "offset":I
    .end local v12    # "syncColumn":I
    .end local v14    # "syncToBottom":I
    :cond_68
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mPositionData:Landroid/util/SparseArray;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;

    .line 945
    .local v11, "rec":Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    if-eqz v11, :cond_18

    .line 947
    const-string v16, "StaggeredGridView"

    new-instance v17, Ljava/lang/StringBuilder;

    const-string v18, "onColumnSync:"

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " ratio:"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-wide v0, v11, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->heightRatio:D

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 948
    iget-wide v0, v11, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->heightRatio:D

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v10, v9, v0}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 942
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_16

    .line 959
    .end local v11    # "rec":Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    :cond_ad
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/etsy/android/grid/StaggeredGridView;->getOrCreateRecord(I)Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;

    move-result-object v11

    .line 960
    .restart local v11    # "rec":Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    invoke-virtual {v10, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Double;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    .line 961
    .local v6, "heightRatio":D
    move-object/from16 v0, p0

    iget v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnWidth:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-double v0, v0

    move-wide/from16 v16, v0

    mul-double v16, v16, v6

    move-wide/from16 v0, v16

    double-to-int v4, v0

    .line 962
    .local v4, "height":I
    iput-wide v6, v11, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->heightRatio:D

    .line 967
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v16

    if-eqz v16, :cond_ff

    .line 969
    invoke-direct/range {p0 .. p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedBottom()I

    move-result v15

    .line 970
    .local v15, "top":I
    add-int v2, v15, v4

    .line 972
    .local v2, "bottom":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_de
    move-object/from16 v0, p0

    iget v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-lt v5, v0, :cond_ec

    .line 958
    .end local v5    # "i":I
    :goto_e8
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_22

    .line 973
    .restart local v5    # "i":I
    :cond_ec
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    move-object/from16 v16, v0

    aput v15, v16, v5

    .line 974
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    move-object/from16 v16, v0

    aput v2, v16, v5

    .line 972
    add-int/lit8 v5, v5, 0x1

    goto :goto_de

    .line 979
    .end local v2    # "bottom":I
    .end local v5    # "i":I
    .end local v15    # "top":I
    :cond_ff
    invoke-direct/range {p0 .. p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedBottomColumn()I

    move-result v3

    .line 981
    .local v3, "column":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    move-object/from16 v16, v0

    aget v15, v16, v3

    .line 982
    .restart local v15    # "top":I
    add-int v16, v15, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/etsy/android/grid/StaggeredGridView;->getChildTopMargin(I)I

    move-result v17

    add-int v16, v16, v17

    invoke-direct/range {p0 .. p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildBottomMargin()I

    move-result v17

    add-int v2, v16, v17

    .line 984
    .restart local v2    # "bottom":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    move-object/from16 v16, v0

    aput v15, v16, v3

    .line 985
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    move-object/from16 v16, v0

    aput v2, v16, v3

    .line 987
    iput v3, v11, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->column:I

    goto :goto_e8
.end method

.method private preLayoutChildren()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 366
    iget-boolean v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mNeedSync:Z

    if-nez v0, :cond_14

    .line 367
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    invoke-static {v0, v3}, Ljava/util/Arrays;->fill([II)V

    .line 375
    :goto_a
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    iget v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 376
    return-void

    .line 370
    :cond_14
    iput-boolean v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mNeedSync:Z

    goto :goto_a
.end method

.method private requestLayoutChildren()V
    .registers 4

    .prologue
    .line 351
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildCount()I

    move-result v0

    .line 352
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-lt v1, v0, :cond_8

    .line 356
    return-void

    .line 353
    :cond_8
    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 354
    .local v2, "v":Landroid/view/View;
    if-eqz v2, :cond_11

    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    .line 352
    :cond_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method private setPositionColumn(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "column"    # I

    .prologue
    .line 1022
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getOrCreateRecord(I)Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;

    move-result-object v0

    .line 1023
    .local v0, "rec":Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    iput p2, v0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->column:I

    .line 1024
    return-void
.end method

.method private setPositionHeightRatio(II)V
    .registers 9
    .param p1, "position"    # I
    .param p2, "height"    # I

    .prologue
    .line 1027
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getOrCreateRecord(I)Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;

    move-result-object v0

    .line 1028
    .local v0, "rec":Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    int-to-double v2, p2

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnWidth:I

    int-to-double v4, v1

    div-double/2addr v2, v4

    iput-wide v2, v0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->heightRatio:D

    .line 1033
    return-void
.end method

.method private setPositionIsHeaderFooter(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 1036
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getOrCreateRecord(I)Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;

    move-result-object v0

    .line 1037
    .local v0, "rec":Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/etsy/android/grid/StaggeredGridView$GridItemRecord;->isHeaderFooter:Z

    .line 1038
    return-void
.end method

.method private updateColumnBottomIfNeeded(II)V
    .registers 4
    .param p1, "column"    # I
    .param p2, "childBottom"    # I

    .prologue
    .line 601
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v0, v0, p1

    if-le p2, v0, :cond_a

    .line 602
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aput p2, v0, p1

    .line 604
    :cond_a
    return-void
.end method

.method private updateColumnTopIfNeeded(II)V
    .registers 4
    .param p1, "column"    # I
    .param p2, "childTop"    # I

    .prologue
    .line 595
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v0, v0, p1

    if-ge p2, v0, :cond_a

    .line 596
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aput p2, v0, p1

    .line 598
    :cond_a
    return-void
.end method


# virtual methods
.method protected adjustViewsAfterFillGap(Z)V
    .registers 2
    .param p1, "down"    # Z

    .prologue
    .line 765
    invoke-super {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->adjustViewsAfterFillGap(Z)V

    .line 768
    if-nez p1, :cond_8

    .line 769
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->alignTops()V

    .line 771
    :cond_8
    return-void
.end method

.method protected generateChildLayoutParams(Landroid/view/View;)Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    .registers 6
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 575
    const/4 v1, 0x0

    .line 577
    .local v1, "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 578
    .local v0, "childParams":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v0, :cond_e

    .line 579
    instance-of v2, v0, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    if-eqz v2, :cond_19

    move-object v1, v0

    .line 580
    check-cast v1, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    .line 586
    :cond_e
    :goto_e
    if-nez v1, :cond_18

    .line 587
    new-instance v1, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    .line 588
    .end local v1    # "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    iget v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnWidth:I

    const/4 v3, -0x2

    .line 587
    invoke-direct {v1, v2, v3}, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;-><init>(II)V

    .line 591
    .restart local v1    # "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    :cond_18
    return-object v1

    .line 583
    :cond_19
    new-instance v1, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    .end local v1    # "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    invoke-direct {v1, v0}, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .restart local v1    # "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    goto :goto_e
.end method

.method protected getChildBottom(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 647
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 648
    invoke-super {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->getChildBottom(I)I

    move-result v1

    .line 655
    :goto_a
    return v1

    .line 651
    :cond_b
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getPositionColumn(I)I

    move-result v0

    .line 652
    .local v0, "column":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_17

    .line 653
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedTop()I

    move-result v1

    goto :goto_a

    .line 655
    :cond_17
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v1, v1, v0

    goto :goto_a
.end method

.method protected getChildLeft(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 608
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 609
    invoke-super {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->getChildLeft(I)I

    move-result v1

    .line 613
    :goto_a
    return v1

    .line 612
    :cond_b
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getPositionColumn(I)I

    move-result v0

    .line 613
    .local v0, "column":I
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnLefts:[I

    aget v1, v1, v0

    goto :goto_a
.end method

.method protected getChildTop(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 619
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 620
    invoke-super {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->getChildTop(I)I

    move-result v1

    .line 627
    :goto_a
    return v1

    .line 623
    :cond_b
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getPositionColumn(I)I

    move-result v0

    .line 624
    .local v0, "column":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_17

    .line 625
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedBottom()I

    move-result v1

    goto :goto_a

    .line 627
    :cond_17
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v1, v1, v0

    goto :goto_a
.end method

.method public getColumnWidth()I
    .registers 2

    .prologue
    .line 310
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnWidth:I

    return v0
.end method

.method public getDistanceToTop()I
    .registers 2

    .prologue
    .line 737
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mDistanceToTop:I

    return v0
.end method

.method protected getFirstChildTop()I
    .registers 2

    .prologue
    .line 684
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mFirstPosition:I

    invoke-direct {p0, v0}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 685
    invoke-super {p0}, Lcom/etsy/android/grid/ExtendableListView;->getFirstChildTop()I

    move-result v0

    .line 687
    :goto_c
    return v0

    :cond_d
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedTop()I

    move-result v0

    goto :goto_c
.end method

.method protected getHighestChildTop()I
    .registers 2

    .prologue
    .line 692
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mFirstPosition:I

    invoke-direct {p0, v0}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 693
    invoke-super {p0}, Lcom/etsy/android/grid/ExtendableListView;->getHighestChildTop()I

    move-result v0

    .line 695
    :goto_c
    return v0

    :cond_d
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedTop()I

    move-result v0

    goto :goto_c
.end method

.method protected getLastChildBottom()I
    .registers 4

    .prologue
    .line 675
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    add-int v0, v1, v2

    .line 676
    .local v0, "lastPosition":I
    invoke-direct {p0, v0}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 677
    invoke-super {p0}, Lcom/etsy/android/grid/ExtendableListView;->getLastChildBottom()I

    move-result v1

    .line 679
    :goto_14
    return v1

    :cond_15
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedBottom()I

    move-result v1

    goto :goto_14
.end method

.method protected getLowestChildBottom()I
    .registers 4

    .prologue
    .line 700
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    add-int v0, v1, v2

    .line 701
    .local v0, "lastPosition":I
    invoke-direct {p0, v0}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 702
    invoke-super {p0}, Lcom/etsy/android/grid/ExtendableListView;->getLowestChildBottom()I

    move-result v1

    .line 704
    :goto_14
    return v1

    :cond_15
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedBottom()I

    move-result v1

    goto :goto_14
.end method

.method protected getNextChildDownsTop(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 637
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 638
    invoke-super {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->getNextChildDownsTop(I)I

    move-result v0

    .line 641
    :goto_a
    return v0

    :cond_b
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHighestPositionedBottom()I

    move-result v0

    goto :goto_a
.end method

.method protected getNextChildUpsBottom(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 665
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 666
    invoke-super {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->getNextChildUpsBottom(I)I

    move-result v0

    .line 669
    :goto_a
    return v0

    :cond_b
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedTop()I

    move-result v0

    goto :goto_a
.end method

.method public getRowPaddingBottom()I
    .registers 3

    .prologue
    .line 214
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getListPaddingBottom()I

    move-result v0

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mGridPaddingBottom:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getRowPaddingLeft()I
    .registers 3

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getListPaddingLeft()I

    move-result v0

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mGridPaddingLeft:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getRowPaddingRight()I
    .registers 3

    .prologue
    .line 206
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getListPaddingRight()I

    move-result v0

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mGridPaddingRight:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getRowPaddingTop()I
    .registers 3

    .prologue
    .line 210
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getListPaddingTop()I

    move-result v0

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mGridPaddingTop:I

    add-int/2addr v0, v1

    return v0
.end method

.method protected hasSpaceUp()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 880
    iget-boolean v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mClipToPadding:Z

    if-eqz v2, :cond_11

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getRowPaddingTop()I

    move-result v0

    .line 881
    .local v0, "end":I
    :goto_9
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getLowestPositionedTop()I

    move-result v2

    if-le v2, v0, :cond_10

    const/4 v1, 0x1

    :cond_10
    return v1

    .end local v0    # "end":I
    :cond_11
    move v0, v1

    .line 880
    goto :goto_9
.end method

.method protected layoutChildren()V
    .registers 1

    .prologue
    .line 360
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->preLayoutChildren()V

    .line 361
    invoke-super {p0}, Lcom/etsy/android/grid/ExtendableListView;->layoutChildren()V

    .line 362
    return-void
.end method

.method protected offsetChildrenTopAndBottom(I)V
    .registers 2
    .param p1, "offset"    # I

    .prologue
    .line 709
    invoke-super {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->offsetChildrenTopAndBottom(I)V

    .line 710
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->offsetAllColumnsTopAndBottom(I)V

    .line 711
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->offsetDistanceToTop(I)V

    .line 712
    return-void
.end method

.method protected offsetChildrenTopAndBottom(II)V
    .registers 8
    .param p1, "offset"    # I
    .param p2, "column"    # I

    .prologue
    .line 716
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildCount()I

    move-result v0

    .line 717
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-lt v1, v0, :cond_b

    .line 728
    invoke-direct {p0, p1, p2}, Lcom/etsy/android/grid/StaggeredGridView;->offsetColumnTopAndBottom(II)V

    .line 729
    return-void

    .line 718
    :cond_b
    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 719
    .local v3, "v":Landroid/view/View;
    if-eqz v3, :cond_2c

    .line 720
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    if-eqz v4, :cond_2c

    .line 721
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    instance-of v4, v4, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    if-eqz v4, :cond_2c

    .line 722
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    .line 723
    .local v2, "lp":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    iget v4, v2, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->column:I

    if-ne v4, p2, :cond_2c

    .line 724
    invoke-virtual {v3, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 717
    .end local v2    # "lp":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    :cond_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method protected onChildCreated(IZ)V
    .registers 5
    .param p1, "position"    # I
    .param p2, "flowDown"    # Z

    .prologue
    .line 337
    invoke-super {p0, p1, p2}, Lcom/etsy/android/grid/ExtendableListView;->onChildCreated(IZ)V

    .line 338
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v1

    if-nez v1, :cond_11

    .line 340
    invoke-direct {p0, p1, p2}, Lcom/etsy/android/grid/StaggeredGridView;->getChildColumn(IZ)I

    move-result v0

    .line 341
    .local v0, "column":I
    invoke-direct {p0, p1, v0}, Lcom/etsy/android/grid/StaggeredGridView;->setPositionColumn(II)V

    .line 348
    .end local v0    # "column":I
    :goto_10
    return-void

    .line 346
    :cond_11
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->setPositionIsHeaderFooter(I)V

    goto :goto_10
.end method

.method protected onChildrenDetached(II)V
    .registers 14
    .param p1, "start"    # I
    .param p2, "count"    # I

    .prologue
    .line 833
    invoke-super {p0, p1, p2}, Lcom/etsy/android/grid/ExtendableListView;->onChildrenDetached(II)V

    .line 837
    iget-object v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    const v10, 0x7fffffff

    invoke-static {v9, v10}, Ljava/util/Arrays;->fill([II)V

    .line 839
    iget-object v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    const/high16 v10, -0x80000000

    invoke-static {v9, v10}, Ljava/util/Arrays;->fill([II)V

    .line 841
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_13
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildCount()I

    move-result v9

    if-lt v6, v9, :cond_1a

    .line 876
    return-void

    .line 842
    :cond_1a
    invoke-virtual {p0, v6}, Lcom/etsy/android/grid/StaggeredGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 843
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_5d

    .line 844
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    .line 845
    .local v2, "childParams":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    iget v9, v2, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->viewType:I

    const/4 v10, -0x2

    if-eq v9, v10, :cond_60

    .line 846
    instance-of v9, v2, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    if-eqz v9, :cond_60

    move-object v7, v2

    .line 847
    check-cast v7, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;

    .line 848
    .local v7, "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    iget v5, v7, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->column:I

    .line 849
    .local v5, "column":I
    iget v8, v7, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->position:I

    .line 850
    .local v8, "position":I
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    .line 851
    .local v3, "childTop":I
    iget-object v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v9, v9, v5

    if-ge v3, v9, :cond_4a

    .line 852
    iget-object v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    invoke-direct {p0, v8}, Lcom/etsy/android/grid/StaggeredGridView;->getChildTopMargin(I)I

    move-result v10

    sub-int v10, v3, v10

    aput v10, v9, v5

    .line 854
    :cond_4a
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v1

    .line 855
    .local v1, "childBottom":I
    iget-object v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v9, v9, v5

    if-le v1, v9, :cond_5d

    .line 856
    iget-object v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildBottomMargin()I

    move-result v10

    add-int/2addr v10, v1

    aput v10, v9, v5

    .line 841
    .end local v1    # "childBottom":I
    .end local v2    # "childParams":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    .end local v3    # "childTop":I
    .end local v5    # "column":I
    .end local v7    # "layoutParams":Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
    .end local v8    # "position":I
    :cond_5d
    add-int/lit8 v6, v6, 0x1

    goto :goto_13

    .line 861
    .restart local v2    # "childParams":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    :cond_60
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    .line 862
    .restart local v3    # "childTop":I
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v1

    .line 864
    .restart local v1    # "childBottom":I
    const/4 v4, 0x0

    .local v4, "col":I
    :goto_69
    iget v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-ge v4, v9, :cond_5d

    .line 865
    iget-object v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aget v9, v9, v4

    if-ge v3, v9, :cond_77

    .line 866
    iget-object v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    aput v3, v9, v4

    .line 868
    :cond_77
    iget-object v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aget v9, v9, v4

    if-le v1, v9, :cond_81

    .line 869
    iget-object v9, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    aput v1, v9, v4

    .line 864
    :cond_81
    add-int/lit8 v4, v4, 0x1

    goto :goto_69
.end method

.method protected onLayoutChild(Landroid/view/View;IZIIII)V
    .registers 14
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "flowDown"    # Z
    .param p4, "childrenLeft"    # I
    .param p5, "childTop"    # I
    .param p6, "childRight"    # I
    .param p7, "childBottom"    # I

    .prologue
    .line 390
    invoke-direct {p0, p2}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 391
    invoke-direct/range {p0 .. p7}, Lcom/etsy/android/grid/StaggeredGridView;->layoutGridHeaderFooter(Landroid/view/View;IZIIII)V

    .line 396
    :goto_9
    return-void

    :cond_a
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p6

    .line 394
    invoke-direct/range {v0 .. v5}, Lcom/etsy/android/grid/StaggeredGridView;->layoutGridChild(Landroid/view/View;IZII)V

    goto :goto_9
.end method

.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 250
    invoke-super {p0, p1, p2}, Lcom/etsy/android/grid/ExtendableListView;->onMeasure(II)V

    .line 252
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-gtz v1, :cond_18

    .line 253
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getMeasuredHeight()I

    move-result v2

    if-le v1, v2, :cond_5f

    const/4 v0, 0x1

    .line 254
    .local v0, "isLandscape":Z
    :goto_12
    if-eqz v0, :cond_61

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountLandscape:I

    :goto_16
    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    .line 261
    .end local v0    # "isLandscape":Z
    :cond_18
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getMeasuredWidth()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/etsy/android/grid/StaggeredGridView;->calculateColumnWidth(I)I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnWidth:I

    .line 263
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    if-eqz v1, :cond_2d

    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    array-length v1, v1

    iget v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-eq v1, v2, :cond_36

    .line 264
    :cond_2d
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    .line 265
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->initColumnTops()V

    .line 267
    :cond_36
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    if-eqz v1, :cond_41

    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    array-length v1, v1

    iget v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-eq v1, v2, :cond_4a

    .line 268
    :cond_41
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    .line 269
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->initColumnBottoms()V

    .line 271
    :cond_4a
    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnLefts:[I

    if-eqz v1, :cond_55

    iget-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnLefts:[I

    array-length v1, v1

    iget v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-eq v1, v2, :cond_5e

    .line 272
    :cond_55
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnLefts:[I

    .line 273
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->initColumnLefts()V

    .line 275
    :cond_5e
    return-void

    .line 253
    :cond_5f
    const/4 v0, 0x0

    goto :goto_12

    .line 254
    .restart local v0    # "isLandscape":Z
    :cond_61
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountPortrait:I

    goto :goto_16
.end method

.method protected onMeasureChild(Landroid/view/View;Lcom/etsy/android/grid/ExtendableListView$LayoutParams;)V
    .registers 11
    .param p1, "child"    # Landroid/view/View;
    .param p2, "layoutParams"    # Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    .prologue
    const/high16 v7, 0x40000000

    const/4 v6, -0x2

    .line 279
    iget v4, p2, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->viewType:I

    .line 280
    .local v4, "viewType":I
    iget v3, p2, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->position:I

    .line 282
    .local v3, "position":I
    if-eq v4, v6, :cond_c

    .line 283
    const/4 v5, -0x1

    if-ne v4, v5, :cond_17

    .line 285
    :cond_c
    invoke-super {p0, p1, p2}, Lcom/etsy/android/grid/ExtendableListView;->onMeasureChild(Landroid/view/View;Lcom/etsy/android/grid/ExtendableListView$LayoutParams;)V

    .line 302
    :goto_f
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->getChildHeight(Landroid/view/View;)I

    move-result v0

    .line 303
    .local v0, "childHeight":I
    invoke-direct {p0, v3, v0}, Lcom/etsy/android/grid/StaggeredGridView;->setPositionHeightRatio(II)V

    .line 307
    return-void

    .line 291
    .end local v0    # "childHeight":I
    :cond_17
    iget v5, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnWidth:I

    invoke-static {v5, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 293
    .local v2, "childWidthSpec":I
    iget v5, p2, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->height:I

    if-lez v5, :cond_2b

    .line 294
    iget v5, p2, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->height:I

    invoke-static {v5, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 299
    .local v1, "childHeightSpec":I
    :goto_27
    invoke-virtual {p1, v2, v1}, Landroid/view/View;->measure(II)V

    goto :goto_f

    .line 297
    .end local v1    # "childHeightSpec":I
    :cond_2b
    const/4 v5, 0x0

    invoke-static {v6, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .restart local v1    # "childHeightSpec":I
    goto :goto_27
.end method

.method protected onOffsetChild(Landroid/view/View;IZII)V
    .registers 7
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "flowDown"    # Z
    .param p4, "childrenLeft"    # I
    .param p5, "childTop"    # I

    .prologue
    .line 489
    invoke-direct {p0, p2}, Lcom/etsy/android/grid/StaggeredGridView;->isHeaderOrFooter(I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 491
    invoke-direct/range {p0 .. p5}, Lcom/etsy/android/grid/StaggeredGridView;->offsetGridHeaderFooter(Landroid/view/View;IZII)V

    .line 496
    :goto_9
    return-void

    .line 494
    :cond_a
    invoke-direct/range {p0 .. p5}, Lcom/etsy/android/grid/StaggeredGridView;->offsetGridChild(Landroid/view/View;IZII)V

    goto :goto_9
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 1330
    move-object v0, p1

    check-cast v0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;

    .line 1331
    .local v0, "ss":Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;
    iget v1, v0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnCount:I

    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    .line 1332
    iget-object v1, v0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnTops:[I

    iput-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    .line 1333
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    .line 1334
    iget-object v1, v0, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->positionData:Landroid/util/SparseArray;

    iput-object v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mPositionData:Landroid/util/SparseArray;

    .line 1335
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mNeedSync:Z

    .line 1336
    invoke-super {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1337
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 7

    .prologue
    const/4 v3, 0x0

    .line 1300
    invoke-super {p0}, Lcom/etsy/android/grid/ExtendableListView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    .line 1301
    .local v1, "listState":Lcom/etsy/android/grid/ExtendableListView$ListSavedState;
    new-instance v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;

    invoke-virtual {v1}, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1304
    .local v2, "ss":Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;
    iget-wide v4, v1, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->selectedId:J

    iput-wide v4, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->selectedId:J

    .line 1305
    iget-wide v4, v1, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->firstId:J

    iput-wide v4, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->firstId:J

    .line 1306
    iget v4, v1, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->viewTop:I

    iput v4, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->viewTop:I

    .line 1307
    iget v4, v1, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->position:I

    iput v4, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->position:I

    .line 1308
    iget v4, v1, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->height:I

    iput v4, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->height:I

    .line 1312
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getChildCount()I

    move-result v4

    if-lez v4, :cond_44

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getCount()I

    move-result v4

    if-lez v4, :cond_44

    const/4 v0, 0x1

    .line 1314
    .local v0, "haveChildren":Z
    :goto_31
    if-eqz v0, :cond_46

    iget v4, p0, Lcom/etsy/android/grid/StaggeredGridView;->mFirstPosition:I

    if-lez v4, :cond_46

    .line 1315
    iget v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    iput v3, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnCount:I

    .line 1316
    iget-object v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    iput-object v3, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnTops:[I

    .line 1317
    iget-object v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mPositionData:Landroid/util/SparseArray;

    iput-object v3, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->positionData:Landroid/util/SparseArray;

    .line 1325
    :goto_43
    return-object v2

    .end local v0    # "haveChildren":Z
    :cond_44
    move v0, v3

    .line 1312
    goto :goto_31

    .line 1320
    .restart local v0    # "haveChildren":Z
    :cond_46
    iget v4, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-ltz v4, :cond_4c

    iget v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    :cond_4c
    iput v3, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnCount:I

    .line 1321
    iget v3, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnCount:I

    new-array v3, v3, [I

    iput-object v3, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->columnTops:[I

    .line 1322
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    iput-object v3, v2, Lcom/etsy/android/grid/StaggeredGridView$GridListSavedState;->positionData:Landroid/util/SparseArray;

    goto :goto_43
.end method

.method protected onSizeChanged(II)V
    .registers 7
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    const/4 v2, 0x0

    .line 896
    invoke-super {p0, p1, p2}, Lcom/etsy/android/grid/ExtendableListView;->onSizeChanged(II)V

    .line 897
    if-le p1, p2, :cond_46

    const/4 v0, 0x1

    .line 898
    .local v0, "isLandscape":Z
    :goto_7
    if-eqz v0, :cond_48

    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountLandscape:I

    .line 899
    .local v1, "newColumnCount":I
    :goto_b
    iget v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-eq v3, v1, :cond_45

    .line 900
    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    .line 902
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/StaggeredGridView;->calculateColumnWidth(I)I

    move-result v3

    iput v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnWidth:I

    .line 904
    iget v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    .line 905
    iget v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    .line 906
    iget v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnLefts:[I

    .line 908
    iput v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mDistanceToTop:I

    .line 911
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->initColumnTopsAndBottoms()V

    .line 912
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->initColumnLefts()V

    .line 915
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getCount()I

    move-result v2

    if-lez v2, :cond_42

    iget-object v2, p0, Lcom/etsy/android/grid/StaggeredGridView;->mPositionData:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-lez v2, :cond_42

    .line 916
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->onColumnSync()V

    .line 919
    :cond_42
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->requestLayout()V

    .line 921
    :cond_45
    return-void

    .end local v0    # "isLandscape":Z
    .end local v1    # "newColumnCount":I
    :cond_46
    move v0, v2

    .line 897
    goto :goto_7

    .line 898
    .restart local v0    # "isLandscape":Z
    :cond_48
    iget v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountPortrait:I

    goto :goto_b
.end method

.method protected onSizeChanged(IIII)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 890
    invoke-super {p0, p1, p2, p3, p4}, Lcom/etsy/android/grid/ExtendableListView;->onSizeChanged(IIII)V

    .line 891
    invoke-virtual {p0, p1, p2}, Lcom/etsy/android/grid/StaggeredGridView;->onSizeChanged(II)V

    .line 892
    return-void
.end method

.method public resetToTop()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 314
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    if-lez v0, :cond_28

    .line 316
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    if-nez v0, :cond_f

    .line 317
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnTops:[I

    .line 319
    :cond_f
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    if-nez v0, :cond_19

    .line 320
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCount:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnBottoms:[I

    .line 322
    :cond_19
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->initColumnTopsAndBottoms()V

    .line 324
    iget-object v0, p0, Lcom/etsy/android/grid/StaggeredGridView;->mPositionData:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 325
    iput-boolean v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mNeedSync:Z

    .line 326
    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mDistanceToTop:I

    .line 327
    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/StaggeredGridView;->setSelection(I)V

    .line 329
    :cond_28
    return-void
.end method

.method public setColumnCount(I)V
    .registers 4
    .param p1, "columnCount"    # I

    .prologue
    .line 237
    iput p1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountPortrait:I

    .line 238
    iput p1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountLandscape:I

    .line 240
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/etsy/android/grid/StaggeredGridView;->onSizeChanged(II)V

    .line 241
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->requestLayoutChildren()V

    .line 242
    return-void
.end method

.method public setColumnCountLandscape(I)V
    .registers 4
    .param p1, "columnCountLandscape"    # I

    .prologue
    .line 231
    iput p1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountLandscape:I

    .line 232
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/etsy/android/grid/StaggeredGridView;->onSizeChanged(II)V

    .line 233
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->requestLayoutChildren()V

    .line 234
    return-void
.end method

.method public setColumnCountPortrait(I)V
    .registers 4
    .param p1, "columnCountPortrait"    # I

    .prologue
    .line 225
    iput p1, p0, Lcom/etsy/android/grid/StaggeredGridView;->mColumnCountPortrait:I

    .line 226
    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/etsy/android/grid/StaggeredGridView;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/etsy/android/grid/StaggeredGridView;->onSizeChanged(II)V

    .line 227
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView;->requestLayoutChildren()V

    .line 228
    return-void
.end method
