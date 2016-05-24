.class Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;
.super Ljava/lang/Object;
.source "LinearLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/LinearLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AnchorInfo"
.end annotation


# instance fields
.field mCoordinate:I

.field mLayoutFromEnd:Z

.field mPosition:I

.field final synthetic this$0:Landroid/support/v7/widget/LinearLayoutManager;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/LinearLayoutManager;)V
    .registers 2

    .prologue
    .line 2087
    iput-object p1, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$State;)Z
    .registers 4
    .param p0, "x0"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 2087
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->isViewValidAsAnchor(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v0

    return v0
.end method

.method private isViewValidAsAnchor(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$State;)Z
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 2117
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 2118
    .local v0, "lp":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v1

    if-nez v1, :cond_1e

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->getViewLayoutPosition()I

    move-result v1

    if-ltz v1, :cond_1e

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->getViewLayoutPosition()I

    move-result v1

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v2

    if-ge v1, v2, :cond_1e

    const/4 v1, 0x1

    :goto_1d
    return v1

    :cond_1e
    const/4 v1, 0x0

    goto :goto_1d
.end method


# virtual methods
.method assignCoordinateFromPadding()V
    .registers 2

    .prologue
    .line 2102
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    :goto_c
    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .line 2105
    return-void

    .line 2102
    :cond_f
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    goto :goto_c
.end method

.method public assignFromView(Landroid/view/View;)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 2170
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v0, :cond_20

    .line 2171
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v1, v1, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpaceChange()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .line 2177
    :goto_17
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 2178
    return-void

    .line 2174
    :cond_20
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto :goto_17
.end method

.method public assignFromViewAndKeepVisibleRect(Landroid/view/View;)V
    .registers 21
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 2123
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpaceChange()I

    move-result v14

    .line 2124
    .local v14, "spaceChange":I
    if-ltz v14, :cond_16

    .line 2125
    invoke-virtual/range {p0 .. p1}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignFromView(Landroid/view/View;)V

    .line 2167
    :cond_15
    :goto_15
    return-void

    .line 2128
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 2129
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    move/from16 v17, v0

    if-eqz v17, :cond_dd

    .line 2130
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v17

    sub-int v10, v17, v14

    .line 2131
    .local v10, "prevLayoutEnd":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v2

    .line 2132
    .local v2, "childEnd":I
    sub-int v11, v10, v2

    .line 2133
    .local v11, "previousEndMargin":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v17

    sub-int v17, v17, v11

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .line 2135
    if-lez v11, :cond_15

    .line 2136
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v3

    .line 2137
    .local v3, "childSize":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    move/from16 v17, v0

    sub-int v7, v17, v3

    .line 2138
    .local v7, "estimatedChildStart":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v9

    .line 2139
    .local v9, "layoutStart":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v17

    sub-int v13, v17, v9

    .line 2141
    .local v13, "previousStartMargin":I
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-static {v13, v0}, Ljava/lang/Math;->min(II)I

    move-result v17

    add-int v16, v9, v17

    .line 2142
    .local v16, "startReference":I
    sub-int v15, v7, v16

    .line 2143
    .local v15, "startMargin":I
    if-gez v15, :cond_15

    .line 2145
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    move/from16 v17, v0

    neg-int v0, v15

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-static {v11, v0}, Ljava/lang/Math;->min(II)I

    move-result v18

    add-int v17, v17, v18

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto/16 :goto_15

    .line 2149
    .end local v2    # "childEnd":I
    .end local v3    # "childSize":I
    .end local v7    # "estimatedChildStart":I
    .end local v9    # "layoutStart":I
    .end local v10    # "prevLayoutEnd":I
    .end local v11    # "previousEndMargin":I
    .end local v13    # "previousStartMargin":I
    .end local v15    # "startMargin":I
    .end local v16    # "startReference":I
    :cond_dd
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v4

    .line 2150
    .local v4, "childStart":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v17

    sub-int v15, v4, v17

    .line 2151
    .restart local v15    # "startMargin":I
    move-object/from16 v0, p0

    iput v4, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .line 2152
    if-lez v15, :cond_15

    .line 2153
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v17

    add-int v8, v4, v17

    .line 2155
    .local v8, "estimatedEnd":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v17

    sub-int v12, v17, v14

    .line 2157
    .local v12, "previousLayoutEnd":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v17

    sub-int v11, v12, v17

    .line 2159
    .restart local v11    # "previousEndMargin":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->this$0:Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v17

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-static {v0, v11}, Ljava/lang/Math;->min(II)I

    move-result v18

    sub-int v6, v17, v18

    .line 2161
    .local v6, "endReference":I
    sub-int v5, v6, v8

    .line 2162
    .local v5, "endMargin":I
    if-gez v5, :cond_15

    .line 2163
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    move/from16 v17, v0

    neg-int v0, v5

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-static {v15, v0}, Ljava/lang/Math;->min(II)I

    move-result v18

    sub-int v17, v17, v18

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto/16 :goto_15
.end method

.method reset()V
    .registers 2

    .prologue
    .line 2092
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 2093
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .line 2094
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 2095
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 2109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AnchorInfo{mPosition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mCoordinate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mLayoutFromEnd="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
