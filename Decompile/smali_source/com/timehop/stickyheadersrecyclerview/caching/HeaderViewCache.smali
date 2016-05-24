.class public Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;
.super Ljava/lang/Object;
.source "HeaderViewCache.java"

# interfaces
.implements Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;


# instance fields
.field private final mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

.field private final mHeaderViews:Landroid/support/v4/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LongSparseArray",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;


# direct methods
.method public constructor <init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;)V
    .registers 4
    .param p1, "adapter"    # Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;
    .param p2, "orientationProvider"    # Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Landroid/support/v4/util/LongSparseArray;

    invoke-direct {v0}, Landroid/support/v4/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;->mHeaderViews:Landroid/support/v4/util/LongSparseArray;

    .line 23
    iput-object p1, p0, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    .line 24
    iput-object p2, p0, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    .line 25
    return-void
.end method


# virtual methods
.method public getHeader(Landroid/support/v7/widget/RecyclerView;I)Landroid/view/View;
    .registers 15
    .param p1, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "position"    # I

    .prologue
    const/high16 v11, 0x40000000

    const/4 v9, -0x2

    const/4 v10, 0x0

    .line 29
    iget-object v8, p0, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    invoke-interface {v8, p2}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;->getHeaderId(I)J

    move-result-wide v4

    .line 31
    .local v4, "headerId":J
    iget-object v8, p0, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;->mHeaderViews:Landroid/support/v4/util/LongSparseArray;

    invoke-virtual {v8, v4, v5}, Landroid/support/v4/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 32
    .local v2, "header":Landroid/view/View;
    if-nez v2, :cond_81

    .line 34
    iget-object v8, p0, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    invoke-interface {v8, p1}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;->onCreateHeaderViewHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v6

    .line 35
    .local v6, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v8, p0, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    invoke-interface {v8, v6, p2}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;->onBindHeaderViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 36
    iget-object v2, v6, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 37
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    if-nez v8, :cond_2f

    .line 38
    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v8, v9, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    :cond_2f
    iget-object v8, p0, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    invoke-interface {v8, p1}, Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;->getOrientation(Landroid/support/v7/widget/RecyclerView;)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_82

    .line 46
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v8

    invoke-static {v8, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 47
    .local v7, "widthSpec":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v8

    invoke-static {v8, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 53
    .local v3, "heightSpec":I
    :goto_48
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v8

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    iget v9, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v7, v8, v9}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v1

    .line 55
    .local v1, "childWidth":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v8

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    iget v9, v9, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v3, v8, v9}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v0

    .line 57
    .local v0, "childHeight":I
    invoke-virtual {v2, v1, v0}, Landroid/view/View;->measure(II)V

    .line 58
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    invoke-virtual {v2, v10, v10, v8, v9}, Landroid/view/View;->layout(IIII)V

    .line 59
    iget-object v8, p0, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;->mHeaderViews:Landroid/support/v4/util/LongSparseArray;

    invoke-virtual {v8, v4, v5, v2}, Landroid/support/v4/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 61
    .end local v0    # "childHeight":I
    .end local v1    # "childWidth":I
    .end local v3    # "heightSpec":I
    .end local v6    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v7    # "widthSpec":I
    :cond_81
    return-object v2

    .line 49
    .restart local v6    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_82
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v8

    invoke-static {v8, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 50
    .restart local v7    # "widthSpec":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v8

    invoke-static {v8, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .restart local v3    # "heightSpec":I
    goto :goto_48
.end method

.method public invalidate()V
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;->mHeaderViews:Landroid/support/v4/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/support/v4/util/LongSparseArray;->clear()V

    .line 67
    return-void
.end method
