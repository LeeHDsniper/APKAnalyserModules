.class public abstract Lcom/etsy/android/grid/ExtendableListView;
.super Landroid/widget/AbsListView;
.source "ExtendableListView.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "WrongCall"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;,
        Lcom/etsy/android/grid/ExtendableListView$FixedViewInfo;,
        Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;,
        Lcom/etsy/android/grid/ExtendableListView$LayoutParams;,
        Lcom/etsy/android/grid/ExtendableListView$ListSavedState;,
        Lcom/etsy/android/grid/ExtendableListView$PerformClick;,
        Lcom/etsy/android/grid/ExtendableListView$RecycleBin;,
        Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;
    }
.end annotation


# instance fields
.field private mActivePointerId:I

.field mAdapter:Landroid/widget/ListAdapter;

.field private mBlockLayoutRequests:Z

.field protected mClipToPadding:Z

.field private mDataChanged:Z

.field protected mFirstPosition:I

.field private mFlingRunnable:Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;

.field private mFlingVelocity:I

.field private mFooterViewInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/etsy/android/grid/ExtendableListView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mHeaderViewInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/etsy/android/grid/ExtendableListView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mInLayout:Z

.field private mIsAttached:Z

.field final mIsScrap:[Z

.field private mItemCount:I

.field private mLastY:I

.field private mLayoutMode:I

.field private mMaximumVelocity:I

.field private mMotionCorrection:I

.field private mMotionPosition:I

.field private mMotionX:I

.field private mMotionY:I

.field mNeedSync:Z

.field private mObserver:Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;

.field private mOldItemCount:I

.field private mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

.field private mPerformClick:Lcom/etsy/android/grid/ExtendableListView$PerformClick;

.field private mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

.field private mScrollState:I

.field protected mSpecificTop:I

.field mSyncHeight:J

.field protected mSyncPosition:I

.field mSyncRowId:J

.field private mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

.field private mTouchMode:I

.field private mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mWidthMeasureSpec:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v4, 0x0

    .line 168
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/AbsListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 86
    iput v4, p0, Lcom/etsy/android/grid/ExtendableListView;->mScrollState:I

    .line 93
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 115
    const/4 v1, -0x1

    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    .line 126
    iput-boolean v4, p0, Lcom/etsy/android/grid/ExtendableListView;->mBlockLayoutRequests:Z

    .line 133
    const/4 v1, 0x1

    new-array v1, v1, [Z

    iput-object v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mIsScrap:[Z

    .line 2539
    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncRowId:J

    .line 2549
    iput-boolean v4, p0, Lcom/etsy/android/grid/ExtendableListView;->mNeedSync:Z

    .line 171
    invoke-virtual {p0, v4}, Lcom/etsy/android/grid/ExtendableListView;->setWillNotDraw(Z)V

    .line 172
    invoke-virtual {p0, v4}, Lcom/etsy/android/grid/ExtendableListView;->setClipToPadding(Z)V

    .line 173
    invoke-virtual {p0, v4}, Lcom/etsy/android/grid/ExtendableListView;->setFocusableInTouchMode(Z)V

    .line 175
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 176
    .local v0, "viewConfiguration":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchSlop:I

    .line 177
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mMaximumVelocity:I

    .line 178
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mFlingVelocity:I

    .line 180
    new-instance v1, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    invoke-direct {v1, p0}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;-><init>(Lcom/etsy/android/grid/ExtendableListView;)V

    iput-object v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    .line 181
    new-instance v1, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;

    invoke-direct {v1, p0}, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;-><init>(Lcom/etsy/android/grid/ExtendableListView;)V

    iput-object v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mObserver:Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;

    .line 183
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    .line 184
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    .line 187
    iput v4, p0, Lcom/etsy/android/grid/ExtendableListView;->mLayoutMode:I

    .line 188
    return-void
.end method

.method static synthetic access$10(Lcom/etsy/android/grid/ExtendableListView;I)V
    .registers 2

    .prologue
    .line 130
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    return-void
.end method

.method static synthetic access$11(Lcom/etsy/android/grid/ExtendableListView;)Lcom/etsy/android/grid/ExtendableListView$RecycleBin;
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    return-object v0
.end method

.method static synthetic access$12(Lcom/etsy/android/grid/ExtendableListView;)I
    .registers 2

    .prologue
    .line 131
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mOldItemCount:I

    return v0
.end method

.method static synthetic access$13(Lcom/etsy/android/grid/ExtendableListView;)V
    .registers 1

    .prologue
    .line 2024
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->updateEmptyStatus()V

    return-void
.end method

.method static synthetic access$14(Lcom/etsy/android/grid/ExtendableListView;Landroid/view/View;Z)V
    .registers 3

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/etsy/android/grid/ExtendableListView;->removeDetachedView(Landroid/view/View;Z)V

    return-void
.end method

.method static synthetic access$15(Lcom/etsy/android/grid/ExtendableListView;)Z
    .registers 2

    .prologue
    .line 129
    iget-boolean v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    return v0
.end method

.method static synthetic access$16(Lcom/etsy/android/grid/ExtendableListView;)I
    .registers 2

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getWindowAttachCount()I

    move-result v0

    return v0
.end method

.method static synthetic access$2(Lcom/etsy/android/grid/ExtendableListView;I)V
    .registers 2

    .prologue
    .line 85
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    return-void
.end method

.method static synthetic access$3(Lcom/etsy/android/grid/ExtendableListView;Ljava/lang/Runnable;)V
    .registers 2

    .prologue
    .line 1971
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->postOnAnimate(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$4(Lcom/etsy/android/grid/ExtendableListView;)I
    .registers 2

    .prologue
    .line 85
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    return v0
.end method

.method static synthetic access$5(Lcom/etsy/android/grid/ExtendableListView;)I
    .registers 2

    .prologue
    .line 130
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    return v0
.end method

.method static synthetic access$6(Lcom/etsy/android/grid/ExtendableListView;I)V
    .registers 2

    .prologue
    .line 111
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionPosition:I

    return-void
.end method

.method static synthetic access$7(Lcom/etsy/android/grid/ExtendableListView;II)Z
    .registers 4

    .prologue
    .line 1096
    invoke-direct {p0, p1, p2}, Lcom/etsy/android/grid/ExtendableListView;->moveTheChildren(II)Z

    move-result v0

    return v0
.end method

.method static synthetic access$8(Lcom/etsy/android/grid/ExtendableListView;Z)V
    .registers 2

    .prologue
    .line 129
    iput-boolean p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    return-void
.end method

.method static synthetic access$9(Lcom/etsy/android/grid/ExtendableListView;I)V
    .registers 2

    .prologue
    .line 131
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mOldItemCount:I

    return-void
.end method

.method private adjustViewsUpOrDown()V
    .registers 5

    .prologue
    .line 1693
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    .line 1696
    .local v0, "childCount":I
    if-lez v0, :cond_19

    .line 1699
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getHighestChildTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v3

    sub-int v1, v2, v3

    .line 1700
    .local v1, "delta":I
    if-gez v1, :cond_13

    .line 1702
    const/4 v1, 0x0

    .line 1705
    :cond_13
    if-eqz v1, :cond_19

    .line 1706
    neg-int v2, v1

    invoke-virtual {p0, v2}, Lcom/etsy/android/grid/ExtendableListView;->offsetChildrenTopAndBottom(I)V

    .line 1709
    .end local v1    # "delta":I
    :cond_19
    return-void
.end method

.method private clearRecycledState(Ljava/util/ArrayList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/etsy/android/grid/ExtendableListView$FixedViewInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2595
    .local p1, "infos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/etsy/android/grid/ExtendableListView$FixedViewInfo;>;"
    if-nez p1, :cond_3

    .line 2603
    :cond_2
    return-void

    .line 2596
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_7
    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/etsy/android/grid/ExtendableListView$FixedViewInfo;

    .line 2597
    .local v1, "info":Lcom/etsy/android/grid/ExtendableListView$FixedViewInfo;
    iget-object v0, v1, Lcom/etsy/android/grid/ExtendableListView$FixedViewInfo;->view:Landroid/view/View;

    .line 2598
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    .line 2599
    .local v2, "p":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    if-eqz v2, :cond_7

    .line 2600
    const/4 v4, 0x0

    iput-boolean v4, v2, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->recycledHeaderFooter:Z

    goto :goto_7
.end method

.method private clearState()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 2581
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->clearRecycledState(Ljava/util/ArrayList;)V

    .line 2582
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->clearRecycledState(Ljava/util/ArrayList;)V

    .line 2584
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->removeAllViewsInLayout()V

    .line 2585
    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 2586
    iput-boolean v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    .line 2587
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->clear()V

    .line 2588
    iput-boolean v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mNeedSync:Z

    .line 2589
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    .line 2590
    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mLayoutMode:I

    .line 2591
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->invalidate()V

    .line 2592
    return-void
.end method

.method private correctTooHigh(I)V
    .registers 10
    .param p1, "childCount"    # I

    .prologue
    .line 1597
    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    add-int/2addr v6, p1

    add-int/lit8 v4, v6, -0x1

    .line 1598
    .local v4, "lastPosition":I
    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    add-int/lit8 v6, v6, -0x1

    if-ne v4, v6, :cond_54

    if-lez p1, :cond_54

    .line 1601
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getLowestChildBottom()I

    move-result v3

    .line 1604
    .local v3, "lastBottom":I
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getBottom()I

    move-result v6

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getTop()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingBottom()I

    move-result v7

    sub-int v1, v6, v7

    .line 1608
    .local v1, "end":I
    sub-int v0, v1, v3

    .line 1610
    .local v0, "bottomOffset":I
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getHighestChildTop()I

    move-result v2

    .line 1614
    .local v2, "firstTop":I
    if-lez v0, :cond_54

    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    if-gtz v6, :cond_32

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v6

    if-ge v2, v6, :cond_54

    .line 1615
    :cond_32
    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    if-nez v6, :cond_3f

    .line 1617
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v6

    sub-int/2addr v6, v2

    invoke-static {v0, v6}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1620
    :cond_3f
    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->offsetChildrenTopAndBottom(I)V

    .line 1621
    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    if-lez v6, :cond_54

    .line 1624
    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    add-int/lit8 v5, v6, -0x1

    .line 1625
    .local v5, "previousPosition":I
    invoke-virtual {p0, v5}, Lcom/etsy/android/grid/ExtendableListView;->getNextChildUpsBottom(I)I

    move-result v6

    invoke-direct {p0, v5, v6}, Lcom/etsy/android/grid/ExtendableListView;->fillUp(II)Landroid/view/View;

    .line 1627
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->adjustViewsUpOrDown()V

    .line 1632
    .end local v0    # "bottomOffset":I
    .end local v1    # "end":I
    .end local v2    # "firstTop":I
    .end local v3    # "lastBottom":I
    .end local v5    # "previousPosition":I
    :cond_54
    return-void
.end method

.method private correctTooLow(I)V
    .registers 11
    .param p1, "childCount"    # I

    .prologue
    .line 1644
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    if-nez v7, :cond_54

    if-lez p1, :cond_54

    .line 1647
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getHighestChildTop()I

    move-result v1

    .line 1650
    .local v1, "firstTop":I
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v5

    .line 1653
    .local v5, "start":I
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getTop()I

    move-result v7

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getBottom()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingBottom()I

    move-result v8

    sub-int v0, v7, v8

    .line 1657
    .local v0, "end":I
    sub-int v6, v1, v5

    .line 1658
    .local v6, "topOffset":I
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getLowestChildBottom()I

    move-result v2

    .line 1660
    .local v2, "lastBottom":I
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    add-int/2addr v7, p1

    add-int/lit8 v3, v7, -0x1

    .line 1664
    .local v3, "lastPosition":I
    if-lez v6, :cond_54

    .line 1665
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    add-int/lit8 v7, v7, -0x1

    if-lt v3, v7, :cond_32

    if-le v2, v0, :cond_55

    .line 1666
    :cond_32
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    add-int/lit8 v7, v7, -0x1

    if-ne v3, v7, :cond_3e

    .line 1668
    sub-int v7, v2, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 1671
    :cond_3e
    neg-int v7, v6

    invoke-virtual {p0, v7}, Lcom/etsy/android/grid/ExtendableListView;->offsetChildrenTopAndBottom(I)V

    .line 1672
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    add-int/lit8 v7, v7, -0x1

    if-ge v3, v7, :cond_54

    .line 1675
    add-int/lit8 v4, v3, 0x1

    .line 1676
    .local v4, "nextPosition":I
    invoke-virtual {p0, v4}, Lcom/etsy/android/grid/ExtendableListView;->getNextChildDownsTop(I)I

    move-result v7

    invoke-direct {p0, v4, v7}, Lcom/etsy/android/grid/ExtendableListView;->fillDown(II)Landroid/view/View;

    .line 1678
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->adjustViewsUpOrDown()V

    .line 1686
    .end local v0    # "end":I
    .end local v1    # "firstTop":I
    .end local v2    # "lastBottom":I
    .end local v3    # "lastPosition":I
    .end local v4    # "nextPosition":I
    .end local v5    # "start":I
    .end local v6    # "topOffset":I
    :cond_54
    :goto_54
    return-void

    .line 1681
    .restart local v0    # "end":I
    .restart local v1    # "firstTop":I
    .restart local v2    # "lastBottom":I
    .restart local v3    # "lastPosition":I
    .restart local v5    # "start":I
    .restart local v6    # "topOffset":I
    :cond_55
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    add-int/lit8 v7, v7, -0x1

    if-ne v3, v7, :cond_54

    .line 1682
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->adjustViewsUpOrDown()V

    goto :goto_54
.end method

.method private fillDown(II)Landroid/view/View;
    .registers 7
    .param p1, "pos"    # I
    .param p2, "nextTop"    # I

    .prologue
    .line 1281
    const/4 v1, 0x0

    .line 1283
    .local v1, "selectedView":Landroid/view/View;
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getHeight()I

    move-result v0

    .line 1284
    .local v0, "end":I
    iget-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mClipToPadding:Z

    if-eqz v2, :cond_e

    .line 1285
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingBottom()I

    move-result v2

    sub-int/2addr v0, v2

    .line 1288
    :cond_e
    :goto_e
    if-lt p2, v0, :cond_16

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->hasSpaceDown()Z

    move-result v2

    if-eqz v2, :cond_1a

    :cond_16
    iget v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    if-lt p1, v2, :cond_1b

    .line 1295
    :cond_1a
    return-object v1

    .line 1290
    :cond_1b
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, p1, p2, v2, v3}, Lcom/etsy/android/grid/ExtendableListView;->makeAndAddView(IIZZ)Landroid/view/View;

    .line 1291
    add-int/lit8 p1, p1, 0x1

    .line 1292
    invoke-virtual {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->getNextChildDownsTop(I)I

    move-result p2

    goto :goto_e
.end method

.method private fillFromTop(I)Landroid/view/View;
    .registers 4
    .param p1, "nextTop"    # I

    .prologue
    .line 1334
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    add-int/lit8 v1, v1, -0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 1335
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    if-gez v0, :cond_13

    .line 1336
    const/4 v0, 0x0

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 1338
    :cond_13
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    invoke-direct {p0, v0, p1}, Lcom/etsy/android/grid/ExtendableListView;->fillDown(II)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private fillSpecific(II)Landroid/view/View;
    .registers 11
    .param p1, "position"    # I
    .param p2, "top"    # I

    .prologue
    .line 1352
    const/4 v6, 0x0

    .line 1353
    .local v6, "tempIsSelected":Z
    const/4 v7, 0x1

    invoke-direct {p0, p1, p2, v7, v6}, Lcom/etsy/android/grid/ExtendableListView;->makeAndAddView(IIZZ)Landroid/view/View;

    move-result-object v5

    .line 1355
    .local v5, "temp":Landroid/view/View;
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 1360
    add-int/lit8 v7, p1, -0x1

    invoke-virtual {p0, v7}, Lcom/etsy/android/grid/ExtendableListView;->getNextChildUpsBottom(I)I

    move-result v3

    .line 1361
    .local v3, "nextBottom":I
    add-int/lit8 v7, p1, 0x1

    invoke-virtual {p0, v7}, Lcom/etsy/android/grid/ExtendableListView;->getNextChildDownsTop(I)I

    move-result v4

    .line 1363
    .local v4, "nextTop":I
    add-int/lit8 v7, p1, -0x1

    invoke-direct {p0, v7, v3}, Lcom/etsy/android/grid/ExtendableListView;->fillUp(II)Landroid/view/View;

    move-result-object v0

    .line 1365
    .local v0, "above":Landroid/view/View;
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->adjustViewsUpOrDown()V

    .line 1366
    add-int/lit8 v7, p1, 0x1

    invoke-direct {p0, v7, v4}, Lcom/etsy/android/grid/ExtendableListView;->fillDown(II)Landroid/view/View;

    move-result-object v1

    .line 1367
    .local v1, "below":Landroid/view/View;
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v2

    .line 1368
    .local v2, "childCount":I
    if-lez v2, :cond_2c

    .line 1369
    invoke-direct {p0, v2}, Lcom/etsy/android/grid/ExtendableListView;->correctTooHigh(I)V

    .line 1372
    :cond_2c
    if-eqz v6, :cond_2f

    .line 1379
    .end local v5    # "temp":Landroid/view/View;
    :goto_2e
    return-object v5

    .line 1375
    .restart local v5    # "temp":Landroid/view/View;
    :cond_2f
    if-eqz v0, :cond_33

    move-object v5, v0

    .line 1376
    goto :goto_2e

    :cond_33
    move-object v5, v1

    .line 1379
    goto :goto_2e
.end method

.method private fillUp(II)Landroid/view/View;
    .registers 7
    .param p1, "pos"    # I
    .param p2, "nextBottom"    # I

    .prologue
    const/4 v2, 0x0

    .line 1307
    const/4 v1, 0x0

    .line 1309
    .local v1, "selectedView":Landroid/view/View;
    iget-boolean v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mClipToPadding:Z

    if-eqz v3, :cond_19

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v0

    .line 1311
    .local v0, "end":I
    :goto_a
    if-gt p2, v0, :cond_12

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->hasSpaceUp()Z

    move-result v3

    if-eqz v3, :cond_14

    :cond_12
    if-gez p1, :cond_1b

    .line 1319
    :cond_14
    add-int/lit8 v2, p1, 0x1

    iput v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 1320
    return-object v1

    .end local v0    # "end":I
    :cond_19
    move v0, v2

    .line 1309
    goto :goto_a

    .line 1313
    .restart local v0    # "end":I
    :cond_1b
    invoke-direct {p0, p1, p2, v2, v2}, Lcom/etsy/android/grid/ExtendableListView;->makeAndAddView(IIZZ)Landroid/view/View;

    .line 1314
    add-int/lit8 p1, p1, -0x1

    .line 1315
    invoke-virtual {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->getNextChildUpsBottom(I)I

    move-result p2

    goto :goto_a
.end method

.method private findMotionRow(I)I
    .registers 6
    .param p1, "y"    # I

    .prologue
    .line 1076
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    .line 1077
    .local v0, "childCount":I
    if-lez v0, :cond_9

    .line 1079
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-lt v1, v0, :cond_b

    .line 1086
    .end local v1    # "i":I
    :cond_9
    const/4 v3, -0x1

    :goto_a
    return v3

    .line 1080
    .restart local v1    # "i":I
    :cond_b
    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1081
    .local v2, "v":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v3

    if-gt p1, v3, :cond_19

    .line 1082
    iget v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    add-int/2addr v3, v1

    goto :goto_a

    .line 1079
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_7
.end method

.method private initOrResetVelocityTracker()V
    .registers 2

    .prologue
    .line 1834
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_b

    .line 1835
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1840
    :goto_a
    return-void

    .line 1838
    :cond_b
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    goto :goto_a
.end method

.method private initVelocityTrackerIfNotExists()V
    .registers 2

    .prologue
    .line 1843
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_a

    .line 1844
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1846
    :cond_a
    return-void
.end method

.method private makeAndAddView(IIZZ)Landroid/view/View;
    .registers 13
    .param p1, "position"    # I
    .param p2, "y"    # I
    .param p3, "flowDown"    # Z
    .param p4, "selected"    # Z

    .prologue
    .line 1389
    invoke-virtual {p0, p1, p3}, Lcom/etsy/android/grid/ExtendableListView;->onChildCreated(IZ)V

    .line 1391
    iget-boolean v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    if-nez v0, :cond_1a

    .line 1393
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    invoke-virtual {v0, p1}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->getActiveView(I)Landroid/view/View;

    move-result-object v1

    .line 1394
    .local v1, "child":Landroid/view/View;
    if-eqz v1, :cond_1a

    .line 1398
    const/4 v6, 0x1

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/etsy/android/grid/ExtendableListView;->setupChild(Landroid/view/View;IIZZZ)V

    move-object v7, v1

    .line 1408
    .end local v1    # "child":Landroid/view/View;
    .local v7, "child":Landroid/view/View;
    :goto_19
    return-object v7

    .line 1404
    .end local v7    # "child":Landroid/view/View;
    :cond_1a
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mIsScrap:[Z

    invoke-direct {p0, p1, v0}, Lcom/etsy/android/grid/ExtendableListView;->obtainView(I[Z)Landroid/view/View;

    move-result-object v1

    .line 1406
    .restart local v1    # "child":Landroid/view/View;
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mIsScrap:[Z

    const/4 v2, 0x0

    aget-boolean v6, v0, v2

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/etsy/android/grid/ExtendableListView;->setupChild(Landroid/view/View;IIZZZ)V

    move-object v7, v1

    .line 1408
    .end local v1    # "child":Landroid/view/View;
    .restart local v7    # "child":Landroid/view/View;
    goto :goto_19
.end method

.method private moveTheChildren(II)Z
    .registers 33
    .param p1, "deltaY"    # I
    .param p2, "incrementalDeltaY"    # I

    .prologue
    .line 1099
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->hasChildren()Z

    move-result v28

    if-nez v28, :cond_9

    const/16 v28, 0x1

    .line 1238
    :goto_8
    return v28

    .line 1101
    :cond_9
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getHighestChildTop()I

    move-result v13

    .line 1102
    .local v13, "firstTop":I
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getLowestChildBottom()I

    move-result v20

    .line 1107
    .local v20, "lastBottom":I
    const/4 v10, 0x0

    .line 1108
    .local v10, "effectivePaddingTop":I
    const/4 v9, 0x0

    .line 1109
    .local v9, "effectivePaddingBottom":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/etsy/android/grid/ExtendableListView;->mClipToPadding:Z

    move/from16 v28, v0

    if-eqz v28, :cond_23

    .line 1110
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v10

    .line 1111
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingBottom()I

    move-result v9

    .line 1114
    :cond_23
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getHeight()I

    move-result v15

    .line 1115
    .local v15, "gridHeight":I
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getFirstChildTop()I

    move-result v28

    sub-int v24, v10, v28

    .line 1116
    .local v24, "spaceAbove":I
    sub-int v11, v15, v9

    .line 1117
    .local v11, "end":I
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getLastChildBottom()I

    move-result v28

    sub-int v25, v28, v11

    .line 1119
    .local v25, "spaceBelow":I
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingBottom()I

    move-result v28

    sub-int v28, v15, v28

    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v29

    sub-int v17, v28, v29

    .line 1121
    .local v17, "height":I
    if-gez p2, :cond_8c

    .line 1122
    add-int/lit8 v28, v17, -0x1

    move/from16 v0, v28

    neg-int v0, v0

    move/from16 v28, v0

    move/from16 v0, v28

    move/from16 v1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 1128
    :goto_52
    move-object/from16 v0, p0

    iget v12, v0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 1130
    .local v12, "firstPosition":I
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v22

    .line 1131
    .local v22, "maxTop":I
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingBottom()I

    move-result v28

    sub-int v21, v15, v28

    .line 1132
    .local v21, "maxBottom":I
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v7

    .line 1134
    .local v7, "childCount":I
    if-nez v12, :cond_97

    .line 1135
    move/from16 v0, v22

    if-lt v13, v0, :cond_97

    .line 1134
    if-ltz p2, :cond_97

    const/4 v4, 0x1

    .line 1136
    .local v4, "cannotScrollDown":Z
    :goto_6d
    add-int v28, v12, v7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    move/from16 v29, v0

    move/from16 v0, v28

    move/from16 v1, v29

    if-ne v0, v1, :cond_99

    .line 1137
    move/from16 v0, v20

    move/from16 v1, v21

    if-gt v0, v1, :cond_99

    .line 1136
    if-gtz p2, :cond_99

    const/4 v5, 0x1

    .line 1150
    .local v5, "cannotScrollUp":Z
    :goto_84
    if-eqz v4, :cond_9f

    .line 1152
    if-eqz p2, :cond_9b

    const/16 v28, 0x1

    goto/16 :goto_8

    .line 1125
    .end local v4    # "cannotScrollDown":Z
    .end local v5    # "cannotScrollUp":Z
    .end local v7    # "childCount":I
    .end local v12    # "firstPosition":I
    .end local v21    # "maxBottom":I
    .end local v22    # "maxTop":I
    :cond_8c
    add-int/lit8 v28, v17, -0x1

    move/from16 v0, v28

    move/from16 v1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result p2

    goto :goto_52

    .line 1134
    .restart local v7    # "childCount":I
    .restart local v12    # "firstPosition":I
    .restart local v21    # "maxBottom":I
    .restart local v22    # "maxTop":I
    :cond_97
    const/4 v4, 0x0

    goto :goto_6d

    .line 1136
    .restart local v4    # "cannotScrollDown":Z
    :cond_99
    const/4 v5, 0x0

    goto :goto_84

    .line 1152
    .restart local v5    # "cannotScrollUp":Z
    :cond_9b
    const/16 v28, 0x0

    goto/16 :goto_8

    .line 1155
    :cond_9f
    if-eqz v5, :cond_ab

    .line 1157
    if-eqz p2, :cond_a7

    const/16 v28, 0x1

    goto/16 :goto_8

    :cond_a7
    const/16 v28, 0x0

    goto/16 :goto_8

    .line 1160
    :cond_ab
    if-gez p2, :cond_140

    const/16 v19, 0x1

    .line 1162
    .local v19, "isDown":Z
    :goto_af
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getHeaderViewsCount()I

    move-result v16

    .line 1163
    .local v16, "headerViewsCount":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    move/from16 v28, v0

    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getFooterViewsCount()I

    move-result v29

    sub-int v14, v28, v29

    .line 1165
    .local v14, "footerViewsStart":I
    const/16 v26, 0x0

    .line 1166
    .local v26, "start":I
    const/4 v8, 0x0

    .line 1168
    .local v8, "count":I
    if-eqz v19, :cond_175

    .line 1169
    move/from16 v0, p2

    neg-int v0, v0

    move/from16 v27, v0

    .line 1170
    .local v27, "top":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/etsy/android/grid/ExtendableListView;->mClipToPadding:Z

    move/from16 v28, v0

    if-eqz v28, :cond_d7

    .line 1171
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v28

    add-int v27, v27, v28

    .line 1173
    :cond_d7
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_d9
    move/from16 v0, v18

    if-lt v0, v7, :cond_144

    .line 1208
    .end local v27    # "top":I
    :cond_dd
    const/16 v28, 0x1

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/etsy/android/grid/ExtendableListView;->mBlockLayoutRequests:Z

    .line 1210
    if-lez v8, :cond_fe

    .line 1212
    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1, v8}, Lcom/etsy/android/grid/ExtendableListView;->detachViewsFromParent(II)V

    .line 1213
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->removeSkippedScrap()V

    .line 1214
    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1, v8}, Lcom/etsy/android/grid/ExtendableListView;->onChildrenDetached(II)V

    .line 1219
    :cond_fe
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->awakenScrollBars()Z

    move-result v28

    if-nez v28, :cond_107

    .line 1220
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->invalidate()V

    .line 1223
    :cond_107
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->offsetChildrenTopAndBottom(I)V

    .line 1225
    if-eqz v19, :cond_11e

    .line 1226
    move-object/from16 v0, p0

    iget v0, v0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    move/from16 v28, v0

    add-int v28, v28, v8

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput v0, v1, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 1229
    :cond_11e
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 1230
    .local v2, "absIncrementalDeltaY":I
    move/from16 v0, v24

    if-lt v0, v2, :cond_12a

    move/from16 v0, v25

    if-ge v0, v2, :cond_131

    .line 1231
    :cond_12a
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->fillGap(Z)V

    .line 1235
    :cond_131
    const/16 v28, 0x0

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/etsy/android/grid/ExtendableListView;->mBlockLayoutRequests:Z

    .line 1236
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->invokeOnItemScrollListener()V

    .line 1238
    const/16 v28, 0x0

    goto/16 :goto_8

    .line 1160
    .end local v2    # "absIncrementalDeltaY":I
    .end local v8    # "count":I
    .end local v14    # "footerViewsStart":I
    .end local v16    # "headerViewsCount":I
    .end local v18    # "i":I
    .end local v19    # "isDown":Z
    .end local v26    # "start":I
    :cond_140
    const/16 v19, 0x0

    goto/16 :goto_af

    .line 1174
    .restart local v8    # "count":I
    .restart local v14    # "footerViewsStart":I
    .restart local v16    # "headerViewsCount":I
    .restart local v18    # "i":I
    .restart local v19    # "isDown":Z
    .restart local v26    # "start":I
    .restart local v27    # "top":I
    :cond_144
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 1175
    .local v6, "child":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v28

    move/from16 v0, v28

    move/from16 v1, v27

    if-ge v0, v1, :cond_dd

    .line 1179
    add-int/lit8 v8, v8, 0x1

    .line 1180
    add-int v23, v12, v18

    .line 1181
    .local v23, "position":I
    move/from16 v0, v23

    move/from16 v1, v16

    if-lt v0, v1, :cond_171

    move/from16 v0, v23

    if-ge v0, v14, :cond_171

    .line 1182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move/from16 v1, v23

    invoke-virtual {v0, v6, v1}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->addScrapView(Landroid/view/View;I)V

    .line 1173
    :cond_171
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_d9

    .line 1188
    .end local v6    # "child":Landroid/view/View;
    .end local v18    # "i":I
    .end local v23    # "position":I
    .end local v27    # "top":I
    :cond_175
    sub-int v3, v15, p2

    .line 1189
    .local v3, "bottom":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/etsy/android/grid/ExtendableListView;->mClipToPadding:Z

    move/from16 v28, v0

    if-eqz v28, :cond_185

    .line 1190
    invoke-virtual/range {p0 .. p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingBottom()I

    move-result v28

    sub-int v3, v3, v28

    .line 1192
    :cond_185
    add-int/lit8 v18, v7, -0x1

    .restart local v18    # "i":I
    :goto_187
    if-ltz v18, :cond_dd

    .line 1193
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 1194
    .restart local v6    # "child":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v28

    move/from16 v0, v28

    if-le v0, v3, :cond_dd

    .line 1198
    move/from16 v26, v18

    .line 1199
    add-int/lit8 v8, v8, 0x1

    .line 1200
    add-int v23, v12, v18

    .line 1201
    .restart local v23    # "position":I
    move/from16 v0, v23

    move/from16 v1, v16

    if-lt v0, v1, :cond_1b6

    move/from16 v0, v23

    if-ge v0, v14, :cond_1b6

    .line 1202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move/from16 v1, v23

    invoke-virtual {v0, v6, v1}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->addScrapView(Landroid/view/View;I)V

    .line 1192
    :cond_1b6
    add-int/lit8 v18, v18, -0x1

    goto :goto_187
.end method

.method private obtainView(I[Z)Landroid/view/View;
    .registers 7
    .param p1, "position"    # I
    .param p2, "isScrap"    # [Z

    .prologue
    const/4 v3, 0x0

    .line 1561
    aput-boolean v3, p2, v3

    .line 1564
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    invoke-virtual {v2, p1}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->getScrapView(I)Landroid/view/View;

    move-result-object v1

    .line 1567
    .local v1, "scrapView":Landroid/view/View;
    if-eqz v1, :cond_1d

    .line 1569
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v2, p1, v1, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1571
    .local v0, "child":Landroid/view/View;
    if-eq v0, v1, :cond_19

    .line 1572
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    invoke-virtual {v2, v1, p1}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->addScrapView(Landroid/view/View;I)V

    .line 1583
    :goto_18
    return-object v0

    .line 1575
    :cond_19
    const/4 v2, 0x1

    aput-boolean v2, p2, v3

    goto :goto_18

    .line 1580
    .end local v0    # "child":Landroid/view/View;
    :cond_1d
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    const/4 v3, 0x0

    invoke-interface {v2, p1, v3, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .restart local v0    # "child":Landroid/view/View;
    goto :goto_18
.end method

.method private onSecondaryPointerUp(Landroid/view/MotionEvent;)V
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 971
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    .line 972
    const v4, 0xff00

    .line 971
    and-int/2addr v3, v4

    shr-int/lit8 v2, v3, 0x8

    .line 974
    .local v2, "pointerIndex":I
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 975
    .local v1, "pointerId":I
    iget v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    if-ne v1, v3, :cond_2c

    .line 979
    if-nez v2, :cond_2d

    const/4 v0, 0x1

    .line 980
    .local v0, "newPointerIndex":I
    :goto_15
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionX:I

    .line 981
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionY:I

    .line 982
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iput v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    .line 983
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->recycleVelocityTracker()V

    .line 985
    .end local v0    # "newPointerIndex":I
    :cond_2c
    return-void

    .line 979
    :cond_2d
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private onTouchCancel(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x0

    .line 887
    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    .line 888
    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->setPressed(Z)V

    .line 889
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->invalidate()V

    .line 890
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->recycleVelocityTracker()V

    .line 891
    const/4 v0, -0x1

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    .line 892
    const/4 v0, 0x1

    return v0
.end method

.method private onTouchDown(Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v6, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 812
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v1, v5

    .line 813
    .local v1, "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    float-to-int v2, v5

    .line 814
    .local v2, "y":I
    invoke-virtual {p0, v1, v2}, Lcom/etsy/android/grid/ExtendableListView;->pointToPosition(II)I

    move-result v0

    .line 816
    .local v0, "motionPosition":I
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v5}, Landroid/view/VelocityTracker;->clear()V

    .line 817
    invoke-static {p1, v3}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v5

    iput v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    .line 823
    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    if-eq v5, v6, :cond_3c

    .line 824
    iget-boolean v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    if-nez v5, :cond_3c

    .line 825
    if-ltz v0, :cond_3c

    .line 826
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v5

    invoke-interface {v5, v0}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v5

    if-eqz v5, :cond_3c

    .line 828
    const/4 v5, 0x3

    iput v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    .line 832
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v5

    if-eqz v5, :cond_48

    if-gez v0, :cond_48

    .line 850
    :goto_3b
    return v3

    .line 839
    :cond_3c
    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    if-ne v5, v6, :cond_48

    .line 840
    iput v4, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    .line 841
    iput v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionCorrection:I

    .line 842
    invoke-direct {p0, v2}, Lcom/etsy/android/grid/ExtendableListView;->findMotionRow(I)I

    move-result v0

    .line 845
    :cond_48
    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionX:I

    .line 846
    iput v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionY:I

    .line 847
    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionPosition:I

    .line 848
    const/high16 v3, -0x80000000

    iput v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mLastY:I

    move v3, v4

    .line 850
    goto :goto_3b
.end method

.method private onTouchMove(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 854
    iget v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v0

    .line 855
    .local v0, "index":I
    if-gez v0, :cond_2c

    .line 856
    const-string v2, "ExtendableListView"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "onTouchMove could not find pointer with id "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 857
    iget v4, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - did ExtendableListView receive an inconsistent "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 858
    const-string v4, "event stream?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 856
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 859
    const/4 v2, 0x0

    .line 882
    :goto_2b
    return v2

    .line 861
    :cond_2c
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v2

    float-to-int v1, v2

    .line 864
    .local v1, "y":I
    iget-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    if-eqz v2, :cond_38

    .line 865
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->layoutChildren()V

    .line 868
    :cond_38
    iget v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    packed-switch v2, :pswitch_data_48

    .line 882
    :goto_3d
    :pswitch_3d
    const/4 v2, 0x1

    goto :goto_2b

    .line 874
    :pswitch_3f
    invoke-direct {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->startScrollIfNeeded(I)Z

    goto :goto_3d

    .line 878
    :pswitch_43
    invoke-direct {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->scrollIfNeeded(I)V

    goto :goto_3d

    .line 868
    nop

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_43
        :pswitch_3d
        :pswitch_3f
        :pswitch_3f
        :pswitch_3f
    .end packed-switch
.end method

.method private onTouchPointerUp(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 959
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    .line 960
    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionX:I

    .line 961
    .local v1, "x":I
    iget v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionY:I

    .line 962
    .local v2, "y":I
    invoke-virtual {p0, v1, v2}, Lcom/etsy/android/grid/ExtendableListView;->pointToPosition(II)I

    move-result v0

    .line 963
    .local v0, "motionPosition":I
    if-ltz v0, :cond_f

    .line 964
    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionPosition:I

    .line 966
    :cond_f
    iput v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mLastY:I

    .line 967
    const/4 v3, 0x1

    return v3
.end method

.method private onTouchUp(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 896
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    packed-switch v0, :pswitch_data_1e

    .line 906
    :pswitch_5
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->setPressed(Z)V

    .line 907
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->invalidate()V

    .line 908
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->recycleVelocityTracker()V

    .line 909
    const/4 v0, -0x1

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    .line 910
    const/4 v0, 0x1

    :goto_13
    return v0

    .line 900
    :pswitch_14
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->onTouchUpTap(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_13

    .line 903
    :pswitch_19
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->onTouchUpScrolling(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_13

    .line 896
    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_19
        :pswitch_5
        :pswitch_14
        :pswitch_14
        :pswitch_14
    .end packed-switch
.end method

.method private onTouchUpScrolling(Landroid/view/MotionEvent;)Z
    .registers 11
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 914
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->hasChildren()Z

    move-result v6

    if-eqz v6, :cond_5e

    .line 916
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getFirstChildTop()I

    move-result v2

    .line 917
    .local v2, "top":I
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getLastChildBottom()I

    move-result v1

    .line 918
    .local v1, "bottom":I
    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    if-nez v6, :cond_5c

    .line 919
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v6

    if-lt v2, v6, :cond_5c

    .line 920
    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v7

    add-int/2addr v6, v7

    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    if-ge v6, v7, :cond_5c

    .line 921
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getHeight()I

    move-result v6

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    .line 918
    if-gt v1, v6, :cond_5c

    move v0, v4

    .line 923
    .local v0, "atEdge":Z
    :goto_31
    if-nez v0, :cond_5e

    .line 924
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v7, 0x3e8

    iget v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mMaximumVelocity:I

    int-to-float v8, v8

    invoke-virtual {v6, v7, v8}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 925
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    invoke-virtual {v6, v7}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v3

    .line 927
    .local v3, "velocity":F
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mFlingVelocity:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_5e

    .line 928
    invoke-direct {p0, v3}, Lcom/etsy/android/grid/ExtendableListView;->startFlingRunnable(F)V

    .line 929
    const/4 v6, 0x2

    iput v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    .line 930
    iput v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionY:I

    .line 931
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->invalidate()V

    .line 940
    .end local v0    # "atEdge":Z
    .end local v1    # "bottom":I
    .end local v2    # "top":I
    .end local v3    # "velocity":F
    :goto_5b
    return v4

    .restart local v1    # "bottom":I
    .restart local v2    # "top":I
    :cond_5c
    move v0, v5

    .line 918
    goto :goto_31

    .line 937
    .end local v1    # "bottom":I
    .end local v2    # "top":I
    :cond_5e
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->stopFlingRunnable()V

    .line 938
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->recycleVelocityTracker()V

    .line 939
    iput v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    goto :goto_5b
.end method

.method private onTouchUpTap(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 944
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mPerformClick:Lcom/etsy/android/grid/ExtendableListView$PerformClick;

    if-nez v2, :cond_f

    .line 945
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->invalidate()V

    .line 946
    new-instance v2, Lcom/etsy/android/grid/ExtendableListView$PerformClick;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/etsy/android/grid/ExtendableListView$PerformClick;-><init>(Lcom/etsy/android/grid/ExtendableListView;Lcom/etsy/android/grid/ExtendableListView$PerformClick;)V

    iput-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mPerformClick:Lcom/etsy/android/grid/ExtendableListView$PerformClick;

    .line 948
    :cond_f
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionPosition:I

    .line 949
    .local v0, "motionPosition":I
    iget-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    if-nez v2, :cond_29

    if-ltz v0, :cond_29

    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v2, v0}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 950
    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mPerformClick:Lcom/etsy/android/grid/ExtendableListView$PerformClick;

    .line 951
    .local v1, "performClick":Lcom/etsy/android/grid/ExtendableListView$PerformClick;
    iput v0, v1, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->mClickMotionPosition:I

    .line 952
    invoke-virtual {v1}, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->rememberWindowAttachCount()V

    .line 953
    invoke-virtual {v1}, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->run()V

    .line 955
    .end local v1    # "performClick":Lcom/etsy/android/grid/ExtendableListView$PerformClick;
    :cond_29
    const/4 v2, 0x1

    return v2
.end method

.method private postOnAnimate(Ljava/lang/Runnable;)V
    .registers 2
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 1972
    invoke-static {p0, p1}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 1973
    return-void
.end method

.method private recycleVelocityTracker()V
    .registers 2

    .prologue
    .line 1849
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_c

    .line 1850
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 1851
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1853
    :cond_c
    return-void
.end method

.method static retrieveFromScrap(Ljava/util/ArrayList;I)Landroid/view/View;
    .registers 6
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;I)",
            "Landroid/view/View;"
        }
    .end annotation

    .prologue
    .line 2504
    .local p0, "scrapViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 2505
    .local v1, "size":I
    if-lez v1, :cond_2a

    .line 2507
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-lt v0, v1, :cond_13

    .line 2514
    add-int/lit8 v3, v1, -0x1

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    move-object v2, v3

    .line 2517
    .end local v0    # "i":I
    :goto_12
    return-object v2

    .line 2508
    .restart local v0    # "i":I
    :cond_13
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 2509
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    iget v3, v3, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->position:I

    if-ne v3, p1, :cond_27

    .line 2510
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_12

    .line 2507
    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 2517
    .end local v0    # "i":I
    .end local v2    # "view":Landroid/view/View;
    :cond_2a
    const/4 v2, 0x0

    goto :goto_12
.end method

.method private scrollIfNeeded(I)V
    .registers 12
    .param p1, "y"    # I

    .prologue
    const/4 v9, 0x1

    .line 1029
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionY:I

    sub-int v6, p1, v7

    .line 1030
    .local v6, "rawDeltaY":I
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionCorrection:I

    sub-int v1, v6, v7

    .line 1031
    .local v1, "deltaY":I
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mLastY:I

    const/high16 v8, -0x80000000

    if-eq v7, v8, :cond_48

    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mLastY:I

    sub-int v2, p1, v7

    .line 1033
    .local v2, "incrementalDeltaY":I
    :goto_13
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    if-ne v7, v9, :cond_47

    .line 1035
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mLastY:I

    if-eq p1, v7, :cond_47

    .line 1037
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v7

    iget v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchSlop:I

    if-le v7, v8, :cond_2c

    .line 1038
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    .line 1039
    .local v5, "parent":Landroid/view/ViewParent;
    if-eqz v5, :cond_2c

    .line 1040
    invoke-interface {v5, v9}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 1045
    .end local v5    # "parent":Landroid/view/ViewParent;
    :cond_2c
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionPosition:I

    if-ltz v7, :cond_4a

    .line 1046
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionPosition:I

    iget v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    sub-int v3, v7, v8

    .line 1055
    .local v3, "motionIndex":I
    :goto_36
    const/4 v0, 0x0

    .line 1056
    .local v0, "atEdge":Z
    if-eqz v2, :cond_3d

    .line 1057
    invoke-direct {p0, v1, v2}, Lcom/etsy/android/grid/ExtendableListView;->moveTheChildren(II)Z

    move-result v0

    .line 1061
    :cond_3d
    invoke-virtual {p0, v3}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 1062
    .local v4, "motionView":Landroid/view/View;
    if-eqz v4, :cond_45

    .line 1066
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionY:I

    .line 1068
    :cond_45
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mLastY:I

    .line 1073
    .end local v0    # "atEdge":Z
    .end local v3    # "motionIndex":I
    .end local v4    # "motionView":Landroid/view/View;
    :cond_47
    return-void

    .end local v2    # "incrementalDeltaY":I
    :cond_48
    move v2, v1

    .line 1031
    goto :goto_13

    .line 1051
    .restart local v2    # "incrementalDeltaY":I
    :cond_4a
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v7

    div-int/lit8 v3, v7, 0x2

    .restart local v3    # "motionIndex":I
    goto :goto_36
.end method

.method private setupChild(Landroid/view/View;IIZZZ)V
    .registers 27
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "y"    # I
    .param p4, "flowDown"    # Z
    .param p5, "selected"    # Z
    .param p6, "recycled"    # Z

    .prologue
    .line 1426
    const/4 v12, 0x0

    .line 1427
    .local v12, "isSelected":Z
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->isSelected()Z

    move-result v18

    .line 1428
    .local v18, "updateChildSelected":Z
    move-object/from16 v0, p0

    iget v15, v0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    .line 1429
    .local v15, "mode":I
    const/4 v2, 0x3

    if-le v15, v2, :cond_94

    const/4 v2, 0x1

    if-ge v15, v2, :cond_94

    .line 1430
    move-object/from16 v0, p0

    iget v2, v0, Lcom/etsy/android/grid/ExtendableListView;->mMotionPosition:I

    move/from16 v0, p2

    if-ne v2, v0, :cond_94

    .line 1429
    const/4 v11, 0x1

    .line 1431
    .local v11, "isPressed":Z
    :goto_18
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->isPressed()Z

    move-result v2

    xor-int v17, v11, v2

    .line 1432
    .local v17, "updateChildPressed":Z
    if-eqz p6, :cond_96

    if-nez v18, :cond_96

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->isLayoutRequested()Z

    move-result v2

    if-nez v2, :cond_96

    const/16 v16, 0x0

    .line 1434
    .local v16, "needToMeasure":Z
    :goto_2a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    move/from16 v0, p2

    invoke-interface {v2, v0}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v13

    .line 1437
    .local v13, "itemViewType":I
    const/4 v2, -0x2

    if-ne v13, v2, :cond_99

    .line 1438
    invoke-virtual/range {p0 .. p1}, Lcom/etsy/android/grid/ExtendableListView;->generateWrapperLayoutParams(Landroid/view/View;)Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    move-result-object v14

    .line 1444
    .local v14, "layoutParams":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    :goto_3b
    iput v13, v14, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->viewType:I

    .line 1445
    move/from16 v0, p2

    iput v0, v14, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->position:I

    .line 1447
    if-nez p6, :cond_4c

    iget-boolean v2, v14, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->recycledHeaderFooter:Z

    if-eqz v2, :cond_a0

    .line 1448
    iget v2, v14, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->viewType:I

    const/4 v3, -0x2

    if-ne v2, v3, :cond_a0

    .line 1450
    :cond_4c
    if-eqz p4, :cond_9e

    const/4 v2, -0x1

    :goto_4f
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2, v14}, Lcom/etsy/android/grid/ExtendableListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 1460
    :goto_56
    if-eqz v18, :cond_5e

    .line 1461
    const/4 v2, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 1464
    :cond_5e
    if-eqz v17, :cond_65

    .line 1465
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/View;->setPressed(Z)V

    .line 1468
    :cond_65
    if-eqz v16, :cond_b6

    .line 1470
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v14}, Lcom/etsy/android/grid/ExtendableListView;->onMeasureChild(Landroid/view/View;Lcom/etsy/android/grid/ExtendableListView$LayoutParams;)V

    .line 1477
    :goto_6e
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v19

    .line 1478
    .local v19, "w":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    .line 1479
    .local v10, "h":I
    if-eqz p4, :cond_ba

    move/from16 v7, p3

    .line 1485
    .local v7, "childTop":I
    :goto_7a
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildLeft(I)I

    move-result v6

    .line 1487
    .local v6, "childrenLeft":I
    if-eqz v16, :cond_bd

    .line 1488
    add-int v8, v6, v19

    .line 1489
    .local v8, "childRight":I
    add-int v9, v7, v10

    .local v9, "childBottom":I
    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p4

    .line 1490
    invoke-virtual/range {v2 .. v9}, Lcom/etsy/android/grid/ExtendableListView;->onLayoutChild(Landroid/view/View;IZIIII)V

    .line 1496
    .end local v8    # "childRight":I
    .end local v9    # "childBottom":I
    :goto_93
    return-void

    .line 1429
    .end local v6    # "childrenLeft":I
    .end local v7    # "childTop":I
    .end local v10    # "h":I
    .end local v11    # "isPressed":Z
    .end local v13    # "itemViewType":I
    .end local v14    # "layoutParams":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    .end local v16    # "needToMeasure":Z
    .end local v17    # "updateChildPressed":Z
    .end local v19    # "w":I
    :cond_94
    const/4 v11, 0x0

    goto :goto_18

    .line 1432
    .restart local v11    # "isPressed":Z
    .restart local v17    # "updateChildPressed":Z
    :cond_96
    const/16 v16, 0x1

    goto :goto_2a

    .line 1441
    .restart local v13    # "itemViewType":I
    .restart local v16    # "needToMeasure":Z
    :cond_99
    invoke-virtual/range {p0 .. p1}, Lcom/etsy/android/grid/ExtendableListView;->generateChildLayoutParams(Landroid/view/View;)Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    move-result-object v14

    .restart local v14    # "layoutParams":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    goto :goto_3b

    .line 1450
    :cond_9e
    const/4 v2, 0x0

    goto :goto_4f

    .line 1454
    :cond_a0
    iget v2, v14, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->viewType:I

    const/4 v3, -0x2

    if-ne v2, v3, :cond_a8

    .line 1455
    const/4 v2, 0x1

    iput-boolean v2, v14, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->recycledHeaderFooter:Z

    .line 1457
    :cond_a8
    if-eqz p4, :cond_b4

    const/4 v2, -0x1

    :goto_ab
    const/4 v3, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2, v14, v3}, Lcom/etsy/android/grid/ExtendableListView;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    goto :goto_56

    :cond_b4
    const/4 v2, 0x0

    goto :goto_ab

    .line 1474
    :cond_b6
    invoke-virtual/range {p0 .. p1}, Lcom/etsy/android/grid/ExtendableListView;->cleanupLayoutState(Landroid/view/View;)V

    goto :goto_6e

    .line 1479
    .restart local v10    # "h":I
    .restart local v19    # "w":I
    :cond_ba
    sub-int v7, p3, v10

    goto :goto_7a

    .restart local v6    # "childrenLeft":I
    .restart local v7    # "childTop":I
    :cond_bd
    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p4

    .line 1493
    invoke-virtual/range {v2 .. v7}, Lcom/etsy/android/grid/ExtendableListView;->onOffsetChild(Landroid/view/View;IZII)V

    goto :goto_93
.end method

.method private startFlingRunnable(F)V
    .registers 4
    .param p1, "velocity"    # F

    .prologue
    .line 1856
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFlingRunnable:Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;

    if-nez v0, :cond_b

    .line 1857
    new-instance v0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;

    invoke-direct {v0, p0}, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;-><init>(Lcom/etsy/android/grid/ExtendableListView;)V

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFlingRunnable:Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;

    .line 1859
    :cond_b
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFlingRunnable:Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;

    neg-float v1, p1

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->start(I)V

    .line 1860
    return-void
.end method

.method private startScrollIfNeeded(I)Z
    .registers 11
    .param p1, "y"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 996
    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionY:I

    sub-int v0, p1, v5

    .line 997
    .local v0, "deltaY":I
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 1000
    .local v1, "distance":I
    const/4 v3, 0x0

    .line 1001
    .local v3, "overscroll":Z
    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchSlop:I

    if-le v1, v5, :cond_3a

    .line 1006
    iput v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    .line 1007
    if-lez v0, :cond_36

    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchSlop:I

    :goto_15
    iput v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionCorrection:I

    .line 1011
    invoke-virtual {p0, v7}, Lcom/etsy/android/grid/ExtendableListView;->setPressed(Z)V

    .line 1012
    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionPosition:I

    iget v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    sub-int/2addr v5, v8

    invoke-virtual {p0, v5}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1013
    .local v2, "motionView":Landroid/view/View;
    if-eqz v2, :cond_28

    .line 1014
    invoke-virtual {v2, v7}, Landroid/view/View;->setPressed(Z)V

    .line 1016
    :cond_28
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    .line 1017
    .local v4, "parent":Landroid/view/ViewParent;
    if-eqz v4, :cond_31

    .line 1018
    invoke-interface {v4, v6}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 1021
    :cond_31
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->scrollIfNeeded(I)V

    move v5, v6

    .line 1024
    .end local v2    # "motionView":Landroid/view/View;
    .end local v4    # "parent":Landroid/view/ViewParent;
    :goto_35
    return v5

    .line 1007
    :cond_36
    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchSlop:I

    neg-int v5, v5

    goto :goto_15

    :cond_3a
    move v5, v7

    .line 1024
    goto :goto_35
.end method

.method private stopFlingRunnable()V
    .registers 2

    .prologue
    .line 1863
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFlingRunnable:Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;

    if-eqz v0, :cond_9

    .line 1864
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFlingRunnable:Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;

    # invokes: Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->endFling()V
    invoke-static {v0}, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->access$0(Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;)V

    .line 1866
    :cond_9
    return-void
.end method

.method private updateEmptyStatus()V
    .registers 9

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 2025
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_42

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/ListAdapter;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_42

    move v6, v1

    .line 2026
    .local v6, "empty":Z
    :goto_14
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->isInFilterMode()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 2027
    const/4 v6, 0x0

    .line 2030
    :cond_1b
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getEmptyView()Landroid/view/View;

    move-result-object v7

    .line 2031
    .local v7, "emptyView":Landroid/view/View;
    if-eqz v6, :cond_48

    .line 2032
    if-eqz v7, :cond_44

    .line 2033
    invoke-virtual {v7, v1}, Landroid/view/View;->setVisibility(I)V

    .line 2034
    invoke-virtual {p0, v2}, Lcom/etsy/android/grid/ExtendableListView;->setVisibility(I)V

    .line 2044
    :goto_29
    iget-boolean v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    if-eqz v0, :cond_41

    .line 2045
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getTop()I

    move-result v3

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getRight()I

    move-result v4

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getBottom()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/etsy/android/grid/ExtendableListView;->onLayout(ZIIII)V

    .line 2054
    :cond_41
    :goto_41
    return-void

    .line 2025
    .end local v6    # "empty":Z
    .end local v7    # "emptyView":Landroid/view/View;
    :cond_42
    const/4 v6, 0x1

    goto :goto_14

    .line 2038
    .restart local v6    # "empty":Z
    .restart local v7    # "emptyView":Landroid/view/View;
    :cond_44
    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->setVisibility(I)V

    goto :goto_29

    .line 2049
    :cond_48
    if-eqz v7, :cond_4d

    .line 2050
    invoke-virtual {v7, v2}, Landroid/view/View;->setVisibility(I)V

    .line 2052
    :cond_4d
    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->setVisibility(I)V

    goto :goto_41
.end method


# virtual methods
.method protected adjustViewsAfterFillGap(Z)V
    .registers 3
    .param p1, "down"    # Z

    .prologue
    .line 1270
    if-eqz p1, :cond_a

    .line 1271
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->correctTooHigh(I)V

    .line 1276
    :goto_9
    return-void

    .line 1274
    :cond_a
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->correctTooLow(I)V

    goto :goto_9
.end method

.method protected fillGap(Z)V
    .registers 6
    .param p1, "down"    # Z

    .prologue
    .line 1253
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    .line 1254
    .local v0, "count":I
    if-eqz p1, :cond_15

    .line 1256
    iget v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    add-int v1, v3, v0

    .line 1257
    .local v1, "position":I
    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildTop(I)I

    move-result v2

    .line 1258
    .local v2, "startOffset":I
    invoke-direct {p0, v1, v2}, Lcom/etsy/android/grid/ExtendableListView;->fillDown(II)Landroid/view/View;

    .line 1266
    :goto_11
    invoke-virtual {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->adjustViewsAfterFillGap(Z)V

    .line 1267
    return-void

    .line 1262
    .end local v1    # "position":I
    .end local v2    # "startOffset":I
    :cond_15
    iget v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    add-int/lit8 v1, v3, -0x1

    .line 1263
    .restart local v1    # "position":I
    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildBottom(I)I

    move-result v2

    .line 1264
    .restart local v2    # "startOffset":I
    invoke-direct {p0, v1, v2}, Lcom/etsy/android/grid/ExtendableListView;->fillUp(II)Landroid/view/View;

    goto :goto_11
.end method

.method protected generateChildLayoutParams(Landroid/view/View;)Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 1499
    invoke-virtual {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->generateWrapperLayoutParams(Landroid/view/View;)Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->generateDefaultLayoutParams()Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected generateDefaultLayoutParams()Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    .registers 5

    .prologue
    .line 1540
    new-instance v0, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    const/4 v1, -0x1

    .line 1541
    const/4 v2, -0x2

    const/4 v3, 0x0

    .line 1540
    invoke-direct {v0, v1, v2, v3}, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;-><init>(III)V

    return-object v0
.end method

.method protected generateWrapperLayoutParams(Landroid/view/View;)Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 1503
    const/4 v1, 0x0

    .line 1505
    .local v1, "layoutParams":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 1506
    .local v0, "childParams":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v0, :cond_e

    .line 1507
    instance-of v2, v0, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    if-eqz v2, :cond_15

    move-object v1, v0

    .line 1508
    check-cast v1, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    .line 1514
    :cond_e
    :goto_e
    if-nez v1, :cond_14

    .line 1515
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->generateDefaultLayoutParams()Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    move-result-object v1

    .line 1518
    :cond_14
    return-object v1

    .line 1511
    :cond_15
    new-instance v1, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    .end local v1    # "layoutParams":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    invoke-direct {v1, v0}, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .restart local v1    # "layoutParams":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    goto :goto_e
.end method

.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .registers 2

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/widget/ListAdapter;
    .registers 2

    .prologue
    .line 252
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method protected getChildBottom(I)I
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 1769
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    .line 1770
    .local v0, "count":I
    const/4 v1, 0x0

    .line 1771
    .local v1, "paddingBottom":I
    iget-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mClipToPadding:Z

    if-eqz v2, :cond_d

    .line 1772
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingBottom()I

    move-result v1

    .line 1774
    :cond_d
    if-lez v0, :cond_19

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    :goto_18
    return v2

    :cond_19
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getHeight()I

    move-result v2

    sub-int/2addr v2, v1

    goto :goto_18
.end method

.method protected getChildLeft(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 1746
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingLeft()I

    move-result v0

    return v0
.end method

.method protected getChildTop(I)I
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 1755
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    .line 1756
    .local v0, "count":I
    const/4 v1, 0x0

    .line 1757
    .local v1, "paddingTop":I
    iget-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mClipToPadding:Z

    if-eqz v2, :cond_d

    .line 1758
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v1

    .line 1760
    :cond_d
    if-lez v0, :cond_19

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {p0, v2}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v1

    .end local v1    # "paddingTop":I
    :cond_19
    return v1
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 282
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    return v0
.end method

.method protected getFirstChildTop()I
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 1791
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->hasChildren()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    :cond_f
    return v0
.end method

.method public getFirstVisiblePosition()I
    .registers 4

    .prologue
    .line 1821
    const/4 v0, 0x0

    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getHeaderViewsCount()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public getFooterViewsCount()I
    .registers 2

    .prologue
    .line 446
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getHeaderViewsCount()I
    .registers 2

    .prologue
    .line 363
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method protected getHighestChildTop()I
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 1795
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->hasChildren()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    :cond_f
    return v0
.end method

.method protected getLastChildBottom()I
    .registers 2

    .prologue
    .line 1799
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public getLastVisiblePosition()I
    .registers 3

    .prologue
    .line 1826
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method protected getLowestChildBottom()I
    .registers 2

    .prologue
    .line 1803
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method protected getNextChildDownsTop(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 1778
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    .line 1779
    .local v0, "count":I
    if-lez v0, :cond_11

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v1

    :goto_10
    return v1

    :cond_11
    const/4 v1, 0x0

    goto :goto_10
.end method

.method protected getNextChildUpsBottom(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x0

    .line 1783
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    .line 1784
    .local v0, "count":I
    if-nez v0, :cond_8

    .line 1787
    :cond_7
    :goto_7
    return v1

    :cond_8
    if-lez v0, :cond_7

    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    goto :goto_7
.end method

.method public getSelectedView()Landroid/view/View;
    .registers 2

    .prologue
    .line 292
    const/4 v0, 0x0

    return-object v0
.end method

.method protected handleDataChanged()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 626
    invoke-super {p0}, Landroid/widget/AbsListView;->handleDataChanged()V

    .line 628
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    .line 630
    .local v0, "count":I
    if-lez v0, :cond_23

    iget-boolean v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mNeedSync:Z

    if-eqz v1, :cond_23

    .line 631
    iput-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mNeedSync:Z

    .line 632
    iput-object v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    .line 634
    const/4 v1, 0x2

    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mLayoutMode:I

    .line 635
    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncPosition:I

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/lit8 v2, v0, -0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncPosition:I

    .line 644
    :goto_22
    return-void

    .line 639
    :cond_23
    const/4 v1, 0x1

    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mLayoutMode:I

    .line 640
    iput-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mNeedSync:Z

    .line 641
    iput-object v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    goto :goto_22
.end method

.method protected hasChildren()Z
    .registers 2

    .prologue
    .line 1807
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected hasSpaceDown()Z
    .registers 2

    .prologue
    .line 1302
    const/4 v0, 0x0

    return v0
.end method

.method protected hasSpaceUp()Z
    .registers 2

    .prologue
    .line 1327
    const/4 v0, 0x0

    return v0
.end method

.method invokeOnItemScrollListener()V
    .registers 5

    .prologue
    .line 2014
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_11

    .line 2015
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v2

    iget v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    invoke-interface {v0, p0, v1, v2, v3}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    .line 2017
    :cond_11
    return-void
.end method

.method protected layoutChildren()V
    .registers 12

    .prologue
    const/4 v10, 0x0

    .line 524
    iget-boolean v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mBlockLayoutRequests:Z

    if-eqz v7, :cond_6

    .line 621
    :goto_5
    return-void

    .line 525
    :cond_6
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mBlockLayoutRequests:Z

    .line 528
    :try_start_9
    invoke-super {p0}, Landroid/widget/AbsListView;->layoutChildren()V

    .line 529
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->invalidate()V

    .line 531
    iget-object v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    if-nez v7, :cond_19

    .line 532
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->clearState()V
    :try_end_16
    .catchall {:try_start_9 .. :try_end_16} :catchall_83

    .line 619
    iput-boolean v10, p0, Lcom/etsy/android/grid/ExtendableListView;->mBlockLayoutRequests:Z

    goto :goto_5

    .line 536
    :cond_19
    :try_start_19
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v1

    .line 538
    .local v1, "childrenTop":I
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    .line 539
    .local v0, "childCount":I
    const/4 v5, 0x0

    .line 542
    .local v5, "oldFirst":Landroid/view/View;
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mLayoutMode:I

    if-nez v7, :cond_2b

    .line 543
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 546
    :cond_2b
    iget-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    .line 547
    .local v2, "dataChanged":Z
    if-eqz v2, :cond_32

    .line 548
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->handleDataChanged()V

    .line 554
    :cond_32
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    if-nez v7, :cond_3c

    .line 555
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->clearState()V
    :try_end_39
    .catchall {:try_start_19 .. :try_end_39} :catchall_83

    .line 619
    iput-boolean v10, p0, Lcom/etsy/android/grid/ExtendableListView;->mBlockLayoutRequests:Z

    goto :goto_5

    .line 558
    :cond_3c
    :try_start_3c
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    iget-object v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v8}, Landroid/widget/ListAdapter;->getCount()I

    move-result v8

    if-eq v7, v8, :cond_87

    .line 559
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "The content of the adapter has changed but ExtendableListView did not receive a notification. Make sure the content of your adapter is not modified from a background thread, but only from the UI thread. [in ExtendableListView("

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 562
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getId()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 563
    const-string v9, ") with Adapter("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 559
    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_83
    .catchall {:try_start_3c .. :try_end_83} :catchall_83

    .line 618
    .end local v0    # "childCount":I
    .end local v1    # "childrenTop":I
    .end local v2    # "dataChanged":Z
    .end local v5    # "oldFirst":Landroid/view/View;
    :catchall_83
    move-exception v7

    .line 619
    iput-boolean v10, p0, Lcom/etsy/android/grid/ExtendableListView;->mBlockLayoutRequests:Z

    .line 620
    throw v7

    .line 568
    .restart local v0    # "childCount":I
    .restart local v1    # "childrenTop":I
    .restart local v2    # "dataChanged":Z
    .restart local v5    # "oldFirst":Landroid/view/View;
    :cond_87
    :try_start_87
    iget v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 569
    .local v3, "firstPosition":I
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    .line 571
    .local v6, "recycleBin":Lcom/etsy/android/grid/ExtendableListView$RecycleBin;
    if-eqz v2, :cond_bc

    .line 572
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_8e
    if-lt v4, v0, :cond_b0

    .line 581
    .end local v4    # "i":I
    :goto_90
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->detachAllViewsFromParent()V

    .line 582
    invoke-virtual {v6}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->removeSkippedScrap()V

    .line 584
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mLayoutMode:I

    packed-switch v7, :pswitch_data_f0

    .line 599
    if-nez v0, :cond_d8

    .line 600
    invoke-direct {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->fillFromTop(I)Landroid/view/View;

    .line 614
    .end local v1    # "childrenTop":I
    :goto_a0
    invoke-virtual {v6}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->scrapActiveViews()V

    .line 615
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    .line 616
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mNeedSync:Z

    .line 617
    const/4 v7, 0x0

    iput v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mLayoutMode:I
    :try_end_ac
    .catchall {:try_start_87 .. :try_end_ac} :catchall_83

    .line 619
    iput-boolean v10, p0, Lcom/etsy/android/grid/ExtendableListView;->mBlockLayoutRequests:Z

    goto/16 :goto_5

    .line 573
    .restart local v1    # "childrenTop":I
    .restart local v4    # "i":I
    :cond_b0
    :try_start_b0
    invoke-virtual {p0, v4}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    add-int v8, v3, v4

    invoke-virtual {v6, v7, v8}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->addScrapView(Landroid/view/View;I)V

    .line 572
    add-int/lit8 v4, v4, 0x1

    goto :goto_8e

    .line 577
    .end local v4    # "i":I
    :cond_bc
    invoke-virtual {v6, v0, v3}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->fillActiveViews(II)V

    goto :goto_90

    .line 586
    :pswitch_c0
    const/4 v7, 0x0

    iput v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 587
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->resetToTop()V

    .line 588
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->adjustViewsUpOrDown()V

    .line 589
    invoke-direct {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->fillFromTop(I)Landroid/view/View;

    .line 590
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->adjustViewsUpOrDown()V

    goto :goto_a0

    .line 594
    :pswitch_d0
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncPosition:I

    iget v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mSpecificTop:I

    invoke-direct {p0, v7, v8}, Lcom/etsy/android/grid/ExtendableListView;->fillSpecific(II)Landroid/view/View;

    goto :goto_a0

    .line 602
    :cond_d8
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    iget v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    if-ge v7, v8, :cond_eb

    .line 603
    iget v7, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 604
    if-nez v5, :cond_e6

    .line 603
    .end local v1    # "childrenTop":I
    :goto_e2
    invoke-direct {p0, v7, v1}, Lcom/etsy/android/grid/ExtendableListView;->fillSpecific(II)Landroid/view/View;

    goto :goto_a0

    .line 604
    .restart local v1    # "childrenTop":I
    :cond_e6
    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v1

    goto :goto_e2

    .line 607
    :cond_eb
    const/4 v7, 0x0

    invoke-direct {p0, v7, v1}, Lcom/etsy/android/grid/ExtendableListView;->fillSpecific(II)Landroid/view/View;
    :try_end_ef
    .catchall {:try_start_b0 .. :try_end_ef} :catchall_83

    goto :goto_a0

    .line 584
    :pswitch_data_f0
    .packed-switch 0x1
        :pswitch_c0
        :pswitch_d0
    .end packed-switch
.end method

.method public notifyTouchMode()V
    .registers 2

    .prologue
    .line 1984
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    packed-switch v0, :pswitch_data_16

    .line 1995
    :goto_5
    return-void

    .line 1986
    :pswitch_6
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->reportScrollStateChange(I)V

    goto :goto_5

    .line 1989
    :pswitch_b
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->reportScrollStateChange(I)V

    goto :goto_5

    .line 1992
    :pswitch_10
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->reportScrollStateChange(I)V

    goto :goto_5

    .line 1984
    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_10
        :pswitch_6
        :pswitch_b
    .end packed-switch
.end method

.method protected offsetChildrenTopAndBottom(I)V
    .registers 5
    .param p1, "offset"    # I

    .prologue
    .line 1812
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    .line 1813
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-lt v1, v0, :cond_8

    .line 1817
    return-void

    .line 1814
    :cond_8
    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1815
    .local v2, "v":Landroid/view/View;
    invoke-virtual {v2, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 1813
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 197
    invoke-super {p0}, Landroid/widget/AbsListView;->onAttachedToWindow()V

    .line 199
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_16

    .line 201
    iput-boolean v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    .line 202
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mOldItemCount:I

    .line 203
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    .line 205
    :cond_16
    iput-boolean v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mIsAttached:Z

    .line 206
    return-void
.end method

.method protected onChildCreated(IZ)V
    .registers 3
    .param p1, "position"    # I
    .param p2, "flowDown"    # Z

    .prologue
    .line 1720
    return-void
.end method

.method protected onChildrenDetached(II)V
    .registers 3
    .param p1, "start"    # I
    .param p2, "count"    # I

    .prologue
    .line 1243
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 210
    invoke-super {p0}, Landroid/widget/AbsListView;->onDetachedFromWindow()V

    .line 213
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->clear()V

    .line 215
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFlingRunnable:Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;

    if-eqz v0, :cond_11

    .line 216
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFlingRunnable:Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;

    invoke-virtual {p0, v0}, Lcom/etsy/android/grid/ExtendableListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 219
    :cond_11
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mIsAttached:Z

    .line 220
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .registers 4
    .param p1, "gainFocus"    # Z
    .param p2, "direction"    # I
    .param p3, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .prologue
    .line 225
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 13
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v10, 0x2

    const/4 v7, 0x1

    const/4 v9, -0x1

    const/4 v6, 0x0

    .line 723
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 725
    .local v0, "action":I
    iget-boolean v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mIsAttached:Z

    if-nez v8, :cond_d

    .line 800
    :cond_c
    :goto_c
    return v6

    .line 734
    :cond_d
    and-int/lit16 v8, v0, 0xff

    packed-switch v8, :pswitch_data_80

    :pswitch_12
    goto :goto_c

    .line 736
    :pswitch_13
    iget v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    .line 744
    .local v3, "touchMode":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v8

    float-to-int v4, v8

    .line 745
    .local v4, "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    float-to-int v5, v8

    .line 746
    .local v5, "y":I
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v8

    iput v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    .line 748
    invoke-direct {p0, v5}, Lcom/etsy/android/grid/ExtendableListView;->findMotionRow(I)I

    move-result v1

    .line 749
    .local v1, "motionPosition":I
    if-eq v3, v10, :cond_36

    if-ltz v1, :cond_36

    .line 752
    iput v4, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionX:I

    .line 753
    iput v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionY:I

    .line 754
    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mMotionPosition:I

    .line 755
    const/4 v8, 0x3

    iput v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    .line 757
    :cond_36
    const/high16 v8, -0x80000000

    iput v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mLastY:I

    .line 758
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->initOrResetVelocityTracker()V

    .line 759
    iget-object v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 760
    if-ne v3, v10, :cond_c

    move v6, v7

    .line 761
    goto :goto_c

    .line 767
    .end local v1    # "motionPosition":I
    .end local v3    # "touchMode":I
    .end local v4    # "x":I
    .end local v5    # "y":I
    :pswitch_46
    iget v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    packed-switch v8, :pswitch_data_92

    goto :goto_c

    .line 769
    :pswitch_4c
    iget v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v2

    .line 770
    .local v2, "pointerIndex":I
    if-ne v2, v9, :cond_5b

    .line 771
    const/4 v2, 0x0

    .line 772
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v8

    iput v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    .line 774
    :cond_5b
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    float-to-int v5, v8

    .line 775
    .restart local v5    # "y":I
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->initVelocityTrackerIfNotExists()V

    .line 776
    iget-object v8, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 777
    invoke-direct {p0, v5}, Lcom/etsy/android/grid/ExtendableListView;->startScrollIfNeeded(I)Z

    move-result v8

    if-eqz v8, :cond_c

    move v6, v7

    .line 778
    goto :goto_c

    .line 787
    .end local v2    # "pointerIndex":I
    .end local v5    # "y":I
    :pswitch_70
    iput v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I

    .line 788
    iput v9, p0, Lcom/etsy/android/grid/ExtendableListView;->mActivePointerId:I

    .line 789
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->recycleVelocityTracker()V

    .line 790
    invoke-virtual {p0, v6}, Lcom/etsy/android/grid/ExtendableListView;->reportScrollStateChange(I)V

    goto :goto_c

    .line 795
    :pswitch_7b
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    goto :goto_c

    .line 734
    nop

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_13
        :pswitch_70
        :pswitch_46
        :pswitch_70
        :pswitch_12
        :pswitch_12
        :pswitch_7b
    .end packed-switch

    .line 767
    :pswitch_data_92
    .packed-switch 0x3
        :pswitch_4c
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .registers 9
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 501
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    if-nez v2, :cond_5

    .line 517
    :goto_4
    return-void

    .line 505
    :cond_5
    if-eqz p1, :cond_13

    .line 506
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    .line 507
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-lt v1, v0, :cond_1d

    .line 510
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    invoke-virtual {v2}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->markChildrenDirty()V

    .line 514
    .end local v0    # "childCount":I
    .end local v1    # "i":I
    :cond_13
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mInLayout:Z

    .line 515
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->layoutChildren()V

    .line 516
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mInLayout:Z

    goto :goto_4

    .line 508
    .restart local v0    # "childCount":I
    .restart local v1    # "i":I
    :cond_1d
    invoke-virtual {p0, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->forceLayout()V

    .line 507
    add-int/lit8 v1, v1, 0x1

    goto :goto_c
.end method

.method protected onLayoutChild(Landroid/view/View;IZIIII)V
    .registers 8
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "flowDown"    # Z
    .param p4, "childrenLeft"    # I
    .param p5, "childTop"    # I
    .param p6, "childRight"    # I
    .param p7, "childBottom"    # I

    .prologue
    .line 1728
    invoke-virtual {p1, p4, p5, p6, p7}, Landroid/view/View;->layout(IIII)V

    .line 1729
    return-void
.end method

.method protected onMeasure(II)V
    .registers 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 659
    invoke-super {p0, p1, p2}, Landroid/widget/AbsListView;->onMeasure(II)V

    .line 660
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 661
    .local v1, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 662
    .local v0, "heightSize":I
    invoke-virtual {p0, v1, v0}, Lcom/etsy/android/grid/ExtendableListView;->setMeasuredDimension(II)V

    .line 663
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mWidthMeasureSpec:I

    .line 664
    return-void
.end method

.method protected onMeasureChild(Landroid/view/View;Lcom/etsy/android/grid/ExtendableListView$LayoutParams;)V
    .registers 10
    .param p1, "child"    # Landroid/view/View;
    .param p2, "layoutParams"    # Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    .prologue
    const/4 v6, 0x0

    .line 1526
    iget v3, p0, Lcom/etsy/android/grid/ExtendableListView;->mWidthMeasureSpec:I

    .line 1527
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingLeft()I

    move-result v4

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingRight()I

    move-result v5

    add-int/2addr v4, v5

    iget v5, p2, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->width:I

    .line 1526
    invoke-static {v3, v4, v5}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v1

    .line 1528
    .local v1, "childWidthSpec":I
    iget v2, p2, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->height:I

    .line 1530
    .local v2, "lpHeight":I
    if-lez v2, :cond_20

    .line 1531
    const/high16 v3, 0x40000000

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 1536
    .local v0, "childHeightSpec":I
    :goto_1c
    invoke-virtual {p1, v1, v0}, Landroid/view/View;->measure(II)V

    .line 1537
    return-void

    .line 1534
    .end local v0    # "childHeightSpec":I
    :cond_20
    invoke-static {v6, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .restart local v0    # "childHeightSpec":I
    goto :goto_1c
.end method

.method protected onOffsetChild(Landroid/view/View;IZII)V
    .registers 7
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "flowDown"    # Z
    .param p4, "childrenLeft"    # I
    .param p5, "childTop"    # I

    .prologue
    .line 1736
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    sub-int v0, p4, v0

    invoke-virtual {p1, v0}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 1737
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    sub-int v0, p5, v0

    invoke-virtual {p1, v0}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 1738
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 9
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    const/4 v6, 0x1

    .line 2716
    move-object v0, p1

    check-cast v0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    .line 2717
    .local v0, "ss":Lcom/etsy/android/grid/ExtendableListView$ListSavedState;
    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/AbsListView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 2718
    iput-boolean v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    .line 2720
    iget v1, v0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->height:I

    int-to-long v2, v1

    iput-wide v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncHeight:J

    .line 2722
    iget-wide v2, v0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->firstId:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-ltz v1, :cond_2a

    .line 2723
    iput-boolean v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mNeedSync:Z

    .line 2724
    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    .line 2725
    iget-wide v2, v0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->firstId:J

    iput-wide v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncRowId:J

    .line 2726
    iget v1, v0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->position:I

    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncPosition:I

    .line 2727
    iget v1, v0, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->viewTop:I

    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mSpecificTop:I

    .line 2729
    :cond_2a
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->requestLayout()V

    .line 2730
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 9

    .prologue
    const/4 v5, 0x0

    .line 2668
    invoke-super {p0}, Landroid/widget/AbsListView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v3

    .line 2669
    .local v3, "superState":Landroid/os/Parcelable;
    new-instance v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    invoke-direct {v2, v3}, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 2671
    .local v2, "ss":Lcom/etsy/android/grid/ExtendableListView$ListSavedState;
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    if-eqz v6, :cond_2d

    .line 2673
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    iget-wide v6, v5, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->selectedId:J

    iput-wide v6, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->selectedId:J

    .line 2674
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    iget-wide v6, v5, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->firstId:J

    iput-wide v6, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->firstId:J

    .line 2675
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    iget v5, v5, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->viewTop:I

    iput v5, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->viewTop:I

    .line 2676
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    iget v5, v5, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->position:I

    iput v5, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->position:I

    .line 2677
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncState:Lcom/etsy/android/grid/ExtendableListView$ListSavedState;

    iget v5, v5, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->height:I

    iput v5, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->height:I

    .line 2711
    :goto_2c
    return-object v2

    .line 2681
    :cond_2d
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v6

    if-lez v6, :cond_69

    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    if-lez v6, :cond_69

    const/4 v1, 0x1

    .line 2682
    .local v1, "haveChildren":Z
    :goto_38
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getSelectedItemId()J

    move-result-wide v6

    iput-wide v6, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->selectedId:J

    .line 2683
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getHeight()I

    move-result v6

    iput v6, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->height:I

    .line 2686
    if-eqz v1, :cond_6b

    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    if-lez v6, :cond_6b

    .line 2696
    invoke-virtual {p0, v5}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 2697
    .local v4, "v":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v5

    iput v5, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->viewTop:I

    .line 2698
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 2699
    .local v0, "firstPos":I
    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    if-lt v0, v5, :cond_5e

    .line 2700
    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    add-int/lit8 v0, v5, -0x1

    .line 2702
    :cond_5e
    iput v0, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->position:I

    .line 2703
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v5, v0}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v6

    iput-wide v6, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->firstId:J

    goto :goto_2c

    .end local v0    # "firstPos":I
    .end local v1    # "haveChildren":Z
    .end local v4    # "v":Landroid/view/View;
    :cond_69
    move v1, v5

    .line 2681
    goto :goto_38

    .line 2706
    .restart local v1    # "haveChildren":Z
    :cond_6b
    iput v5, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->viewTop:I

    .line 2707
    const-wide/16 v6, -0x1

    iput-wide v6, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->firstId:J

    .line 2708
    iput v5, v2, Lcom/etsy/android/grid/ExtendableListView$ListSavedState;->position:I

    goto :goto_2c
.end method

.method protected onSizeChanged(II)V
    .registers 4
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 238
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v0

    if-lez v0, :cond_14

    .line 239
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->stopFlingRunnable()V

    .line 240
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->clear()V

    .line 241
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    .line 242
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->rememberSyncState()V

    .line 244
    :cond_14
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 234
    invoke-virtual {p0, p1, p2}, Lcom/etsy/android/grid/ExtendableListView;->onSizeChanged(II)V

    .line 235
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x0

    .line 679
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_16

    .line 682
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->isClickable()Z

    move-result v2

    if-nez v2, :cond_14

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->isLongClickable()Z

    move-result v2

    if-nez v2, :cond_14

    .line 717
    :cond_13
    :goto_13
    return v1

    .line 682
    :cond_14
    const/4 v1, 0x1

    goto :goto_13

    .line 685
    :cond_16
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->initVelocityTrackerIfNotExists()V

    .line 686
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 688
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->hasChildren()Z

    move-result v2

    if-eqz v2, :cond_13

    .line 691
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    and-int/lit16 v0, v2, 0xff

    .line 692
    .local v0, "action":I
    packed-switch v0, :pswitch_data_4a

    .line 711
    :pswitch_2d
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->onTouchUp(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 715
    .local v1, "handled":Z
    :goto_31
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->notifyTouchMode()V

    goto :goto_13

    .line 694
    .end local v1    # "handled":Z
    :pswitch_35
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->onTouchDown(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 695
    .restart local v1    # "handled":Z
    goto :goto_31

    .line 698
    .end local v1    # "handled":Z
    :pswitch_3a
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->onTouchMove(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 699
    .restart local v1    # "handled":Z
    goto :goto_31

    .line 702
    .end local v1    # "handled":Z
    :pswitch_3f
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->onTouchCancel(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 703
    .restart local v1    # "handled":Z
    goto :goto_31

    .line 706
    .end local v1    # "handled":Z
    :pswitch_44
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView;->onTouchPointerUp(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 707
    .restart local v1    # "handled":Z
    goto :goto_31

    .line 692
    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_35
        :pswitch_2d
        :pswitch_3a
        :pswitch_3f
        :pswitch_2d
        :pswitch_2d
        :pswitch_44
    .end packed-switch
.end method

.method public onWindowFocusChanged(Z)V
    .registers 2
    .param p1, "hasWindowFocus"    # Z

    .prologue
    .line 230
    return-void
.end method

.method rememberSyncState()V
    .registers 5

    .prologue
    .line 2560
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v2

    if-lez v2, :cond_39

    .line 2561
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mNeedSync:Z

    .line 2562
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getHeight()I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncHeight:J

    .line 2564
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2565
    .local v1, "v":Landroid/view/View;
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    .line 2566
    .local v0, "adapter":Landroid/widget/ListAdapter;
    iget v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    if-ltz v2, :cond_3a

    iget v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_3a

    .line 2567
    iget v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    invoke-interface {v0, v2}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncRowId:J

    .line 2572
    :goto_2d
    if-eqz v1, :cond_35

    .line 2573
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v2

    iput v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mSpecificTop:I

    .line 2575
    :cond_35
    iget v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    iput v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncPosition:I

    .line 2577
    .end local v0    # "adapter":Landroid/widget/ListAdapter;
    .end local v1    # "v":Landroid/view/View;
    :cond_39
    return-void

    .line 2570
    .restart local v0    # "adapter":Landroid/widget/ListAdapter;
    .restart local v1    # "v":Landroid/view/View;
    :cond_3a
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncRowId:J

    goto :goto_2d
.end method

.method reportScrollStateChange(I)V
    .registers 3
    .param p1, "newState"    # I

    .prologue
    .line 2005
    iget v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mScrollState:I

    if-eq p1, v0, :cond_f

    .line 2006
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mScrollState:I

    .line 2007
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_f

    .line 2008
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p0, p1}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 2011
    :cond_f
    return-void
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 2
    .param p1, "disallowIntercept"    # Z

    .prologue
    .line 805
    if-eqz p1, :cond_5

    .line 806
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView;->recycleVelocityTracker()V

    .line 808
    :cond_5
    invoke-super {p0, p1}, Landroid/widget/AbsListView;->requestDisallowInterceptTouchEvent(Z)V

    .line 809
    return-void
.end method

.method public requestLayout()V
    .registers 2

    .prologue
    .line 489
    iget-boolean v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mBlockLayoutRequests:Z

    if-nez v0, :cond_b

    iget-boolean v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mInLayout:Z

    if-nez v0, :cond_b

    .line 490
    invoke-super {p0}, Landroid/widget/AbsListView;->requestLayout()V

    .line 492
    :cond_b
    return-void
.end method

.method public resetToTop()V
    .registers 1

    .prologue
    .line 648
    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 5
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 257
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_b

    .line 258
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mObserver:Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 262
    :cond_b
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_1b

    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_45

    .line 263
    :cond_1b
    new-instance v0, Lcom/etsy/android/grid/HeaderViewListAdapter;

    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2, p1}, Lcom/etsy/android/grid/HeaderViewListAdapter;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/widget/ListAdapter;)V

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 269
    :goto_26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z

    .line 270
    if-eqz p1, :cond_48

    invoke-interface {p1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    :goto_2f
    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I

    .line 272
    if-eqz p1, :cond_41

    .line 273
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mObserver:Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 274
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    invoke-interface {p1}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->setViewTypeCount(I)V

    .line 277
    :cond_41
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->requestLayout()V

    .line 278
    return-void

    .line 266
    :cond_45
    iput-object p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    goto :goto_26

    .line 270
    :cond_48
    const/4 v0, 0x0

    goto :goto_2f
.end method

.method public setClipToPadding(Z)V
    .registers 2
    .param p1, "clipToPadding"    # Z

    .prologue
    .line 476
    invoke-super {p0, p1}, Landroid/widget/AbsListView;->setClipToPadding(Z)V

    .line 477
    iput-boolean p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mClipToPadding:Z

    .line 478
    return-void
.end method

.method public setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .registers 2
    .param p1, "scrollListener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 2000
    invoke-super {p0, p1}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 2001
    iput-object p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    .line 2002
    return-void
.end method

.method public setSelection(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 297
    if-ltz p1, :cond_1f

    .line 298
    const/4 v0, 0x2

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mLayoutMode:I

    .line 299
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->getListPaddingTop()I

    move-result v0

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mSpecificTop:I

    .line 301
    const/4 v0, 0x0

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    .line 302
    iget-boolean v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mNeedSync:Z

    if-eqz v0, :cond_1c

    .line 303
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncPosition:I

    .line 304
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/etsy/android/grid/ExtendableListView;->mSyncRowId:J

    .line 306
    :cond_1c
    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView;->requestLayout()V

    .line 308
    :cond_1f
    return-void
.end method
