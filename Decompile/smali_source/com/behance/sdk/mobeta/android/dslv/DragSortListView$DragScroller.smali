.class Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;
.super Ljava/lang/Object;
.source "DragSortListView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DragScroller"
.end annotation


# instance fields
.field private dt:F

.field private dy:I

.field private mAbort:Z

.field private mCurrTime:J

.field private mPrevTime:J

.field private mScrollSpeed:F

.field private mScrolling:Z

.field private scrollDir:I

.field private tStart:J

.field final synthetic this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;


# direct methods
.method public constructor <init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V
    .registers 3

    .prologue
    .line 2786
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2776
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    .line 2787
    return-void
.end method


# virtual methods
.method public getScrollDir()I
    .registers 2

    .prologue
    .line 2783
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->scrollDir:I

    :goto_6
    return v0

    :cond_7
    const/4 v0, -0x1

    goto :goto_6
.end method

.method public isScrolling()Z
    .registers 2

    .prologue
    .line 2779
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    return v0
.end method

.method public run()V
    .registers 19

    .prologue
    .line 2814
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mAbort:Z

    if-eqz v13, :cond_c

    .line 2815
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    .line 2900
    :goto_b
    return-void

    .line 2821
    :cond_c
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v3

    .line 2822
    .local v3, "first":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getLastVisiblePosition()I

    move-result v4

    .line 2823
    .local v4, "last":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v2

    .line 2824
    .local v2, "count":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingTop()I

    move-result v10

    .line 2825
    .local v10, "padTop":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeight()I

    move-result v13

    sub-int/2addr v13, v10

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingBottom()I

    move-result v14

    sub-int v5, v13, v14

    .line 2827
    .local v5, "listHeight":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mY:I
    invoke-static {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I
    invoke-static {v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2000(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeightHalf:I
    invoke-static {v15}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v15

    add-int/2addr v14, v15

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 2828
    .local v7, "minY":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mY:I
    invoke-static {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I
    invoke-static {v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2000(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeightHalf:I
    invoke-static {v15}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v15

    sub-int/2addr v14, v15

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 2830
    .local v6, "maxY":I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->scrollDir:I

    if-nez v13, :cond_163

    .line 2831
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 2833
    .local v12, "v":Landroid/view/View;
    if-nez v12, :cond_91

    .line 2834
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    goto/16 :goto_b

    .line 2837
    :cond_91
    if-nez v3, :cond_a0

    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    move-result v13

    if-ne v13, v10, :cond_a0

    .line 2838
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    goto/16 :goto_b

    .line 2842
    :cond_a0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mScrollProfile:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;
    invoke-static {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUpScrollStartYF:F
    invoke-static {v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2100(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v14

    int-to-float v15, v6

    sub-float/2addr v14, v15

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .line 2843
    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragUpScrollHeight:F
    invoke-static {v15}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2200(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v15

    div-float/2addr v14, v15

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mPrevTime:J

    move-wide/from16 v16, v0

    .line 2842
    move-wide/from16 v0, v16

    invoke-interface {v13, v14, v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;->getSpeed(FJ)F

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrollSpeed:F

    .line 2859
    :goto_cb
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v14

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mCurrTime:J

    .line 2860
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mCurrTime:J

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mPrevTime:J

    move-wide/from16 v16, v0

    sub-long v14, v14, v16

    long-to-float v13, v14

    move-object/from16 v0, p0

    iput v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->dt:F

    .line 2866
    move-object/from16 v0, p0

    iget v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrollSpeed:F

    move-object/from16 v0, p0

    iget v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->dt:F

    mul-float/2addr v13, v14

    invoke-static {v13}, Ljava/lang/Math;->round(F)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    .line 2869
    move-object/from16 v0, p0

    iget v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    if-ltz v13, :cond_1b7

    .line 2870
    move-object/from16 v0, p0

    iget v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    invoke-static {v5, v13}, Ljava/lang/Math;->min(II)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    .line 2871
    move v9, v3

    .line 2877
    .local v9, "movePos":I
    :goto_108
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    sub-int v14, v9, v3

    invoke-virtual {v13, v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 2878
    .local v8, "moveItem":Landroid/view/View;
    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    add-int v11, v13, v14

    .line 2880
    .local v11, "top":I
    if-nez v9, :cond_121

    if-le v11, v10, :cond_121

    .line 2881
    move v11, v10

    .line 2885
    :cond_121
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    const/4 v14, 0x1

    # setter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mBlockLayoutRequests:Z
    invoke-static {v13, v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2602(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;Z)Z

    .line 2887
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    sub-int v14, v11, v10

    invoke-virtual {v13, v9, v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setSelectionFromTop(II)V

    .line 2888
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->layoutChildren()V

    .line 2889
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->invalidate()V

    .line 2891
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    const/4 v14, 0x0

    # setter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mBlockLayoutRequests:Z
    invoke-static {v13, v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2602(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;Z)Z

    .line 2894
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    const/4 v14, 0x0

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doDragFloatView(ILandroid/view/View;Z)V
    invoke-static {v13, v9, v8, v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2700(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;ILandroid/view/View;Z)V

    .line 2896
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mCurrTime:J

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mPrevTime:J

    .line 2899
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_b

    .line 2845
    .end local v8    # "moveItem":Landroid/view/View;
    .end local v9    # "movePos":I
    .end local v11    # "top":I
    .end local v12    # "v":Landroid/view/View;
    :cond_163
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    sub-int v14, v4, v3

    invoke-virtual {v13, v14}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 2846
    .restart local v12    # "v":Landroid/view/View;
    if-nez v12, :cond_176

    .line 2847
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    goto/16 :goto_b

    .line 2850
    :cond_176
    add-int/lit8 v13, v2, -0x1

    if-ne v4, v13, :cond_189

    invoke-virtual {v12}, Landroid/view/View;->getBottom()I

    move-result v13

    add-int v14, v5, v10

    if-gt v13, v14, :cond_189

    .line 2851
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    goto/16 :goto_b

    .line 2855
    :cond_189
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mScrollProfile:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;
    invoke-static {v13}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;

    move-result-object v13

    int-to-float v14, v7

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDownScrollStartYF:F
    invoke-static {v15}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v15

    sub-float/2addr v14, v15

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .line 2856
    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDownScrollHeight:F
    invoke-static {v15}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v15

    div-float/2addr v14, v15

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mPrevTime:J

    move-wide/from16 v16, v0

    .line 2855
    move-wide/from16 v0, v16

    invoke-interface {v13, v14, v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;->getSpeed(FJ)F

    move-result v13

    neg-float v13, v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrollSpeed:F

    goto/16 :goto_cb

    .line 2873
    :cond_1b7
    neg-int v13, v5

    move-object/from16 v0, p0

    iget v14, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    .line 2874
    move v9, v4

    .restart local v9    # "movePos":I
    goto/16 :goto_108
.end method

.method public startScrolling(I)V
    .registers 4
    .param p1, "dir"    # I

    .prologue
    .line 2790
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    if-nez v0, :cond_1b

    .line 2792
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mAbort:Z

    .line 2793
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    .line 2794
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->tStart:J

    .line 2795
    iget-wide v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->tStart:J

    iput-wide v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mPrevTime:J

    .line 2796
    iput p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->scrollDir:I

    .line 2797
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->post(Ljava/lang/Runnable;)Z

    .line 2799
    :cond_1b
    return-void
.end method

.method public stopScrolling(Z)V
    .registers 3
    .param p1, "now"    # Z

    .prologue
    .line 2802
    if-eqz p1, :cond_b

    .line 2803
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2804
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    .line 2810
    :goto_a
    return-void

    .line 2806
    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->mAbort:Z

    goto :goto_a
.end method
