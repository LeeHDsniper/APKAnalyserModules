.class Landroid/support/v7/widget/LinearLayoutManager$LayoutState;
.super Ljava/lang/Object;
.source "LinearLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/LinearLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LayoutState"
.end annotation


# instance fields
.field mAvailable:I

.field mCurrentPosition:I

.field mExtra:I

.field mIsPreLayout:Z

.field mItemDirection:I

.field mLastScrollDelta:I

.field mLayoutDirection:I

.field mOffset:I

.field mRecycle:Z

.field mScrapList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field mScrollingOffset:I


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1858
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1877
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mRecycle:Z

    .line 1918
    iput v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 1925
    iput-boolean v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mIsPreLayout:Z

    .line 1936
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    return-void
.end method

.method private nextViewFromScrapList()Landroid/view/View;
    .registers 6

    .prologue
    .line 1968
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .line 1969
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_28

    .line 1970
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 1971
    .local v2, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 1969
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 1974
    :cond_1a
    iget v3, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v4

    if-ne v3, v4, :cond_17

    .line 1975
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->assignPositionFromScrapList(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 1976
    iget-object v3, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 1979
    .end local v2    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :goto_27
    return-object v3

    :cond_28
    const/4 v3, 0x0

    goto :goto_27
.end method


# virtual methods
.method public assignPositionFromScrapList()V
    .registers 2

    .prologue
    .line 1983
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->assignPositionFromScrapList(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 1984
    return-void
.end method

.method public assignPositionFromScrapList(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 4
    .param p1, "ignore"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 1987
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->nextViewHolderInLimitedList(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 1988
    .local v0, "closest":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-nez v0, :cond_a

    const/4 v1, -0x1

    :goto_7
    iput v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 1990
    return-void

    .line 1988
    :cond_a
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v1

    goto :goto_7
.end method

.method hasMore(Landroid/support/v7/widget/RecyclerView$State;)Z
    .registers 4
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1942
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    if-ltz v0, :cond_e

    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    if-ge v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method next(Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 1952
    iget-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    if-eqz v1, :cond_9

    .line 1953
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->nextViewFromScrapList()Landroid/view/View;

    move-result-object v0

    .line 1957
    :goto_8
    return-object v0

    .line 1955
    :cond_9
    iget v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object v0

    .line 1956
    .local v0, "view":Landroid/view/View;
    iget v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    add-int/2addr v1, v2

    iput v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    goto :goto_8
.end method

.method public nextViewHolderInLimitedList(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 10
    .param p1, "ignore"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 1993
    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v4

    .line 1994
    .local v4, "size":I
    const/4 v0, 0x0

    .line 1995
    .local v0, "closest":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    const v1, 0x7fffffff

    .line 1999
    .local v1, "closestDistance":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_b
    if-ge v3, v4, :cond_33

    .line 2000
    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 2001
    .local v5, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eq v5, p1, :cond_1d

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v6

    if-eqz v6, :cond_20

    .line 1999
    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 2004
    :cond_20
    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v6

    iget v7, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    sub-int/2addr v6, v7

    iget v7, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    mul-int v2, v6, v7

    .line 2006
    .local v2, "distance":I
    if-ltz v2, :cond_1d

    .line 2009
    if-ge v2, v1, :cond_1d

    .line 2010
    move-object v0, v5

    .line 2011
    move v1, v2

    .line 2012
    if-nez v2, :cond_1d

    .line 2017
    .end local v2    # "distance":I
    .end local v5    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_33
    return-object v0
.end method
