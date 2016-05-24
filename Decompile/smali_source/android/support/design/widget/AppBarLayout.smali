.class public Landroid/support/design/widget/AppBarLayout;
.super Landroid/widget/LinearLayout;
.source "AppBarLayout.java"


# annotations
.annotation runtime Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;
    value = Landroid/support/design/widget/AppBarLayout$Behavior;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/AppBarLayout$Behavior;,
        Landroid/support/design/widget/AppBarLayout$LayoutParams;,
        Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;
    }
.end annotation


# instance fields
.field private mDownPreScrollRange:I

.field private mDownScrollRange:I

.field mHaveChildWithInterpolator:Z

.field private mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

.field private final mListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private mTargetElevation:F

.field private mTotalScrollRange:I


# direct methods
.method static synthetic access$200(Landroid/support/design/widget/AppBarLayout;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/AppBarLayout;

    .prologue
    .line 96
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout;->mListeners:Ljava/util/List;

    return-object v0
.end method

.method private setWindowInsets(Landroid/support/v4/view/WindowInsetsCompat;)V
    .registers 6
    .param p1, "insets"    # Landroid/support/v4/view/WindowInsetsCompat;

    .prologue
    .line 421
    const/4 v3, -0x1

    iput v3, p0, Landroid/support/design/widget/AppBarLayout;->mTotalScrollRange:I

    .line 422
    iput-object p1, p0, Landroid/support/design/widget/AppBarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    .line 425
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v2

    .local v2, "z":I
    :goto_a
    if-ge v1, v2, :cond_1a

    .line 426
    invoke-virtual {p0, v1}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 427
    .local v0, "child":Landroid/view/View;
    invoke-static {v0, p1}, Landroid/support/v4/view/ViewCompat;->dispatchApplyWindowInsets(Landroid/view/View;Landroid/support/v4/view/WindowInsetsCompat;)Landroid/support/v4/view/WindowInsetsCompat;

    move-result-object p1

    .line 428
    invoke-virtual {p1}, Landroid/support/v4/view/WindowInsetsCompat;->isConsumed()Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 432
    .end local v0    # "child":Landroid/view/View;
    :cond_1a
    return-void

    .line 425
    .restart local v0    # "child":Landroid/view/View;
    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_a
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 228
    instance-of v0, p1, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    return v0
.end method

.method protected generateDefaultLayoutParams()Landroid/support/design/widget/AppBarLayout$LayoutParams;
    .registers 4

    .prologue
    .line 233
    new-instance v0, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/support/design/widget/AppBarLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .prologue
    .line 95
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->generateDefaultLayoutParams()Landroid/support/design/widget/AppBarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/widget/LinearLayout$LayoutParams;
    .registers 2

    .prologue
    .line 95
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->generateDefaultLayoutParams()Landroid/support/design/widget/AppBarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/design/widget/AppBarLayout$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 238
    new-instance v0, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/design/widget/AppBarLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/design/widget/AppBarLayout$LayoutParams;
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 243
    instance-of v0, p1, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_c

    .line 244
    new-instance v0, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .end local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/design/widget/AppBarLayout$LayoutParams;-><init>(Landroid/widget/LinearLayout$LayoutParams;)V

    .line 248
    :goto_b
    return-object v0

    .line 245
    .restart local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_c
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_18

    .line 246
    new-instance v0, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/design/widget/AppBarLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_b

    .line 248
    .restart local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_18
    new-instance v0, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/design/widget/AppBarLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_b
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "x0"    # Landroid/util/AttributeSet;

    .prologue
    .line 95
    invoke-virtual {p0, p1}, Landroid/support/design/widget/AppBarLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/design/widget/AppBarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "x0"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 95
    invoke-virtual {p0, p1}, Landroid/support/design/widget/AppBarLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/design/widget/AppBarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/LinearLayout$LayoutParams;
    .registers 3
    .param p1, "x0"    # Landroid/util/AttributeSet;

    .prologue
    .line 95
    invoke-virtual {p0, p1}, Landroid/support/design/widget/AppBarLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/design/widget/AppBarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;
    .registers 3
    .param p1, "x0"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 95
    invoke-virtual {p0, p1}, Landroid/support/design/widget/AppBarLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/design/widget/AppBarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method final getDownNestedPreScrollRange()I
    .registers 9

    .prologue
    .line 310
    iget v6, p0, Landroid/support/design/widget/AppBarLayout;->mDownPreScrollRange:I

    const/4 v7, -0x1

    if-eq v6, v7, :cond_8

    .line 312
    iget v5, p0, Landroid/support/design/widget/AppBarLayout;->mDownPreScrollRange:I

    .line 339
    :goto_7
    return v5

    .line 315
    :cond_8
    const/4 v5, 0x0

    .line 316
    .local v5, "range":I
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v6

    add-int/lit8 v3, v6, -0x1

    .local v3, "i":I
    :goto_f
    if-ltz v3, :cond_41

    .line 317
    invoke-virtual {p0, v3}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 318
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    .line 319
    .local v4, "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_38

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 322
    .local v1, "childHeight":I
    :goto_25
    iget v2, v4, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollFlags:I

    .line 324
    .local v2, "flags":I
    and-int/lit8 v6, v2, 0x5

    const/4 v7, 0x5

    if-ne v6, v7, :cond_3f

    .line 326
    and-int/lit8 v6, v2, 0x8

    if-eqz v6, :cond_3d

    .line 328
    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v6

    add-int/2addr v5, v6

    .line 316
    :cond_35
    :goto_35
    add-int/lit8 v3, v3, -0x1

    goto :goto_f

    .line 319
    .end local v1    # "childHeight":I
    .end local v2    # "flags":I
    :cond_38
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    goto :goto_25

    .line 331
    .restart local v1    # "childHeight":I
    .restart local v2    # "flags":I
    :cond_3d
    add-int/2addr v5, v1

    goto :goto_35

    .line 333
    :cond_3f
    if-lez v5, :cond_35

    .line 339
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childHeight":I
    .end local v2    # "flags":I
    .end local v4    # "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    :cond_41
    iput v5, p0, Landroid/support/design/widget/AppBarLayout;->mDownPreScrollRange:I

    goto :goto_7
.end method

.method final getDownNestedScrollRange()I
    .registers 10

    .prologue
    .line 346
    iget v7, p0, Landroid/support/design/widget/AppBarLayout;->mDownScrollRange:I

    const/4 v8, -0x1

    if-eq v7, v8, :cond_8

    .line 348
    iget v5, p0, Landroid/support/design/widget/AppBarLayout;->mDownScrollRange:I

    .line 377
    :goto_7
    return v5

    .line 351
    :cond_8
    const/4 v5, 0x0

    .line 352
    .local v5, "range":I
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v6

    .local v6, "z":I
    :goto_e
    if-ge v3, v6, :cond_3d

    .line 353
    invoke-virtual {p0, v3}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 354
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    .line 355
    .local v4, "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_35

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 359
    .local v1, "childHeight":I
    :goto_24
    iget v2, v4, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollFlags:I

    .line 361
    .local v2, "flags":I
    and-int/lit8 v7, v2, 0x1

    if-eqz v7, :cond_3d

    .line 363
    add-int/2addr v5, v1

    .line 365
    and-int/lit8 v7, v2, 0x2

    if-eqz v7, :cond_3a

    .line 369
    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v7

    sub-int/2addr v5, v7

    goto :goto_7

    .line 355
    .end local v1    # "childHeight":I
    .end local v2    # "flags":I
    :cond_35
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    goto :goto_24

    .line 352
    .restart local v1    # "childHeight":I
    .restart local v2    # "flags":I
    :cond_3a
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 377
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childHeight":I
    .end local v2    # "flags":I
    .end local v4    # "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    :cond_3d
    iput v5, p0, Landroid/support/design/widget/AppBarLayout;->mDownScrollRange:I

    goto :goto_7
.end method

.method final getMinimumHeightForVisibleOverlappingContent()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 381
    iget-object v4, p0, Landroid/support/design/widget/AppBarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    if-eqz v4, :cond_15

    iget-object v4, p0, Landroid/support/design/widget/AppBarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v4}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v2

    .line 382
    .local v2, "topInset":I
    :goto_b
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v1

    .line 383
    .local v1, "minHeight":I
    if-eqz v1, :cond_17

    .line 385
    mul-int/lit8 v3, v1, 0x2

    add-int/2addr v3, v2

    .line 390
    :cond_14
    :goto_14
    return v3

    .end local v1    # "minHeight":I
    .end local v2    # "topInset":I
    :cond_15
    move v2, v3

    .line 381
    goto :goto_b

    .line 389
    .restart local v1    # "minHeight":I
    .restart local v2    # "topInset":I
    :cond_17
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v0

    .line 390
    .local v0, "childCount":I
    const/4 v4, 0x1

    if-lt v0, v4, :cond_14

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {p0, v3}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    add-int/2addr v3, v2

    goto :goto_14
.end method

.method public getTargetElevation()F
    .registers 2

    .prologue
    .line 416
    iget v0, p0, Landroid/support/design/widget/AppBarLayout;->mTargetElevation:F

    return v0
.end method

.method public final getTotalScrollRange()I
    .registers 11

    .prologue
    .line 261
    iget v8, p0, Landroid/support/design/widget/AppBarLayout;->mTotalScrollRange:I

    const/4 v9, -0x1

    if-eq v8, v9, :cond_8

    .line 262
    iget v8, p0, Landroid/support/design/widget/AppBarLayout;->mTotalScrollRange:I

    .line 292
    :goto_7
    return v8

    .line 265
    :cond_8
    const/4 v5, 0x0

    .line 266
    .local v5, "range":I
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v7

    .local v7, "z":I
    :goto_e
    if-ge v3, v7, :cond_34

    .line 267
    invoke-virtual {p0, v3}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 268
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    .line 269
    .local v4, "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_43

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 272
    .local v1, "childHeight":I
    :goto_24
    iget v2, v4, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollFlags:I

    .line 274
    .local v2, "flags":I
    and-int/lit8 v8, v2, 0x1

    if-eqz v8, :cond_34

    .line 276
    add-int/2addr v5, v1

    .line 278
    and-int/lit8 v8, v2, 0x2

    if-eqz v8, :cond_48

    .line 282
    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v8

    sub-int/2addr v5, v8

    .line 291
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childHeight":I
    .end local v2    # "flags":I
    .end local v4    # "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    :cond_34
    iget-object v8, p0, Landroid/support/design/widget/AppBarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    if-eqz v8, :cond_4b

    iget-object v8, p0, Landroid/support/design/widget/AppBarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v8}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v6

    .line 292
    .local v6, "top":I
    :goto_3e
    sub-int v8, v5, v6

    iput v8, p0, Landroid/support/design/widget/AppBarLayout;->mTotalScrollRange:I

    goto :goto_7

    .line 269
    .end local v6    # "top":I
    .restart local v0    # "child":Landroid/view/View;
    .restart local v4    # "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    :cond_43
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    goto :goto_24

    .line 266
    .restart local v1    # "childHeight":I
    .restart local v2    # "flags":I
    :cond_48
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 291
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childHeight":I
    .end local v2    # "flags":I
    .end local v4    # "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    :cond_4b
    const/4 v6, 0x0

    goto :goto_3e
.end method

.method final getUpNestedPreScrollRange()I
    .registers 2

    .prologue
    .line 303
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    return v0
.end method

.method final hasChildWithInterpolator()Z
    .registers 2

    .prologue
    .line 252
    iget-boolean v0, p0, Landroid/support/design/widget/AppBarLayout;->mHaveChildWithInterpolator:Z

    return v0
.end method

.method final hasScrollableChildren()Z
    .registers 2

    .prologue
    .line 296
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected onLayout(ZIIII)V
    .registers 12
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/4 v5, -0x1

    .line 197
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 200
    iput v5, p0, Landroid/support/design/widget/AppBarLayout;->mTotalScrollRange:I

    .line 201
    iput v5, p0, Landroid/support/design/widget/AppBarLayout;->mDownPreScrollRange:I

    .line 202
    iput v5, p0, Landroid/support/design/widget/AppBarLayout;->mDownPreScrollRange:I

    .line 204
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/support/design/widget/AppBarLayout;->mHaveChildWithInterpolator:Z

    .line 205
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v4

    .local v4, "z":I
    :goto_12
    if-ge v2, v4, :cond_27

    .line 206
    invoke-virtual {p0, v2}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 207
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    .line 208
    .local v1, "childLp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    invoke-virtual {v1}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->getScrollInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v3

    .line 210
    .local v3, "interpolator":Landroid/view/animation/Interpolator;
    if-eqz v3, :cond_28

    .line 211
    const/4 v5, 0x1

    iput-boolean v5, p0, Landroid/support/design/widget/AppBarLayout;->mHaveChildWithInterpolator:Z

    .line 215
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childLp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    .end local v3    # "interpolator":Landroid/view/animation/Interpolator;
    :cond_27
    return-void

    .line 205
    .restart local v0    # "child":Landroid/view/View;
    .restart local v1    # "childLp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    .restart local v3    # "interpolator":Landroid/view/animation/Interpolator;
    :cond_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_12
.end method

.method public setOrientation(I)V
    .registers 4
    .param p1, "orientation"    # I

    .prologue
    .line 219
    const/4 v0, 0x1

    if-eq p1, v0, :cond_b

    .line 220
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "AppBarLayout is always vertical and does not support horizontal orientation"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 223
    :cond_b
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 224
    return-void
.end method

.method public setTargetElevation(F)V
    .registers 2
    .param p1, "elevation"    # F

    .prologue
    .line 408
    iput p1, p0, Landroid/support/design/widget/AppBarLayout;->mTargetElevation:F

    .line 409
    return-void
.end method
