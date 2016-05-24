.class public abstract Lcom/adobe/android/ui/widget/AdobeAdapterView;
.super Landroid/view/ViewGroup;
.source "AdobeAdapterView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;,
        Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;,
        Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterContextMenuInfo;,
        Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;,
        Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemLongClickListener;,
        Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroid/widget/Adapter;",
        ">",
        "Landroid/view/ViewGroup;"
    }
.end annotation


# instance fields
.field mBlockLayoutRequests:Z

.field mDataChanged:Z

.field private mDesiredFocusableInTouchModeState:Z

.field private mDesiredFocusableState:Z

.field private mEmptyView:Landroid/view/View;

.field mFirstPosition:I

.field mInLayout:Z

.field mItemCount:I

.field private mLayoutHeight:I

.field mNeedSync:Z

.field mNextSelectedPosition:I

.field mNextSelectedRowId:J

.field mOldItemCount:I

.field mOldSelectedPosition:I

.field mOldSelectedRowId:J

.field mOnItemClickListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;

.field mOnItemLongClickListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemLongClickListener;

.field mOnItemSelectedListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;

.field mSelectedPosition:I

.field mSelectedRowId:J

.field private mSelectionNotifier:Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<TT;>.com/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;"
        }
    .end annotation
.end field

.field mSpecificTop:I

.field mSyncHeight:J

.field mSyncMode:I

.field mSyncPosition:I

.field mSyncRowId:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const/4 v1, -0x1

    const-wide/high16 v2, -0x8000000000000000L

    const/4 v0, 0x0

    .line 66
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 34
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedPosition:I

    .line 35
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    .line 36
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedPosition:I

    .line 38
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncRowId:J

    .line 39
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedRowId:J

    .line 40
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedRowId:J

    .line 41
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedRowId:J

    .line 45
    iput v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mFirstPosition:I

    .line 49
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNeedSync:Z

    .line 51
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mInLayout:Z

    .line 58
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mBlockLayoutRequests:Z

    .line 67
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const/4 v1, -0x1

    const-wide/high16 v2, -0x8000000000000000L

    const/4 v0, 0x0

    .line 70
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedPosition:I

    .line 35
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    .line 36
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedPosition:I

    .line 38
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncRowId:J

    .line 39
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedRowId:J

    .line 40
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedRowId:J

    .line 41
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedRowId:J

    .line 45
    iput v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mFirstPosition:I

    .line 49
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNeedSync:Z

    .line 51
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mInLayout:Z

    .line 58
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mBlockLayoutRequests:Z

    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const/4 v1, -0x1

    const-wide/high16 v2, -0x8000000000000000L

    const/4 v0, 0x0

    .line 74
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedPosition:I

    .line 35
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    .line 36
    iput v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedPosition:I

    .line 38
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncRowId:J

    .line 39
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedRowId:J

    .line 40
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedRowId:J

    .line 41
    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedRowId:J

    .line 45
    iput v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mFirstPosition:I

    .line 49
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNeedSync:Z

    .line 51
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mInLayout:Z

    .line 58
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mBlockLayoutRequests:Z

    .line 75
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/os/Parcelable;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/android/ui/widget/AdobeAdapterView;
    .param p1, "x1"    # Landroid/os/Parcelable;

    .prologue
    .line 30
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/android/ui/widget/AdobeAdapterView;)Landroid/os/Parcelable;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/android/ui/widget/AdobeAdapterView;

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    return-object v0
.end method

.method private updateEmptyStatus(Z)V
    .registers 8
    .param p1, "empty"    # Z
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongCall"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 182
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->isInFilterMode()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 183
    const/4 p1, 0x0

    .line 186
    :cond_a
    if-eqz p1, :cond_35

    .line 187
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_31

    .line 188
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mEmptyView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 189
    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->setVisibility(I)V

    .line 199
    :goto_18
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mDataChanged:Z

    if-eqz v0, :cond_30

    .line 200
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getTop()I

    move-result v3

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getRight()I

    move-result v4

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getBottom()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->onLayout(ZIIII)V

    .line 208
    :cond_30
    :goto_30
    return-void

    .line 193
    :cond_31
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->setVisibility(I)V

    goto :goto_18

    .line 203
    :cond_35
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_3e

    .line 204
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mEmptyView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 206
    :cond_3e
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->setVisibility(I)V

    goto :goto_30
.end method


# virtual methods
.method public addView(Landroid/view/View;)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 289
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "addView(View) is not supported in AviaryAdapterView"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addView(Landroid/view/View;I)V
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I

    .prologue
    .line 294
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "addView(View, int) is not supported in AviaryAdapterView"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 304
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "addView(View, int, LayoutParams) is not supported in AviaryAdapterView"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 299
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "addView(View, LayoutParams) is not supported in AviaryAdapterView"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected canAnimate()Z
    .registers 2

    .prologue
    .line 335
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    invoke-super {p0}, Landroid/view/ViewGroup;->canAnimate()Z

    move-result v0

    if-eqz v0, :cond_c

    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mItemCount:I

    if-lez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method checkFocus()V
    .registers 7

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 215
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    .line 216
    .local v0, "adapter":Landroid/widget/Adapter;, "TT;"
    if-eqz v0, :cond_e

    invoke-interface {v0}, Landroid/widget/Adapter;->getCount()I

    move-result v3

    if-nez v3, :cond_3d

    :cond_e
    move v1, v4

    .line 217
    .local v1, "empty":Z
    :goto_f
    if-eqz v1, :cond_17

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->isInFilterMode()Z

    move-result v3

    if-eqz v3, :cond_3f

    :cond_17
    move v2, v4

    .line 221
    .local v2, "focusable":Z
    :goto_18
    if-eqz v2, :cond_41

    iget-boolean v3, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mDesiredFocusableInTouchModeState:Z

    if-eqz v3, :cond_41

    move v3, v4

    :goto_1f
    invoke-super {p0, v3}, Landroid/view/ViewGroup;->setFocusableInTouchMode(Z)V

    .line 222
    if-eqz v2, :cond_43

    iget-boolean v3, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mDesiredFocusableState:Z

    if-eqz v3, :cond_43

    move v3, v4

    :goto_29
    invoke-super {p0, v3}, Landroid/view/ViewGroup;->setFocusable(Z)V

    .line 223
    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mEmptyView:Landroid/view/View;

    if-eqz v3, :cond_3c

    .line 224
    if-eqz v0, :cond_38

    invoke-interface {v0}, Landroid/widget/Adapter;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_39

    :cond_38
    move v5, v4

    :cond_39
    invoke-direct {p0, v5}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->updateEmptyStatus(Z)V

    .line 226
    :cond_3c
    return-void

    .end local v1    # "empty":Z
    .end local v2    # "focusable":Z
    :cond_3d
    move v1, v5

    .line 216
    goto :goto_f

    .restart local v1    # "empty":Z
    :cond_3f
    move v2, v5

    .line 217
    goto :goto_18

    .restart local v2    # "focusable":Z
    :cond_41
    move v3, v5

    .line 221
    goto :goto_1f

    :cond_43
    move v3, v5

    .line 222
    goto :goto_29
.end method

.method checkSelectionChanged()V
    .registers 5

    .prologue
    .line 514
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedPosition:I

    if-ne v0, v1, :cond_e

    iget-wide v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedRowId:J

    iget-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedRowId:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1d

    .line 515
    :cond_e
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedPosition:I

    iget v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    invoke-virtual {p0, v0, v1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->selectionChanged(II)V

    .line 516
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    iput v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedPosition:I

    .line 517
    iget-wide v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedRowId:J

    iput-wide v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldSelectedRowId:J

    .line 519
    :cond_1d
    return-void
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 241
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getSelectedView()Landroid/view/View;

    move-result-object v0

    .line 242
    .local v0, "selectedView":Landroid/view/View;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_14

    .line 243
    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 244
    const/4 v1, 0x1

    .line 246
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method protected dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 284
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    .local p1, "container":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->dispatchThawSelfOnly(Landroid/util/SparseArray;)V

    .line 285
    return-void
.end method

.method protected dispatchSaveInstanceState(Landroid/util/SparseArray;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 279
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    .local p1, "container":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->dispatchFreezeSelfOnly(Landroid/util/SparseArray;)V

    .line 280
    return-void
.end method

.method findSyncPosition()I
    .registers 21

    .prologue
    .line 421
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mItemCount:I

    .line 423
    .local v3, "count":I
    if-nez v3, :cond_8

    .line 424
    const/4 v13, -0x1

    .line 496
    :cond_7
    :goto_7
    return v13

    .line 427
    :cond_8
    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncRowId:J

    .line 428
    .local v10, "idToMatch":J
    move-object/from16 v0, p0

    iget v13, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncPosition:I

    .line 431
    .local v13, "seed":I
    const-wide/high16 v16, -0x8000000000000000L

    cmp-long v16, v10, v16

    if-nez v16, :cond_18

    .line 432
    const/4 v13, -0x1

    goto :goto_7

    .line 436
    :cond_18
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-static {v0, v13}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 437
    add-int/lit8 v16, v3, -0x1

    move/from16 v0, v16

    invoke-static {v0, v13}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 439
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v16

    const-wide/16 v18, 0x64

    add-long v4, v16, v18

    .line 444
    .local v4, "endTime":J
    move v6, v13

    .line 447
    .local v6, "first":I
    move v9, v13

    .line 450
    .local v9, "last":I
    const/4 v12, 0x0

    .line 460
    .local v12, "next":Z
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v2

    .line 461
    .local v2, "adapter":Landroid/widget/Adapter;, "TT;"
    if-nez v2, :cond_45

    .line 462
    const/4 v13, -0x1

    goto :goto_7

    .line 480
    .local v7, "hitFirst":Z
    .local v8, "hitLast":Z
    .local v14, "rowId":J
    :cond_3b
    if-nez v7, :cond_41

    if-eqz v12, :cond_69

    if-nez v8, :cond_69

    .line 482
    :cond_41
    add-int/lit8 v9, v9, 0x1

    .line 483
    move v13, v9

    .line 485
    const/4 v12, 0x0

    .line 465
    .end local v7    # "hitFirst":Z
    .end local v8    # "hitLast":Z
    .end local v14    # "rowId":J
    :cond_45
    :goto_45
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v16

    cmp-long v16, v16, v4

    if-gtz v16, :cond_63

    .line 466
    invoke-interface {v2, v13}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v14

    .line 467
    .restart local v14    # "rowId":J
    cmp-long v16, v14, v10

    if-eqz v16, :cond_7

    .line 472
    add-int/lit8 v16, v3, -0x1

    move/from16 v0, v16

    if-ne v9, v0, :cond_65

    const/4 v8, 0x1

    .line 473
    .restart local v8    # "hitLast":Z
    :goto_5c
    if-nez v6, :cond_67

    const/4 v7, 0x1

    .line 475
    .restart local v7    # "hitFirst":Z
    :goto_5f
    if-eqz v8, :cond_3b

    if-eqz v7, :cond_3b

    .line 496
    .end local v7    # "hitFirst":Z
    .end local v8    # "hitLast":Z
    .end local v14    # "rowId":J
    :cond_63
    const/4 v13, -0x1

    goto :goto_7

    .line 472
    .restart local v14    # "rowId":J
    :cond_65
    const/4 v8, 0x0

    goto :goto_5c

    .line 473
    .restart local v8    # "hitLast":Z
    :cond_67
    const/4 v7, 0x0

    goto :goto_5f

    .line 486
    .restart local v7    # "hitFirst":Z
    :cond_69
    if-nez v8, :cond_6f

    if-nez v12, :cond_45

    if-nez v7, :cond_45

    .line 488
    :cond_6f
    add-int/lit8 v6, v6, -0x1

    .line 489
    move v13, v6

    .line 491
    const/4 v12, 0x1

    goto :goto_45
.end method

.method protected fireOnSelected()V
    .registers 7

    .prologue
    .line 549
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemSelectedListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;

    if-nez v0, :cond_5

    .line 560
    :goto_4
    return-void

    .line 553
    :cond_5
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getSelectedItemPosition()I

    move-result v3

    .line 554
    .local v3, "selection":I
    if-ltz v3, :cond_1e

    .line 555
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getSelectedView()Landroid/view/View;

    move-result-object v2

    .line 556
    .local v2, "v":Landroid/view/View;
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemSelectedListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v4

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;->onItemSelected(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V

    goto :goto_4

    .line 558
    .end local v2    # "v":Landroid/view/View;
    :cond_1e
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemSelectedListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;

    invoke-interface {v0, p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;->onNothingSelected(Lcom/adobe/android/ui/widget/AdobeAdapterView;)V

    goto :goto_4
.end method

.method public abstract getAdapter()Landroid/widget/Adapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 137
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mItemCount:I

    return v0
.end method

.method public getEmptyView()Landroid/view/View;
    .registers 2

    .prologue
    .line 169
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mEmptyView:Landroid/view/View;

    return-object v0
.end method

.method public getFirstVisiblePosition()I
    .registers 2

    .prologue
    .line 353
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mFirstPosition:I

    return v0
.end method

.method public getItemIdAtPosition(I)J
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 522
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    .line 523
    .local v0, "adapter":Landroid/widget/Adapter;, "TT;"
    if-eqz v0, :cond_8

    if-gez p1, :cond_b

    :cond_8
    const-wide/high16 v2, -0x8000000000000000L

    :goto_a
    return-wide v2

    :cond_b
    invoke-interface {v0, p1}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v2

    goto :goto_a
.end method

.method public getLastVisiblePosition()I
    .registers 3

    .prologue
    .line 349
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getChildCount()I

    move-result v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public final getOnItemClickListener()Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;
    .registers 2

    .prologue
    .line 78
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemClickListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;

    return-object v0
.end method

.method public final getOnItemLongClickListener()Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemLongClickListener;
    .registers 2

    .prologue
    .line 96
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemLongClickListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemLongClickListener;

    return-object v0
.end method

.method public final getOnItemSelectedListener()Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;
    .registers 2

    .prologue
    .line 107
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemSelectedListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;

    return-object v0
.end method

.method public getSelectedItem()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 119
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    .line 120
    .local v0, "adapter":Landroid/widget/Adapter;, "TT;"
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getSelectedItemPosition()I

    move-result v1

    .line 121
    .local v1, "selection":I
    if-eqz v0, :cond_17

    invoke-interface {v0}, Landroid/widget/Adapter;->getCount()I

    move-result v2

    if-lez v2, :cond_17

    if-ltz v1, :cond_17

    .line 122
    invoke-interface {v0, v1}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    .line 124
    :goto_16
    return-object v2

    :cond_17
    const/4 v2, 0x0

    goto :goto_16
.end method

.method public getSelectedItemId()J
    .registers 3

    .prologue
    .line 115
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget-wide v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedRowId:J

    return-wide v0
.end method

.method public getSelectedItemPosition()I
    .registers 2

    .prologue
    .line 133
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedPosition:I

    return v0
.end method

.method public abstract getSelectedView()Landroid/view/View;
.end method

.method handleDataChanged()V
    .registers 11

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const-wide/high16 v8, -0x8000000000000000L

    const/4 v7, 0x1

    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 357
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mItemCount:I

    .line 358
    .local v0, "count":I
    const/4 v1, 0x0

    .line 360
    .local v1, "found":Z
    if-lez v0, :cond_40

    .line 365
    iget-boolean v4, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNeedSync:Z

    if-eqz v4, :cond_20

    .line 368
    iput-boolean v5, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNeedSync:Z

    .line 372
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->findSyncPosition()I

    move-result v2

    .line 373
    .local v2, "newPos":I
    if-ltz v2, :cond_20

    .line 375
    invoke-virtual {p0, v2, v7}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->lookForSelectablePosition(IZ)I

    move-result v3

    .line 376
    .local v3, "selectablePos":I
    if-ne v3, v2, :cond_20

    .line 378
    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->setNextSelectedPositionInt(I)V

    .line 379
    const/4 v1, 0x1

    .line 383
    .end local v2    # "newPos":I
    .end local v3    # "selectablePos":I
    :cond_20
    if-nez v1, :cond_40

    .line 385
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getSelectedItemPosition()I

    move-result v2

    .line 388
    .restart local v2    # "newPos":I
    if-lt v2, v0, :cond_2a

    .line 389
    add-int/lit8 v2, v0, -0x1

    .line 391
    :cond_2a
    if-gez v2, :cond_2d

    .line 392
    const/4 v2, 0x0

    .line 396
    :cond_2d
    invoke-virtual {p0, v2, v7}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->lookForSelectablePosition(IZ)I

    move-result v3

    .line 397
    .restart local v3    # "selectablePos":I
    if-gez v3, :cond_37

    .line 399
    invoke-virtual {p0, v2, v5}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->lookForSelectablePosition(IZ)I

    move-result v3

    .line 401
    :cond_37
    if-ltz v3, :cond_40

    .line 402
    invoke-virtual {p0, v3}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->setNextSelectedPositionInt(I)V

    .line 403
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->checkSelectionChanged()V

    .line 404
    const/4 v1, 0x1

    .line 408
    .end local v2    # "newPos":I
    .end local v3    # "selectablePos":I
    :cond_40
    if-nez v1, :cond_4f

    .line 410
    iput v6, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    .line 411
    iput-wide v8, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedRowId:J

    .line 412
    iput v6, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedPosition:I

    .line 413
    iput-wide v8, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedRowId:J

    .line 414
    iput-boolean v5, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNeedSync:Z

    .line 415
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->checkSelectionChanged()V

    .line 417
    :cond_4f
    return-void
.end method

.method isInFilterMode()Z
    .registers 2

    .prologue
    .line 211
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method lookForSelectablePosition(IZ)I
    .registers 3
    .param p1, "position"    # I
    .param p2, "lookDown"    # Z

    .prologue
    .line 500
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    return p1
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 309
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 310
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectionNotifier:Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 311
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 7
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 330
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mLayoutHeight:I

    .line 331
    return-void
.end method

.method public performItemClick(Landroid/view/View;IJ)Z
    .registers 12
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "id"    # J

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const/4 v6, 0x1

    const/4 v0, 0x0

    .line 86
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemClickListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;

    if-eqz v1, :cond_18

    if-eqz p1, :cond_18

    .line 87
    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->playSoundEffect(I)V

    .line 88
    invoke-virtual {p1, v6}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 89
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemClickListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-interface/range {v0 .. v5}, Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;->onItemClick(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V

    move v0, v6

    .line 92
    :cond_18
    return v0
.end method

.method rememberSyncState()V
    .registers 7

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 568
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getChildCount()I

    move-result v2

    if-lez v2, :cond_2e

    .line 569
    iput-boolean v5, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNeedSync:Z

    .line 570
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mLayoutHeight:I

    int-to-long v2, v2

    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncHeight:J

    .line 571
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    if-ltz v2, :cond_2f

    .line 573
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    iget v3, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mFirstPosition:I

    sub-int/2addr v2, v3

    invoke-virtual {p0, v2}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 574
    .local v1, "v":Landroid/view/View;
    iget-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedRowId:J

    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncRowId:J

    .line 575
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedPosition:I

    iput v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncPosition:I

    .line 576
    if-eqz v1, :cond_2c

    .line 577
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v2

    iput v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSpecificTop:I

    .line 579
    :cond_2c
    iput v4, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncMode:I

    .line 596
    .end local v1    # "v":Landroid/view/View;
    :cond_2e
    :goto_2e
    return-void

    .line 582
    :cond_2f
    invoke-virtual {p0, v4}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 583
    .restart local v1    # "v":Landroid/view/View;
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    .line 584
    .local v0, "adapter":Landroid/widget/Adapter;, "TT;"
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mFirstPosition:I

    if-ltz v2, :cond_5a

    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mFirstPosition:I

    invoke-interface {v0}, Landroid/widget/Adapter;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_5a

    .line 585
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mFirstPosition:I

    invoke-interface {v0, v2}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncRowId:J

    .line 589
    :goto_4b
    iget v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mFirstPosition:I

    iput v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncPosition:I

    .line 590
    if-eqz v1, :cond_57

    .line 591
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v2

    iput v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSpecificTop:I

    .line 593
    :cond_57
    iput v5, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncMode:I

    goto :goto_2e

    .line 587
    :cond_5a
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncRowId:J

    goto :goto_4b
.end method

.method public removeAllViews()V
    .registers 3

    .prologue
    .line 325
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "removeAllViews() is not supported in AviaryAdapterView"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeView(Landroid/view/View;)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 315
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "removeView(View) is not supported in AviaryAdapterView"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeViewAt(I)V
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 320
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "removeViewAt(int) is not supported in AviaryAdapterView"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method selectionChanged(II)V
    .registers 5
    .param p1, "oldIndex"    # I
    .param p2, "newIndex"    # I

    .prologue
    .line 527
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemSelectedListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;

    if-eqz v0, :cond_1d

    .line 528
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mInLayout:Z

    if-nez v0, :cond_c

    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mBlockLayoutRequests:Z

    if-eqz v0, :cond_33

    .line 533
    :cond_c
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectionNotifier:Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;

    if-nez v0, :cond_18

    .line 534
    new-instance v0, Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;-><init>(Lcom/adobe/android/ui/widget/AdobeAdapterView;Lcom/adobe/android/ui/widget/AdobeAdapterView$1;)V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectionNotifier:Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;

    .line 536
    :cond_18
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectionNotifier:Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->post(Ljava/lang/Runnable;)Z

    .line 543
    :cond_1d
    :goto_1d
    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_32

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->isInTouchMode()Z

    move-result v0

    if-nez v0, :cond_32

    .line 544
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->sendAccessibilityEvent(I)V

    .line 546
    :cond_32
    return-void

    .line 538
    :cond_33
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->fireOnSelected()V

    goto :goto_1d
.end method

.method public abstract setAdapter(Landroid/widget/Adapter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public setEmptyView(Landroid/view/View;)V
    .registers 5
    .param p1, "emptyView"    # Landroid/view/View;

    .prologue
    .line 173
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mEmptyView:Landroid/view/View;

    .line 175
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    .line 176
    .local v0, "adapter":Landroid/widget/Adapter;, "TT;"
    if-eqz v0, :cond_e

    invoke-interface {v0}, Landroid/widget/Adapter;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_e
    const/4 v1, 0x1

    .line 177
    .local v1, "empty":Z
    :goto_f
    invoke-direct {p0, v1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->updateEmptyStatus(Z)V

    .line 178
    return-void

    .line 176
    .end local v1    # "empty":Z
    :cond_13
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public setFocusable(Z)V
    .registers 7
    .param p1, "focusable"    # Z

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 253
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    .line 254
    .local v0, "adapter":Landroid/widget/Adapter;, "TT;"
    if-eqz v0, :cond_e

    invoke-interface {v0}, Landroid/widget/Adapter;->getCount()I

    move-result v4

    if-nez v4, :cond_23

    :cond_e
    move v1, v3

    .line 256
    .local v1, "empty":Z
    :goto_f
    iput-boolean p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mDesiredFocusableState:Z

    .line 257
    if-nez p1, :cond_15

    .line 258
    iput-boolean v2, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mDesiredFocusableInTouchModeState:Z

    .line 261
    :cond_15
    if-eqz p1, :cond_25

    if-eqz v1, :cond_1f

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->isInFilterMode()Z

    move-result v4

    if-eqz v4, :cond_25

    :cond_1f
    :goto_1f
    invoke-super {p0, v3}, Landroid/view/ViewGroup;->setFocusable(Z)V

    .line 262
    return-void

    .end local v1    # "empty":Z
    :cond_23
    move v1, v2

    .line 254
    goto :goto_f

    .restart local v1    # "empty":Z
    :cond_25
    move v3, v2

    .line 261
    goto :goto_1f
.end method

.method public setFocusableInTouchMode(Z)V
    .registers 7
    .param p1, "focusable"    # Z

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 266
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    .line 267
    .local v0, "adapter":Landroid/widget/Adapter;, "TT;"
    if-eqz v0, :cond_e

    invoke-interface {v0}, Landroid/widget/Adapter;->getCount()I

    move-result v4

    if-nez v4, :cond_23

    :cond_e
    move v1, v3

    .line 269
    .local v1, "empty":Z
    :goto_f
    iput-boolean p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mDesiredFocusableInTouchModeState:Z

    .line 270
    if-eqz p1, :cond_15

    .line 271
    iput-boolean v3, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mDesiredFocusableState:Z

    .line 274
    :cond_15
    if-eqz p1, :cond_25

    if-eqz v1, :cond_1f

    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->isInFilterMode()Z

    move-result v4

    if-eqz v4, :cond_25

    :cond_1f
    :goto_1f
    invoke-super {p0, v3}, Landroid/view/ViewGroup;->setFocusableInTouchMode(Z)V

    .line 275
    return-void

    .end local v1    # "empty":Z
    :cond_23
    move v1, v2

    .line 267
    goto :goto_f

    .restart local v1    # "empty":Z
    :cond_25
    move v3, v2

    .line 274
    goto :goto_1f
.end method

.method setNextSelectedPositionInt(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 504
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iput p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedPosition:I

    .line 505
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getItemIdAtPosition(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedRowId:J

    .line 507
    iget-boolean v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNeedSync:Z

    if-eqz v0, :cond_18

    iget v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncMode:I

    if-nez v0, :cond_18

    if-ltz p1, :cond_18

    .line 508
    iput p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncPosition:I

    .line 509
    iget-wide v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedRowId:J

    iput-wide v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSyncRowId:J

    .line 511
    :cond_18
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 4
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 235
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Don\'t call setOnClickListener for an AviaryAdapterView. You probably want setOnItemClickListener instead"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOnItemClickListener(Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;

    .prologue
    .line 82
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemClickListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;

    .line 83
    return-void
.end method

.method public setOnItemLongClickListener(Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemLongClickListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemLongClickListener;

    .prologue
    .line 100
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->isLongClickable()Z

    move-result v0

    if-nez v0, :cond_a

    .line 101
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->setLongClickable(Z)V

    .line 103
    :cond_a
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemLongClickListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemLongClickListener;

    .line 104
    return-void
.end method

.method public setOnItemSelectedListener(Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;

    .prologue
    .line 111
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOnItemSelectedListener:Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemSelectedListener;

    .line 112
    return-void
.end method

.method setSelectedPositionInt(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 563
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>;"
    iput p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    .line 564
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getItemIdAtPosition(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedRowId:J

    .line 565
    return-void
.end method

.method public abstract setSelection(I)V
.end method
