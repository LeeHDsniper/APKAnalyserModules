.class public abstract Lorg/lucasr/twowayview/TwoWayLayoutManager;
.super Landroid/support/v7/widget/RecyclerView$LayoutManager;
.source "TwoWayLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;,
        Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;,
        Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    }
.end annotation


# instance fields
.field private mIsVertical:Z

.field private mLayoutEnd:I

.field private mLayoutStart:I

.field private mPendingSavedState:Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

.field private mPendingScrollOffset:I

.field private mPendingScrollPosition:I

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)V
    .registers 5
    .param p1, "orientation"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 89
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    .line 56
    iput-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    .line 58
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingSavedState:Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    .line 60
    const/4 v2, -0x1

    iput v2, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingScrollPosition:I

    .line 61
    iput v1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingScrollOffset:I

    .line 90
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    if-ne p1, v2, :cond_16

    :goto_13
    iput-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    .line 91
    return-void

    :cond_16
    move v0, v1

    .line 90
    goto :goto_13
.end method

.method static synthetic access$200(Lorg/lucasr/twowayview/TwoWayLayoutManager;)Z
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/TwoWayLayoutManager;

    .prologue
    .line 41
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    return v0
.end method

.method private adjustViewsStartOrEnd()V
    .registers 4

    .prologue
    .line 390
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v1

    if-nez v1, :cond_7

    .line 403
    :cond_6
    :goto_6
    return-void

    .line 394
    :cond_7
    iget v1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getStartWithPadding()I

    move-result v2

    sub-int v0, v1, v2

    .line 395
    .local v0, "delta":I
    if-gez v0, :cond_12

    .line 397
    const/4 v0, 0x0

    .line 400
    :cond_12
    if-eqz v0, :cond_6

    .line 401
    neg-int v1, v0

    invoke-direct {p0, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->offsetChildren(I)V

    goto :goto_6
.end method

.method private correctTooHigh(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 10
    .param p1, "childCount"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 309
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getLastVisiblePosition()I

    move-result v3

    .line 310
    .local v3, "lastPosition":I
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne v3, v5, :cond_e

    if-nez p1, :cond_f

    .line 343
    :cond_e
    :goto_e
    return-void

    .line 315
    :cond_f
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getStartWithPadding()I

    move-result v4

    .line 316
    .local v4, "start":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getEndWithPadding()I

    move-result v0

    .line 317
    .local v0, "end":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v2

    .line 321
    .local v2, "firstPosition":I
    iget v5, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    sub-int v1, v0, v5

    .line 325
    .local v1, "endOffset":I
    if-lez v1, :cond_e

    if-gtz v2, :cond_27

    iget v5, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    if-ge v5, v4, :cond_e

    .line 326
    :cond_27
    if-nez v2, :cond_31

    .line 328
    iget v5, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    sub-int v5, v4, v5

    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 332
    :cond_31
    invoke-direct {p0, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->offsetChildren(I)V

    .line 334
    if-lez v2, :cond_e

    .line 337
    add-int/lit8 v5, v2, -0x1

    invoke-direct {p0, v5, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillBefore(ILandroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 340
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->adjustViewsStartOrEnd()V

    goto :goto_e
.end method

.method private correctTooLow(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 11
    .param p1, "childCount"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 348
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v1

    .line 349
    .local v1, "firstPosition":I
    if-nez v1, :cond_8

    if-nez p1, :cond_9

    .line 387
    :cond_8
    :goto_8
    return-void

    .line 353
    :cond_9
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getStartWithPadding()I

    move-result v4

    .line 354
    .local v4, "start":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getEndWithPadding()I

    move-result v0

    .line 355
    .local v0, "end":I
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v2

    .line 356
    .local v2, "itemCount":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getLastVisiblePosition()I

    move-result v3

    .line 360
    .local v3, "lastPosition":I
    iget v6, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    sub-int v5, v6, v4

    .line 365
    .local v5, "startOffset":I
    if-lez v5, :cond_8

    .line 366
    add-int/lit8 v6, v2, -0x1

    if-lt v3, v6, :cond_27

    iget v6, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    if-le v6, v0, :cond_43

    .line 367
    :cond_27
    add-int/lit8 v6, v2, -0x1

    if-ne v3, v6, :cond_32

    .line 369
    iget v6, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    sub-int/2addr v6, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 373
    :cond_32
    neg-int v6, v5

    invoke-direct {p0, v6}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->offsetChildren(I)V

    .line 375
    add-int/lit8 v6, v2, -0x1

    if-ge v3, v6, :cond_8

    .line 378
    add-int/lit8 v6, v3, 0x1

    invoke-direct {p0, v6, p2, p3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillAfter(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 381
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->adjustViewsStartOrEnd()V

    goto :goto_8

    .line 383
    :cond_43
    add-int/lit8 v6, v2, -0x1

    if-ne v3, v6, :cond_8

    .line 384
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->adjustViewsStartOrEnd()V

    goto :goto_8
.end method

.method private fillAfter(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 264
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillAfter(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)V

    .line 265
    return-void
.end method

.method private fillAfter(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)V
    .registers 8
    .param p1, "position"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p4, "extraSpace"    # I

    .prologue
    .line 268
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getEndWithPadding()I

    move-result v2

    add-int v1, v2, p4

    .line 270
    .local v1, "limit":I
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    .line 271
    .local v0, "itemCount":I
    :goto_a
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {p0, v2, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->canAddMoreViews(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;I)Z

    move-result v2

    if-eqz v2, :cond_1c

    if-ge p1, v0, :cond_1c

    .line 272
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-direct {p0, p1, v2, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->makeAndAddView(ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;

    .line 273
    add-int/lit8 p1, p1, 0x1

    goto :goto_a

    .line 275
    :cond_1c
    return-void
.end method

.method private fillBefore(ILandroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 251
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillBefore(ILandroid/support/v7/widget/RecyclerView$Recycler;I)V

    .line 252
    return-void
.end method

.method private fillBefore(ILandroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "extraSpace"    # I

    .prologue
    .line 255
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getStartWithPadding()I

    move-result v1

    sub-int v0, v1, p3

    .line 257
    .local v0, "limit":I
    :goto_6
    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {p0, v1, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->canAddMoreViews(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;I)Z

    move-result v1

    if-eqz v1, :cond_18

    if-ltz p1, :cond_18

    .line 258
    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-direct {p0, p1, v1, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->makeAndAddView(ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;

    .line 259
    add-int/lit8 p1, p1, -0x1

    goto :goto_6

    .line 261
    :cond_18
    return-void
.end method

.method private fillFromScrapList(Ljava/util/List;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 7
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;",
            "Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;",
            ")V"
        }
    .end annotation

    .prologue
    .line 440
    .local p1, "scrapList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v0

    .line 443
    .local v0, "firstPosition":I
    sget-object v3, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p2, v3, :cond_1e

    .line 444
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v3

    add-int v1, v0, v3

    .line 450
    .local v1, "position":I
    :goto_e
    invoke-static {p1, p2, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->findNextScrapView(Ljava/util/List;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;I)Landroid/view/View;

    move-result-object v2

    .local v2, "scrapChild":Landroid/view/View;
    if-eqz v2, :cond_23

    .line 451
    invoke-direct {p0, v2, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->setupChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 452
    sget-object v3, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p2, v3, :cond_21

    const/4 v3, 0x1

    :goto_1c
    add-int/2addr v1, v3

    goto :goto_e

    .line 446
    .end local v1    # "position":I
    .end local v2    # "scrapChild":Landroid/view/View;
    :cond_1e
    add-int/lit8 v1, v0, -0x1

    .restart local v1    # "position":I
    goto :goto_e

    .line 452
    .restart local v2    # "scrapChild":Landroid/view/View;
    :cond_21
    const/4 v3, -0x1

    goto :goto_1c

    .line 454
    :cond_23
    return-void
.end method

.method private fillGap(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 8
    .param p1, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 237
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v0

    .line 238
    .local v0, "childCount":I
    invoke-virtual {p0, p3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getExtraLayoutSpace(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v1

    .line 239
    .local v1, "extraSpace":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v2

    .line 241
    .local v2, "firstPosition":I
    sget-object v3, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p1, v3, :cond_19

    .line 242
    add-int v3, v2, v0

    invoke-direct {p0, v3, p2, p3, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillAfter(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)V

    .line 243
    invoke-direct {p0, v0, p2, p3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->correctTooHigh(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 248
    :goto_18
    return-void

    .line 245
    :cond_19
    add-int/lit8 v3, v2, -0x1

    invoke-direct {p0, v3, p2, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillBefore(ILandroid/support/v7/widget/RecyclerView$Recycler;I)V

    .line 246
    invoke-direct {p0, v0, p2, p3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->correctTooLow(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    goto :goto_18
.end method

.method private fillSpecific(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 8
    .param p1, "position"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 278
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v3

    if-nez v3, :cond_7

    .line 304
    :goto_6
    return-void

    .line 282
    :cond_7
    sget-object v3, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-direct {p0, p1, v3, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->makeAndAddView(ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;

    .line 287
    invoke-virtual {p0, p3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getExtraLayoutSpace(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    .line 288
    .local v0, "extraSpace":I
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$State;->getTargetScrollPosition()I

    move-result v3

    if-ge v3, p1, :cond_2d

    .line 289
    const/4 v1, 0x0

    .line 290
    .local v1, "extraSpaceAfter":I
    move v2, v0

    .line 296
    .local v2, "extraSpaceBefore":I
    :goto_18
    add-int/lit8 v3, p1, -0x1

    invoke-direct {p0, v3, p2, v2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillBefore(ILandroid/support/v7/widget/RecyclerView$Recycler;I)V

    .line 300
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->adjustViewsStartOrEnd()V

    .line 302
    add-int/lit8 v3, p1, 0x1

    invoke-direct {p0, v3, p2, p3, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillAfter(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)V

    .line 303
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v3

    invoke-direct {p0, v3, p2, p3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->correctTooHigh(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    goto :goto_6

    .line 292
    .end local v1    # "extraSpaceAfter":I
    .end local v2    # "extraSpaceBefore":I
    :cond_2d
    move v1, v0

    .line 293
    .restart local v1    # "extraSpaceAfter":I
    const/4 v2, 0x0

    .restart local v2    # "extraSpaceBefore":I
    goto :goto_18
.end method

.method private findFirstValidChildPosition(I)I
    .registers 6
    .param p1, "itemCount"    # I

    .prologue
    .line 634
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v0

    .line 635
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v0, :cond_17

    .line 636
    invoke-virtual {p0, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 637
    .local v3, "view":Landroid/view/View;
    invoke-virtual {p0, v3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    .line 638
    .local v2, "position":I
    if-ltz v2, :cond_14

    if-ge v2, p1, :cond_14

    .line 643
    .end local v2    # "position":I
    .end local v3    # "view":Landroid/view/View;
    :goto_13
    return v2

    .line 635
    .restart local v2    # "position":I
    .restart local v3    # "view":Landroid/view/View;
    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 643
    .end local v2    # "position":I
    .end local v3    # "view":Landroid/view/View;
    :cond_17
    const/4 v2, 0x0

    goto :goto_13
.end method

.method private static findNextScrapView(Ljava/util/List;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;I)Landroid/view/View;
    .registers 11
    .param p1, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;",
            "Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;",
            "I)",
            "Landroid/view/View;"
        }
    .end annotation

    .prologue
    .line 407
    .local p0, "scrapList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v6

    .line 409
    .local v6, "scrapCount":I
    const/4 v1, 0x0

    .line 410
    .local v1, "closest":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    const v2, 0x7fffffff

    .line 412
    .local v2, "closestDistance":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_9
    if-ge v5, v6, :cond_30

    .line 413
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 415
    .local v4, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getPosition()I

    move-result v7

    sub-int v3, v7, p2

    .line 416
    .local v3, "distance":I
    if-gez v3, :cond_1d

    sget-object v7, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-eq p1, v7, :cond_23

    :cond_1d
    if-lez v3, :cond_26

    sget-object v7, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p1, v7, :cond_26

    .line 412
    :cond_23
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 421
    :cond_26
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 422
    .local v0, "absDistance":I
    if-ge v0, v2, :cond_23

    .line 423
    move-object v1, v4

    .line 424
    move v2, v0

    .line 426
    if-nez v3, :cond_23

    .line 432
    .end local v0    # "absDistance":I
    .end local v3    # "distance":I
    .end local v4    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_30
    if-eqz v1, :cond_35

    .line 433
    iget-object v7, v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 436
    :goto_34
    return-object v7

    :cond_35
    const/4 v7, 0x0

    goto :goto_34
.end method

.method private getPendingItemSelectionState()Landroid/os/Bundle;
    .registers 2

    .prologue
    .line 586
    iget-object v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingSavedState:Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    if-eqz v0, :cond_b

    .line 587
    iget-object v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingSavedState:Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    # getter for: Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->itemSelectionState:Landroid/os/Bundle;
    invoke-static {v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->access$000(Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;)Landroid/os/Bundle;

    move-result-object v0

    .line 590
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private getTotalSpace()I
    .registers 3

    .prologue
    .line 94
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-eqz v0, :cond_13

    .line 95
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    .line 97
    :goto_12
    return v0

    :cond_13
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_12
.end method

.method private handleUpdate()V
    .registers 5

    .prologue
    .line 488
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v1

    .line 489
    .local v1, "firstPosition":I
    invoke-virtual {p0, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 490
    .local v0, "firstChild":Landroid/view/View;
    if-eqz v0, :cond_12

    .line 491
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildStart(Landroid/view/View;)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->setPendingScrollPositionWithOffset(II)V

    .line 495
    :goto_11
    return-void

    .line 493
    :cond_12
    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->setPendingScrollPositionWithOffset(II)V

    goto :goto_11
.end method

.method private makeAndAddView(ILorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;
    .registers 7
    .param p1, "position"    # I
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    .param p3, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 468
    invoke-virtual {p3, p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object v0

    .line 469
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v1

    .line 471
    .local v1, "isItemRemoved":Z
    if-nez v1, :cond_18

    .line 472
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p2, v2, :cond_21

    const/4 v2, -0x1

    :goto_15
    invoke-virtual {p0, v0, v2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->addView(Landroid/view/View;I)V

    .line 475
    :cond_18
    invoke-direct {p0, v0, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->setupChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 477
    if-nez v1, :cond_20

    .line 478
    invoke-direct {p0, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->updateLayoutEdgesFromNewChild(Landroid/view/View;)V

    .line 481
    :cond_20
    return-object v0

    .line 472
    :cond_21
    const/4 v2, 0x0

    goto :goto_15
.end method

.method private offsetChildren(I)V
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 126
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-eqz v0, :cond_12

    .line 127
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->offsetChildrenVertical(I)V

    .line 132
    :goto_7
    iget v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    .line 133
    iget v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    .line 134
    return-void

    .line 129
    :cond_12
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->offsetChildrenHorizontal(I)V

    goto :goto_7
.end method

.method private recycleChildrenFromEnd(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 10
    .param p1, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 170
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getEndWithPadding()I

    move-result v3

    .line 171
    .local v3, "childrenEnd":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v1

    .line 173
    .local v1, "childCount":I
    const/4 v5, 0x0

    .line 174
    .local v5, "firstDetachedPos":I
    const/4 v4, 0x0

    .line 175
    .local v4, "detachedCount":I
    add-int/lit8 v6, v1, -0x1

    .local v6, "i":I
    :goto_c
    if-ltz v6, :cond_18

    .line 176
    invoke-virtual {p0, v6}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 177
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildStart(Landroid/view/View;)I

    move-result v2

    .line 179
    .local v2, "childStart":I
    if-gt v2, v3, :cond_27

    .line 189
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "childStart":I
    :cond_18
    :goto_18
    add-int/lit8 v4, v4, -0x1

    if-ltz v4, :cond_30

    .line 190
    invoke-virtual {p0, v5}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 191
    .restart local v0    # "child":Landroid/view/View;
    invoke-virtual {p0, v5, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->removeAndRecycleViewAt(ILandroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 192
    invoke-direct {p0, v0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->updateLayoutEdgesFromRemovedChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    goto :goto_18

    .line 183
    .restart local v2    # "childStart":I
    :cond_27
    move v5, v6

    .line 184
    add-int/lit8 v4, v4, 0x1

    .line 186
    invoke-virtual {p0, v0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->detachChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 175
    add-int/lit8 v6, v6, -0x1

    goto :goto_c

    .line 194
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "childStart":I
    :cond_30
    return-void
.end method

.method private recycleChildrenFromStart(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 10
    .param p1, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 145
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v1

    .line 146
    .local v1, "childCount":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getStartWithPadding()I

    move-result v3

    .line 148
    .local v3, "childrenStart":I
    const/4 v4, 0x0

    .line 149
    .local v4, "detachedCount":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_a
    if-ge v5, v1, :cond_16

    .line 150
    invoke-virtual {p0, v5}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 151
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildEnd(Landroid/view/View;)I

    move-result v2

    .line 153
    .local v2, "childEnd":I
    if-lt v2, v3, :cond_26

    .line 162
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "childEnd":I
    :cond_16
    :goto_16
    add-int/lit8 v4, v4, -0x1

    if-ltz v4, :cond_2e

    .line 163
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 164
    .restart local v0    # "child":Landroid/view/View;
    invoke-virtual {p0, v0, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->removeAndRecycleView(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 165
    invoke-direct {p0, v0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->updateLayoutEdgesFromRemovedChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    goto :goto_16

    .line 157
    .restart local v2    # "childEnd":I
    :cond_26
    add-int/lit8 v4, v4, 0x1

    .line 159
    invoke-virtual {p0, v0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->detachChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 149
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    .line 167
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "childEnd":I
    :cond_2e
    return-void
.end method

.method private recycleChildrenOutOfBounds(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 4
    .param p1, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 137
    sget-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p1, v0, :cond_8

    .line 138
    invoke-direct {p0, p1, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->recycleChildrenFromStart(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 142
    :goto_7
    return-void

    .line 140
    :cond_8
    invoke-direct {p0, p1, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->recycleChildrenFromEnd(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    goto :goto_7
.end method

.method private resetLayoutEdges()V
    .registers 2

    .prologue
    .line 573
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getStartWithPadding()I

    move-result v0

    iput v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    .line 574
    iget v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    iput v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    .line 575
    return-void
.end method

.method private scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 15
    .param p1, "delta"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 197
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v3

    .line 198
    .local v3, "childCount":I
    if-eqz v3, :cond_8

    if-nez p1, :cond_a

    .line 199
    :cond_8
    const/4 v9, 0x0

    .line 233
    :goto_9
    return v9

    .line 202
    :cond_a
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getStartWithPadding()I

    move-result v7

    .line 203
    .local v7, "start":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getEndWithPadding()I

    move-result v5

    .line 204
    .local v5, "end":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v6

    .line 206
    .local v6, "firstPosition":I
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getTotalSpace()I

    move-result v8

    .line 207
    .local v8, "totalSpace":I
    if-gez p1, :cond_41

    .line 208
    add-int/lit8 v9, v8, -0x1

    neg-int v9, v9

    invoke-static {v9, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 213
    :goto_23
    if-nez v6, :cond_48

    iget v9, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    if-lt v9, v7, :cond_48

    if-gtz p1, :cond_48

    const/4 v1, 0x1

    .line 215
    .local v1, "cannotScrollBackward":Z
    :goto_2c
    add-int v9, v6, v3

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v10

    if-ne v9, v10, :cond_4a

    iget v9, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    if-gt v9, v5, :cond_4a

    if-ltz p1, :cond_4a

    const/4 v2, 0x1

    .line 218
    .local v2, "cannotScrollForward":Z
    :goto_3b
    if-nez v2, :cond_3f

    if-eqz v1, :cond_4c

    .line 219
    :cond_3f
    const/4 v9, 0x0

    goto :goto_9

    .line 210
    .end local v1    # "cannotScrollBackward":Z
    .end local v2    # "cannotScrollForward":Z
    :cond_41
    add-int/lit8 v9, v8, -0x1

    invoke-static {v9, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_23

    .line 213
    :cond_48
    const/4 v1, 0x0

    goto :goto_2c

    .line 215
    .restart local v1    # "cannotScrollBackward":Z
    :cond_4a
    const/4 v2, 0x0

    goto :goto_3b

    .line 222
    .restart local v2    # "cannotScrollForward":Z
    :cond_4c
    neg-int v9, p1

    invoke-direct {p0, v9}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->offsetChildren(I)V

    .line 224
    if-lez p1, :cond_74

    sget-object v4, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .line 225
    .local v4, "direction":Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    :goto_54
    invoke-direct {p0, v4, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->recycleChildrenOutOfBounds(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 227
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 228
    .local v0, "absDelta":I
    sget-object v9, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    sub-int v10, v7, v0

    invoke-virtual {p0, v9, v10}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->canAddMoreViews(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;I)Z

    move-result v9

    if-nez v9, :cond_6f

    sget-object v9, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    add-int v10, v5, v0

    .line 229
    invoke-virtual {p0, v9, v10}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->canAddMoreViews(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;I)Z

    move-result v9

    if-eqz v9, :cond_72

    .line 230
    :cond_6f
    invoke-direct {p0, v4, p2, p3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillGap(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    :cond_72
    move v9, p1

    .line 233
    goto :goto_9

    .line 224
    .end local v0    # "absDelta":I
    .end local v4    # "direction":Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    :cond_74
    sget-object v4, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    goto :goto_54
.end method

.method private setupChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 457
    iget-object v2, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v2}, Lorg/lucasr/twowayview/ItemSelectionSupport;->from(Landroid/support/v7/widget/RecyclerView;)Lorg/lucasr/twowayview/ItemSelectionSupport;

    move-result-object v0

    .line 458
    .local v0, "itemSelection":Lorg/lucasr/twowayview/ItemSelectionSupport;
    if-eqz v0, :cond_13

    .line 459
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    .line 460
    .local v1, "position":I
    invoke-virtual {v0, v1}, Lorg/lucasr/twowayview/ItemSelectionSupport;->isItemChecked(I)Z

    move-result v2

    invoke-virtual {v0, p1, v2}, Lorg/lucasr/twowayview/ItemSelectionSupport;->setViewChecked(Landroid/view/View;Z)V

    .line 463
    .end local v1    # "position":I
    :cond_13
    invoke-virtual {p0, p1, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->measureChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 464
    invoke-virtual {p0, p1, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->layoutChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 465
    return-void
.end method

.method private updateLayoutEdgesFromNewChild(Landroid/view/View;)V
    .registers 5
    .param p1, "newChild"    # Landroid/view/View;

    .prologue
    .line 498
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildStart(Landroid/view/View;)I

    move-result v1

    .line 499
    .local v1, "childStart":I
    iget v2, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    if-ge v1, v2, :cond_a

    .line 500
    iput v1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    .line 503
    :cond_a
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildEnd(Landroid/view/View;)I

    move-result v0

    .line 504
    .local v0, "childEnd":I
    iget v2, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    if-le v0, v2, :cond_14

    .line 505
    iput v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    .line 507
    :cond_14
    return-void
.end method

.method private updateLayoutEdgesFromRemovedChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 12
    .param p1, "removedChild"    # Landroid/view/View;
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 510
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v1

    .line 511
    .local v1, "childCount":I
    if-nez v1, :cond_a

    .line 512
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->resetLayoutEdges()V

    .line 570
    :cond_9
    return-void

    .line 516
    :cond_a
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildStart(Landroid/view/View;)I

    move-result v7

    .line 517
    .local v7, "removedChildStart":I
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildEnd(Landroid/view/View;)I

    move-result v6

    .line 519
    .local v6, "removedChildEnd":I
    iget v8, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    if-le v7, v8, :cond_1a

    iget v8, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    if-lt v6, v8, :cond_9

    .line 525
    :cond_1a
    sget-object v8, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p2, v8, :cond_42

    .line 528
    const v8, 0x7fffffff

    iput v8, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    .line 529
    const/4 v4, 0x0

    .line 530
    .local v4, "index":I
    move v5, v6

    .line 539
    .local v5, "limit":I
    :goto_25
    if-ltz v4, :cond_9

    add-int/lit8 v8, v1, -0x1

    if-gt v4, v8, :cond_9

    .line 540
    invoke-virtual {p0, v4}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 542
    .local v0, "child":Landroid/view/View;
    sget-object v8, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    if-ne p2, v8, :cond_4a

    .line 543
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildStart(Landroid/view/View;)I

    move-result v3

    .line 544
    .local v3, "childStart":I
    iget v8, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    if-ge v3, v8, :cond_3d

    .line 545
    iput v3, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutStart:I

    .line 550
    :cond_3d
    if-ge v3, v5, :cond_9

    .line 554
    add-int/lit8 v4, v4, 0x1

    .line 555
    goto :goto_25

    .line 534
    .end local v0    # "child":Landroid/view/View;
    .end local v3    # "childStart":I
    .end local v4    # "index":I
    .end local v5    # "limit":I
    :cond_42
    const/high16 v8, -0x80000000

    iput v8, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    .line 535
    add-int/lit8 v4, v1, -0x1

    .line 536
    .restart local v4    # "index":I
    move v5, v7

    .restart local v5    # "limit":I
    goto :goto_25

    .line 556
    .restart local v0    # "child":Landroid/view/View;
    :cond_4a
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildEnd(Landroid/view/View;)I

    move-result v2

    .line 557
    .local v2, "childEnd":I
    iget v8, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    if-le v2, v8, :cond_54

    .line 558
    iput v2, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mLayoutEnd:I

    .line 563
    :cond_54
    if-le v2, v5, :cond_9

    .line 567
    add-int/lit8 v4, v4, -0x1

    goto :goto_25
.end method


# virtual methods
.method protected abstract canAddMoreViews(Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;I)Z
.end method

.method public canScrollHorizontally()Z
    .registers 2

    .prologue
    .line 809
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public canScrollVertically()Z
    .registers 2

    .prologue
    .line 814
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    return v0
.end method

.method public computeHorizontalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 879
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 861
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 862
    const/4 v0, 0x0

    .line 865
    :goto_7
    return v0

    :cond_8
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v0

    goto :goto_7
.end method

.method public computeHorizontalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 889
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 884
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 870
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 871
    const/4 v0, 0x0

    .line 874
    :goto_7
    return v0

    :cond_8
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v0

    goto :goto_7
.end method

.method public computeVerticalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 894
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    return v0
.end method

.method protected detachChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
    .registers 3
    .param p1, "child"    # Landroid/view/View;
    .param p2, "direction"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .prologue
    .line 748
    return-void
.end method

.method public generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4

    .prologue
    const/4 v2, -0x1

    const/4 v1, -0x2

    .line 777
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-eqz v0, :cond_c

    .line 778
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-direct {v0, v2, v1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    .line 780
    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    goto :goto_b
.end method

.method protected getAnchorItemPosition(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v2, -0x1

    .line 615
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    .line 617
    .local v0, "itemCount":I
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPendingScrollPosition()I

    move-result v1

    .line 618
    .local v1, "pendingPosition":I
    if-eq v1, v2, :cond_10

    .line 619
    if-ltz v1, :cond_f

    if-lt v1, v0, :cond_10

    .line 620
    :cond_f
    const/4 v1, -0x1

    .line 624
    :cond_10
    if-eq v1, v2, :cond_13

    .line 629
    .end local v1    # "pendingPosition":I
    :goto_12
    return v1

    .line 626
    .restart local v1    # "pendingPosition":I
    :cond_13
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v2

    if-lez v2, :cond_1e

    .line 627
    invoke-direct {p0, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->findFirstValidChildPosition(I)I

    move-result v1

    goto :goto_12

    .line 629
    :cond_1e
    const/4 v1, 0x0

    goto :goto_12
.end method

.method protected getChildEnd(Landroid/view/View;)I
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 118
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v0

    :goto_8
    return v0

    :cond_9
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getDecoratedRight(Landroid/view/View;)I

    move-result v0

    goto :goto_8
.end method

.method protected getChildStart(Landroid/view/View;)I
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 114
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v0

    :goto_8
    return v0

    :cond_9
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v0

    goto :goto_8
.end method

.method public getDecoratedBottom(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 678
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 679
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v1, v2

    return v1
.end method

.method public getDecoratedLeft(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 660
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 661
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v1, v2

    return v1
.end method

.method public getDecoratedMeasuredHeight(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 654
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 655
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v1, v2

    return v1
.end method

.method public getDecoratedMeasuredWidth(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 648
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 649
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedMeasuredWidth(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v1, v2

    return v1
.end method

.method public getDecoratedRight(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 672
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 673
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedRight(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v1, v2

    return v1
.end method

.method public getDecoratedTop(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 666
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 667
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v1, v2

    return v1
.end method

.method protected getEndWithPadding()I
    .registers 3

    .prologue
    .line 106
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-eqz v0, :cond_e

    .line 107
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    .line 109
    :goto_d
    return v0

    :cond_e
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_d
.end method

.method protected getExtraLayoutSpace(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 578
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->hasTargetScrollPosition()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 579
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getTotalSpace()I

    move-result v0

    .line 581
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getFirstVisiblePosition()I
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 943
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v1

    if-nez v1, :cond_8

    .line 947
    :goto_7
    return v0

    :cond_8
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v0

    goto :goto_7
.end method

.method public getLastVisiblePosition()I
    .registers 3

    .prologue
    .line 951
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v0

    .line 952
    .local v0, "childCount":I
    if-nez v0, :cond_8

    .line 953
    const/4 v1, 0x0

    .line 956
    :goto_7
    return v1

    :cond_8
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_7
.end method

.method public getOrientation()Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    .registers 2

    .prologue
    .line 929
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-eqz v0, :cond_7

    sget-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->HORIZONTAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    goto :goto_6
.end method

.method protected getPendingScrollOffset()I
    .registers 2

    .prologue
    .line 607
    iget-object v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingSavedState:Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    if-eqz v0, :cond_6

    .line 608
    const/4 v0, 0x0

    .line 611
    :goto_5
    return v0

    :cond_6
    iget v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingScrollOffset:I

    goto :goto_5
.end method

.method protected getPendingScrollPosition()I
    .registers 2

    .prologue
    .line 599
    iget-object v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingSavedState:Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    if-eqz v0, :cond_b

    .line 600
    iget-object v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingSavedState:Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    # getter for: Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->anchorItemPosition:I
    invoke-static {v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->access$100(Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;)I

    move-result v0

    .line 603
    :goto_a
    return v0

    :cond_b
    iget v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingScrollPosition:I

    goto :goto_a
.end method

.method protected getStartWithPadding()I
    .registers 2

    .prologue
    .line 102
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPaddingTop()I

    move-result v0

    :goto_8
    return v0

    :cond_9
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPaddingLeft()I

    move-result v0

    goto :goto_8
.end method

.method protected abstract layoutChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
.end method

.method public layoutDecorated(Landroid/view/View;IIII)V
    .registers 13
    .param p1, "child"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 684
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 685
    .local v6, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int v2, p2, v0

    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int v3, p3, v0

    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int v4, p4, v0

    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int v5, p5, v0

    move-object v0, p0

    move-object v1, p1

    invoke-super/range {v0 .. v5}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 687
    return-void
.end method

.method protected abstract measureChild(Landroid/view/View;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V
.end method

.method public onAdapterChanged(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .registers 5
    .param p1, "oldAdapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;
    .param p2, "newAdapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;

    .prologue
    .line 703
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onAdapterChanged(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 705
    iget-object v1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v1}, Lorg/lucasr/twowayview/ItemSelectionSupport;->from(Landroid/support/v7/widget/RecyclerView;)Lorg/lucasr/twowayview/ItemSelectionSupport;

    move-result-object v0

    .line 706
    .local v0, "itemSelectionSupport":Lorg/lucasr/twowayview/ItemSelectionSupport;
    if-eqz p1, :cond_10

    if-eqz v0, :cond_10

    .line 707
    invoke-virtual {v0}, Lorg/lucasr/twowayview/ItemSelectionSupport;->clearChoices()V

    .line 709
    :cond_10
    return-void
.end method

.method public onAttachedToWindow(Landroid/support/v7/widget/RecyclerView;)V
    .registers 2
    .param p1, "view"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 691
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onAttachedToWindow(Landroid/support/v7/widget/RecyclerView;)V

    .line 692
    iput-object p1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 693
    return-void
.end method

.method public onDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 4
    .param p1, "view"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 697
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 698
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 699
    return-void
.end method

.method public onItemsAdded(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 752
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->handleUpdate()V

    .line 753
    return-void
.end method

.method public onItemsChanged(Landroid/support/v7/widget/RecyclerView;)V
    .registers 2
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 772
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->handleUpdate()V

    .line 773
    return-void
.end method

.method public onItemsMoved(Landroid/support/v7/widget/RecyclerView;III)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .param p4, "itemCount"    # I

    .prologue
    .line 767
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->handleUpdate()V

    .line 768
    return-void
.end method

.method public onItemsRemoved(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 757
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->handleUpdate()V

    .line 758
    return-void
.end method

.method public onItemsUpdated(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 762
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->handleUpdate()V

    .line 763
    return-void
.end method

.method public onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 8
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 713
    iget-object v3, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v3}, Lorg/lucasr/twowayview/ItemSelectionSupport;->from(Landroid/support/v7/widget/RecyclerView;)Lorg/lucasr/twowayview/ItemSelectionSupport;

    move-result-object v1

    .line 714
    .local v1, "itemSelection":Lorg/lucasr/twowayview/ItemSelectionSupport;
    if-eqz v1, :cond_1a

    .line 715
    invoke-direct {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPendingItemSelectionState()Landroid/os/Bundle;

    move-result-object v2

    .line 716
    .local v2, "itemSelectionState":Landroid/os/Bundle;
    if-eqz v2, :cond_11

    .line 717
    invoke-virtual {v1, v2}, Lorg/lucasr/twowayview/ItemSelectionSupport;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 720
    :cond_11
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->didStructureChange()Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 721
    invoke-virtual {v1}, Lorg/lucasr/twowayview/ItemSelectionSupport;->onAdapterDataChanged()V

    .line 725
    .end local v2    # "itemSelectionState":Landroid/os/Bundle;
    :cond_1a
    invoke-virtual {p0, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getAnchorItemPosition(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    .line 726
    .local v0, "anchorItemPosition":I
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->detachAndScrapAttachedViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 727
    invoke-direct {p0, v0, p1, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillSpecific(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 729
    invoke-virtual {p0, p1, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->onLayoutScrapList(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 731
    const/4 v3, -0x1

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->setPendingScrollPositionWithOffset(II)V

    .line 732
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingSavedState:Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    .line 733
    return-void
.end method

.method protected onLayoutScrapList(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 6
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 736
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getChildCount()I

    move-result v0

    .line 737
    .local v0, "childCount":I
    if-eqz v0, :cond_12

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v2

    if-nez v2, :cond_12

    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->supportsPredictiveItemAnimations()Z

    move-result v2

    if-nez v2, :cond_13

    .line 744
    :cond_12
    :goto_12
    return-void

    .line 741
    :cond_13
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->getScrapList()Ljava/util/List;

    move-result-object v1

    .line 742
    .local v1, "scrapList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-direct {p0, v1, v2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillFromScrapList(Ljava/util/List;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    .line 743
    sget-object v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-direct {p0, v1, v2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->fillFromScrapList(Ljava/util/List;Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;)V

    goto :goto_12
.end method

.method public onMeasure(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;II)V
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "widthSpec"    # I
    .param p4, "heightSpec"    # I

    .prologue
    .line 899
    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onMeasure(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;II)V

    .line 900
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 924
    check-cast p1, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    .end local p1    # "state":Landroid/os/Parcelable;
    iput-object p1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingSavedState:Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    .line 925
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->requestLayout()V

    .line 926
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 904
    new-instance v2, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    sget-object v3, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->EMPTY_STATE:Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;

    invoke-direct {v2, v3}, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 906
    .local v2, "state":Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getPendingScrollPosition()I

    move-result v0

    .line 907
    .local v0, "anchorItemPosition":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_12

    .line 908
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v0

    .line 910
    :cond_12
    # setter for: Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->anchorItemPosition:I
    invoke-static {v2, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->access$102(Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;I)I

    .line 912
    iget-object v3, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v3}, Lorg/lucasr/twowayview/ItemSelectionSupport;->from(Landroid/support/v7/widget/RecyclerView;)Lorg/lucasr/twowayview/ItemSelectionSupport;

    move-result-object v1

    .line 913
    .local v1, "itemSelection":Lorg/lucasr/twowayview/ItemSelectionSupport;
    if-eqz v1, :cond_25

    .line 914
    invoke-virtual {v1}, Lorg/lucasr/twowayview/ItemSelectionSupport;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v3

    # setter for: Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->itemSelectionState:Landroid/os/Bundle;
    invoke-static {v2, v3}, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->access$002(Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 919
    :goto_24
    return-object v2

    .line 916
    :cond_25
    sget-object v3, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    # setter for: Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->itemSelectionState:Landroid/os/Bundle;
    invoke-static {v2, v3}, Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;->access$002(Lorg/lucasr/twowayview/TwoWayLayoutManager$SavedState;Landroid/os/Bundle;)Landroid/os/Bundle;

    goto :goto_24
.end method

.method public scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "dx"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 791
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-eqz v0, :cond_6

    .line 792
    const/4 v0, 0x0

    .line 795
    :goto_5
    return v0

    :cond_6
    invoke-direct {p0, p1, p2, p3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_5
.end method

.method public scrollToPosition(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 819
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->scrollToPositionWithOffset(II)V

    .line 820
    return-void
.end method

.method public scrollToPositionWithOffset(II)V
    .registers 3
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 823
    invoke-virtual {p0, p1, p2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->setPendingScrollPositionWithOffset(II)V

    .line 824
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->requestLayout()V

    .line 825
    return-void
.end method

.method public scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "dy"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 800
    iget-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-nez v0, :cond_6

    .line 801
    const/4 v0, 0x0

    .line 804
    :goto_5
    return v0

    :cond_6
    invoke-direct {p0, p1, p2, p3}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_5
.end method

.method public setOrientation(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)V
    .registers 4
    .param p1, "orientation"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    .prologue
    .line 933
    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    if-ne p1, v1, :cond_a

    const/4 v0, 0x1

    .line 934
    .local v0, "isVertical":Z
    :goto_5
    iget-boolean v1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    if-ne v1, v0, :cond_c

    .line 940
    :goto_9
    return-void

    .line 933
    .end local v0    # "isVertical":Z
    :cond_a
    const/4 v0, 0x0

    goto :goto_5

    .line 938
    .restart local v0    # "isVertical":Z
    :cond_c
    iput-boolean v0, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z

    .line 939
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->requestLayout()V

    goto :goto_9
.end method

.method protected setPendingScrollPositionWithOffset(II)V
    .registers 3
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 594
    iput p1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingScrollPosition:I

    .line 595
    iput p2, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager;->mPendingScrollOffset:I

    .line 596
    return-void
.end method

.method public smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "position"    # I

    .prologue
    .line 829
    new-instance v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$1;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager$1;-><init>(Lorg/lucasr/twowayview/TwoWayLayoutManager;Landroid/content/Context;)V

    .line 855
    .local v0, "scroller":Landroid/support/v7/widget/LinearSmoothScroller;
    invoke-virtual {v0, p3}, Landroid/support/v7/widget/LinearSmoothScroller;->setTargetPosition(I)V

    .line 856
    invoke-virtual {p0, v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->startSmoothScroll(Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V

    .line 857
    return-void
.end method

.method public supportsPredictiveItemAnimations()Z
    .registers 2

    .prologue
    .line 786
    const/4 v0, 0x1

    return v0
.end method
