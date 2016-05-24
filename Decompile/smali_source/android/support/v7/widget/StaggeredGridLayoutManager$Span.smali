.class Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
.super Ljava/lang/Object;
.source "StaggeredGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/StaggeredGridLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Span"
.end annotation


# instance fields
.field mCachedEnd:I

.field mCachedStart:I

.field mDeletedSize:I

.field final mIndex:I

.field private mViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;I)V
    .registers 5
    .param p2, "index"    # I

    .prologue
    const/high16 v1, -0x80000000

    .line 2095
    iput-object p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2089
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    .line 2090
    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2091
    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2092
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2096
    iput p2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    .line 2097
    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;ILandroid/support/v7/widget/StaggeredGridLayoutManager$1;)V
    .registers 4
    .param p1, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager;
    .param p2, "x1"    # I
    .param p3, "x2"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$1;

    .prologue
    .line 2086
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;I)V

    return-void
.end method

.method static synthetic access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .prologue
    .line 2086
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method appendToSpan(Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/high16 v3, -0x80000000

    .line 2180
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v0

    .line 2181
    .local v0, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iput-object p0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 2182
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2183
    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2184
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1a

    .line 2185
    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2187
    :cond_1a
    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v1

    if-nez v1, :cond_26

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 2188
    :cond_26
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2190
    :cond_33
    return-void
.end method

.method cacheReferenceLineAndClear(ZI)V
    .registers 6
    .param p1, "reverseLayout"    # Z
    .param p2, "offset"    # I

    .prologue
    const/high16 v2, -0x80000000

    .line 2195
    if-eqz p1, :cond_e

    .line 2196
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v0

    .line 2200
    .local v0, "reference":I
    :goto_8
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    .line 2201
    if-ne v0, v2, :cond_13

    .line 2212
    :cond_d
    :goto_d
    return-void

    .line 2198
    .end local v0    # "reference":I
    :cond_e
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v0

    .restart local v0    # "reference":I
    goto :goto_8

    .line 2204
    :cond_13
    if-eqz p1, :cond_1f

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    if-lt v0, v1, :cond_d

    :cond_1f
    if-nez p1, :cond_2b

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    if-gt v0, v1, :cond_d

    .line 2208
    :cond_2b
    if-eq p2, v2, :cond_2e

    .line 2209
    add-int/2addr v0, p2

    .line 2211
    :cond_2e
    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    goto :goto_d
.end method

.method calculateCachedEnd()V
    .registers 6

    .prologue
    .line 2145
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 2146
    .local v0, "endView":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v2

    .line 2147
    .local v2, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v3

    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2148
    iget-boolean v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v3, :cond_40

    .line 2149
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFullSpanItem(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v1

    .line 2151
    .local v1, "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    if-eqz v1, :cond_40

    iget v3, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_40

    .line 2152
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    iget v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->getGapForSpan(I)I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2155
    .end local v1    # "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    :cond_40
    return-void
.end method

.method calculateCachedStart()V
    .registers 6

    .prologue
    .line 2111
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 2112
    .local v2, "startView":Landroid/view/View;
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v1

    .line 2113
    .local v1, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2114
    iget-boolean v3, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v3, :cond_39

    .line 2115
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFullSpanItem(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v0

    .line 2117
    .local v0, "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    if-eqz v0, :cond_39

    iget v3, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_39

    .line 2118
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    iget v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->getGapForSpan(I)I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2121
    .end local v0    # "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    :cond_39
    return-void
.end method

.method clear()V
    .registers 2

    .prologue
    .line 2215
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2216
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->invalidateCache()V

    .line 2217
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2218
    return-void
.end method

.method public findFirstVisibleItemPosition()I
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 2313
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z
    invoke-static {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->access$600(Landroid/support/v7/widget/StaggeredGridLayoutManager;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findOneVisibleChild(IIZ)I

    move-result v0

    :goto_16
    return v0

    :cond_17
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, v2, v0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findOneVisibleChild(IIZ)I

    move-result v0

    goto :goto_16
.end method

.method findOneVisibleChild(IIZ)I
    .registers 13
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "completelyVisible"    # Z

    .prologue
    const/4 v7, -0x1

    .line 2337
    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v8, v8, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    .line 2338
    .local v6, "start":I
    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v8, v8, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    .line 2339
    .local v3, "end":I
    if-le p2, p1, :cond_40

    const/4 v5, 0x1

    .line 2340
    .local v5, "next":I
    :goto_14
    move v4, p1

    .local v4, "i":I
    :goto_15
    if-eq v4, p2, :cond_3f

    .line 2341
    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 2342
    .local v0, "child":Landroid/view/View;
    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v8, v8, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v2

    .line 2343
    .local v2, "childStart":I
    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v8, v8, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v1

    .line 2344
    .local v1, "childEnd":I
    if-ge v2, v3, :cond_49

    if-le v1, v6, :cond_49

    .line 2345
    if-eqz p3, :cond_42

    .line 2346
    if-lt v2, v6, :cond_49

    if-gt v1, v3, :cond_49

    .line 2347
    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    invoke-virtual {v7, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v7

    .line 2354
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childEnd":I
    .end local v2    # "childStart":I
    :cond_3f
    :goto_3f
    return v7

    .end local v4    # "i":I
    .end local v5    # "next":I
    :cond_40
    move v5, v7

    .line 2339
    goto :goto_14

    .line 2350
    .restart local v0    # "child":Landroid/view/View;
    .restart local v1    # "childEnd":I
    .restart local v2    # "childStart":I
    .restart local v4    # "i":I
    .restart local v5    # "next":I
    :cond_42
    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    invoke-virtual {v7, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v7

    goto :goto_3f

    .line 2340
    :cond_49
    add-int/2addr v4, v5

    goto :goto_15
.end method

.method public getDeletedSize()I
    .registers 2

    .prologue
    .line 2257
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    return v0
.end method

.method getEndLine()I
    .registers 3

    .prologue
    .line 2159
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_9

    .line 2160
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2163
    :goto_8
    return v0

    .line 2162
    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->calculateCachedEnd()V

    .line 2163
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    goto :goto_8
.end method

.method getEndLine(I)I
    .registers 5
    .param p1, "def"    # I

    .prologue
    .line 2133
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    const/high16 v2, -0x80000000

    if-eq v1, v2, :cond_9

    .line 2134
    iget p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2141
    .end local p1    # "def":I
    :cond_8
    :goto_8
    return p1

    .line 2136
    .restart local p1    # "def":I
    :cond_9
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2137
    .local v0, "size":I
    if-eqz v0, :cond_8

    .line 2140
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->calculateCachedEnd()V

    .line 2141
    iget p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    goto :goto_8
.end method

.method getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 2261
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    return-object v0
.end method

.method getStartLine()I
    .registers 3

    .prologue
    .line 2125
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_9

    .line 2126
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2129
    :goto_8
    return v0

    .line 2128
    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->calculateCachedStart()V

    .line 2129
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    goto :goto_8
.end method

.method getStartLine(I)I
    .registers 4
    .param p1, "def"    # I

    .prologue
    .line 2100
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_9

    .line 2101
    iget p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2107
    .end local p1    # "def":I
    :cond_8
    :goto_8
    return p1

    .line 2103
    .restart local p1    # "def":I
    :cond_9
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_8

    .line 2106
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->calculateCachedStart()V

    .line 2107
    iget p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    goto :goto_8
.end method

.method invalidateCache()V
    .registers 2

    .prologue
    const/high16 v0, -0x80000000

    .line 2221
    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2222
    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2223
    return-void
.end method

.method onOffset(I)V
    .registers 4
    .param p1, "dt"    # I

    .prologue
    const/high16 v1, -0x80000000

    .line 2265
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    if-eq v0, v1, :cond_b

    .line 2266
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2268
    :cond_b
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    if-eq v0, v1, :cond_14

    .line 2269
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2271
    :cond_14
    return-void
.end method

.method popEnd()V
    .registers 7

    .prologue
    const/high16 v5, -0x80000000

    .line 2230
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 2231
    .local v2, "size":I
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    add-int/lit8 v4, v2, -0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 2232
    .local v0, "end":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v1

    .line 2233
    .local v1, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    const/4 v3, 0x0

    iput-object v3, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 2234
    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v3

    if-nez v3, :cond_25

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v3

    if-eqz v3, :cond_32

    .line 2235
    :cond_25
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v4, v4, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2237
    :cond_32
    const/4 v3, 0x1

    if-ne v2, v3, :cond_37

    .line 2238
    iput v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2240
    :cond_37
    iput v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2241
    return-void
.end method

.method popStart()V
    .registers 6

    .prologue
    const/high16 v4, -0x80000000

    .line 2244
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 2245
    .local v1, "start":Landroid/view/View;
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v0

    .line 2246
    .local v0, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    const/4 v2, 0x0

    iput-object v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 2247
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_1c

    .line 2248
    iput v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2250
    :cond_1c
    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v2

    if-nez v2, :cond_28

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v2

    if-eqz v2, :cond_35

    .line 2251
    :cond_28
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2253
    :cond_35
    iput v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2254
    return-void
.end method

.method prependToSpan(Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/high16 v3, -0x80000000

    .line 2167
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v0

    .line 2168
    .local v0, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iput-object p0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 2169
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 2170
    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2171
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1b

    .line 2172
    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2174
    :cond_1b
    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v1

    if-nez v1, :cond_27

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v1

    if-eqz v1, :cond_34

    .line 2175
    :cond_27
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2177
    :cond_34
    return-void
.end method

.method setLine(I)V
    .registers 2
    .param p1, "line"    # I

    .prologue
    .line 2226
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2227
    return-void
.end method
