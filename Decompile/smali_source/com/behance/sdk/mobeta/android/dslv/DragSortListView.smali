.class public Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
.super Landroid/widget/ListView;
.source "DragSortListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortListener;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$SmoothAnimator;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;,
        Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;
    }
.end annotation


# instance fields
.field private mAdapterWrapper:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

.field private mAnimate:Z

.field private mBlockLayoutRequests:Z

.field private mCancelEvent:Landroid/view/MotionEvent;

.field private mCancelMethod:I

.field private mChildHeightCache:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;

.field private mCurrFloatAlpha:F

.field private mDownScrollStartY:I

.field private mDownScrollStartYF:F

.field private mDragDeltaX:I

.field private mDragDeltaY:I

.field private mDragDownScrollHeight:F

.field private mDragDownScrollStartFrac:F

.field private mDragEnabled:Z

.field private mDragFlags:I

.field private mDragListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;

.field private mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

.field private mDragSortTracker:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;

.field private mDragState:I

.field private mDragUpScrollHeight:F

.field private mDragUpScrollStartFrac:F

.field private mDropAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;

.field private mDropListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;

.field private mFirstExpPos:I

.field private mFloatAlpha:F

.field private mFloatLoc:Landroid/graphics/Point;

.field private mFloatPos:I

.field private mFloatView:Landroid/view/View;

.field private mFloatViewHeight:I

.field private mFloatViewHeightHalf:I

.field private mFloatViewManager:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

.field private mFloatViewMid:I

.field private mFloatViewOnMeasured:Z

.field private mIgnoreTouchEvent:Z

.field private mInTouchEvent:Z

.field private mItemHeightCollapsed:I

.field private mLastCallWasIntercept:Z

.field private mLastY:I

.field private mLiftAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;

.field private mListViewIntercepted:Z

.field private mMaxScrollSpeed:F

.field private mObserver:Landroid/database/DataSetObserver;

.field private mRemoveAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;

.field private mRemoveListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;

.field private mRemoveVelocityX:F

.field private mSampleViewTypes:[Landroid/view/View;

.field private mScrollProfile:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;

.field private mSecondExpPos:I

.field private mSlideFrac:F

.field private mSlideRegionFrac:F

.field private mSrcPos:I

.field private mTouchLoc:Landroid/graphics/Point;

.field private mTrackDragSort:Z

.field private mUpScrollStartY:I

.field private mUpScrollStartYF:F

.field private mUseRemoveVelocity:Z

.field private mWidthMeasureSpec:I

.field private mX:I

.field private mY:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 38
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Recycle"
        }
    .end annotation

    .prologue
    .line 425
    invoke-direct/range {p0 .. p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 78
    new-instance v5, Landroid/graphics/Point;

    invoke-direct {v5}, Landroid/graphics/Point;-><init>()V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    .line 80
    new-instance v5, Landroid/graphics/Point;

    invoke-direct {v5}, Landroid/graphics/Point;-><init>()V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mTouchLoc:Landroid/graphics/Point;

    .line 90
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewOnMeasured:Z

    .line 101
    const/high16 v5, 0x3f800000

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatAlpha:F

    .line 102
    const/high16 v5, 0x3f800000

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCurrFloatAlpha:F

    .line 127
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mAnimate:Z

    .line 171
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragEnabled:Z

    .line 182
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    .line 189
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mItemHeightCollapsed:I

    .line 205
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mWidthMeasureSpec:I

    .line 211
    const/4 v5, 0x1

    new-array v5, v5, [Landroid/view/View;

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSampleViewTypes:[Landroid/view/View;

    .line 223
    const v5, 0x3eaaaaab

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragUpScrollStartFrac:F

    .line 230
    const v5, 0x3eaaaaab

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDownScrollStartFrac:F

    .line 254
    const/high16 v5, 0x3f000000

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mMaxScrollSpeed:F

    .line 262
    new-instance v5, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$1;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$1;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mScrollProfile:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;

    .line 316
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragFlags:I

    .line 322
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLastCallWasIntercept:Z

    .line 327
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mInTouchEvent:Z

    .line 332
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewManager:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

    .line 352
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelMethod:I

    .line 359
    const/high16 v5, 0x3e800000

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSlideRegionFrac:F

    .line 368
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSlideFrac:F

    .line 381
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mTrackDragSort:Z

    .line 391
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mBlockLayoutRequests:Z

    .line 398
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mIgnoreTouchEvent:Z

    .line 412
    new-instance v5, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;

    const/4 v12, 0x3

    move-object/from16 v0, p0

    invoke-direct {v5, v0, v12}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mChildHeightCache:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;

    .line 421
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F

    .line 1666
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mListViewIntercepted:Z

    .line 427
    const/16 v27, 0x96

    .line 428
    .local v27, "defaultDuration":I
    move/from16 v30, v27

    .line 429
    .local v30, "removeAnimDuration":I
    move/from16 v28, v27

    .line 431
    .local v28, "dropAnimDuration":I
    if-eqz p2, :cond_1cf

    .line 432
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getContext()Landroid/content/Context;

    move-result-object v5

    sget-object v12, Lcom/behance/sdk/R$styleable;->DragSortListView:[I

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v5, v0, v12, v13, v14}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v11

    .line 435
    .local v11, "a":Landroid/content/res/TypedArray;
    const/4 v5, 0x1

    sget v12, Lcom/behance/sdk/R$styleable;->DragSortListView_collapsed_height:I

    const/4 v13, 0x1

    invoke-virtual {v11, v12, v13}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v12

    invoke-static {v5, v12}, Ljava/lang/Math;->max(II)I

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mItemHeightCollapsed:I

    .line 438
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_track_drag_sort:I

    const/4 v12, 0x0

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mTrackDragSort:Z

    .line 441
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mTrackDragSort:Z

    if-eqz v5, :cond_f0

    .line 442
    new-instance v5, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragSortTracker:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;

    .line 446
    :cond_f0
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_float_alpha:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatAlpha:F

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatAlpha:F

    .line 447
    move-object/from16 v0, p0

    iget v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatAlpha:F

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCurrFloatAlpha:F

    .line 449
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_drag_enabled:I

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragEnabled:Z

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragEnabled:Z

    .line 451
    const/4 v5, 0x0

    const/high16 v12, 0x3f800000

    const/high16 v13, 0x3f800000

    sget v14, Lcom/behance/sdk/R$styleable;->DragSortListView_slide_shuffle_speed:I

    const/high16 v15, 0x3f400000

    .line 452
    invoke-virtual {v11, v14, v15}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v14

    sub-float/2addr v13, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->min(FF)F

    move-result v12

    .line 451
    invoke-static {v5, v12}, Ljava/lang/Math;->max(FF)F

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSlideRegionFrac:F

    .line 456
    move-object/from16 v0, p0

    iget v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSlideRegionFrac:F

    const/4 v12, 0x0

    cmpl-float v5, v5, v12

    if-lez v5, :cond_22a

    const/4 v5, 0x1

    :goto_138
    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mAnimate:Z

    .line 458
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_drag_scroll_start:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragUpScrollStartFrac:F

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v29

    .line 462
    .local v29, "frac":F
    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setDragScrollStart(F)V

    .line 464
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_max_drag_scroll_speed:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mMaxScrollSpeed:F

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mMaxScrollSpeed:F

    .line 468
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_remove_animation_duration:I

    move/from16 v0, v30

    invoke-virtual {v11, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v30

    .line 472
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_drop_animation_duration:I

    move/from16 v0, v28

    invoke-virtual {v11, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v28

    .line 476
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_use_default_controller:I

    const/4 v12, 0x1

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v34

    .line 480
    .local v34, "useDefault":Z
    if-eqz v34, :cond_1cc

    .line 481
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_remove_enabled:I

    const/4 v12, 0x0

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v31

    .line 484
    .local v31, "removeEnabled":Z
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_remove_mode:I

    const/4 v12, 0x1

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v8

    .line 487
    .local v8, "removeMode":I
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_sort_enabled:I

    const/4 v12, 0x1

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v33

    .line 490
    .local v33, "sortEnabled":Z
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_drag_start_mode:I

    const/4 v12, 0x0

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    .line 493
    .local v7, "dragInitMode":I
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_drag_handle_id:I

    const/4 v12, 0x0

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    .line 496
    .local v6, "dragHandleId":I
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_fling_handle_id:I

    const/4 v12, 0x0

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    .line 499
    .local v10, "flingHandleId":I
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_click_remove_id:I

    const/4 v12, 0x0

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v9

    .line 502
    .local v9, "clickRemoveId":I
    sget v5, Lcom/behance/sdk/R$styleable;->DragSortListView_float_background_color:I

    const/high16 v12, -0x1000000

    invoke-virtual {v11, v5, v12}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v26

    .line 506
    .local v26, "bgColor":I
    new-instance v4, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    move-object/from16 v5, p0

    invoke-direct/range {v4 .. v10}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;IIIII)V

    .line 509
    .local v4, "controller":Lcom/behance/sdk/mobeta/android/dslv/DragSortController;
    move/from16 v0, v31

    invoke-virtual {v4, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->setRemoveEnabled(Z)V

    .line 510
    move/from16 v0, v33

    invoke-virtual {v4, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->setSortEnabled(Z)V

    .line 511
    move/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->setBackgroundColor(I)V

    .line 513
    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewManager:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

    .line 514
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 517
    .end local v4    # "controller":Lcom/behance/sdk/mobeta/android/dslv/DragSortController;
    .end local v6    # "dragHandleId":I
    .end local v7    # "dragInitMode":I
    .end local v8    # "removeMode":I
    .end local v9    # "clickRemoveId":I
    .end local v10    # "flingHandleId":I
    .end local v26    # "bgColor":I
    .end local v31    # "removeEnabled":Z
    .end local v33    # "sortEnabled":Z
    :cond_1cc
    invoke-virtual {v11}, Landroid/content/res/TypedArray;->recycle()V

    .line 520
    .end local v11    # "a":Landroid/content/res/TypedArray;
    .end local v29    # "frac":F
    .end local v34    # "useDefault":Z
    :cond_1cf
    new-instance v5, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    .line 522
    const/high16 v32, 0x3f000000

    .line 523
    .local v32, "smoothness":F
    if-lez v30, :cond_1ed

    .line 524
    new-instance v5, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;

    move-object/from16 v0, p0

    move/from16 v1, v32

    move/from16 v2, v30

    invoke-direct {v5, v0, v1, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;FI)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;

    .line 527
    :cond_1ed
    if-lez v28, :cond_1fe

    .line 528
    new-instance v5, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;

    move-object/from16 v0, p0

    move/from16 v1, v32

    move/from16 v2, v28

    invoke-direct {v5, v0, v1, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;FI)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDropAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;

    .line 531
    :cond_1fe
    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x3

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-static/range {v12 .. v25}, Landroid/view/MotionEvent;->obtain(JJIFFFFIFFII)Landroid/view/MotionEvent;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelEvent:Landroid/view/MotionEvent;

    .line 535
    new-instance v5, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$2;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$2;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mObserver:Landroid/database/DataSetObserver;

    .line 552
    return-void

    .line 456
    .end local v32    # "smoothness":F
    .restart local v11    # "a":Landroid/content/res/TypedArray;
    :cond_22a
    const/4 v5, 0x0

    goto/16 :goto_138
.end method

.method static synthetic access$000(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mMaxScrollSpeed:F

    return v0
.end method

.method static synthetic access$100(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    return v0
.end method

.method static synthetic access$1000(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mItemHeightCollapsed:I

    return v0
.end method

.method static synthetic access$102(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    return p1
.end method

.method static synthetic access$1100(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    return v0
.end method

.method static synthetic access$1200(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->dropFloatView()V

    return-void
.end method

.method static synthetic access$1300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    return v0
.end method

.method static synthetic access$1400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    return v0
.end method

.method static synthetic access$1500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUseRemoveVelocity:Z

    return v0
.end method

.method static synthetic access$1600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F

    return v0
.end method

.method static synthetic access$1602(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;F)F
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # F

    .prologue
    .line 63
    iput p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F

    return p1
.end method

.method static synthetic access$1700(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->destroyFloatView()V

    return-void
.end method

.method static synthetic access$1800(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;ILandroid/view/View;Z)I
    .registers 5
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/view/View;
    .param p3, "x3"    # Z

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(ILandroid/view/View;Z)I

    move-result v0

    return v0
.end method

.method static synthetic access$1900(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doRemoveItem()V

    return-void
.end method

.method static synthetic access$200(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;ILandroid/view/View;Z)V
    .registers 4
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/view/View;
    .param p3, "x3"    # Z

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->adjustItem(ILandroid/view/View;Z)V

    return-void
.end method

.method static synthetic access$2000(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    return v0
.end method

.method static synthetic access$2100(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUpScrollStartYF:F

    return v0
.end method

.method static synthetic access$2200(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragUpScrollHeight:F

    return v0
.end method

.method static synthetic access$2300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mScrollProfile:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDownScrollStartYF:F

    return v0
.end method

.method static synthetic access$2500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDownScrollHeight:F

    return v0
.end method

.method static synthetic access$2602(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # Z

    .prologue
    .line 63
    iput-boolean p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mBlockLayoutRequests:Z

    return p1
.end method

.method static synthetic access$2700(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;ILandroid/view/View;Z)V
    .registers 4
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/view/View;
    .param p3, "x3"    # Z

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doDragFloatView(ILandroid/view/View;Z)V

    return-void
.end method

.method static synthetic access$2800(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I
    .registers 3
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # I

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getItemHeight(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$2900(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I
    .registers 3
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # I

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaY:I

    return v0
.end method

.method static synthetic access$3000(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLastY:I

    return v0
.end method

.method static synthetic access$302(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaY:I

    return p1
.end method

.method static synthetic access$3100(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;II)I
    .registers 4
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getShuffleEdge(II)I

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeightHalf:I

    return v0
.end method

.method static synthetic access$500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    return-object v0
.end method

.method static synthetic access$600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mY:I

    return v0
.end method

.method static synthetic access$700(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .param p1, "x1"    # Z

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doDragFloatView(Z)V

    return-void
.end method

.method static synthetic access$800(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I

    return v0
.end method

.method static synthetic access$900(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 63
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    return v0
.end method

.method private adjustAllItems()V
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 1829
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v2

    .line 1830
    .local v2, "first":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getLastVisiblePosition()I

    move-result v4

    .line 1832
    .local v4, "last":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v6

    sub-int/2addr v6, v2

    invoke-static {v9, v6}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1833
    .local v0, "begin":I
    sub-int v6, v4, v2

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFooterViewsCount()I

    move-result v8

    sub-int/2addr v7, v8

    sub-int/2addr v7, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1835
    .local v1, "end":I
    move v3, v0

    .local v3, "i":I
    :goto_25
    if-gt v3, v1, :cond_35

    .line 1836
    invoke-virtual {p0, v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1837
    .local v5, "v":Landroid/view/View;
    if-eqz v5, :cond_32

    .line 1838
    add-int v6, v2, v3

    invoke-direct {p0, v6, v5, v9}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->adjustItem(ILandroid/view/View;Z)V

    .line 1835
    :cond_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_25

    .line 1841
    .end local v5    # "v":Landroid/view/View;
    :cond_35
    return-void
.end method

.method private adjustItem(ILandroid/view/View;Z)V
    .registers 10
    .param p1, "position"    # I
    .param p2, "v"    # Landroid/view/View;
    .param p3, "invalidChildHeight"    # Z

    .prologue
    .line 1850
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 1852
    .local v1, "lp":Landroid/view/ViewGroup$LayoutParams;
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-eq p1, v4, :cond_42

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    if-eq p1, v4, :cond_42

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-eq p1, v4, :cond_42

    .line 1853
    const/4 v0, -0x2

    .line 1858
    .local v0, "height":I
    :goto_11
    iget v4, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v0, v4, :cond_1a

    .line 1859
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1860
    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1864
    :cond_1a
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    if-eq p1, v4, :cond_22

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-ne p1, v4, :cond_2e

    .line 1865
    :cond_22
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-ge p1, v4, :cond_47

    move-object v4, p2

    .line 1866
    check-cast v4, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;

    const/16 v5, 0x50

    invoke-virtual {v4, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->setGravity(I)V

    .line 1874
    :cond_2e
    :goto_2e
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result v2

    .line 1875
    .local v2, "oldVis":I
    const/4 v3, 0x0

    .line 1877
    .local v3, "vis":I
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-ne p1, v4, :cond_3c

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    if-eqz v4, :cond_3c

    .line 1878
    const/4 v3, 0x4

    .line 1881
    :cond_3c
    if-eq v3, v2, :cond_41

    .line 1882
    invoke-virtual {p2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1884
    :cond_41
    return-void

    .line 1855
    .end local v0    # "height":I
    .end local v2    # "oldVis":I
    .end local v3    # "vis":I
    :cond_42
    invoke-direct {p0, p1, p2, p3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->calcItemHeight(ILandroid/view/View;Z)I

    move-result v0

    .restart local v0    # "height":I
    goto :goto_11

    .line 1867
    :cond_47
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-le p1, v4, :cond_2e

    move-object v4, p2

    .line 1868
    check-cast v4, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;

    const/16 v5, 0x30

    invoke-virtual {v4, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->setGravity(I)V

    goto :goto_2e
.end method

.method private adjustOnReorder()V
    .registers 6

    .prologue
    .line 1525
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v0

    .line 1527
    .local v0, "firstPos":I
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-ge v3, v0, :cond_1f

    .line 1530
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1531
    .local v2, "v":Landroid/view/View;
    const/4 v1, 0x0

    .line 1532
    .local v1, "top":I
    if-eqz v2, :cond_14

    .line 1533
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v1

    .line 1536
    :cond_14
    add-int/lit8 v3, v0, -0x1

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingTop()I

    move-result v4

    sub-int v4, v1, v4

    invoke-virtual {p0, v3, v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setSelectionFromTop(II)V

    .line 1538
    .end local v1    # "top":I
    .end local v2    # "v":Landroid/view/View;
    :cond_1f
    return-void
.end method

.method private adjustScroll(ILandroid/view/View;II)I
    .registers 14
    .param p1, "movePos"    # I
    .param p2, "moveItem"    # Landroid/view/View;
    .param p3, "oldFirstExpPos"    # I
    .param p4, "oldSecondExpPos"    # I

    .prologue
    .line 2016
    const/4 v0, 0x0

    .line 2018
    .local v0, "adjust":I
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(I)I

    move-result v1

    .line 2020
    .local v1, "childHeight":I
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v6

    .line 2021
    .local v6, "moveHeightBefore":I
    invoke-direct {p0, p1, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->calcItemHeight(II)I

    move-result v5

    .line 2023
    .local v5, "moveHeightAfter":I
    move v4, v6

    .line 2024
    .local v4, "moveBlankBefore":I
    move v3, v5

    .line 2025
    .local v3, "moveBlankAfter":I
    iget v7, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-eq p1, v7, :cond_15

    .line 2026
    sub-int/2addr v4, v1

    .line 2027
    sub-int/2addr v3, v1

    .line 2030
    :cond_15
    iget v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    .line 2031
    .local v2, "maxBlank":I
    iget v7, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    if-eq v7, v8, :cond_26

    iget v7, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-eq v7, v8, :cond_26

    .line 2032
    iget v7, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mItemHeightCollapsed:I

    sub-int/2addr v2, v7

    .line 2035
    :cond_26
    if-gt p1, p3, :cond_30

    .line 2036
    iget v7, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    if-le p1, v7, :cond_2f

    .line 2037
    sub-int v7, v2, v3

    add-int/2addr v0, v7

    .line 2055
    :cond_2f
    :goto_2f
    return v0

    .line 2039
    :cond_30
    if-ne p1, p4, :cond_44

    .line 2040
    iget v7, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    if-gt p1, v7, :cond_3a

    .line 2041
    sub-int v7, v4, v2

    add-int/2addr v0, v7

    goto :goto_2f

    .line 2042
    :cond_3a
    iget v7, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-ne p1, v7, :cond_42

    .line 2043
    sub-int v7, v6, v5

    add-int/2addr v0, v7

    goto :goto_2f

    .line 2045
    :cond_42
    add-int/2addr v0, v4

    goto :goto_2f

    .line 2048
    :cond_44
    iget v7, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    if-gt p1, v7, :cond_4a

    .line 2049
    sub-int/2addr v0, v2

    goto :goto_2f

    .line 2050
    :cond_4a
    iget v7, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-ne p1, v7, :cond_2f

    .line 2051
    sub-int/2addr v0, v3

    goto :goto_2f
.end method

.method private static buildRunList(Landroid/util/SparseBooleanArray;II[I[I)I
    .registers 12
    .param p0, "cip"    # Landroid/util/SparseBooleanArray;
    .param p1, "rangeStart"    # I
    .param p2, "rangeEnd"    # I
    .param p3, "runStart"    # [I
    .param p4, "runEnd"    # [I

    .prologue
    const/4 v5, 0x0

    .line 2653
    const/4 v4, 0x0

    .line 2655
    .local v4, "runCount":I
    invoke-static {p0, p1, p2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->findFirstSetIndex(Landroid/util/SparseBooleanArray;II)I

    move-result v2

    .line 2656
    .local v2, "i":I
    const/4 v6, -0x1

    if-ne v2, v6, :cond_a

    .line 2697
    :goto_9
    return v5

    .line 2659
    :cond_a
    invoke-virtual {p0, v2}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v3

    .line 2660
    .local v3, "position":I
    move v1, v3

    .line 2661
    .local v1, "currentRunStart":I
    add-int/lit8 v0, v1, 0x1

    .line 2662
    .local v0, "currentRunEnd":I
    add-int/lit8 v2, v2, 0x1

    :goto_13
    invoke-virtual {p0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v6

    if-ge v2, v6, :cond_37

    invoke-virtual {p0, v2}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v3

    if-ge v3, p2, :cond_37

    .line 2663
    invoke-virtual {p0, v2}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v6

    if-nez v6, :cond_28

    .line 2662
    :goto_25
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 2665
    :cond_28
    if-ne v3, v0, :cond_2d

    .line 2666
    add-int/lit8 v0, v0, 0x1

    goto :goto_25

    .line 2668
    :cond_2d
    aput v1, p3, v4

    .line 2669
    aput v0, p4, v4

    .line 2670
    add-int/lit8 v4, v4, 0x1

    .line 2671
    move v1, v3

    .line 2672
    add-int/lit8 v0, v3, 0x1

    goto :goto_25

    .line 2676
    :cond_37
    if-ne v0, p2, :cond_3a

    .line 2681
    move v0, p1

    .line 2683
    :cond_3a
    aput v1, p3, v4

    .line 2684
    aput v0, p4, v4

    .line 2685
    add-int/lit8 v4, v4, 0x1

    .line 2687
    const/4 v6, 0x1

    if-le v4, v6, :cond_55

    .line 2688
    aget v6, p3, v5

    if-ne v6, p1, :cond_55

    add-int/lit8 v6, v4, -0x1

    aget v6, p4, v6

    if-ne v6, p1, :cond_55

    .line 2693
    add-int/lit8 v6, v4, -0x1

    aget v6, p3, v6

    aput v6, p3, v5

    .line 2694
    add-int/lit8 v4, v4, -0x1

    :cond_55
    move v5, v4

    .line 2697
    goto :goto_9
.end method

.method private calcItemHeight(II)I
    .registers 9
    .param p1, "position"    # I
    .param p2, "childHeight"    # I

    .prologue
    .line 1973
    iget-boolean v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mAnimate:Z

    if-eqz v4, :cond_27

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-eq v4, v5, :cond_27

    const/4 v1, 0x1

    .line 1974
    .local v1, "isSliding":Z
    :goto_b
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mItemHeightCollapsed:I

    sub-int v2, v4, v5

    .line 1975
    .local v2, "maxNonSrcBlankHeight":I
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSlideFrac:F

    int-to-float v5, v2

    mul-float/2addr v4, v5

    float-to-int v3, v4

    .line 1979
    .local v3, "slideHeight":I
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-ne p1, v4, :cond_3a

    .line 1980
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    if-ne v4, v5, :cond_2c

    .line 1981
    if-eqz v1, :cond_29

    .line 1982
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mItemHeightCollapsed:I

    add-int v0, v3, v4

    .line 2005
    .local v0, "height":I
    :goto_26
    return v0

    .line 1973
    .end local v0    # "height":I
    .end local v1    # "isSliding":Z
    .end local v2    # "maxNonSrcBlankHeight":I
    .end local v3    # "slideHeight":I
    :cond_27
    const/4 v1, 0x0

    goto :goto_b

    .line 1984
    .restart local v1    # "isSliding":Z
    .restart local v2    # "maxNonSrcBlankHeight":I
    .restart local v3    # "slideHeight":I
    :cond_29
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    .restart local v0    # "height":I
    goto :goto_26

    .line 1986
    .end local v0    # "height":I
    :cond_2c
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-ne v4, v5, :cond_37

    .line 1988
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    sub-int v0, v4, v3

    .restart local v0    # "height":I
    goto :goto_26

    .line 1990
    .end local v0    # "height":I
    :cond_37
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mItemHeightCollapsed:I

    .restart local v0    # "height":I
    goto :goto_26

    .line 1992
    .end local v0    # "height":I
    :cond_3a
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    if-ne p1, v4, :cond_46

    .line 1993
    if-eqz v1, :cond_43

    .line 1994
    add-int v0, p2, v3

    .restart local v0    # "height":I
    goto :goto_26

    .line 1996
    .end local v0    # "height":I
    :cond_43
    add-int v0, p2, v2

    .restart local v0    # "height":I
    goto :goto_26

    .line 1998
    .end local v0    # "height":I
    :cond_46
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-ne p1, v4, :cond_4f

    .line 2000
    add-int v4, p2, v2

    sub-int v0, v4, v3

    .restart local v0    # "height":I
    goto :goto_26

    .line 2002
    .end local v0    # "height":I
    :cond_4f
    move v0, p2

    .restart local v0    # "height":I
    goto :goto_26
.end method

.method private calcItemHeight(ILandroid/view/View;Z)I
    .registers 5
    .param p1, "position"    # I
    .param p2, "item"    # Landroid/view/View;
    .param p3, "invalidChildHeight"    # Z

    .prologue
    .line 1968
    invoke-direct {p0, p1, p2, p3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(ILandroid/view/View;Z)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->calcItemHeight(II)I

    move-result v0

    return v0
.end method

.method private clearPositions()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 1464
    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    .line 1465
    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    .line 1466
    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    .line 1467
    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I

    .line 1468
    return-void
.end method

.method private continueDrag(II)V
    .registers 10
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    const/4 v6, -0x1

    const/4 v5, 0x1

    .line 1764
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaX:I

    sub-int v4, p1, v4

    iput v4, v3, Landroid/graphics/Point;->x:I

    .line 1765
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaY:I

    sub-int v4, p2, v4

    iput v4, v3, Landroid/graphics/Point;->y:I

    .line 1767
    invoke-direct {p0, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doDragFloatView(Z)V

    .line 1769
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeightHalf:I

    add-int/2addr v3, v4

    invoke-static {p2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1770
    .local v2, "minY":I
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeightHalf:I

    sub-int/2addr v3, v4

    invoke-static {p2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 1773
    .local v1, "maxY":I
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    invoke-virtual {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->getScrollDir()I

    move-result v0

    .line 1775
    .local v0, "currentScrollDir":I
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLastY:I

    if-le v2, v3, :cond_44

    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDownScrollStartY:I

    if-le v2, v3, :cond_44

    if-eq v0, v5, :cond_44

    .line 1779
    if-eq v0, v6, :cond_3e

    .line 1781
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    invoke-virtual {v3, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->stopScrolling(Z)V

    .line 1785
    :cond_3e
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    invoke-virtual {v3, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->startScrolling(I)V

    .line 1805
    :cond_43
    :goto_43
    return-void

    .line 1786
    :cond_44
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLastY:I

    if-ge v1, v3, :cond_5c

    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUpScrollStartY:I

    if-ge v1, v3, :cond_5c

    if-eqz v0, :cond_5c

    .line 1790
    if-eq v0, v6, :cond_55

    .line 1792
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    invoke-virtual {v3, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->stopScrolling(Z)V

    .line 1796
    :cond_55
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->startScrolling(I)V

    goto :goto_43

    .line 1798
    :cond_5c
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUpScrollStartY:I

    if-lt v1, v3, :cond_43

    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDownScrollStartY:I

    if-gt v2, v3, :cond_43

    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    .line 1799
    invoke-virtual {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->isScrolling()Z

    move-result v3

    if-eqz v3, :cond_43

    .line 1803
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    invoke-virtual {v3, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->stopScrolling(Z)V

    goto :goto_43
.end method

.method private destroyFloatView()V
    .registers 3

    .prologue
    .line 2362
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    if-eqz v0, :cond_1c

    .line 2363
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 2364
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewManager:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

    if-eqz v0, :cond_16

    .line 2365
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewManager:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    invoke-interface {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;->onDestroyFloatView(Landroid/view/View;)V

    .line 2367
    :cond_16
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    .line 2368
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->invalidate()V

    .line 2370
    :cond_1c
    return-void
.end method

.method private doActionUpOrCancel()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1640
    iput v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelMethod:I

    .line 1641
    iput-boolean v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mInTouchEvent:Z

    .line 1642
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_c

    .line 1643
    iput v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    .line 1645
    :cond_c
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatAlpha:F

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCurrFloatAlpha:F

    .line 1646
    iput-boolean v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mListViewIntercepted:Z

    .line 1647
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mChildHeightCache:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;

    invoke-virtual {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;->clear()V

    .line 1648
    return-void
.end method

.method private doDragFloatView(ILandroid/view/View;Z)V
    .registers 10
    .param p1, "movePos"    # I
    .param p2, "moveItem"    # Landroid/view/View;
    .param p3, "forceInvalidate"    # Z

    .prologue
    .line 2271
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mBlockLayoutRequests:Z

    .line 2273
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->updateFloatView()V

    .line 2275
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    .line 2276
    .local v0, "oldFirstExpPos":I
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    .line 2278
    .local v1, "oldSecondExpPos":I
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->updatePositions()Z

    move-result v3

    .line 2280
    .local v3, "updated":Z
    if-eqz v3, :cond_27

    .line 2281
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->adjustAllItems()V

    .line 2282
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->adjustScroll(ILandroid/view/View;II)I

    move-result v2

    .line 2285
    .local v2, "scroll":I
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v4

    add-int/2addr v4, v2

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0, p1, v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setSelectionFromTop(II)V

    .line 2286
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->layoutChildren()V

    .line 2289
    .end local v2    # "scroll":I
    :cond_27
    if-nez v3, :cond_2b

    if-eqz p3, :cond_2e

    .line 2290
    :cond_2b
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->invalidate()V

    .line 2293
    :cond_2e
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mBlockLayoutRequests:Z

    .line 2294
    return-void
.end method

.method private doDragFloatView(Z)V
    .registers 6
    .param p1, "forceInvalidate"    # Z

    .prologue
    .line 2260
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v2

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildCount()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int v1, v2, v3

    .line 2261
    .local v1, "movePos":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildCount()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {p0, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 2263
    .local v0, "moveItem":Landroid/view/View;
    if-nez v0, :cond_19

    .line 2268
    :goto_18
    return-void

    .line 2267
    :cond_19
    invoke-direct {p0, v1, v0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doDragFloatView(ILandroid/view/View;Z)V

    goto :goto_18
.end method

.method private doRemoveItem()V
    .registers 3

    .prologue
    .line 1495
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doRemoveItem(I)V

    .line 1496
    return-void
.end method

.method private doRemoveItem(I)V
    .registers 3
    .param p1, "which"    # I

    .prologue
    .line 1504
    const/4 v0, 0x1

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    .line 1507
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;

    if-eqz v0, :cond_c

    .line 1508
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;

    invoke-interface {v0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;->remove(I)V

    .line 1511
    :cond_c
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->destroyFloatView()V

    .line 1513
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->adjustOnReorder()V

    .line 1514
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->clearPositions()V

    .line 1517
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mInTouchEvent:Z

    if-eqz v0, :cond_1d

    .line 1518
    const/4 v0, 0x3

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    .line 1522
    :goto_1c
    return-void

    .line 1520
    :cond_1d
    const/4 v0, 0x0

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    goto :goto_1c
.end method

.method private drawDivider(ILandroid/graphics/Canvas;)V
    .registers 13
    .param p1, "expPosition"    # I
    .param p2, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 735
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getDivider()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 736
    .local v2, "divider":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getDividerHeight()I

    move-result v3

    .line 739
    .local v3, "dividerHeight":I
    if-eqz v2, :cond_4c

    if-eqz v3, :cond_4c

    .line 741
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v8

    sub-int v8, p1, v8

    .line 740
    invoke-virtual {p0, v8}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    .line 742
    .local v4, "expItem":Landroid/view/ViewGroup;
    if-eqz v4, :cond_4c

    .line 743
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingLeft()I

    move-result v5

    .line 744
    .local v5, "l":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getWidth()I

    move-result v8

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingRight()I

    move-result v9

    sub-int v6, v8, v9

    .line 748
    .local v6, "r":I
    const/4 v8, 0x0

    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 750
    .local v1, "childHeight":I
    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-le p1, v8, :cond_4d

    .line 751
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getTop()I

    move-result v8

    add-int v7, v8, v1

    .line 752
    .local v7, "t":I
    add-int v0, v7, v3

    .line 760
    .local v0, "b":I
    :goto_3d
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 761
    invoke-virtual {p2, v5, v7, v6, v0}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 762
    invoke-virtual {v2, v5, v7, v6, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 763
    invoke-virtual {v2, p2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 764
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 767
    .end local v0    # "b":I
    .end local v1    # "childHeight":I
    .end local v4    # "expItem":Landroid/view/ViewGroup;
    .end local v5    # "l":I
    .end local v6    # "r":I
    .end local v7    # "t":I
    :cond_4c
    return-void

    .line 754
    .restart local v1    # "childHeight":I
    .restart local v4    # "expItem":Landroid/view/ViewGroup;
    .restart local v5    # "l":I
    .restart local v6    # "r":I
    :cond_4d
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getBottom()I

    move-result v8

    sub-int v0, v8, v1

    .line 755
    .restart local v0    # "b":I
    sub-int v7, v0, v3

    .restart local v7    # "t":I
    goto :goto_3d
.end method

.method private dropFloatView()V
    .registers 5

    .prologue
    .line 1473
    const/4 v1, 0x2

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    .line 1475
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDropListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;

    if-eqz v1, :cond_22

    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I

    if-ltz v1, :cond_22

    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_22

    .line 1476
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v0

    .line 1477
    .local v0, "numHeaders":I
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDropListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;

    iget v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    sub-int/2addr v2, v0

    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I

    sub-int/2addr v3, v0

    invoke-interface {v1, v2, v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;->drop(II)V

    .line 1480
    .end local v0    # "numHeaders":I
    :cond_22
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->destroyFloatView()V

    .line 1482
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->adjustOnReorder()V

    .line 1483
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->clearPositions()V

    .line 1484
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->adjustAllItems()V

    .line 1487
    iget-boolean v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mInTouchEvent:Z

    if-eqz v1, :cond_36

    .line 1488
    const/4 v1, 0x3

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    .line 1492
    :goto_35
    return-void

    .line 1490
    :cond_36
    const/4 v1, 0x0

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    goto :goto_35
.end method

.method private static findFirstSetIndex(Landroid/util/SparseBooleanArray;II)I
    .registers 6
    .param p0, "sba"    # Landroid/util/SparseBooleanArray;
    .param p1, "rangeStart"    # I
    .param p2, "rangeEnd"    # I

    .prologue
    .line 2713
    invoke-virtual {p0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    .line 2714
    .local v1, "size":I
    invoke-static {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->insertionIndexForKey(Landroid/util/SparseBooleanArray;I)I

    move-result v0

    .line 2715
    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_19

    invoke-virtual {p0, v0}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v2

    if-ge v2, p2, :cond_19

    invoke-virtual {p0, v0}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v2

    if-nez v2, :cond_19

    .line 2716
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 2717
    :cond_19
    if-eq v0, v1, :cond_21

    invoke-virtual {p0, v0}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v2

    if-lt v2, p2, :cond_22

    .line 2718
    :cond_21
    const/4 v0, -0x1

    .line 2719
    .end local v0    # "i":I
    :cond_22
    return v0
.end method

.method private getChildHeight(I)I
    .registers 9
    .param p1, "position"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v1, 0x0

    .line 1887
    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-ne p1, v5, :cond_7

    .line 1933
    :cond_6
    :goto_6
    return v1

    .line 1891
    :cond_7
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v5

    sub-int v5, p1, v5

    invoke-virtual {p0, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 1893
    .local v4, "v":Landroid/view/View;
    if-eqz v4, :cond_18

    .line 1896
    invoke-direct {p0, p1, v4, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(ILandroid/view/View;Z)I

    move-result v1

    goto :goto_6

    .line 1900
    :cond_18
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mChildHeightCache:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;

    invoke-virtual {v5, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;->get(I)I

    move-result v1

    .line 1901
    .local v1, "childHeight":I
    const/4 v5, -0x1

    if-ne v1, v5, :cond_6

    .line 1906
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    .line 1907
    .local v0, "adapter":Landroid/widget/ListAdapter;
    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v2

    .line 1910
    .local v2, "type":I
    invoke-interface {v0}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v3

    .line 1911
    .local v3, "typeCount":I
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSampleViewTypes:[Landroid/view/View;

    array-length v5, v5

    if-eq v3, v5, :cond_36

    .line 1912
    new-array v5, v3, [Landroid/view/View;

    iput-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSampleViewTypes:[Landroid/view/View;

    .line 1915
    :cond_36
    if-ltz v2, :cond_5a

    .line 1916
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSampleViewTypes:[Landroid/view/View;

    aget-object v5, v5, v2

    if-nez v5, :cond_51

    .line 1917
    invoke-interface {v0, p1, v6, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 1918
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSampleViewTypes:[Landroid/view/View;

    aput-object v4, v5, v2

    .line 1928
    :goto_46
    const/4 v5, 0x1

    invoke-direct {p0, p1, v4, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(ILandroid/view/View;Z)I

    move-result v1

    .line 1931
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mChildHeightCache:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;

    invoke-virtual {v5, p1, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$HeightCache;->add(II)V

    goto :goto_6

    .line 1920
    :cond_51
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSampleViewTypes:[Landroid/view/View;

    aget-object v5, v5, v2

    invoke-interface {v0, p1, v5, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    goto :goto_46

    .line 1924
    :cond_5a
    invoke-interface {v0, p1, v6, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    goto :goto_46
.end method

.method private getChildHeight(ILandroid/view/View;Z)I
    .registers 9
    .param p1, "position"    # I
    .param p2, "item"    # Landroid/view/View;
    .param p3, "invalidChildHeight"    # Z

    .prologue
    const/4 v1, 0x0

    .line 1938
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-ne p1, v3, :cond_6

    .line 1964
    .end local p2    # "item":Landroid/view/View;
    :cond_5
    :goto_5
    return v1

    .line 1943
    .restart local p2    # "item":Landroid/view/View;
    :cond_6
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v3

    if-lt p1, v3, :cond_17

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v3

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFooterViewsCount()I

    move-result v4

    sub-int/2addr v3, v4

    if-lt p1, v3, :cond_25

    .line 1944
    :cond_17
    move-object v0, p2

    .line 1949
    .end local p2    # "item":Landroid/view/View;
    .local v0, "child":Landroid/view/View;
    :goto_18
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 1951
    .local v2, "lp":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v2, :cond_2c

    .line 1952
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v3, :cond_2c

    .line 1953
    iget v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_5

    .line 1946
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "lp":Landroid/view/ViewGroup$LayoutParams;
    .restart local p2    # "item":Landroid/view/View;
    :cond_25
    check-cast p2, Landroid/view/ViewGroup;

    .end local p2    # "item":Landroid/view/View;
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .restart local v0    # "child":Landroid/view/View;
    goto :goto_18

    .line 1957
    .restart local v2    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_2c
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 1959
    .local v1, "childHeight":I
    if-eqz v1, :cond_34

    if-eqz p3, :cond_5

    .line 1960
    :cond_34
    invoke-direct {p0, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->measureItem(Landroid/view/View;)V

    .line 1961
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    goto :goto_5
.end method

.method private getItemHeight(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 817
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v1

    sub-int v1, p1, v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 819
    .local v0, "v":Landroid/view/View;
    if-eqz v0, :cond_11

    .line 821
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 825
    :goto_10
    return v1

    :cond_11
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(I)I

    move-result v1

    invoke-direct {p0, p1, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->calcItemHeight(II)I

    move-result v1

    goto :goto_10
.end method

.method private getShuffleEdge(II)I
    .registers 14
    .param p1, "position"    # I
    .param p2, "top"    # I

    .prologue
    .line 894
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v7

    .line 895
    .local v7, "numHeaders":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFooterViewsCount()I

    move-result v6

    .line 901
    .local v6, "numFooters":I
    if-le p1, v7, :cond_11

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v9

    sub-int/2addr v9, v6

    if-lt p1, v9, :cond_13

    :cond_11
    move v3, p2

    .line 948
    :goto_12
    return v3

    .line 905
    :cond_13
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getDividerHeight()I

    move-result v2

    .line 909
    .local v2, "divHeight":I
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    iget v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mItemHeightCollapsed:I

    sub-int v5, v9, v10

    .line 910
    .local v5, "maxBlankHeight":I
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(I)I

    move-result v1

    .line 911
    .local v1, "childHeight":I
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getItemHeight(I)I

    move-result v4

    .line 915
    .local v4, "itemHeight":I
    move v8, p2

    .line 916
    .local v8, "otop":I
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    iget v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-gt v9, v10, :cond_65

    .line 919
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-ne p1, v9, :cond_5a

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    iget v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-eq v9, v10, :cond_5a

    .line 920
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-ne p1, v9, :cond_53

    .line 921
    add-int v9, p2, v4

    iget v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    sub-int v8, v9, v10

    .line 942
    :cond_40
    :goto_40
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-gt p1, v9, :cond_7f

    .line 943
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    sub-int/2addr v9, v2

    add-int/lit8 v10, p1, -0x1

    invoke-direct {p0, v10}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(I)I

    move-result v10

    sub-int/2addr v9, v10

    div-int/lit8 v9, v9, 0x2

    add-int v3, v8, v9

    .local v3, "edge":I
    goto :goto_12

    .line 923
    .end local v3    # "edge":I
    :cond_53
    sub-int v0, v4, v1

    .line 924
    .local v0, "blankHeight":I
    add-int v9, p2, v0

    sub-int v8, v9, v5

    .line 925
    goto :goto_40

    .line 926
    .end local v0    # "blankHeight":I
    :cond_5a
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-le p1, v9, :cond_40

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-gt p1, v9, :cond_40

    .line 927
    sub-int v8, p2, v5

    goto :goto_40

    .line 933
    :cond_65
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-le p1, v9, :cond_70

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    if-gt p1, v9, :cond_70

    .line 934
    add-int v8, p2, v5

    goto :goto_40

    .line 935
    :cond_70
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-ne p1, v9, :cond_40

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    iget v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    if-eq v9, v10, :cond_40

    .line 936
    sub-int v0, v4, v1

    .line 937
    .restart local v0    # "blankHeight":I
    add-int v8, p2, v0

    goto :goto_40

    .line 945
    .end local v0    # "blankHeight":I
    :cond_7f
    sub-int v9, v1, v2

    iget v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    sub-int/2addr v9, v10

    div-int/lit8 v9, v9, 0x2

    add-int v3, v8, v9

    .restart local v3    # "edge":I
    goto :goto_12
.end method

.method private static insertionIndexForKey(Landroid/util/SparseBooleanArray;I)I
    .registers 6
    .param p0, "sba"    # Landroid/util/SparseBooleanArray;
    .param p1, "key"    # I

    .prologue
    .line 2723
    const/4 v1, 0x0

    .line 2724
    .local v1, "low":I
    invoke-virtual {p0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v0

    .line 2725
    .local v0, "high":I
    :goto_5
    sub-int v3, v0, v1

    if-lez v3, :cond_18

    .line 2726
    add-int v3, v1, v0

    shr-int/lit8 v2, v3, 0x1

    .line 2727
    .local v2, "middle":I
    invoke-virtual {p0, v2}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v3

    if-ge v3, p1, :cond_16

    .line 2728
    add-int/lit8 v1, v2, 0x1

    goto :goto_5

    .line 2730
    :cond_16
    move v0, v2

    goto :goto_5

    .line 2732
    .end local v2    # "middle":I
    :cond_18
    return v1
.end method

.method private measureFloatView()V
    .registers 2

    .prologue
    .line 2076
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    if-eqz v0, :cond_17

    .line 2077
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->measureItem(Landroid/view/View;)V

    .line 2078
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    .line 2079
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeightHalf:I

    .line 2081
    :cond_17
    return-void
.end method

.method private measureItem(Landroid/view/View;)V
    .registers 9
    .param p1, "item"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x0

    .line 2059
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 2060
    .local v1, "lp":Landroid/view/ViewGroup$LayoutParams;
    if-nez v1, :cond_11

    .line 2061
    new-instance v1, Landroid/widget/AbsListView$LayoutParams;

    .end local v1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v1, v3, v4}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    .line 2062
    .restart local v1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2064
    :cond_11
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mWidthMeasureSpec:I

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getListPaddingLeft()I

    move-result v4

    .line 2065
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getListPaddingRight()I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 2064
    invoke-static {v3, v4, v5}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v2

    .line 2067
    .local v2, "wspec":I
    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v3, :cond_32

    .line 2068
    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/high16 v4, 0x40000000

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 2072
    .local v0, "hspec":I
    :goto_2e
    invoke-virtual {p1, v2, v0}, Landroid/view/View;->measure(II)V

    .line 2073
    return-void

    .line 2070
    .end local v0    # "hspec":I
    :cond_32
    invoke-static {v6, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .restart local v0    # "hspec":I
    goto :goto_2e
.end method

.method private static rotate(IIII)I
    .registers 5
    .param p0, "value"    # I
    .param p1, "offset"    # I
    .param p2, "lowerBound"    # I
    .param p3, "upperBound"    # I

    .prologue
    .line 2701
    sub-int v0, p3, p2

    .line 2703
    .local v0, "windowSize":I
    add-int/2addr p0, p1

    .line 2704
    if-ge p0, p2, :cond_7

    .line 2705
    add-int/2addr p0, v0

    .line 2709
    :cond_6
    :goto_6
    return p0

    .line 2706
    :cond_7
    if-lt p0, p3, :cond_6

    .line 2707
    sub-int/2addr p0, v0

    goto :goto_6
.end method

.method private saveTouchCoords(Landroid/view/MotionEvent;)V
    .registers 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 1651
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 1652
    .local v0, "action":I
    if-eqz v0, :cond_c

    .line 1653
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mY:I

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLastY:I

    .line 1655
    :cond_c
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mX:I

    .line 1656
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mY:I

    .line 1657
    if-nez v0, :cond_20

    .line 1658
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mY:I

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLastY:I

    .line 1660
    :cond_20
    return-void
.end method

.method private updateFloatView()V
    .registers 14

    .prologue
    .line 2302
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewManager:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

    if-eqz v9, :cond_18

    .line 2303
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mTouchLoc:Landroid/graphics/Point;

    iget v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mX:I

    iget v11, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mY:I

    invoke-virtual {v9, v10, v11}, Landroid/graphics/Point;->set(II)V

    .line 2304
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewManager:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

    iget-object v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    iget-object v11, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget-object v12, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mTouchLoc:Landroid/graphics/Point;

    invoke-interface {v9, v10, v11, v12}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;->onDragFloatView(Landroid/view/View;Landroid/graphics/Point;Landroid/graphics/Point;)V

    .line 2307
    :cond_18
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v2, v9, Landroid/graphics/Point;->x:I

    .line 2308
    .local v2, "floatX":I
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v3, v9, Landroid/graphics/Point;->y:I

    .line 2311
    .local v3, "floatY":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingLeft()I

    move-result v7

    .line 2312
    .local v7, "padLeft":I
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragFlags:I

    and-int/lit8 v9, v9, 0x1

    if-nez v9, :cond_b7

    if-le v2, v7, :cond_b7

    .line 2313
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iput v7, v9, Landroid/graphics/Point;->x:I

    .line 2319
    :cond_30
    :goto_30
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v6

    .line 2320
    .local v6, "numHeaders":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFooterViewsCount()I

    move-result v5

    .line 2321
    .local v5, "numFooters":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v1

    .line 2322
    .local v1, "firstPos":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getLastVisiblePosition()I

    move-result v4

    .line 2326
    .local v4, "lastPos":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingTop()I

    move-result v8

    .line 2327
    .local v8, "topLimit":I
    if-ge v1, v6, :cond_52

    .line 2328
    sub-int v9, v6, v1

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {p0, v9}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getBottom()I

    move-result v8

    .line 2330
    :cond_52
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragFlags:I

    and-int/lit8 v9, v9, 0x8

    if-nez v9, :cond_6b

    .line 2331
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-gt v1, v9, :cond_6b

    .line 2332
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    sub-int/2addr v9, v1

    invoke-virtual {p0, v9}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    move-result v9

    invoke-static {v9, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 2337
    :cond_6b
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeight()I

    move-result v9

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingBottom()I

    move-result v10

    sub-int v0, v9, v10

    .line 2338
    .local v0, "bottomLimit":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v9

    sub-int/2addr v9, v5

    add-int/lit8 v9, v9, -0x1

    if-lt v4, v9, :cond_8e

    .line 2339
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v9

    sub-int/2addr v9, v5

    add-int/lit8 v9, v9, -0x1

    sub-int/2addr v9, v1

    invoke-virtual {p0, v9}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getBottom()I

    move-result v0

    .line 2341
    :cond_8e
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragFlags:I

    and-int/lit8 v9, v9, 0x4

    if-nez v9, :cond_a7

    .line 2342
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-lt v4, v9, :cond_a7

    .line 2343
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    sub-int/2addr v9, v1

    invoke-virtual {p0, v9}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getBottom()I

    move-result v9

    invoke-static {v9, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 2351
    :cond_a7
    if-ge v3, v8, :cond_c5

    .line 2352
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iput v8, v9, Landroid/graphics/Point;->y:I

    .line 2358
    :cond_ad
    :goto_ad
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v9, v9, Landroid/graphics/Point;->y:I

    iget v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeightHalf:I

    add-int/2addr v9, v10

    iput v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    .line 2359
    return-void

    .line 2314
    .end local v0    # "bottomLimit":I
    .end local v1    # "firstPos":I
    .end local v4    # "lastPos":I
    .end local v5    # "numFooters":I
    .end local v6    # "numHeaders":I
    .end local v8    # "topLimit":I
    :cond_b7
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragFlags:I

    and-int/lit8 v9, v9, 0x2

    if-nez v9, :cond_30

    if-ge v2, v7, :cond_30

    .line 2315
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iput v7, v9, Landroid/graphics/Point;->x:I

    goto/16 :goto_30

    .line 2353
    .restart local v0    # "bottomLimit":I
    .restart local v1    # "firstPos":I
    .restart local v4    # "lastPos":I
    .restart local v5    # "numFooters":I
    .restart local v6    # "numHeaders":I
    .restart local v8    # "topLimit":I
    :cond_c5
    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    add-int/2addr v9, v3

    if-le v9, v0, :cond_ad

    .line 2354
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I

    sub-int v10, v0, v10

    iput v10, v9, Landroid/graphics/Point;->y:I

    goto :goto_ad
.end method

.method private updatePositions()Z
    .registers 31

    .prologue
    .line 953
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v9

    .line 954
    .local v9, "first":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    move/from16 v23, v0

    .line 955
    .local v23, "startPos":I
    sub-int v27, v23, v9

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v25

    .line 957
    .local v25, "startView":Landroid/view/View;
    if-nez v25, :cond_28

    .line 958
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildCount()I

    move-result v27

    div-int/lit8 v27, v27, 0x2

    add-int v23, v9, v27

    .line 959
    sub-int v27, v23, v9

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v25

    .line 961
    :cond_28
    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getTop()I

    move-result v24

    .line 963
    .local v24, "startTop":I
    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getHeight()I

    move-result v10

    .line 965
    .local v10, "itemHeight":I
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getShuffleEdge(II)I

    move-result v5

    .line 966
    .local v5, "edge":I
    move v13, v5

    .line 968
    .local v13, "lastEdge":I
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getDividerHeight()I

    move-result v4

    .line 972
    .local v4, "divHeight":I
    move/from16 v11, v23

    .line 973
    .local v11, "itemPos":I
    move/from16 v12, v24

    .line 974
    .local v12, "itemTop":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    move/from16 v27, v0

    move/from16 v0, v27

    if-ge v0, v5, :cond_15b

    .line 977
    :goto_4d
    if-ltz v11, :cond_5d

    .line 978
    add-int/lit8 v11, v11, -0x1

    .line 979
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getItemHeight(I)I

    move-result v10

    .line 981
    if-nez v11, :cond_144

    .line 982
    sub-int v27, v12, v4

    sub-int v5, v27, v10

    .line 1021
    :cond_5d
    :goto_5d
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v15

    .line 1022
    .local v15, "numHeaders":I
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFooterViewsCount()I

    move-result v14

    .line 1024
    .local v14, "numFooters":I
    const/16 v26, 0x0

    .line 1026
    .local v26, "updated":Z
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    move/from16 v16, v0

    .line 1027
    .local v16, "oldFirstExpPos":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    move/from16 v17, v0

    .line 1028
    .local v17, "oldSecondExpPos":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSlideFrac:F

    move/from16 v18, v0

    .line 1030
    .local v18, "oldSlideFrac":F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mAnimate:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1d8

    .line 1031
    sub-int v27, v5, v13

    invoke-static/range {v27 .. v27}, Ljava/lang/Math;->abs(I)I

    move-result v7

    .line 1034
    .local v7, "edgeToEdge":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    move/from16 v27, v0

    move/from16 v0, v27

    if-ge v0, v5, :cond_193

    .line 1035
    move v6, v5

    .line 1036
    .local v6, "edgeBottom":I
    move v8, v13

    .line 1043
    .local v8, "edgeTop":I
    :goto_93
    const/high16 v27, 0x3f000000

    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSlideRegionFrac:F

    move/from16 v28, v0

    mul-float v27, v27, v28

    int-to-float v0, v7

    move/from16 v28, v0

    mul-float v27, v27, v28

    move/from16 v0, v27

    float-to-int v0, v0

    move/from16 v21, v0

    .line 1044
    .local v21, "slideRgnHeight":I
    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v22, v0

    .line 1045
    .local v22, "slideRgnHeightF":F
    add-int v20, v8, v21

    .line 1046
    .local v20, "slideEdgeTop":I
    sub-int v19, v6, v21

    .line 1049
    .local v19, "slideEdgeBottom":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    move/from16 v27, v0

    move/from16 v0, v27

    move/from16 v1, v20

    if-ge v0, v1, :cond_197

    .line 1050
    add-int/lit8 v27, v11, -0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    .line 1051
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    .line 1052
    const/high16 v27, 0x3f000000

    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    move/from16 v28, v0

    sub-int v28, v20, v28

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    mul-float v27, v27, v28

    div-float v27, v27, v22

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSlideFrac:F

    .line 1073
    .end local v6    # "edgeBottom":I
    .end local v7    # "edgeToEdge":I
    .end local v8    # "edgeTop":I
    .end local v19    # "slideEdgeBottom":I
    .end local v20    # "slideEdgeTop":I
    .end local v21    # "slideRgnHeight":I
    .end local v22    # "slideRgnHeightF":F
    :goto_e1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    move/from16 v27, v0

    move/from16 v0, v27

    if-ge v0, v15, :cond_1e2

    .line 1074
    move v11, v15

    .line 1075
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    .line 1076
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    .line 1083
    :cond_f4
    :goto_f4
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    move/from16 v27, v0

    move/from16 v0, v27

    move/from16 v1, v16

    if-ne v0, v1, :cond_116

    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    move/from16 v27, v0

    move/from16 v0, v27

    move/from16 v1, v17

    if-ne v0, v1, :cond_116

    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSlideFrac:F

    move/from16 v27, v0

    cmpl-float v27, v27, v18

    if-eqz v27, :cond_118

    .line 1085
    :cond_116
    const/16 v26, 0x1

    .line 1088
    :cond_118
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I

    move/from16 v27, v0

    move/from16 v0, v27

    if-eq v11, v0, :cond_143

    .line 1089
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;

    move-object/from16 v27, v0

    if-eqz v27, :cond_13d

    .line 1090
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I

    move/from16 v28, v0

    sub-int v28, v28, v15

    sub-int v29, v11, v15

    invoke-interface/range {v27 .. v29}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;->drag(II)V

    .line 1093
    :cond_13d
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I

    .line 1094
    const/16 v26, 0x1

    .line 1097
    :cond_143
    return v26

    .line 986
    .end local v14    # "numFooters":I
    .end local v15    # "numHeaders":I
    .end local v16    # "oldFirstExpPos":I
    .end local v17    # "oldSecondExpPos":I
    .end local v18    # "oldSlideFrac":F
    .end local v26    # "updated":Z
    :cond_144
    add-int v27, v10, v4

    sub-int v12, v12, v27

    .line 987
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v12}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getShuffleEdge(II)I

    move-result v5

    .line 990
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    move/from16 v27, v0

    move/from16 v0, v27

    if-ge v0, v5, :cond_5d

    .line 994
    move v13, v5

    goto/16 :goto_4d

    .line 999
    :cond_15b
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v3

    .line 1000
    .local v3, "count":I
    :goto_15f
    if-ge v11, v3, :cond_5d

    .line 1001
    add-int/lit8 v27, v3, -0x1

    move/from16 v0, v27

    if-ne v11, v0, :cond_16d

    .line 1002
    add-int v27, v12, v4

    add-int v5, v27, v10

    .line 1003
    goto/16 :goto_5d

    .line 1006
    :cond_16d
    add-int v27, v4, v10

    add-int v12, v12, v27

    .line 1007
    add-int/lit8 v27, v11, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getItemHeight(I)I

    move-result v10

    .line 1008
    add-int/lit8 v27, v11, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1, v12}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getShuffleEdge(II)I

    move-result v5

    .line 1012
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    move/from16 v27, v0

    move/from16 v0, v27

    if-lt v0, v5, :cond_5d

    .line 1016
    move v13, v5

    .line 1017
    add-int/lit8 v11, v11, 0x1

    goto :goto_15f

    .line 1038
    .end local v3    # "count":I
    .restart local v7    # "edgeToEdge":I
    .restart local v14    # "numFooters":I
    .restart local v15    # "numHeaders":I
    .restart local v16    # "oldFirstExpPos":I
    .restart local v17    # "oldSecondExpPos":I
    .restart local v18    # "oldSlideFrac":F
    .restart local v26    # "updated":Z
    :cond_193
    move v8, v5

    .line 1039
    .restart local v8    # "edgeTop":I
    move v6, v13

    .restart local v6    # "edgeBottom":I
    goto/16 :goto_93

    .line 1055
    .restart local v19    # "slideEdgeBottom":I
    .restart local v20    # "slideEdgeTop":I
    .restart local v21    # "slideRgnHeight":I
    .restart local v22    # "slideRgnHeightF":F
    :cond_197
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    move/from16 v27, v0

    move/from16 v0, v27

    move/from16 v1, v19

    if-ge v0, v1, :cond_1ad

    .line 1056
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    .line 1057
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    goto/16 :goto_e1

    .line 1059
    :cond_1ad
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    .line 1060
    add-int/lit8 v27, v11, 0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    .line 1061
    const/high16 v27, 0x3f000000

    const/high16 v28, 0x3f800000

    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I

    move/from16 v29, v0

    sub-int v29, v6, v29

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    div-float v29, v29, v22

    add-float v28, v28, v29

    mul-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSlideFrac:F

    goto/16 :goto_e1

    .line 1068
    .end local v6    # "edgeBottom":I
    .end local v7    # "edgeToEdge":I
    .end local v8    # "edgeTop":I
    .end local v19    # "slideEdgeBottom":I
    .end local v20    # "slideEdgeTop":I
    .end local v21    # "slideRgnHeight":I
    .end local v22    # "slideRgnHeightF":F
    :cond_1d8
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    .line 1069
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    goto/16 :goto_e1

    .line 1077
    :cond_1e2
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    move/from16 v27, v0

    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v28

    sub-int v28, v28, v14

    move/from16 v0, v27

    move/from16 v1, v28

    if-lt v0, v1, :cond_f4

    .line 1078
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v27

    sub-int v27, v27, v14

    add-int/lit8 v11, v27, -0x1

    .line 1079
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    .line 1080
    move-object/from16 v0, p0

    iput v11, v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    goto/16 :goto_f4
.end method

.method private updateScrollStarts()V
    .registers 7

    .prologue
    .line 1808
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingTop()I

    move-result v2

    .line 1809
    .local v2, "padTop":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeight()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingBottom()I

    move-result v4

    sub-int v1, v3, v4

    .line 1810
    .local v1, "listHeight":I
    int-to-float v0, v1

    .line 1812
    .local v0, "heightF":F
    int-to-float v3, v2

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragUpScrollStartFrac:F

    mul-float/2addr v4, v0

    add-float/2addr v3, v4

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUpScrollStartYF:F

    .line 1813
    int-to-float v3, v2

    const/high16 v4, 0x3f800000

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDownScrollStartFrac:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, v0

    add-float/2addr v3, v4

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDownScrollStartYF:F

    .line 1815
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUpScrollStartYF:F

    float-to-int v3, v3

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUpScrollStartY:I

    .line 1816
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDownScrollStartYF:F

    float-to-int v3, v3

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDownScrollStartY:I

    .line 1818
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUpScrollStartYF:F

    int-to-float v4, v2

    sub-float/2addr v3, v4

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragUpScrollHeight:F

    .line 1819
    add-int v3, v2, v1

    int-to-float v3, v3

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDownScrollStartYF:F

    sub-float/2addr v3, v4

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDownScrollHeight:F

    .line 1820
    return-void
.end method


# virtual methods
.method public cancelDrag()V
    .registers 3

    .prologue
    .line 1449
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1b

    .line 1450
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->stopScrolling(Z)V

    .line 1451
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->destroyFloatView()V

    .line 1452
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->clearPositions()V

    .line 1453
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->adjustAllItems()V

    .line 1455
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mInTouchEvent:Z

    if-eqz v0, :cond_1c

    .line 1456
    const/4 v0, 0x3

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    .line 1461
    :cond_1b
    :goto_1b
    return-void

    .line 1458
    :cond_1c
    const/4 v0, 0x0

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    goto :goto_1b
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 771
    invoke-super {p0, p1}, Landroid/widget/ListView;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 773
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    if-eqz v0, :cond_25

    .line 775
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    iget v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-eq v0, v2, :cond_14

    .line 776
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    invoke-direct {p0, v0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->drawDivider(ILandroid/graphics/Canvas;)V

    .line 778
    :cond_14
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    iget v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    if-eq v0, v2, :cond_25

    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    iget v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    if-eq v0, v2, :cond_25

    .line 779
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    invoke-direct {p0, v0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->drawDivider(ILandroid/graphics/Canvas;)V

    .line 783
    :cond_25
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    if-eqz v0, :cond_77

    .line 785
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v9

    .line 786
    .local v9, "w":I
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v8

    .line 788
    .local v8, "h":I
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v11, v0, Landroid/graphics/Point;->x:I

    .line 790
    .local v11, "x":I
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getWidth()I

    move-result v10

    .line 791
    .local v10, "width":I
    if-gez v11, :cond_40

    .line 792
    neg-int v11, v11

    .line 794
    :cond_40
    if-ge v11, v10, :cond_78

    .line 795
    sub-int v0, v10, v11

    int-to-float v0, v0

    int-to-float v2, v10

    div-float v7, v0, v2

    .line 796
    .local v7, "alphaMod":F
    mul-float/2addr v7, v7

    .line 801
    :goto_49
    const/high16 v0, 0x437f0000

    iget v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCurrFloatAlpha:F

    mul-float/2addr v0, v2

    mul-float/2addr v0, v7

    float-to-int v5, v0

    .line 803
    .local v5, "alpha":I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 805
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 806
    invoke-virtual {p1, v3, v3, v9, v8}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 809
    int-to-float v3, v9

    int-to-float v4, v8

    const/16 v6, 0x1f

    move-object v0, p1

    move v2, v1

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->saveLayerAlpha(FFFFII)I

    .line 810
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 811
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 812
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 814
    .end local v5    # "alpha":I
    .end local v7    # "alphaMod":F
    .end local v8    # "h":I
    .end local v9    # "w":I
    .end local v10    # "width":I
    .end local v11    # "x":I
    :cond_77
    return-void

    .line 798
    .restart local v8    # "h":I
    .restart local v9    # "w":I
    .restart local v10    # "width":I
    .restart local v11    # "x":I
    :cond_78
    const/4 v7, 0x0

    .restart local v7    # "alphaMod":F
    goto :goto_49
.end method

.method public getFloatAlpha()F
    .registers 2

    .prologue
    .line 564
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCurrFloatAlpha:F

    return v0
.end method

.method public getInputAdapter()Landroid/widget/ListAdapter;
    .registers 2

    .prologue
    .line 617
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mAdapterWrapper:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

    if-nez v0, :cond_6

    .line 618
    const/4 v0, 0x0

    .line 620
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mAdapterWrapper:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

    invoke-virtual {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    goto :goto_5
.end method

.method public isDragEnabled()Z
    .registers 2

    .prologue
    .line 2448
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragEnabled:Z

    return v0
.end method

.method protected layoutChildren()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 2098
    invoke-super {p0}, Landroid/widget/ListView;->layoutChildren()V

    .line 2100
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    if-eqz v0, :cond_2a

    .line 2101
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    if-eqz v0, :cond_17

    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewOnMeasured:Z

    if-nez v0, :cond_17

    .line 2105
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->measureFloatView()V

    .line 2107
    :cond_17
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 2108
    iput-boolean v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewOnMeasured:Z

    .line 2110
    :cond_2a
    return-void
.end method

.method public listViewIntercepted()Z
    .registers 2

    .prologue
    .line 1663
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mListViewIntercepted:Z

    return v0
.end method

.method public moveCheckState(II)V
    .registers 15
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    const/4 v11, -0x1

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 2585
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v0

    .line 2586
    .local v0, "cip":Landroid/util/SparseBooleanArray;
    move v3, p1

    .line 2587
    .local v3, "rangeStart":I
    move v2, p2

    .line 2588
    .local v2, "rangeEnd":I
    if-ge p2, p1, :cond_d

    .line 2589
    move v3, p2

    .line 2590
    move v2, p1

    .line 2592
    :cond_d
    add-int/lit8 v2, v2, 0x1

    .line 2594
    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v7

    new-array v6, v7, [I

    .line 2595
    .local v6, "runStart":[I
    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v7

    new-array v5, v7, [I

    .line 2596
    .local v5, "runEnd":[I
    invoke-static {v0, v3, v2, v6, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->buildRunList(Landroid/util/SparseBooleanArray;II[I[I)I

    move-result v4

    .line 2597
    .local v4, "runCount":I
    if-ne v4, v10, :cond_28

    aget v7, v6, v9

    aget v8, v5, v9

    if-ne v7, v8, :cond_28

    .line 2615
    :cond_27
    return-void

    .line 2603
    :cond_28
    if-ge p1, p2, :cond_42

    .line 2604
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2b
    if-eq v1, v4, :cond_27

    .line 2605
    aget v7, v6, v1

    invoke-static {v7, v11, v3, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->rotate(IIII)I

    move-result v7

    invoke-virtual {p0, v7, v10}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setItemChecked(IZ)V

    .line 2606
    aget v7, v5, v1

    invoke-static {v7, v11, v3, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->rotate(IIII)I

    move-result v7

    invoke-virtual {p0, v7, v9}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setItemChecked(IZ)V

    .line 2604
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 2610
    .end local v1    # "i":I
    :cond_42
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_43
    if-eq v1, v4, :cond_27

    .line 2611
    aget v7, v6, v1

    invoke-virtual {p0, v7, v9}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setItemChecked(IZ)V

    .line 2612
    aget v7, v5, v1

    invoke-virtual {p0, v7, v10}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setItemChecked(IZ)V

    .line 2610
    add-int/lit8 v1, v1, 0x1

    goto :goto_43
.end method

.method protected onDragTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x4

    .line 2115
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    packed-switch v0, :pswitch_data_32

    .line 2134
    :goto_a
    const/4 v0, 0x1

    return v0

    .line 2117
    :pswitch_c
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    if-ne v0, v1, :cond_13

    .line 2118
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->cancelDrag()V

    .line 2120
    :cond_13
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doActionUpOrCancel()V

    goto :goto_a

    .line 2124
    :pswitch_17
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    if-ne v0, v1, :cond_1f

    .line 2125
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->stopDrag(Z)Z

    .line 2127
    :cond_1f
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doActionUpOrCancel()V

    goto :goto_a

    .line 2130
    :pswitch_23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-direct {p0, v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->continueDrag(II)V

    goto :goto_a

    .line 2115
    nop

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_17
        :pswitch_23
        :pswitch_c
    .end packed-switch
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1102
    invoke-super {p0, p1}, Landroid/widget/ListView;->onDraw(Landroid/graphics/Canvas;)V

    .line 1104
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mTrackDragSort:Z

    if-eqz v0, :cond_c

    .line 1105
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragSortTracker:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;

    invoke-virtual {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->appendState()V

    .line 1107
    :cond_c
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x1

    .line 1670
    iget-boolean v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragEnabled:Z

    if-nez v3, :cond_a

    .line 1671
    invoke-super {p0, p1}, Landroid/widget/ListView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 1718
    :cond_9
    :goto_9
    return v1

    .line 1674
    :cond_a
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->saveTouchCoords(Landroid/view/MotionEvent;)V

    .line 1675
    iput-boolean v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLastCallWasIntercept:Z

    .line 1677
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    and-int/lit16 v0, v3, 0xff

    .line 1679
    .local v0, "action":I
    if-nez v0, :cond_21

    .line 1680
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    if-eqz v3, :cond_1f

    .line 1682
    iput-boolean v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mIgnoreTouchEvent:Z

    move v1, v2

    .line 1683
    goto :goto_9

    .line 1685
    :cond_1f
    iput-boolean v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mInTouchEvent:Z

    .line 1688
    :cond_21
    const/4 v1, 0x0

    .line 1691
    .local v1, "intercept":Z
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    if-eqz v3, :cond_30

    .line 1693
    const/4 v1, 0x1

    .line 1714
    :goto_27
    if-eq v0, v2, :cond_2c

    const/4 v2, 0x3

    if-ne v0, v2, :cond_9

    .line 1715
    :cond_2c
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mInTouchEvent:Z

    goto :goto_9

    .line 1695
    :cond_30
    invoke-super {p0, p1}, Landroid/widget/ListView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    if-eqz v3, :cond_39

    .line 1696
    iput-boolean v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mListViewIntercepted:Z

    .line 1697
    const/4 v1, 0x1

    .line 1700
    :cond_39
    packed-switch v0, :pswitch_data_4a

    .line 1706
    :pswitch_3c
    if-eqz v1, :cond_45

    .line 1707
    iput v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelMethod:I

    goto :goto_27

    .line 1703
    :pswitch_41
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doActionUpOrCancel()V

    goto :goto_27

    .line 1709
    :cond_45
    const/4 v3, 0x2

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelMethod:I

    goto :goto_27

    .line 1700
    nop

    :pswitch_data_4a
    .packed-switch 0x1
        :pswitch_41
        :pswitch_3c
        :pswitch_41
    .end packed-switch
.end method

.method protected onMeasure(II)V
    .registers 4
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 2085
    invoke-super {p0, p1, p2}, Landroid/widget/ListView;->onMeasure(II)V

    .line 2087
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    if-eqz v0, :cond_15

    .line 2088
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 2089
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->measureFloatView()V

    .line 2091
    :cond_12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewOnMeasured:Z

    .line 2093
    :cond_15
    iput p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mWidthMeasureSpec:I

    .line 2094
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 1824
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ListView;->onSizeChanged(IIII)V

    .line 1825
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->updateScrollStarts()V

    .line 1826
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x0

    .line 1589
    iget-boolean v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mIgnoreTouchEvent:Z

    if-eqz v4, :cond_9

    .line 1590
    iput-boolean v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mIgnoreTouchEvent:Z

    move v2, v3

    .line 1636
    :cond_8
    :goto_8
    return v2

    .line 1594
    :cond_9
    iget-boolean v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragEnabled:Z

    if-nez v4, :cond_12

    .line 1595
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    goto :goto_8

    .line 1598
    :cond_12
    const/4 v2, 0x0

    .line 1600
    .local v2, "more":Z
    iget-boolean v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLastCallWasIntercept:Z

    .line 1601
    .local v1, "lastCallWasIntercept":Z
    iput-boolean v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLastCallWasIntercept:Z

    .line 1603
    if-nez v1, :cond_1c

    .line 1604
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->saveTouchCoords(Landroid/view/MotionEvent;)V

    .line 1608
    :cond_1c
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_26

    .line 1609
    invoke-virtual {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->onDragTouchEvent(Landroid/view/MotionEvent;)Z

    .line 1610
    const/4 v2, 0x1

    goto :goto_8

    .line 1616
    :cond_26
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    if-nez v3, :cond_31

    .line 1617
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    if-eqz v3, :cond_31

    .line 1618
    const/4 v2, 0x1

    .line 1622
    :cond_31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    and-int/lit16 v0, v3, 0xff

    .line 1624
    .local v0, "action":I
    packed-switch v0, :pswitch_data_44

    .line 1630
    :pswitch_3a
    if-eqz v2, :cond_8

    .line 1631
    const/4 v3, 0x1

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelMethod:I

    goto :goto_8

    .line 1627
    :pswitch_40
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doActionUpOrCancel()V

    goto :goto_8

    .line 1624
    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_40
        :pswitch_3a
        :pswitch_40
    .end packed-switch
.end method

.method public removeItem(I)V
    .registers 3
    .param p1, "which"    # I

    .prologue
    .line 1378
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUseRemoveVelocity:Z

    .line 1379
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->removeItem(IF)V

    .line 1380
    return-void
.end method

.method public removeItem(IF)V
    .registers 7
    .param p1, "which"    # I
    .param p2, "velocityX"    # F

    .prologue
    const/4 v3, 0x4

    .line 1390
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    if-eqz v1, :cond_9

    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    if-ne v1, v3, :cond_47

    .line 1392
    :cond_9
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    if-nez v1, :cond_30

    .line 1394
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v1

    add-int/2addr v1, p1

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    .line 1395
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    .line 1396
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    .line 1397
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I

    .line 1398
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1399
    .local v0, "v":Landroid/view/View;
    if-eqz v0, :cond_30

    .line 1400
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1404
    .end local v0    # "v":Landroid/view/View;
    :cond_30
    const/4 v1, 0x1

    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    .line 1405
    iput p2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F

    .line 1407
    iget-boolean v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mInTouchEvent:Z

    if-eqz v1, :cond_3e

    .line 1408
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelMethod:I

    packed-switch v1, :pswitch_data_58

    .line 1418
    :cond_3e
    :goto_3e
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;

    if-eqz v1, :cond_54

    .line 1419
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;

    invoke-virtual {v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->start()V

    .line 1424
    :cond_47
    :goto_47
    return-void

    .line 1410
    :pswitch_48
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelEvent:Landroid/view/MotionEvent;

    invoke-super {p0, v1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_3e

    .line 1413
    :pswitch_4e
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelEvent:Landroid/view/MotionEvent;

    invoke-super {p0, v1}, Landroid/widget/ListView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_3e

    .line 1421
    :cond_54
    invoke-direct {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doRemoveItem(I)V

    goto :goto_47

    .line 1408
    :pswitch_data_58
    .packed-switch 0x1
        :pswitch_48
        :pswitch_4e
    .end packed-switch
.end method

.method public requestLayout()V
    .registers 2

    .prologue
    .line 2010
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mBlockLayoutRequests:Z

    if-nez v0, :cond_7

    .line 2011
    invoke-super {p0}, Landroid/widget/ListView;->requestLayout()V

    .line 2013
    :cond_7
    return-void
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .registers 2

    .prologue
    .line 63
    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 3
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 589
    if-eqz p1, :cond_31

    .line 590
    new-instance v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

    invoke-direct {v0, p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;Landroid/widget/ListAdapter;)V

    iput-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mAdapterWrapper:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

    .line 591
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 593
    instance-of v0, p1, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;

    if-eqz v0, :cond_18

    move-object v0, p1

    .line 594
    check-cast v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;

    invoke-virtual {p0, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setDropListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;)V

    .line 596
    :cond_18
    instance-of v0, p1, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;

    if-eqz v0, :cond_22

    move-object v0, p1

    .line 597
    check-cast v0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;

    invoke-virtual {p0, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setDragListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;)V

    .line 599
    :cond_22
    instance-of v0, p1, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;

    if-eqz v0, :cond_2b

    .line 600
    check-cast p1, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;

    .end local p1    # "adapter":Landroid/widget/ListAdapter;
    invoke-virtual {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setRemoveListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;)V

    .line 606
    :cond_2b
    :goto_2b
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mAdapterWrapper:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

    invoke-super {p0, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 607
    return-void

    .line 603
    .restart local p1    # "adapter":Landroid/widget/ListAdapter;
    :cond_31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mAdapterWrapper:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

    goto :goto_2b
.end method

.method public setDragEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 2444
    iput-boolean p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragEnabled:Z

    .line 2445
    return-void
.end method

.method public setDragListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;)V
    .registers 2
    .param p1, "l"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;

    .prologue
    .line 2430
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;

    .line 2431
    return-void
.end method

.method public setDragScrollProfile(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;)V
    .registers 2
    .param p1, "ssp"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;

    .prologue
    .line 2527
    if-eqz p1, :cond_4

    .line 2528
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mScrollProfile:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;

    .line 2530
    :cond_4
    return-void
.end method

.method public setDragScrollStart(F)V
    .registers 2
    .param p1, "heightFraction"    # F

    .prologue
    .line 1730
    invoke-virtual {p0, p1, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setDragScrollStarts(FF)V

    .line 1731
    return-void
.end method

.method public setDragScrollStarts(FF)V
    .registers 5
    .param p1, "upperFrac"    # F
    .param p2, "lowerFrac"    # F

    .prologue
    const/high16 v1, 0x3f000000

    .line 1744
    cmpl-float v0, p2, v1

    if-lez v0, :cond_18

    .line 1745
    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDownScrollStartFrac:F

    .line 1750
    :goto_8
    cmpl-float v0, p1, v1

    if-lez v0, :cond_1b

    .line 1751
    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragUpScrollStartFrac:F

    .line 1756
    :goto_e
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeight()I

    move-result v0

    if-eqz v0, :cond_17

    .line 1757
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->updateScrollStarts()V

    .line 1759
    :cond_17
    return-void

    .line 1747
    :cond_18
    iput p2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDownScrollStartFrac:F

    goto :goto_8

    .line 1753
    :cond_1b
    iput p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragUpScrollStartFrac:F

    goto :goto_e
.end method

.method public setDragSortListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortListener;)V
    .registers 2
    .param p1, "l"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortListener;

    .prologue
    .line 2514
    invoke-virtual {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setDropListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;)V

    .line 2515
    invoke-virtual {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setDragListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragListener;)V

    .line 2516
    invoke-virtual {p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setRemoveListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;)V

    .line 2517
    return-void
.end method

.method public setDropListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;)V
    .registers 2
    .param p1, "l"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;

    .prologue
    .line 2464
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDropListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;

    .line 2465
    return-void
.end method

.method public setFloatAlpha(F)V
    .registers 2
    .param p1, "alpha"    # F

    .prologue
    .line 560
    iput p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCurrFloatAlpha:F

    .line 561
    return-void
.end method

.method public setFloatViewManager(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;)V
    .registers 2
    .param p1, "manager"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

    .prologue
    .line 2426
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewManager:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

    .line 2427
    return-void
.end method

.method public setMaxScrollSpeed(F)V
    .registers 2
    .param p1, "max"    # F

    .prologue
    .line 574
    iput p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mMaxScrollSpeed:F

    .line 575
    return-void
.end method

.method public setRemoveListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;)V
    .registers 2
    .param p1, "l"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;

    .prologue
    .line 2478
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveListener:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;

    .line 2479
    return-void
.end method

.method public startDrag(IIII)Z
    .registers 11
    .param p1, "position"    # I
    .param p2, "dragFlags"    # I
    .param p3, "deltaX"    # I
    .param p4, "deltaY"    # I

    .prologue
    const/4 v0, 0x0

    .line 2161
    iget-boolean v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mInTouchEvent:Z

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewManager:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

    if-nez v1, :cond_a

    .line 2170
    :cond_9
    :goto_9
    return v0

    .line 2165
    :cond_a
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewManager:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;

    invoke-interface {v1, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$FloatViewManager;->onCreateFloatView(I)Landroid/view/View;

    move-result-object v2

    .line 2167
    .local v2, "v":Landroid/view/View;
    if-eqz v2, :cond_9

    move-object v0, p0

    move v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .line 2170
    invoke-virtual/range {v0 .. v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->startDrag(ILandroid/view/View;III)Z

    move-result v0

    goto :goto_9
.end method

.method public startDrag(ILandroid/view/View;III)Z
    .registers 13
    .param p1, "position"    # I
    .param p2, "floatView"    # Landroid/view/View;
    .param p3, "dragFlags"    # I
    .param p4, "deltaX"    # I
    .param p5, "deltaY"    # I

    .prologue
    const/4 v6, 0x4

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 2198
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    if-nez v4, :cond_15

    iget-boolean v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mInTouchEvent:Z

    if-eqz v4, :cond_15

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    if-nez v4, :cond_15

    if-eqz p2, :cond_15

    iget-boolean v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragEnabled:Z

    if-nez v4, :cond_17

    :cond_15
    move v2, v3

    .line 2256
    :cond_16
    :goto_16
    return v2

    .line 2203
    :cond_17
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_24

    .line 2204
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 2207
    :cond_24
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v4

    add-int v0, p1, v4

    .line 2208
    .local v0, "pos":I
    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I

    .line 2209
    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I

    .line 2210
    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    .line 2211
    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I

    .line 2214
    iput v6, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I

    .line 2215
    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragFlags:I

    .line 2216
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragFlags:I

    or-int/2addr v3, p3

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragFlags:I

    .line 2218
    iput-object p2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    .line 2219
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->measureFloatView()V

    .line 2221
    iput p4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaX:I

    .line 2222
    iput p5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaY:I

    .line 2225
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mX:I

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaX:I

    sub-int/2addr v4, v5

    iput v4, v3, Landroid/graphics/Point;->x:I

    .line 2226
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mY:I

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaY:I

    sub-int/2addr v4, v5

    iput v4, v3, Landroid/graphics/Point;->y:I

    .line 2229
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0, v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2231
    .local v1, "srcItem":Landroid/view/View;
    if-eqz v1, :cond_66

    .line 2232
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 2235
    :cond_66
    iget-boolean v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mTrackDragSort:Z

    if-eqz v3, :cond_6f

    .line 2236
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragSortTracker:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;

    invoke-virtual {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->startTracking()V

    .line 2241
    :cond_6f
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelMethod:I

    packed-switch v3, :pswitch_data_8e

    .line 2250
    :goto_74
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->requestLayout()V

    .line 2252
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLiftAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;

    if-eqz v3, :cond_16

    .line 2253
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLiftAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;

    invoke-virtual {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->start()V

    goto :goto_16

    .line 2243
    :pswitch_81
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelEvent:Landroid/view/MotionEvent;

    invoke-super {p0, v3}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_74

    .line 2246
    :pswitch_87
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mCancelEvent:Landroid/view/MotionEvent;

    invoke-super {p0, v3}, Landroid/widget/ListView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_74

    .line 2241
    nop

    :pswitch_data_8e
    .packed-switch 0x1
        :pswitch_81
        :pswitch_87
    .end packed-switch
.end method

.method public stopDrag(Z)Z
    .registers 3
    .param p1, "remove"    # Z

    .prologue
    .line 1552
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUseRemoveVelocity:Z

    .line 1553
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->stopDrag(ZF)Z

    move-result v0

    return v0
.end method

.method public stopDrag(ZF)Z
    .registers 6
    .param p1, "remove"    # Z
    .param p2, "velocityX"    # F

    .prologue
    const/4 v0, 0x1

    .line 1563
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatView:Landroid/view/View;

    if-eqz v1, :cond_2e

    .line 1564
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragScroller:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;

    invoke-virtual {v1, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScroller;->stopScrolling(Z)V

    .line 1566
    if-eqz p1, :cond_20

    .line 1567
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1, p2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->removeItem(IF)V

    .line 1576
    :goto_16
    iget-boolean v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mTrackDragSort:Z

    if-eqz v1, :cond_1f

    .line 1577
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragSortTracker:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;

    invoke-virtual {v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->stopTracking()V

    .line 1583
    :cond_1f
    :goto_1f
    return v0

    .line 1569
    :cond_20
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDropAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;

    if-eqz v1, :cond_2a

    .line 1570
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDropAnimator:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;

    invoke-virtual {v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->start()V

    goto :goto_16

    .line 1572
    :cond_2a
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->dropFloatView()V

    goto :goto_16

    .line 1583
    :cond_2e
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method public stopDragWithVelocity(ZF)Z
    .registers 4
    .param p1, "remove"    # Z
    .param p2, "velocityX"    # F

    .prologue
    .line 1558
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUseRemoveVelocity:Z

    .line 1559
    invoke-virtual {p0, p1, p2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->stopDrag(ZF)Z

    move-result v0

    return v0
.end method
