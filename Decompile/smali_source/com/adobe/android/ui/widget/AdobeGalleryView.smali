.class public Lcom/adobe/android/ui/widget/AdobeGalleryView;
.super Lcom/adobe/android/ui/widget/AdobeAbsSpinner;
.source "AdobeGalleryView.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;
.implements Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;
.implements Lcom/adobe/android/ui/widget/VibrationWidget;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollScrollSelectionNotifier;,
        Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;,
        Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;
    }
.end annotation


# instance fields
.field private isDown:Z

.field private mAnimationDuration:I

.field private mAutoScrollToCenter:Z

.field private mAutoSelectChild:Z

.field private mCenter:I

.field private mContextMenuInfo:Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterContextMenuInfo;

.field private mDownTouchPosition:I

.field private mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mGravity:I

.field private mIsFirstScroll:Z

.field private mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

.field private mRealSelectedPosition:I

.field private mReceivedInvokeKeyDown:Z

.field mScrollCompletedNotifier:Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;

.field mScrollScrollNotifier:Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollScrollSelectionNotifier;

.field private mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

.field private mShouldCallbackDuringFling:Z

.field private mShouldCallbackOnUnselectedItemClick:Z

.field private mSuppressSelectionChanged:Z

.field private mTouchSlop:I

.field private mVibratorHelper:Lcom/adobe/android/ui/widget/VibrationHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 77
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 78
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v5, 0x0

    .line 81
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    iput-boolean v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoSelectChild:Z

    .line 38
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    .line 40
    iput v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mCenter:I

    .line 47
    const/16 v3, 0x10

    iput v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mGravity:I

    .line 54
    iput-boolean v8, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoScrollToCenter:Z

    .line 58
    iput-boolean v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mShouldCallbackDuringFling:Z

    .line 60
    iput-boolean v8, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mShouldCallbackOnUnselectedItemClick:Z

    .line 62
    iput-boolean v8, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSuppressSelectionChanged:Z

    .line 83
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    .line 84
    .local v2, "theme":Landroid/content/res/Resources$Theme;
    sget-object v3, Lcom/adobe/android/ui/R$styleable;->AdobeGalleryView:[I

    invoke-virtual {v2, p2, v3, p3, v5}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 85
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v3, Lcom/adobe/android/ui/R$styleable;->AdobeGalleryView_android_animationDuration:I

    const/16 v4, 0x190

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAnimationDuration:I

    .line 87
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 89
    new-instance v3, Landroid/view/GestureDetector;

    invoke-direct {v3, p1, p0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mGestureDetector:Landroid/view/GestureDetector;

    .line 90
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v3, v5}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    .line 92
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    .line 93
    .local v1, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v3

    iput v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mTouchSlop:I

    .line 95
    new-instance v3, Lcom/adobe/android/ui/widget/ScrollerRunnable;

    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAnimationDuration:I

    .line 98
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledOverscrollDistance()I

    move-result v5

    new-instance v6, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v7, 0x3f800000

    invoke-direct {v6, v7}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-direct {v3, p0, v4, v5, v6}, Lcom/adobe/android/ui/widget/ScrollerRunnable;-><init>(Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;IILandroid/view/animation/Interpolator;)V

    iput-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    .line 100
    new-instance v3, Lcom/adobe/android/ui/widget/VibrationHelper;

    invoke-direct {v3, p1, v8}, Lcom/adobe/android/ui/widget/VibrationHelper;-><init>(Landroid/content/Context;Z)V

    iput-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mVibratorHelper:Lcom/adobe/android/ui/widget/VibrationHelper;

    .line 101
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/android/ui/widget/AdobeGalleryView;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/android/ui/widget/AdobeGalleryView;

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->dispatchUnpress()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/android/ui/widget/AdobeGalleryView;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/android/ui/widget/AdobeGalleryView;

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->fireOnScrollCompleted()V

    return-void
.end method

.method private calculateTop(Landroid/view/View;Z)I
    .registers 9
    .param p1, "child"    # Landroid/view/View;
    .param p2, "duringLayout"    # Z

    .prologue
    .line 739
    if-eqz p2, :cond_13

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getMeasuredHeight()I

    move-result v3

    .line 740
    .local v3, "myHeight":I
    :goto_6
    if-eqz p2, :cond_18

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 742
    .local v1, "childHeight":I
    :goto_c
    const/4 v2, 0x0

    .line 744
    .local v2, "childTop":I
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mGravity:I

    sparse-switch v4, :sswitch_data_42

    .line 759
    :goto_12
    return v2

    .line 739
    .end local v1    # "childHeight":I
    .end local v2    # "childTop":I
    .end local v3    # "myHeight":I
    :cond_13
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getHeight()I

    move-result v3

    goto :goto_6

    .line 740
    .restart local v3    # "myHeight":I
    :cond_18
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    goto :goto_c

    .line 746
    .restart local v1    # "childHeight":I
    .restart local v2    # "childTop":I
    :sswitch_1d
    iget-object v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v2, v4, Landroid/graphics/Rect;->top:I

    .line 747
    goto :goto_12

    .line 749
    :sswitch_22
    iget-object v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int v4, v3, v4

    iget-object v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v5

    sub-int v0, v4, v1

    .line 750
    .local v0, "availableSpace":I
    iget-object v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    div-int/lit8 v5, v0, 0x2

    add-int v2, v4, v5

    .line 751
    goto :goto_12

    .line 753
    .end local v0    # "availableSpace":I
    :sswitch_38
    iget-object v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int v4, v3, v4

    sub-int v2, v4, v1

    .line 754
    goto :goto_12

    .line 744
    nop

    :sswitch_data_42
    .sparse-switch
        0x10 -> :sswitch_22
        0x30 -> :sswitch_1d
        0x50 -> :sswitch_38
    .end sparse-switch
.end method

.method private detachOffScreenChildren(Z)V
    .registers 14
    .param p1, "toLeft"    # Z

    .prologue
    .line 223
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v7

    .line 224
    .local v7, "numChildren":I
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    .line 225
    .local v2, "firstPosition":I
    const/4 v8, 0x0

    .line 226
    .local v8, "start":I
    const/4 v1, 0x0

    .line 228
    .local v1, "count":I
    if-eqz p1, :cond_3e

    .line 229
    const/4 v3, 0x0

    .line 230
    .local v3, "galleryLeft":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_c
    if-ge v5, v7, :cond_19

    .line 231
    move v6, v5

    .line 232
    .local v6, "n":I
    invoke-virtual {p0, v6}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 233
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v10

    if-ltz v10, :cond_25

    .line 243
    .end local v0    # "child":Landroid/view/View;
    .end local v6    # "n":I
    :cond_19
    const/4 v8, 0x0

    .line 262
    .end local v3    # "galleryLeft":I
    :cond_1a
    invoke-virtual {p0, v8, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->detachViewsFromParent(II)V

    .line 264
    if-eqz p1, :cond_24

    .line 265
    iget v10, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    add-int/2addr v10, v1

    iput v10, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    .line 267
    :cond_24
    return-void

    .line 236
    .restart local v0    # "child":Landroid/view/View;
    .restart local v3    # "galleryLeft":I
    .restart local v6    # "n":I
    :cond_25
    move v8, v6

    .line 237
    add-int/lit8 v1, v1, 0x1

    .line 239
    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAdapter:Landroid/widget/Adapter;

    add-int v11, v2, v6

    invoke-interface {v10, v11}, Landroid/widget/Adapter;->getItemViewType(I)I

    move-result v9

    .line 240
    .local v9, "viewType":I
    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mRecycleBin:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Queue;

    invoke-interface {v10, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 230
    add-int/lit8 v5, v5, 0x1

    goto :goto_c

    .line 246
    .end local v0    # "child":Landroid/view/View;
    .end local v3    # "galleryLeft":I
    .end local v5    # "i":I
    .end local v6    # "n":I
    .end local v9    # "viewType":I
    :cond_3e
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getWidth()I

    move-result v4

    .line 247
    .local v4, "galleryRight":I
    add-int/lit8 v5, v7, -0x1

    .restart local v5    # "i":I
    :goto_44
    if-ltz v5, :cond_1a

    .line 248
    move v6, v5

    .line 249
    .restart local v6    # "n":I
    invoke-virtual {p0, v6}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 250
    .restart local v0    # "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v10

    if-le v10, v4, :cond_1a

    .line 253
    move v8, v6

    .line 254
    add-int/lit8 v1, v1, 0x1

    .line 256
    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAdapter:Landroid/widget/Adapter;

    add-int v11, v2, v6

    invoke-interface {v10, v11}, Landroid/widget/Adapter;->getItemViewType(I)I

    move-result v9

    .line 257
    .restart local v9    # "viewType":I
    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mRecycleBin:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Queue;

    invoke-interface {v10, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 247
    add-int/lit8 v5, v5, -0x1

    goto :goto_44
.end method

.method private dispatchPress(Landroid/view/View;)V
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    const/4 v0, 0x1

    .line 1030
    if-eqz p1, :cond_6

    .line 1031
    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    .line 1033
    :cond_6
    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setPressed(Z)V

    .line 1034
    return-void
.end method

.method private dispatchUnpress()V
    .registers 2

    .prologue
    .line 1248
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setPressed(Z)V

    .line 1249
    return-void
.end method

.method private drawEdges(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1073
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v3, :cond_88

    .line 1074
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v3

    if-nez v3, :cond_46

    .line 1075
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    .line 1076
    .local v1, "restoreCount":I
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getPaddingBottom()I

    move-result v4

    sub-int v0, v3, v4

    .line 1078
    .local v0, "height":I
    const/high16 v3, 0x43870000

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->rotate(F)V

    .line 1079
    neg-int v3, v0

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getPaddingTop()I

    move-result v4

    add-int/2addr v3, v4

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1080
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getWidth()I

    move-result v4

    invoke-virtual {v3, v0, v4}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    .line 1081
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v3

    if-eqz v3, :cond_43

    .line 1082
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->postInvalidate()V

    .line 1084
    :cond_43
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 1086
    .end local v0    # "height":I
    .end local v1    # "restoreCount":I
    :cond_46
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v3

    if-nez v3, :cond_88

    .line 1087
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    .line 1088
    .restart local v1    # "restoreCount":I
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getWidth()I

    move-result v2

    .line 1089
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getPaddingBottom()I

    move-result v4

    sub-int v0, v3, v4

    .line 1091
    .restart local v0    # "height":I
    const/high16 v3, 0x42b40000

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->rotate(F)V

    .line 1092
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getPaddingTop()I

    move-result v3

    neg-int v3, v3

    int-to-float v3, v3

    neg-int v4, v2

    int-to-float v4, v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1093
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3, v0, v2}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    .line 1094
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v3

    if-eqz v3, :cond_85

    .line 1095
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->postInvalidate()V

    .line 1097
    :cond_85
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 1100
    .end local v0    # "height":I
    .end local v1    # "restoreCount":I
    .end local v2    # "width":I
    :cond_88
    return-void
.end method

.method private fillToGalleryLeft()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 569
    const/4 v2, 0x0

    .line 572
    .local v2, "galleryLeft":I
    invoke-virtual {p0, v6}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 576
    .local v3, "prevIterationView":Landroid/view/View;
    if-eqz v3, :cond_23

    .line 577
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    add-int/lit8 v0, v4, -0x1

    .line 578
    .local v0, "curPosition":I
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v1

    .line 585
    .local v1, "curRightEdge":I
    :goto_10
    if-le v1, v2, :cond_2f

    .line 586
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    sub-int v4, v0, v4

    invoke-direct {p0, v0, v4, v1, v6}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->makeAndAddView(IIIZ)Landroid/view/View;

    move-result-object v3

    .line 589
    iput v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    .line 592
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v1

    .line 593
    add-int/lit8 v0, v0, -0x1

    goto :goto_10

    .line 581
    .end local v0    # "curPosition":I
    .end local v1    # "curRightEdge":I
    :cond_23
    const/4 v0, 0x0

    .line 582
    .restart local v0    # "curPosition":I
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getRight()I

    move-result v4

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getLeft()I

    move-result v5

    sub-int v1, v4, v5

    .restart local v1    # "curRightEdge":I
    goto :goto_10

    .line 595
    :cond_2f
    return-void
.end method

.method private fillToGalleryRight()V
    .registers 8

    .prologue
    .line 598
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getRight()I

    move-result v5

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getLeft()I

    move-result v6

    sub-int v2, v5, v6

    .line 599
    .local v2, "galleryRight":I
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v3

    .line 602
    .local v3, "numChildren":I
    add-int/lit8 v5, v3, -0x1

    invoke-virtual {p0, v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 606
    .local v4, "prevIterationView":Landroid/view/View;
    if-eqz v4, :cond_30

    .line 607
    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    add-int v1, v5, v3

    .line 608
    .local v1, "curPosition":I
    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v0

    .line 615
    .local v0, "curLeftEdge":I
    :goto_1e
    if-ge v0, v2, :cond_38

    .line 616
    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    sub-int v5, v1, v5

    const/4 v6, 0x1

    invoke-direct {p0, v1, v5, v0, v6}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->makeAndAddView(IIIZ)Landroid/view/View;

    move-result-object v4

    .line 619
    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v0

    .line 620
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 610
    .end local v0    # "curLeftEdge":I
    .end local v1    # "curPosition":I
    :cond_30
    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    add-int/lit8 v1, v5, -0x1

    .line 611
    .restart local v1    # "curPosition":I
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    .line 612
    const/4 v0, 0x0

    .restart local v0    # "curLeftEdge":I
    goto :goto_1e

    .line 622
    :cond_38
    return-void
.end method

.method private fireOnScrollCompleted()V
    .registers 7

    .prologue
    .line 1329
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    if-nez v0, :cond_5

    .line 1338
    :cond_4
    :goto_4
    return-void

    .line 1333
    :cond_5
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedItemPosition()I

    move-result v3

    .line 1334
    .local v3, "selection":I
    if-ltz v3, :cond_4

    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    if-ge v3, v0, :cond_4

    .line 1335
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedView()Landroid/view/View;

    move-result-object v2

    .line 1336
    .local v2, "v":Landroid/view/View;
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v4

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;->onScrollFinished(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V

    goto :goto_4
.end method

.method private fireVibration()V
    .registers 3

    .prologue
    .line 1155
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mVibratorHelper:Lcom/adobe/android/ui/widget/VibrationHelper;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/VibrationHelper;->vibrate(I)V

    .line 1156
    return-void
.end method

.method private getCenterOfGallery()I
    .registers 2

    .prologue
    .line 1016
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mCenter:I

    return v0
.end method

.method private static getCenterOfView(Landroid/view/View;)I
    .registers 3
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 1026
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    return v0
.end method

.method private isOverScrolled()Z
    .registers 8

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 382
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v5

    const/4 v6, 0x2

    if-ge v5, v6, :cond_a

    .line 403
    :cond_9
    :goto_9
    return v3

    .line 386
    :cond_a
    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    if-eqz v5, :cond_16

    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    add-int/lit8 v6, v6, -0x1

    if-ne v5, v6, :cond_9

    .line 388
    :cond_16
    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int/2addr v5, v6

    invoke-virtual {p0, v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 389
    .local v2, "view":Landroid/view/View;
    if-eqz v2, :cond_9

    .line 393
    invoke-static {v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfView(Landroid/view/View;)I

    move-result v0

    .line 394
    .local v0, "selectedCenter0":I
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfGallery()I

    move-result v1

    .line 396
    .local v1, "targetCenter":I
    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    if-nez v5, :cond_31

    if-le v0, v1, :cond_31

    move v3, v4

    .line 397
    goto :goto_9

    .line 399
    :cond_31
    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    add-int/lit8 v6, v6, -0x1

    if-ne v5, v6, :cond_9

    if-ge v0, v1, :cond_9

    move v3, v4

    .line 400
    goto :goto_9
.end method

.method private makeAndAddView(IIIZ)Landroid/view/View;
    .registers 9
    .param p1, "position"    # I
    .param p2, "offset"    # I
    .param p3, "x"    # I
    .param p4, "fromLeft"    # Z

    .prologue
    .line 626
    const/4 v0, 0x0

    .line 627
    .local v0, "child":Landroid/view/View;
    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAdapter:Landroid/widget/Adapter;

    invoke-interface {v2, p1}, Landroid/widget/Adapter;->getItemViewType(I)I

    move-result v1

    .line 629
    .local v1, "viewType":I
    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDataChanged:Z

    if-nez v2, :cond_24

    .line 630
    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mRecycleBin:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "child":Landroid/view/View;
    check-cast v0, Landroid/view/View;

    .line 632
    .restart local v0    # "child":Landroid/view/View;
    if-eqz v0, :cond_24

    .line 633
    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAdapter:Landroid/widget/Adapter;

    invoke-interface {v2, p1, v0, p0}, Landroid/widget/Adapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 634
    invoke-direct {p0, v0, p2, p3, p4}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setUpChild(Landroid/view/View;IIZ)V

    .line 638
    :cond_24
    if-nez v0, :cond_30

    .line 639
    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAdapter:Landroid/widget/Adapter;

    const/4 v3, 0x0

    invoke-interface {v2, p1, v3, p0}, Landroid/widget/Adapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 640
    invoke-direct {p0, v0, p2, p3, p4}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setUpChild(Landroid/view/View;IIZ)V

    .line 644
    :cond_30
    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoSelectChild:Z

    if-nez v2, :cond_3e

    if-eqz v0, :cond_3e

    .line 645
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mRealSelectedPosition:I

    if-ne p1, v2, :cond_3f

    const/4 v2, 0x1

    :goto_3b
    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 648
    :cond_3e
    return-object v0

    .line 645
    :cond_3f
    const/4 v2, 0x0

    goto :goto_3b
.end method

.method private offsetChildrenLeftAndRight(I)V
    .registers 4
    .param p1, "offset"    # I

    .prologue
    .line 211
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_6
    if-ltz v0, :cond_12

    .line 212
    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 211
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 214
    :cond_12
    return-void
.end method

.method private onFinishedMovement()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 407
    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->isDown:Z

    if-eqz v2, :cond_6

    .line 438
    :goto_5
    return-void

    .line 411
    :cond_6
    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSuppressSelectionChanged:Z

    if-eqz v2, :cond_13

    .line 412
    iput-boolean v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSuppressSelectionChanged:Z

    .line 413
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    invoke-virtual {p0, v2, v3}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->selectionChanged(II)V

    .line 416
    :cond_13
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->scrollCompleted()V

    .line 418
    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoSelectChild:Z

    if-nez v2, :cond_3c

    .line 420
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedView()Landroid/view/View;

    move-result-object v0

    .line 422
    .local v0, "centerChild":Landroid/view/View;
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mRealSelectedPosition:I

    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    if-eq v2, v3, :cond_32

    .line 424
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mRealSelectedPosition:I

    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int/2addr v2, v3

    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 425
    .local v1, "old":Landroid/view/View;
    if-eqz v1, :cond_32

    .line 426
    invoke-virtual {v1, v4}, Landroid/view/View;->setSelected(Z)V

    .line 430
    .end local v1    # "old":Landroid/view/View;
    :cond_32
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iput v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mRealSelectedPosition:I

    .line 432
    if-eqz v0, :cond_3c

    .line 433
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 437
    .end local v0    # "centerChild":Landroid/view/View;
    :cond_3c
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->invalidate()V

    goto :goto_5
.end method

.method private scrollToChild(I)Z
    .registers 11
    .param p1, "childPosition"    # I

    .prologue
    const/4 v8, 0x0

    .line 919
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 920
    .local v6, "child":Landroid/view/View;
    if-eqz v6, :cond_39

    .line 921
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    if-eqz v0, :cond_23

    .line 922
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedItemPosition()I

    move-result v3

    .line 923
    .local v3, "selection":I
    if-ltz v3, :cond_23

    .line 924
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedView()Landroid/view/View;

    move-result-object v2

    .line 925
    .local v2, "v":Landroid/view/View;
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v4

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;->onScrollStarted(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V

    .line 928
    .end local v2    # "v":Landroid/view/View;
    .end local v3    # "selection":I
    :cond_23
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfGallery()I

    move-result v0

    invoke-static {v6}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfView(Landroid/view/View;)I

    move-result v1

    sub-int v7, v0, v1

    .line 929
    .local v7, "distance":I
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    neg-int v1, v7

    invoke-virtual {v0, v8, v1}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->startUsingDistance(II)V

    .line 930
    if-eqz v7, :cond_37

    const/4 v0, 0x1

    .line 932
    .end local v7    # "distance":I
    :goto_36
    return v0

    .restart local v7    # "distance":I
    :cond_37
    move v0, v8

    .line 930
    goto :goto_36

    .end local v7    # "distance":I
    :cond_39
    move v0, v8

    .line 932
    goto :goto_36
.end method

.method private setSelectionToCenterChild()V
    .registers 11

    .prologue
    .line 445
    iget v8, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int/2addr v8, v9

    invoke-virtual {p0, v8}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 447
    .local v7, "view":Landroid/view/View;
    if-nez v7, :cond_c

    .line 486
    :cond_b
    :goto_b
    return-void

    .line 451
    :cond_c
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfGallery()I

    move-result v3

    .line 454
    .local v3, "galleryCenter":I
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v8

    if-gt v8, v3, :cond_1c

    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v8

    if-ge v8, v3, :cond_b

    .line 458
    :cond_1c
    const v2, 0x7fffffff

    .line 459
    .local v2, "closestEdgeDistance":I
    const/4 v6, 0x0

    .line 460
    .local v6, "newSelectedChildIndex":I
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v8

    add-int/lit8 v4, v8, -0x1

    .local v4, "i":I
    :goto_26
    if-ltz v4, :cond_39

    .line 462
    invoke-virtual {p0, v4}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 464
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v8

    if-gt v8, v3, :cond_59

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v8

    if-lt v8, v3, :cond_59

    .line 465
    move v6, v4

    .line 477
    .end local v0    # "child":Landroid/view/View;
    :cond_39
    iget v8, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    add-int v5, v8, v6

    .line 479
    .local v5, "newPos":I
    iget v8, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    if-eq v5, v8, :cond_b

    .line 481
    const/4 v8, 0x0

    invoke-static {v5, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    add-int/lit8 v9, v9, -0x1

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 482
    const/4 v8, 0x1

    invoke-virtual {p0, v5, v8}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setSelectedPositionInt(IZ)V

    .line 483
    invoke-virtual {p0, v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setNextSelectedPositionInt(I)V

    .line 484
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->checkSelectionChanged()V

    goto :goto_b

    .line 470
    .end local v5    # "newPos":I
    .restart local v0    # "child":Landroid/view/View;
    :cond_59
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v8

    sub-int/2addr v8, v3

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v9

    sub-int/2addr v9, v3

    invoke-static {v9}, Ljava/lang/Math;->abs(I)I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 471
    .local v1, "childClosestEdgeDistance":I
    if-ge v1, v2, :cond_73

    .line 472
    move v2, v1

    .line 473
    move v6, v4

    .line 460
    :cond_73
    add-int/lit8 v4, v4, -0x1

    goto :goto_26
.end method

.method private setUpChild(Landroid/view/View;IIZ)V
    .registers 16
    .param p1, "child"    # Landroid/view/View;
    .param p2, "offset"    # I
    .param p3, "x"    # I
    .param p4, "fromLeft"    # Z

    .prologue
    .line 678
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 680
    .local v6, "lp":Landroid/view/ViewGroup$LayoutParams;
    if-nez v6, :cond_a

    .line 681
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 684
    :cond_a
    if-eqz p4, :cond_4b

    const/4 v8, -0x1

    :goto_d
    invoke-virtual {p0, p1, v8, v6}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    .line 686
    iget-boolean v8, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoSelectChild:Z

    if-eqz v8, :cond_1a

    .line 687
    if-nez p2, :cond_4d

    const/4 v8, 0x1

    :goto_17
    invoke-virtual {p1, v8}, Landroid/view/View;->setSelected(Z)V

    .line 691
    :cond_1a
    iget v8, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mHeightMeasureSpec:I

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mPaddingTop:I

    iget v10, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mPaddingBottom:I

    add-int/2addr v9, v10

    iget v10, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v8, v9, v10}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v1

    .line 692
    .local v1, "childHeightSpec":I
    iget v8, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mWidthMeasureSpec:I

    const/4 v9, 0x0

    iget v10, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v8, v9, v10}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v5

    .line 695
    .local v5, "childWidthSpec":I
    invoke-virtual {p1, v5, v1}, Landroid/view/View;->measure(II)V

    .line 701
    const/4 v8, 0x1

    invoke-direct {p0, p1, v8}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->calculateTop(Landroid/view/View;Z)I

    move-result v4

    .line 702
    .local v4, "childTop":I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    add-int v0, v4, v8

    .line 704
    .local v0, "childBottom":I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    .line 705
    .local v7, "width":I
    if-eqz p4, :cond_4f

    .line 706
    move v2, p3

    .line 707
    .local v2, "childLeft":I
    add-int v3, v2, v7

    .line 713
    .local v3, "childRight":I
    :goto_47
    invoke-virtual {p1, v2, v4, v3, v0}, Landroid/view/View;->layout(IIII)V

    .line 714
    return-void

    .line 684
    .end local v0    # "childBottom":I
    .end local v1    # "childHeightSpec":I
    .end local v2    # "childLeft":I
    .end local v3    # "childRight":I
    .end local v4    # "childTop":I
    .end local v5    # "childWidthSpec":I
    .end local v7    # "width":I
    :cond_4b
    const/4 v8, 0x0

    goto :goto_d

    .line 687
    :cond_4d
    const/4 v8, 0x0

    goto :goto_17

    .line 709
    .restart local v0    # "childBottom":I
    .restart local v1    # "childHeightSpec":I
    .restart local v4    # "childTop":I
    .restart local v5    # "childWidthSpec":I
    .restart local v7    # "width":I
    :cond_4f
    sub-int v2, p3, v7

    .line 710
    .restart local v2    # "childLeft":I
    move v3, p3

    .restart local v3    # "childRight":I
    goto :goto_47
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1118
    if-eqz p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method protected computeHorizontalScrollExtent()I
    .registers 2

    .prologue
    .line 1290
    const/4 v0, 0x1

    return v0
.end method

.method protected computeHorizontalScrollOffset()I
    .registers 2

    .prologue
    .line 1285
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    return v0
.end method

.method protected computeHorizontalScrollRange()I
    .registers 2

    .prologue
    .line 1280
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    return v0
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1064
    invoke-super {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 1066
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v0

    if-lez v0, :cond_c

    .line 1067
    invoke-direct {p0, p1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->drawEdges(Landroid/graphics/Canvas;)V

    .line 1069
    :cond_c
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x0

    .line 1059
    invoke-virtual {p1, p0, v0, v0}, Landroid/view/KeyEvent;->dispatch(Landroid/view/KeyEvent$Callback;Landroid/view/KeyEvent$DispatcherState;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected dispatchSetPressed(Z)V
    .registers 5
    .param p1, "pressed"    # Z

    .prologue
    .line 1109
    if-nez p1, :cond_15

    .line 1110
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_8
    if-ltz v0, :cond_15

    .line 1111
    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 1110
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 1114
    .end local v0    # "i":I
    :cond_15
    return-void
.end method

.method public dispatchSetSelected(Z)V
    .registers 2
    .param p1, "selected"    # Z

    .prologue
    .line 1105
    return-void
.end method

.method protected fireOnSelected()V
    .registers 7

    .prologue
    .line 1006
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    if-nez v0, :cond_5

    .line 1013
    :goto_4
    return-void

    .line 1010
    :cond_5
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedView()Landroid/view/View;

    move-result-object v2

    .line 1011
    .local v2, "newSelectedChild":Landroid/view/View;
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedItemPosition()I

    move-result v3

    .line 1012
    .local v3, "position":I
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v4

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;->onScroll(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V

    goto :goto_4
.end method

.method public forceChildLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 8
    .param p1, "child"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 725
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mHeightMeasureSpec:I

    .line 726
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getPaddingBottom()I

    move-result v4

    add-int/2addr v3, v4

    iget v4, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v2, v3, v4}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v0

    .line 727
    .local v0, "childHeightSpec":I
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mWidthMeasureSpec:I

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getPaddingRight()I

    move-result v4

    add-int/2addr v3, v4

    iget v4, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v2, v3, v4}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v1

    .line 728
    .local v1, "childWidthSpec":I
    invoke-virtual {p1, v1, v0}, Landroid/view/View;->measure(II)V

    .line 729
    return-void
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    .prologue
    .line 560
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 1123
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1128
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getAutoSelectChild()Z
    .registers 2

    .prologue
    .line 104
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoSelectChild:Z

    return v0
.end method

.method getChildHeight(Landroid/view/View;)I
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 565
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    return v0
.end method

.method protected getContextMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .registers 2

    .prologue
    .line 1253
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mContextMenuInfo:Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterContextMenuInfo;

    return-object v0
.end method

.method public getCurrentSelectedItemPosition()I
    .registers 2

    .prologue
    .line 1348
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoSelectChild:Z

    if-nez v0, :cond_7

    .line 1349
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mRealSelectedPosition:I

    .line 1351
    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    goto :goto_6
.end method

.method getLimitedMotionScrollAmount(ZI)I
    .registers 11
    .param p1, "motionToLeft"    # Z
    .param p2, "deltaX"    # I

    .prologue
    const/4 v5, 0x0

    .line 176
    if-eqz p1, :cond_13

    iget v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    add-int/lit8 v3, v6, -0x1

    .line 177
    .local v3, "extremeItemPosition":I
    :goto_7
    iget v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int v6, v3, v6

    invoke-virtual {p0, v6}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 179
    .local v1, "extremeChild":Landroid/view/View;
    if-nez v1, :cond_15

    move v5, p2

    .line 201
    :cond_12
    :goto_12
    return v5

    .end local v1    # "extremeChild":Landroid/view/View;
    .end local v3    # "extremeItemPosition":I
    :cond_13
    move v3, v5

    .line 176
    goto :goto_7

    .line 184
    .restart local v1    # "extremeChild":Landroid/view/View;
    .restart local v3    # "extremeItemPosition":I
    :cond_15
    invoke-static {v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfView(Landroid/view/View;)I

    move-result v7

    if-eqz p1, :cond_34

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    :goto_21
    add-int v2, v7, v6

    .line 185
    .local v2, "extremeChildCenter":I
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfGallery()I

    move-result v4

    .line 187
    .local v4, "galleryCenter":I
    if-eqz p1, :cond_3c

    .line 188
    if-le v2, v4, :cond_12

    .line 199
    :cond_2b
    sub-int v0, v4, v2

    .line 201
    .local v0, "centerDifference":I
    if-eqz p1, :cond_3f

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v5

    goto :goto_12

    .line 184
    .end local v0    # "centerDifference":I
    .end local v2    # "extremeChildCenter":I
    .end local v4    # "galleryCenter":I
    :cond_34
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v6

    neg-int v6, v6

    div-int/lit8 v6, v6, 0x2

    goto :goto_21

    .line 193
    .restart local v2    # "extremeChildCenter":I
    .restart local v4    # "galleryCenter":I
    :cond_3c
    if-lt v2, v4, :cond_2b

    goto :goto_12

    .line 201
    .restart local v0    # "centerDifference":I
    :cond_3f
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result v5

    goto :goto_12
.end method

.method public getMaxX()I
    .registers 2

    .prologue
    .line 372
    const v0, 0x7fffffff

    return v0
.end method

.method public getMinX()I
    .registers 2

    .prologue
    .line 367
    const/4 v0, 0x0

    return v0
.end method

.method getOverScrollDelta(I)I
    .registers 8
    .param p1, "deltaX"    # I

    .prologue
    const/4 v2, 0x0

    .line 894
    if-lez p1, :cond_15

    const/4 v4, 0x1

    .line 895
    .local v4, "motionToLeft":Z
    :goto_4
    if-eqz v4, :cond_a

    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    add-int/lit8 v2, v5, -0x1

    .line 897
    .local v2, "extremeItemPosition":I
    :cond_a
    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int v5, v2, v5

    invoke-virtual {p0, v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 899
    .local v0, "extremeChild":Landroid/view/View;
    if-nez v0, :cond_17

    .line 915
    .end local p1    # "deltaX":I
    :cond_14
    :goto_14
    return p1

    .end local v0    # "extremeChild":Landroid/view/View;
    .end local v2    # "extremeItemPosition":I
    .end local v4    # "motionToLeft":Z
    .restart local p1    # "deltaX":I
    :cond_15
    move v4, v2

    .line 894
    goto :goto_4

    .line 903
    .restart local v0    # "extremeChild":Landroid/view/View;
    .restart local v2    # "extremeItemPosition":I
    .restart local v4    # "motionToLeft":Z
    :cond_17
    invoke-static {v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfView(Landroid/view/View;)I

    move-result v1

    .line 904
    .local v1, "extremeChildCenter":I
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfGallery()I

    move-result v3

    .line 906
    .local v3, "galleryCenter":I
    if-eqz v4, :cond_28

    .line 907
    sub-int v5, v1, p1

    if-ge v5, v3, :cond_14

    .line 908
    sub-int p1, v1, v3

    goto :goto_14

    .line 911
    :cond_28
    sub-int v5, v1, p1

    if-le v5, v3, :cond_14

    .line 912
    sub-int p1, v1, v3

    goto :goto_14
.end method

.method public getSelectedItemPosition()I
    .registers 2

    .prologue
    .line 943
    invoke-super {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getSelectedItemPosition()I

    move-result v0

    return v0
.end method

.method public getVibrationEnabled()Z
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mVibratorHelper:Lcom/adobe/android/ui/widget/VibrationHelper;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/VibrationHelper;->enabled()Z

    move-result v0

    return v0
.end method

.method public invalidateViews()V
    .registers 6

    .prologue
    .line 652
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v1

    .line 653
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-ge v2, v1, :cond_27

    .line 654
    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 655
    .local v0, "child":Landroid/view/View;
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAdapter:Landroid/widget/Adapter;

    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    add-int/2addr v4, v2

    invoke-interface {v3, v4, v0, p0}, Landroid/widget/Adapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 658
    iget-boolean v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoSelectChild:Z

    if-nez v3, :cond_22

    .line 659
    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    add-int/2addr v3, v2

    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mRealSelectedPosition:I

    if-ne v3, v4, :cond_25

    const/4 v3, 0x1

    :goto_1f
    invoke-virtual {v0, v3}, Landroid/view/View;->setSelected(Z)V

    .line 653
    :cond_22
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 659
    :cond_25
    const/4 v3, 0x0

    goto :goto_1f

    .line 662
    .end local v0    # "child":Landroid/view/View;
    :cond_27
    return-void
.end method

.method layout(IZZ)V
    .registers 12
    .param p1, "delta"    # I
    .param p2, "animate"    # Z
    .param p3, "changed"    # Z

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 502
    if-nez p3, :cond_a

    if-nez p1, :cond_a

    .line 503
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->layoutChildren()V

    .line 556
    :goto_9
    return-void

    .line 507
    :cond_a
    const/4 v0, 0x0

    .line 508
    .local v0, "childrenLeft":I
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getRight()I

    move-result v4

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getLeft()I

    move-result v5

    sub-int v1, v4, v5

    .line 510
    .local v1, "childrenWidth":I
    iget-boolean v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDataChanged:Z

    if-eqz v4, :cond_1c

    .line 511
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->handleDataChanged()V

    .line 515
    :cond_1c
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    if-nez v4, :cond_24

    .line 516
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->resetList()V

    goto :goto_9

    .line 521
    :cond_24
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mNextSelectedPosition:I

    if-ltz v4, :cond_31

    .line 522
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mNextSelectedPosition:I

    iput v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mRealSelectedPosition:I

    .line 523
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mNextSelectedPosition:I

    invoke-virtual {p0, v4, p2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setSelectedPositionInt(IZ)V

    .line 527
    :cond_31
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iput v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    .line 529
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v4

    if-eqz v4, :cond_3f

    if-nez p3, :cond_3f

    if-eqz p1, :cond_62

    .line 530
    :cond_3f
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->recycleAllViews()V

    .line 531
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->emptySubRecycler()V

    .line 532
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->removeAllViewsInLayout()V

    .line 535
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    invoke-direct {p0, v4, v6, v6, v7}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->makeAndAddView(IIIZ)Landroid/view/View;

    move-result-object v2

    .line 538
    .local v2, "sel":Landroid/view/View;
    div-int/lit8 v4, v1, 0x2

    add-int/2addr v4, v0

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    sub-int v3, v4, v5

    .line 539
    .local v3, "selectedOffset":I
    invoke-virtual {v2, v3}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 541
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->fillToGalleryRight()V

    .line 542
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->fillToGalleryLeft()V

    .line 547
    .end local v2    # "sel":Landroid/view/View;
    .end local v3    # "selectedOffset":I
    :cond_62
    iput-boolean v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDataChanged:Z

    .line 548
    iput-boolean v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mNeedSync:Z

    .line 550
    iput-boolean v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSuppressSelectionChanged:Z

    .line 551
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    invoke-virtual {p0, v4}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setNextSelectedPositionInt(I)V

    .line 552
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->checkSelectionChanged()V

    .line 553
    iput-boolean v7, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSuppressSelectionChanged:Z

    .line 555
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->postInvalidate()V

    goto :goto_9
.end method

.method public layoutChildren()V
    .registers 7

    .prologue
    .line 717
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_28

    .line 718
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 719
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->forceChildLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 720
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v5

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/view/View;->layout(IIII)V

    .line 717
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 722
    .end local v0    # "child":Landroid/view/View;
    :cond_28
    return-void
.end method

.method public moveNext()Z
    .registers 3

    .prologue
    .line 1141
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    if-lez v0, :cond_18

    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_18

    .line 1142
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->scrollToChild(I)Z

    .line 1143
    const/4 v0, 0x1

    .line 1145
    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public movePrevious()Z
    .registers 3

    .prologue
    .line 1132
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    if-lez v0, :cond_14

    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    if-lez v0, :cond_14

    .line 1133
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    invoke-direct {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->scrollToChild(I)Z

    .line 1134
    const/4 v0, 0x1

    .line 1136
    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method onCancel()V
    .registers 1

    .prologue
    .line 1054
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->onUp()V

    .line 1055
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 948
    invoke-super {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->onDetachedFromWindow()V

    .line 949
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScrollCompletedNotifier:Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 950
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScrollScrollNotifier:Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollScrollSelectionNotifier;

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 951
    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    .line 764
    iput-boolean v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->isDown:Z

    .line 765
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->stop(Z)V

    .line 766
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p0, v1, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->pointToPosition(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    .line 768
    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    if-ltz v1, :cond_2f

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    if-ge v1, v2, :cond_2f

    .line 769
    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 770
    .local v0, "view":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->dispatchPress(Landroid/view/View;)V

    .line 772
    .end local v0    # "view":Landroid/view/View;
    :cond_2f
    iput-boolean v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mIsFirstScroll:Z

    .line 773
    return v3
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 12
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 869
    iget-boolean v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mShouldCallbackDuringFling:Z

    if-nez v6, :cond_8

    .line 870
    iput-boolean v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSuppressSelectionChanged:Z

    .line 873
    :cond_8
    neg-float v6, p3

    float-to-int v6, v6

    div-int/lit8 v2, v6, 0x2

    .line 874
    .local v2, "initialVelocity":I
    if-gez v2, :cond_20

    const v3, 0x7fffffff

    .line 876
    .local v3, "initialX":I
    :goto_11
    if-gez v2, :cond_22

    const/4 v1, -0x2

    .line 877
    .local v1, "delta":I
    :goto_14
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getOverScrollDelta(I)I

    move-result v0

    .line 879
    .local v0, "clampedDelta":I
    if-ne v1, v0, :cond_24

    .line 880
    iget-object v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    invoke-virtual {v5, v3, v2}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->startUsingVelocity(II)V

    .line 883
    :goto_1f
    return v4

    .end local v0    # "clampedDelta":I
    .end local v1    # "delta":I
    .end local v3    # "initialX":I
    :cond_20
    move v3, v5

    .line 874
    goto :goto_11

    .line 876
    .restart local v3    # "initialX":I
    :cond_22
    const/4 v1, 0x2

    goto :goto_14

    .restart local v0    # "clampedDelta":I
    .restart local v1    # "delta":I
    :cond_24
    move v4, v5

    .line 883
    goto :goto_1f
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .registers 7
    .param p1, "gainFocus"    # Z
    .param p2, "direction"    # I
    .param p3, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .prologue
    .line 1173
    invoke-super {p0, p1, p2, p3}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 1175
    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1177
    .local v0, "current":Landroid/view/View;
    if-eqz p1, :cond_18

    if-eqz v0, :cond_18

    .line 1180
    iget-boolean v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoSelectChild:Z

    if-eqz v1, :cond_18

    .line 1181
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 1184
    :cond_18
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 1188
    sparse-switch p1, :sswitch_data_1e

    .line 1211
    :goto_4
    const/4 v0, 0x0

    :cond_5
    :goto_5
    return v0

    .line 1191
    :sswitch_6
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->movePrevious()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1192
    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->playSoundEffect(I)V

    goto :goto_5

    .line 1197
    :sswitch_10
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->moveNext()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1198
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->playSoundEffect(I)V

    goto :goto_5

    .line 1204
    :sswitch_1b
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mReceivedInvokeKeyDown:Z

    goto :goto_4

    .line 1188
    :sswitch_data_1e
    .sparse-switch
        0x15 -> :sswitch_6
        0x16 -> :sswitch_10
        0x17 -> :sswitch_1b
        0x42 -> :sswitch_1b
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 9
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x0

    .line 1216
    sparse-switch p1, :sswitch_data_3a

    .line 1243
    :goto_4
    return v2

    .line 1220
    :sswitch_5
    iget-boolean v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mReceivedInvokeKeyDown:Z

    if-eqz v3, :cond_36

    .line 1221
    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    if-lez v3, :cond_36

    .line 1223
    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int v0, v3, v4

    .line 1224
    .local v0, "selectedIndex":I
    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1225
    .local v1, "view":Landroid/view/View;
    if-eqz v1, :cond_36

    .line 1226
    invoke-direct {p0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->dispatchPress(Landroid/view/View;)V

    .line 1227
    new-instance v3, Lcom/adobe/android/ui/widget/AdobeGalleryView$1;

    invoke-direct {v3, p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView$1;-><init>(Lcom/adobe/android/ui/widget/AdobeGalleryView;)V

    .line 1233
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v4

    int-to-long v4, v4

    .line 1227
    invoke-virtual {p0, v3, v4, v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1235
    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget-object v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAdapter:Landroid/widget/Adapter;

    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    invoke-interface {v4, v5}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v4

    invoke-virtual {p0, v1, v3, v4, v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->performItemClick(Landroid/view/View;IJ)Z

    .line 1239
    .end local v0    # "selectedIndex":I
    .end local v1    # "view":Landroid/view/View;
    :cond_36
    iput-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mReceivedInvokeKeyDown:Z

    .line 1240
    const/4 v2, 0x1

    goto :goto_4

    .line 1216
    :sswitch_data_3a
    .sparse-switch
        0x17 -> :sswitch_5
        0x42 -> :sswitch_5
    .end sparse-switch
.end method

.method protected onLayout(ZIIII)V
    .registers 8
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/4 v1, 0x0

    .line 955
    invoke-super/range {p0 .. p5}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->onLayout(ZIIII)V

    .line 957
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mInLayout:Z

    .line 958
    invoke-virtual {p0, v1, v1, p1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->layout(IZZ)V

    .line 959
    iput-boolean v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mInLayout:Z

    .line 960
    return-void
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 864
    return-void
.end method

.method protected onOverScrolled(IIZZ)V
    .registers 5
    .param p1, "scrollX"    # I
    .param p2, "scrollY"    # I
    .param p3, "clampedX"    # Z
    .param p4, "clampedY"    # Z

    .prologue
    .line 1294
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 16
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 801
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 804
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSuppressSelectionChanged:Z

    .line 806
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mIsFirstScroll:Z

    if-eqz v0, :cond_34

    .line 808
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    if-eqz v0, :cond_2b

    .line 809
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedItemPosition()I

    move-result v3

    .line 810
    .local v3, "selection":I
    if-ltz v3, :cond_2b

    .line 811
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedView()Landroid/view/View;

    move-result-object v2

    .line 812
    .local v2, "v":Landroid/view/View;
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v4

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;->onScrollStarted(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V

    .line 816
    .end local v2    # "v":Landroid/view/View;
    .end local v3    # "selection":I
    :cond_2b
    const/4 v0, 0x0

    cmpl-float v0, p3, v0

    if-lez v0, :cond_82

    .line 817
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mTouchSlop:I

    int-to-float v0, v0

    sub-float/2addr p3, v0

    .line 823
    :cond_34
    :goto_34
    float-to-int v7, p3

    .line 824
    .local v7, "delta":I
    invoke-virtual {p0, v7}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getOverScrollDelta(I)I

    move-result v6

    .line 825
    .local v6, "clampedDelta":I
    invoke-virtual {p0, v6}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->trackMotionScroll(I)V

    .line 827
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v0, :cond_7d

    .line 829
    if-eq v7, v6, :cond_6a

    .line 830
    if-lez v7, :cond_87

    const/4 v9, 0x1

    .line 833
    .local v9, "toLeft":Z
    :goto_45
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 834
    .local v10, "view":Landroid/view/View;
    if-eqz v10, :cond_89

    .line 835
    invoke-virtual {v10}, Landroid/view/View;->getWidth()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    int-to-float v8, v0

    .line 840
    .local v8, "maxWidth":F
    :goto_53
    if-nez v9, :cond_91

    .line 841
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    neg-int v1, v7

    int-to-float v1, v1

    div-float/2addr v1, v8

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    .line 842
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v0

    if-nez v0, :cond_6a

    .line 843
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    .line 854
    .end local v8    # "maxWidth":F
    .end local v9    # "toLeft":Z
    .end local v10    # "view":Landroid/view/View;
    :cond_6a
    :goto_6a
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_7a

    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v0

    if-nez v0, :cond_7d

    .line 855
    :cond_7a
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->postInvalidate()V

    .line 859
    :cond_7d
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mIsFirstScroll:Z

    .line 860
    const/4 v0, 0x1

    return v0

    .line 819
    .end local v6    # "clampedDelta":I
    .end local v7    # "delta":I
    :cond_82
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mTouchSlop:I

    int-to-float v0, v0

    add-float/2addr p3, v0

    goto :goto_34

    .line 830
    .restart local v6    # "clampedDelta":I
    .restart local v7    # "delta":I
    :cond_87
    const/4 v9, 0x0

    goto :goto_45

    .line 837
    .restart local v9    # "toLeft":Z
    .restart local v10    # "view":Landroid/view/View;
    :cond_89
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v8, v0

    .restart local v8    # "maxWidth":F
    goto :goto_53

    .line 846
    :cond_91
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    int-to-float v1, v7

    div-float/2addr v1, v8

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    .line 848
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v0

    if-nez v0, :cond_6a

    .line 849
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    goto :goto_6a
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .registers 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 778
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 782
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    if-ltz v0, :cond_37

    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemCount:I

    if-ge v0, v1, :cond_37

    .line 784
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->scrollToChild(I)Z

    move-result v0

    if-nez v0, :cond_37

    .line 786
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mShouldCallbackOnUnselectedItemClick:Z

    if-nez v0, :cond_1f

    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    if-ne v0, v1, :cond_35

    .line 787
    :cond_1f
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int/2addr v0, v1

    .line 788
    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAdapter:Landroid/widget/Adapter;

    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    .line 790
    invoke-interface {v2, v3}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v2

    .line 787
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->performItemClick(Landroid/view/View;IJ)Z

    .line 792
    :cond_35
    const/4 v0, 0x1

    .line 795
    :goto_36
    return v0

    :cond_37
    const/4 v0, 0x0

    goto :goto_36
.end method

.method protected onSizeChanged(IIII)V
    .registers 6
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 1273
    invoke-super {p0, p1, p2, p3, p4}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->onSizeChanged(IIII)V

    .line 1274
    div-int/lit8 v0, p1, 0x2

    iput v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mCenter:I

    .line 1276
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 1259
    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v2, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 1261
    .local v1, "retValue":Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 1262
    .local v0, "action":I
    const/4 v2, 0x1

    if-ne v0, v2, :cond_11

    .line 1263
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->onUp()V

    .line 1268
    :cond_10
    :goto_10
    return v1

    .line 1264
    :cond_11
    const/4 v2, 0x3

    if-ne v0, v2, :cond_10

    .line 1265
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->onCancel()V

    goto :goto_10
.end method

.method onUp()V
    .registers 2

    .prologue
    .line 1037
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->isDown:Z

    .line 1038
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 1039
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->scrollIntoSlots()V

    .line 1046
    :cond_e
    :goto_e
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v0, :cond_1c

    .line 1047
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    .line 1048
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    .line 1050
    :cond_1c
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->dispatchUnpress()V

    .line 1051
    return-void

    .line 1041
    :cond_20
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->isOverScrolled()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1042
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->scrollIntoSlots()V

    goto :goto_e
.end method

.method scrollCompleted()V
    .registers 3

    .prologue
    .line 1312
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    if-eqz v0, :cond_1d

    .line 1313
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mInLayout:Z

    if-nez v0, :cond_c

    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mBlockLayoutRequests:Z

    if-eqz v0, :cond_1e

    .line 1318
    :cond_c
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScrollCompletedNotifier:Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;

    if-nez v0, :cond_18

    .line 1319
    new-instance v0, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;-><init>(Lcom/adobe/android/ui/widget/AdobeGalleryView;Lcom/adobe/android/ui/widget/AdobeGalleryView$1;)V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScrollCompletedNotifier:Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;

    .line 1321
    :cond_18
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScrollCompletedNotifier:Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->post(Ljava/lang/Runnable;)Z

    .line 1326
    :cond_1d
    :goto_1d
    return-void

    .line 1323
    :cond_1e
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->fireOnScrollCompleted()V

    goto :goto_1d
.end method

.method public scrollIntoSlots()V
    .registers 8

    .prologue
    .line 275
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v4

    if-nez v4, :cond_7

    .line 298
    :cond_6
    :goto_6
    return-void

    .line 279
    :cond_7
    iget-boolean v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoScrollToCenter:Z

    if-eqz v4, :cond_2e

    .line 281
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int/2addr v4, v5

    invoke-virtual {p0, v4}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 282
    .local v3, "view":Landroid/view/View;
    if-eqz v3, :cond_6

    .line 286
    invoke-static {v3}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfView(Landroid/view/View;)I

    move-result v1

    .line 287
    .local v1, "selectedCenter":I
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getCenterOfGallery()I

    move-result v2

    .line 288
    .local v2, "targetCenter":I
    sub-int v0, v2, v1

    .line 290
    .local v0, "scrollAmount":I
    if-eqz v0, :cond_2a

    .line 291
    iget-object v4, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    const/4 v5, 0x0

    neg-int v6, v0

    invoke-virtual {v4, v5, v6}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->startUsingDistance(II)V

    goto :goto_6

    .line 293
    :cond_2a
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->onFinishedMovement()V

    goto :goto_6

    .line 296
    .end local v0    # "scrollAmount":I
    .end local v1    # "selectedCenter":I
    .end local v2    # "targetCenter":I
    .end local v3    # "view":Landroid/view/View;
    :cond_2e
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->onFinishedMovement()V

    goto :goto_6
.end method

.method selectionChanged(II)V
    .registers 7
    .param p1, "oldIndex"    # I
    .param p2, "newIndex"    # I

    .prologue
    .line 969
    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoSelectChild:Z

    if-eqz v2, :cond_24

    if-eq p1, p2, :cond_24

    .line 970
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int v2, p1, v2

    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 971
    .local v1, "oldSelectedChild":Landroid/view/View;
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    sub-int v2, p2, v2

    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 973
    .local v0, "newSelectedChild":Landroid/view/View;
    if-eqz v0, :cond_1c

    .line 974
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 977
    :cond_1c
    if-eqz v1, :cond_24

    if-eq v1, v0, :cond_24

    .line 978
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setSelected(Z)V

    .line 982
    .end local v0    # "newSelectedChild":Landroid/view/View;
    .end local v1    # "oldSelectedChild":Landroid/view/View;
    :cond_24
    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSuppressSelectionChanged:Z

    if-nez v2, :cond_49

    .line 984
    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    if-eqz v2, :cond_34

    .line 985
    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mInLayout:Z

    if-nez v2, :cond_34

    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mBlockLayoutRequests:Z

    if-eqz v2, :cond_53

    .line 993
    :cond_34
    :goto_34
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_49

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->isShown()Z

    move-result v2

    if-eqz v2, :cond_49

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->isInTouchMode()Z

    move-result v2

    if-nez v2, :cond_49

    .line 994
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->sendAccessibilityEvent(I)V

    .line 998
    :cond_49
    if-eq p1, p2, :cond_52

    iget-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mInLayout:Z

    if-nez v2, :cond_52

    .line 1000
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->fireVibration()V

    .line 1002
    :cond_52
    return-void

    .line 988
    :cond_53
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->fireOnSelected()V

    goto :goto_34
.end method

.method public setAnimationDuration(I)V
    .registers 2
    .param p1, "animationDurationMillis"    # I

    .prologue
    .line 172
    iput p1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAnimationDuration:I

    .line 173
    return-void
.end method

.method public setAutoScrollToCenter(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 142
    iput-boolean p1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoScrollToCenter:Z

    .line 143
    return-void
.end method

.method public setAutoSelectChild(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 114
    iput-boolean p1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mAutoSelectChild:Z

    .line 115
    return-void
.end method

.method public setCallbackDuringFling(Z)V
    .registers 2
    .param p1, "shouldCallback"    # Z

    .prologue
    .line 155
    iput-boolean p1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mShouldCallbackDuringFling:Z

    .line 156
    return-void
.end method

.method public setCallbackOnUnselectedItemClick(Z)V
    .registers 2
    .param p1, "shouldCallback"    # Z

    .prologue
    .line 168
    iput-boolean p1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mShouldCallbackOnUnselectedItemClick:Z

    .line 169
    return-void
.end method

.method public setGravity(I)V
    .registers 3
    .param p1, "gravity"    # I

    .prologue
    .line 1165
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mGravity:I

    if-eq v0, p1, :cond_9

    .line 1166
    iput p1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mGravity:I

    .line 1167
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->requestLayout()V

    .line 1169
    :cond_9
    return-void
.end method

.method public setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V
    .registers 2
    .param p1, "value"    # Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mItemsScrollListener:Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;

    .line 134
    return-void
.end method

.method public setOverScrollMode(I)V
    .registers 4
    .param p1, "overScrollMode"    # I

    .prologue
    const/4 v1, 0x0

    .line 1298
    invoke-super {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setOverScrollMode(I)V

    .line 1300
    const/4 v0, 0x2

    if-eq p1, v0, :cond_22

    .line 1301
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    if-nez v0, :cond_21

    .line 1302
    new-instance v0, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 1303
    new-instance v0, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 1309
    :cond_21
    :goto_21
    return-void

    .line 1306
    :cond_22
    iput-object v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 1307
    iput-object v1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    goto :goto_21
.end method

.method setSelectedPositionInt(IZ)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "animate"    # Z

    .prologue
    .line 1150
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mSelectedPosition:I

    iput v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mOldSelectedPosition:I

    .line 1151
    invoke-super {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setSelectedPositionInt(I)V

    .line 1152
    return-void
.end method

.method public setVibrationEnabled(Z)V
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 124
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mVibratorHelper:Lcom/adobe/android/ui/widget/VibrationHelper;

    invoke-virtual {v0, p1}, Lcom/adobe/android/ui/widget/VibrationHelper;->setEnabled(Z)V

    .line 125
    return-void
.end method

.method public trackMotionScroll(I)V
    .registers 9
    .param p1, "delta"    # I

    .prologue
    const/4 v4, 0x0

    .line 302
    if-nez p1, :cond_4

    .line 363
    :cond_3
    :goto_3
    return-void

    .line 306
    :cond_4
    iget-object v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    invoke-virtual {v5}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->getLastFlingX()I

    move-result v5

    sub-int v0, v5, p1

    .line 309
    .local v0, "deltaX":I
    if-lez p1, :cond_5e

    .line 310
    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    iput v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    .line 317
    :goto_12
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v5

    if-eqz v5, :cond_3

    .line 321
    if-gez v0, :cond_6a

    const/4 v3, 0x1

    .line 323
    .local v3, "toLeft":Z
    :goto_1b
    move v1, v0

    .line 325
    .local v1, "limitedDeltaX":I
    iget-object v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    invoke-virtual {v5}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->isFinished()Z

    move-result v5

    if-nez v5, :cond_3d

    .line 326
    invoke-virtual {p0, v3, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getLimitedMotionScrollAmount(ZI)I

    move-result v2

    .line 327
    .local v2, "realDeltaX":I
    if-eq v2, v0, :cond_3d

    .line 328
    if-nez v3, :cond_6c

    .line 329
    iget-object v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v5, :cond_3c

    .line 330
    iget-object v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowLeft:Landroid/support/v4/widget/EdgeEffectCompat;

    iget-object v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    invoke-virtual {v6}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->getCurrVelocity()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Landroid/support/v4/widget/EdgeEffectCompat;->onAbsorb(I)Z

    .line 337
    :cond_3c
    :goto_3c
    move v1, v2

    .line 341
    .end local v2    # "realDeltaX":I
    :cond_3d
    if-eq v1, v0, :cond_49

    .line 342
    iget-object v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    invoke-virtual {v5, v4}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->endFling(Z)V

    .line 343
    if-nez v1, :cond_49

    .line 344
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->onFinishedMovement()V

    .line 348
    :cond_49
    invoke-direct {p0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->offsetChildrenLeftAndRight(I)V

    .line 349
    invoke-direct {p0, v3}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->detachOffScreenChildren(Z)V

    .line 351
    if-eqz v3, :cond_7d

    .line 353
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->fillToGalleryRight()V

    .line 359
    :goto_54
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setSelectionToCenterChild()V

    .line 360
    invoke-virtual {p0, v4, v4, v4, v4}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->onScrollChanged(IIII)V

    .line 362
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->invalidate()V

    goto :goto_3

    .line 313
    .end local v1    # "limitedDeltaX":I
    .end local v3    # "toLeft":Z
    :cond_5e
    iget v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getChildCount()I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDownTouchPosition:I

    goto :goto_12

    :cond_6a
    move v3, v4

    .line 321
    goto :goto_1b

    .line 333
    .restart local v1    # "limitedDeltaX":I
    .restart local v2    # "realDeltaX":I
    .restart local v3    # "toLeft":Z
    :cond_6c
    iget-object v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v5, :cond_3c

    .line 334
    iget-object v5, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mEdgeGlowRight:Landroid/support/v4/widget/EdgeEffectCompat;

    iget-object v6, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mScroller:Lcom/adobe/android/ui/widget/ScrollerRunnable;

    invoke-virtual {v6}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->getCurrVelocity()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Landroid/support/v4/widget/EdgeEffectCompat;->onAbsorb(I)Z

    goto :goto_3c

    .line 356
    .end local v2    # "realDeltaX":I
    :cond_7d
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->fillToGalleryLeft()V

    goto :goto_54
.end method
