.class public abstract Lcom/adobe/android/ui/widget/AdobeAbsSpinner;
.super Lcom/adobe/android/ui/widget/AdobeAdapterView;
.source "AdobeAbsSpinner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/android/ui/widget/AdobeAdapterView",
        "<",
        "Landroid/widget/Adapter;",
        ">;"
    }
.end annotation


# instance fields
.field mAdapter:Landroid/widget/Adapter;

.field mBlockLayoutRequests:Z

.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field mDefaultPosition:I

.field mHeightMeasureSpec:I

.field mPaddingBottom:I

.field mPaddingLeft:I

.field mPaddingRight:I

.field mPaddingTop:I

.field protected final mRecycleBin:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Queue",
            "<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field mSelectionBottomPadding:I

.field mSelectionLeftPadding:I

.field mSelectionRightPadding:I

.field mSelectionTopPadding:I

.field final mSpinnerPadding:Landroid/graphics/Rect;

.field private mTouchFrame:Landroid/graphics/Rect;

.field mWidthMeasureSpec:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, 0x0

    .line 58
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/android/ui/widget/AdobeAdapterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    .line 37
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionLeftPadding:I

    .line 38
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionTopPadding:I

    .line 39
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionRightPadding:I

    .line 40
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionBottomPadding:I

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mRecycleBin:Ljava/util/List;

    .line 60
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->initAbsSpinner()V

    .line 61
    return-void
.end method

.method private emptyRecycler()V
    .registers 2

    .prologue
    .line 174
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->emptySubRecycler()V

    .line 175
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mRecycleBin:Ljava/util/List;

    if-eqz v0, :cond_c

    .line 176
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mRecycleBin:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 178
    :cond_c
    return-void
.end method

.method private initAbsSpinner()V
    .registers 2

    .prologue
    .line 64
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setFocusable(Z)V

    .line 65
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setWillNotDraw(Z)V

    .line 66
    return-void
.end method


# virtual methods
.method protected emptySubRecycler()V
    .registers 3

    .prologue
    .line 196
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mRecycleBin:Ljava/util/List;

    if-eqz v1, :cond_1b

    .line 197
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mRecycleBin:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1b

    .line 198
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mRecycleBin:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->clear()V

    .line 197
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 201
    .end local v0    # "i":I
    :cond_1b
    return-void
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    .prologue
    .line 363
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public getAdapter()Landroid/widget/Adapter;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    return-object v0
.end method

.method getChildHeight(Landroid/view/View;)I
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 367
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    return v0
.end method

.method getChildWidth(Landroid/view/View;)I
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 371
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    return v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 205
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mItemCount:I

    return v0
.end method

.method public getSelectedView()Landroid/view/View;
    .registers 3

    .prologue
    .line 219
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mItemCount:I

    if-lez v0, :cond_12

    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectedPosition:I

    if-ltz v0, :cond_12

    .line 220
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectedPosition:I

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mFirstPosition:I

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 222
    :goto_11
    return-object v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method abstract layout(IZZ)V
.end method

.method protected onMeasure(II)V
    .registers 15
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 294
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v7

    .line 298
    .local v7, "widthMode":I
    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingLeft:I

    iget v11, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionLeftPadding:I

    if-le v9, v11, :cond_e9

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingLeft:I

    :goto_e
    iput v9, v10, Landroid/graphics/Rect;->left:I

    .line 299
    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingTop:I

    iget v11, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionTopPadding:I

    if-le v9, v11, :cond_ed

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingTop:I

    :goto_1a
    iput v9, v10, Landroid/graphics/Rect;->top:I

    .line 300
    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingRight:I

    iget v11, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionRightPadding:I

    if-le v9, v11, :cond_f1

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingRight:I

    :goto_26
    iput v9, v10, Landroid/graphics/Rect;->right:I

    .line 301
    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingBottom:I

    iget v11, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionBottomPadding:I

    if-le v9, v11, :cond_f5

    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingBottom:I

    :goto_32
    iput v9, v10, Landroid/graphics/Rect;->bottom:I

    .line 303
    iget-boolean v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mDataChanged:Z

    if-eqz v9, :cond_3b

    .line 304
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->handleDataChanged()V

    .line 307
    :cond_3b
    const/4 v2, 0x0

    .line 308
    .local v2, "preferredHeight":I
    const/4 v3, 0x0

    .line 309
    .local v3, "preferredWidth":I
    const/4 v1, 0x1

    .line 311
    .local v1, "needsMeasuring":Z
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getSelectedItemPosition()I

    move-result v4

    .line 312
    .local v4, "selectedPosition":I
    if-ltz v4, :cond_b1

    iget-object v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    if-eqz v9, :cond_b1

    iget-object v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    invoke-interface {v9}, Landroid/widget/Adapter;->getCount()I

    move-result v9

    if-ge v4, v9, :cond_b1

    .line 315
    iget-object v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    invoke-interface {v9, v4}, Landroid/widget/Adapter;->getItemViewType(I)I

    move-result v6

    .line 316
    .local v6, "viewType":I
    iget-object v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mRecycleBin:Ljava/util/List;

    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Queue;

    invoke-interface {v9}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 317
    .local v5, "view":Landroid/view/View;
    if-nez v5, :cond_6d

    .line 319
    iget-object v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    const/4 v10, 0x0

    invoke-interface {v9, v4, v10, p0}, Landroid/widget/Adapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 322
    :cond_6d
    if-eqz v5, :cond_7a

    .line 324
    iget-object v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mRecycleBin:Ljava/util/List;

    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Queue;

    invoke-interface {v9, v5}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 327
    :cond_7a
    if-eqz v5, :cond_b1

    .line 328
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    if-nez v9, :cond_8f

    .line 329
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mBlockLayoutRequests:Z

    .line 330
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 331
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mBlockLayoutRequests:Z

    .line 333
    :cond_8f
    invoke-virtual {p0, v5, p1, p2}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->measureChild(Landroid/view/View;II)V

    .line 335
    invoke-virtual {p0, v5}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getChildHeight(Landroid/view/View;)I

    move-result v9

    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->top:I

    add-int/2addr v9, v10

    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    add-int v2, v9, v10

    .line 336
    invoke-virtual {p0, v5}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getChildWidth(Landroid/view/View;)I

    move-result v9

    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->left:I

    add-int/2addr v9, v10

    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->right:I

    add-int v3, v9, v10

    .line 338
    const/4 v1, 0x0

    .line 342
    .end local v5    # "view":Landroid/view/View;
    .end local v6    # "viewType":I
    :cond_b1
    if-eqz v1, :cond_c9

    .line 344
    iget-object v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    add-int v2, v9, v10

    .line 345
    if-nez v7, :cond_c9

    .line 346
    iget-object v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->left:I

    iget-object v10, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->right:I

    add-int v3, v9, v10

    .line 350
    :cond_c9
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getSuggestedMinimumHeight()I

    move-result v9

    invoke-static {v2, v9}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 351
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getSuggestedMinimumWidth()I

    move-result v9

    invoke-static {v3, v9}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 353
    invoke-static {v2, p2}, Landroid/view/View;->resolveSize(II)I

    move-result v0

    .line 354
    .local v0, "heightSize":I
    invoke-static {v3, p1}, Landroid/view/View;->resolveSize(II)I

    move-result v8

    .line 356
    .local v8, "widthSize":I
    invoke-virtual {p0, v8, v0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setMeasuredDimension(II)V

    .line 357
    iput p2, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mHeightMeasureSpec:I

    .line 358
    iput p1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mWidthMeasureSpec:I

    .line 359
    return-void

    .line 298
    .end local v0    # "heightSize":I
    .end local v1    # "needsMeasuring":Z
    .end local v2    # "preferredHeight":I
    .end local v3    # "preferredWidth":I
    .end local v4    # "selectedPosition":I
    .end local v8    # "widthSize":I
    :cond_e9
    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionLeftPadding:I

    goto/16 :goto_e

    .line 299
    :cond_ed
    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionTopPadding:I

    goto/16 :goto_1a

    .line 300
    :cond_f1
    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionRightPadding:I

    goto/16 :goto_26

    .line 301
    :cond_f5
    iget v9, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectionBottomPadding:I

    goto/16 :goto_32
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 9
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    const/4 v6, 0x1

    .line 261
    move-object v0, p1

    check-cast v0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;

    .line 263
    .local v0, "ss":Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;
    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 265
    iget-wide v2, v0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;->selectedId:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-ltz v1, :cond_25

    .line 266
    iput-boolean v6, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mDataChanged:Z

    .line 267
    iput-boolean v6, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mNeedSync:Z

    .line 268
    iget-wide v2, v0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;->selectedId:J

    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSyncRowId:J

    .line 269
    iget v1, v0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;->position:I

    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSyncPosition:I

    .line 270
    const/4 v1, 0x0

    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSyncMode:I

    .line 271
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->requestLayout()V

    .line 273
    :cond_25
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 7

    .prologue
    .line 248
    invoke-super {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 249
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;

    invoke-direct {v0, v1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 250
    .local v0, "ss":Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getSelectedItemId()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;->selectedId:J

    .line 251
    iget-wide v2, v0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;->selectedId:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_1e

    .line 252
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getSelectedItemPosition()I

    move-result v2

    iput v2, v0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;->position:I

    .line 256
    :goto_1d
    return-object v0

    .line 254
    :cond_1e
    const/4 v2, -0x1

    iput v2, v0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner$SavedState;->position:I

    goto :goto_1d
.end method

.method public pointToPosition(II)I
    .registers 8
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 227
    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mTouchFrame:Landroid/graphics/Rect;

    .line 228
    .local v2, "frame":Landroid/graphics/Rect;
    if-nez v2, :cond_d

    .line 229
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mTouchFrame:Landroid/graphics/Rect;

    .line 230
    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mTouchFrame:Landroid/graphics/Rect;

    .line 233
    :cond_d
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getChildCount()I

    move-result v1

    .line 234
    .local v1, "count":I
    add-int/lit8 v3, v1, -0x1

    .local v3, "i":I
    :goto_13
    if-ltz v3, :cond_2f

    .line 235
    invoke-virtual {p0, v3}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 236
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_2c

    .line 237
    invoke-virtual {v0, v2}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 238
    invoke-virtual {v2, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 239
    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mFirstPosition:I

    add-int/2addr v4, v3

    .line 243
    .end local v0    # "child":Landroid/view/View;
    :goto_2b
    return v4

    .line 234
    .restart local v0    # "child":Landroid/view/View;
    :cond_2c
    add-int/lit8 v3, v3, -0x1

    goto :goto_13

    .line 243
    .end local v0    # "child":Landroid/view/View;
    :cond_2f
    const/4 v4, -0x1

    goto :goto_2b
.end method

.method recycleAllViews()V
    .registers 8

    .prologue
    .line 80
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getChildCount()I

    move-result v0

    .line 81
    .local v0, "childCount":I
    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mFirstPosition:I

    .line 84
    .local v3, "position":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_23

    .line 85
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 86
    .local v4, "v":Landroid/view/View;
    add-int v2, v3, v1

    .line 87
    .local v2, "index":I
    iget-object v6, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    invoke-interface {v6, v2}, Landroid/widget/Adapter;->getItemViewType(I)I

    move-result v5

    .line 88
    .local v5, "viewType":I
    iget-object v6, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mRecycleBin:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Queue;

    invoke-interface {v6, v4}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 84
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 97
    .end local v2    # "index":I
    .end local v4    # "v":Landroid/view/View;
    .end local v5    # "viewType":I
    :cond_23
    return-void
.end method

.method public requestLayout()V
    .registers 2

    .prologue
    .line 286
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mBlockLayoutRequests:Z

    if-nez v0, :cond_7

    .line 287
    invoke-super {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->requestLayout()V

    .line 289
    :cond_7
    return-void
.end method

.method resetList()V
    .registers 4

    .prologue
    const/4 v0, 0x0

    const/4 v2, -0x1

    .line 181
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mDataChanged:Z

    .line 182
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mNeedSync:Z

    .line 184
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->removeAllViewsInLayout()V

    .line 185
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->emptyRecycler()V

    .line 187
    iput v2, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mOldSelectedPosition:I

    .line 188
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mOldSelectedRowId:J

    .line 190
    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setSelectedPositionInt(I)V

    .line 191
    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setNextSelectedPositionInt(I)V

    .line 192
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->invalidate()V

    .line 193
    return-void
.end method

.method public setAdapter(Landroid/widget/Adapter;)V
    .registers 8
    .param p1, "adapter"    # Landroid/widget/Adapter;

    .prologue
    const/4 v1, -0x1

    .line 124
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    if-eqz v3, :cond_12

    .line 125
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    iget-object v4, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {v3, v4}, Landroid/widget/Adapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 126
    invoke-direct {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->emptyRecycler()V

    .line 127
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->resetList()V

    .line 130
    :cond_12
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    .line 132
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mOldSelectedPosition:I

    .line 133
    const-wide/high16 v4, -0x8000000000000000L

    iput-wide v4, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mOldSelectedRowId:J

    .line 135
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    if-eqz v3, :cond_74

    .line 136
    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mItemCount:I

    iput v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mOldItemCount:I

    .line 137
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    invoke-interface {v3}, Landroid/widget/Adapter;->getCount()I

    move-result v3

    iput v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mItemCount:I

    .line 138
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->checkFocus()V

    .line 140
    new-instance v3, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;

    invoke-direct {v3, p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;-><init>(Lcom/adobe/android/ui/widget/AdobeAdapterView;)V

    iput-object v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mDataSetObserver:Landroid/database/DataSetObserver;

    .line 141
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    iget-object v4, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {v3, v4}, Landroid/widget/Adapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 144
    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mDefaultPosition:I

    if-ltz v3, :cond_5d

    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mDefaultPosition:I

    iget v4, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mItemCount:I

    if-ge v3, v4, :cond_5d

    .line 145
    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mDefaultPosition:I

    .line 150
    .local v1, "position":I
    :goto_47
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mAdapter:Landroid/widget/Adapter;

    invoke-interface {v3}, Landroid/widget/Adapter;->getViewTypeCount()I

    move-result v2

    .line 151
    .local v2, "total":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4e
    if-ge v0, v2, :cond_63

    .line 152
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mRecycleBin:Ljava/util/List;

    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    add-int/lit8 v0, v0, 0x1

    goto :goto_4e

    .line 147
    .end local v0    # "i":I
    .end local v1    # "position":I
    .end local v2    # "total":I
    :cond_5d
    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mItemCount:I

    if-lez v3, :cond_62

    const/4 v1, 0x0

    .restart local v1    # "position":I
    :cond_62
    goto :goto_47

    .line 155
    .restart local v0    # "i":I
    .restart local v2    # "total":I
    :cond_63
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setSelectedPositionInt(I)V

    .line 156
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setNextSelectedPositionInt(I)V

    .line 158
    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mItemCount:I

    if-nez v3, :cond_70

    .line 160
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->checkSelectionChanged()V

    .line 170
    .end local v0    # "i":I
    .end local v1    # "position":I
    .end local v2    # "total":I
    :cond_70
    :goto_70
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->requestLayout()V

    .line 171
    return-void

    .line 164
    :cond_74
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->checkFocus()V

    .line 165
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->resetList()V

    .line 167
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->checkSelectionChanged()V

    goto :goto_70
.end method

.method public setDefaultPosition(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 75
    iput p1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mDefaultPosition:I

    .line 76
    return-void
.end method

.method public setPadding(IIII)V
    .registers 5
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 277
    invoke-super {p0, p1, p2, p3, p4}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->setPadding(IIII)V

    .line 278
    iput p1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingLeft:I

    .line 279
    iput p4, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingBottom:I

    .line 280
    iput p2, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingTop:I

    .line 281
    iput p3, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mPaddingRight:I

    .line 282
    return-void
.end method

.method public setSelection(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 210
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mItemCount:I

    if-lez v0, :cond_13

    if-ltz p1, :cond_13

    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mItemCount:I

    if-ge p1, v0, :cond_13

    .line 211
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setNextSelectedPositionInt(I)V

    .line 212
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->requestLayout()V

    .line 213
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->postInvalidate()V

    .line 215
    :cond_13
    return-void
.end method

.method public setSelection(IZZ)V
    .registers 7
    .param p1, "position"    # I
    .param p2, "animate"    # Z
    .param p3, "changed"    # Z

    .prologue
    .line 101
    if-eqz p2, :cond_16

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mFirstPosition:I

    if-gt v1, p1, :cond_16

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->getChildCount()I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    if-gt p1, v1, :cond_16

    const/4 v0, 0x1

    .line 102
    .local v0, "shouldAnimate":Z
    :goto_12
    invoke-virtual {p0, p1, v0, p3}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setSelectionInt(IZZ)V

    .line 103
    return-void

    .line 101
    .end local v0    # "shouldAnimate":Z
    :cond_16
    const/4 v0, 0x0

    goto :goto_12
.end method

.method setSelectionInt(IZZ)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "animate"    # Z
    .param p3, "changed"    # Z

    .prologue
    .line 106
    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mOldSelectedPosition:I

    if-eq p1, v1, :cond_14

    .line 107
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mBlockLayoutRequests:Z

    .line 108
    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mSelectedPosition:I

    sub-int v0, p1, v1

    .line 109
    .local v0, "delta":I
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->setNextSelectedPositionInt(I)V

    .line 110
    invoke-virtual {p0, v0, p2, p3}, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->layout(IZZ)V

    .line 111
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/adobe/android/ui/widget/AdobeAbsSpinner;->mBlockLayoutRequests:Z

    .line 113
    .end local v0    # "delta":I
    :cond_14
    return-void
.end method
