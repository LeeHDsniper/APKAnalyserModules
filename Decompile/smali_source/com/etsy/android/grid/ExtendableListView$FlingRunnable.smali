.class Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;
.super Ljava/lang/Object;
.source "ExtendableListView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/ExtendableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FlingRunnable"
.end annotation


# instance fields
.field private mLastFlingY:I

.field private final mScroller:Landroid/widget/Scroller;

.field final synthetic this$0:Lcom/etsy/android/grid/ExtendableListView;


# direct methods
.method constructor <init>(Lcom/etsy/android/grid/ExtendableListView;)V
    .registers 4

    .prologue
    .line 1888
    iput-object p1, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1889
    new-instance v0, Landroid/widget/Scroller;

    invoke-virtual {p1}, Lcom/etsy/android/grid/ExtendableListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    .line 1890
    return-void
.end method

.method static synthetic access$0(Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;)V
    .registers 1

    .prologue
    .line 1909
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->endFling()V

    return-void
.end method

.method private endFling()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1910
    iput v1, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->mLastFlingY:I

    .line 1911
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-static {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->access$2(Lcom/etsy/android/grid/ExtendableListView;I)V

    .line 1913
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->reportScrollStateChange(I)V

    .line 1914
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v0, p0}, Lcom/etsy/android/grid/ExtendableListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1916
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 1917
    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    .line 1920
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # getter for: Lcom/etsy/android/grid/ExtendableListView;->mTouchMode:I
    invoke-static {v6}, Lcom/etsy/android/grid/ExtendableListView;->access$4(Lcom/etsy/android/grid/ExtendableListView;)I

    move-result v6

    packed-switch v6, :pswitch_data_9c

    .line 1967
    :goto_9
    return-void

    .line 1925
    :pswitch_a
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # getter for: Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I
    invoke-static {v6}, Lcom/etsy/android/grid/ExtendableListView;->access$5(Lcom/etsy/android/grid/ExtendableListView;)I

    move-result v6

    if-eqz v6, :cond_1a

    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v6}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v6

    if-nez v6, :cond_1e

    .line 1926
    :cond_1a
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->endFling()V

    goto :goto_9

    .line 1930
    :cond_1e
    iget-object v4, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    .line 1931
    .local v4, "scroller":Landroid/widget/Scroller;
    invoke-virtual {v4}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v2

    .line 1932
    .local v2, "more":Z
    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrY()I

    move-result v5

    .line 1936
    .local v5, "y":I
    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->mLastFlingY:I

    sub-int v1, v6, v5

    .line 1939
    .local v1, "delta":I
    if-lez v1, :cond_68

    .line 1941
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget-object v7, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget v7, v7, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    invoke-static {v6, v7}, Lcom/etsy/android/grid/ExtendableListView;->access$6(Lcom/etsy/android/grid/ExtendableListView;I)V

    .line 1943
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v6}, Lcom/etsy/android/grid/ExtendableListView;->getHeight()I

    move-result v6

    iget-object v7, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v7}, Lcom/etsy/android/grid/ExtendableListView;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    iget-object v7, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v7}, Lcom/etsy/android/grid/ExtendableListView;->getPaddingTop()I

    move-result v7

    sub-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    invoke-static {v6, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1954
    :goto_51
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->moveTheChildren(II)Z
    invoke-static {v6, v1, v1}, Lcom/etsy/android/grid/ExtendableListView;->access$7(Lcom/etsy/android/grid/ExtendableListView;II)Z

    move-result v0

    .line 1956
    .local v0, "atEnd":Z
    if-eqz v2, :cond_96

    if-nez v0, :cond_96

    .line 1957
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v6}, Lcom/etsy/android/grid/ExtendableListView;->invalidate()V

    .line 1958
    iput v5, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->mLastFlingY:I

    .line 1959
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->postOnAnimate(Ljava/lang/Runnable;)V
    invoke-static {v6, p0}, Lcom/etsy/android/grid/ExtendableListView;->access$3(Lcom/etsy/android/grid/ExtendableListView;Ljava/lang/Runnable;)V

    goto :goto_9

    .line 1947
    .end local v0    # "atEnd":Z
    :cond_68
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v6}, Lcom/etsy/android/grid/ExtendableListView;->getChildCount()I

    move-result v6

    add-int/lit8 v3, v6, -0x1

    .line 1948
    .local v3, "offsetToLast":I
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget-object v7, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget v7, v7, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    add-int/2addr v7, v3

    invoke-static {v6, v7}, Lcom/etsy/android/grid/ExtendableListView;->access$6(Lcom/etsy/android/grid/ExtendableListView;I)V

    .line 1951
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v6}, Lcom/etsy/android/grid/ExtendableListView;->getHeight()I

    move-result v6

    iget-object v7, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v7}, Lcom/etsy/android/grid/ExtendableListView;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    iget-object v7, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v7}, Lcom/etsy/android/grid/ExtendableListView;->getPaddingTop()I

    move-result v7

    sub-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    neg-int v6, v6

    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_51

    .line 1962
    .end local v3    # "offsetToLast":I
    .restart local v0    # "atEnd":Z
    :cond_96
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->endFling()V

    goto/16 :goto_9

    .line 1920
    nop

    :pswitch_data_9c
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method start(I)V
    .registers 11
    .param p1, "initialVelocity"    # I

    .prologue
    const v6, 0x7fffffff

    const/4 v1, 0x0

    .line 1893
    if-gez p1, :cond_25

    move v2, v6

    .line 1894
    .local v2, "initialY":I
    :goto_7
    iput v2, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->mLastFlingY:I

    .line 1895
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 1896
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    move v3, v1

    move v4, p1

    move v5, v1

    move v7, v1

    move v8, v6

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 1897
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->access$2(Lcom/etsy/android/grid/ExtendableListView;I)V

    .line 1898
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$FlingRunnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->postOnAnimate(Ljava/lang/Runnable;)V
    invoke-static {v0, p0}, Lcom/etsy/android/grid/ExtendableListView;->access$3(Lcom/etsy/android/grid/ExtendableListView;Ljava/lang/Runnable;)V

    .line 1899
    return-void

    .end local v2    # "initialY":I
    :cond_25
    move v2, v1

    .line 1893
    goto :goto_7
.end method
