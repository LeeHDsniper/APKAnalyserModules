.class public Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "CoordinatorLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/CoordinatorLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field public anchorGravity:I

.field public gravity:I

.field public keyline:I

.field mAnchorDirectChild:Landroid/view/View;

.field mAnchorId:I

.field mAnchorView:Landroid/view/View;

.field mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

.field mBehaviorResolved:Z

.field mBehaviorTag:Ljava/lang/Object;

.field private mDidAcceptNestedScroll:Z

.field private mDidBlockInteraction:Z

.field private mDidChangeAfterNestedScroll:Z

.field final mLastChildRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(II)V
    .registers 5
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v1, -0x1

    const/4 v0, 0x0

    .line 2178
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 2138
    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorResolved:Z

    .line 2145
    iput v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->gravity:I

    .line 2151
    iput v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->anchorGravity:I

    .line 2158
    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->keyline:I

    .line 2164
    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    .line 2173
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mLastChildRect:Landroid/graphics/Rect;

    .line 2179
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 2182
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2138
    iput-boolean v2, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorResolved:Z

    .line 2145
    iput v2, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->gravity:I

    .line 2151
    iput v2, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->anchorGravity:I

    .line 2158
    iput v3, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->keyline:I

    .line 2164
    iput v3, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    .line 2173
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mLastChildRect:Landroid/graphics/Rect;

    .line 2184
    sget-object v1, Landroid/support/design/R$styleable;->CoordinatorLayout_LayoutParams:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 2187
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/design/R$styleable;->CoordinatorLayout_LayoutParams_android_layout_gravity:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->gravity:I

    .line 2190
    sget v1, Landroid/support/design/R$styleable;->CoordinatorLayout_LayoutParams_layout_anchor:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    .line 2192
    sget v1, Landroid/support/design/R$styleable;->CoordinatorLayout_LayoutParams_layout_anchorGravity:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->anchorGravity:I

    .line 2196
    sget v1, Landroid/support/design/R$styleable;->CoordinatorLayout_LayoutParams_layout_keyline:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->keyline:I

    .line 2199
    sget v1, Landroid/support/design/R$styleable;->CoordinatorLayout_LayoutParams_layout_behavior:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    iput-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorResolved:Z

    .line 2201
    iget-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorResolved:Z

    if-eqz v1, :cond_54

    .line 2202
    sget v1, Landroid/support/design/R$styleable;->CoordinatorLayout_LayoutParams_layout_behavior:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, p2, v1}, Landroid/support/design/widget/CoordinatorLayout;->parseBehavior(Landroid/content/Context;Landroid/util/AttributeSet;Ljava/lang/String;)Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v1

    iput-object v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    .line 2206
    :cond_54
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 2207
    return-void
.end method

.method public constructor <init>(Landroid/support/design/widget/CoordinatorLayout$LayoutParams;)V
    .registers 4
    .param p1, "p"    # Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .prologue
    const/4 v1, -0x1

    const/4 v0, 0x0

    .line 2210
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 2138
    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorResolved:Z

    .line 2145
    iput v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->gravity:I

    .line 2151
    iput v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->anchorGravity:I

    .line 2158
    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->keyline:I

    .line 2164
    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    .line 2173
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mLastChildRect:Landroid/graphics/Rect;

    .line 2211
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v1, -0x1

    const/4 v0, 0x0

    .line 2218
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2138
    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorResolved:Z

    .line 2145
    iput v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->gravity:I

    .line 2151
    iput v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->anchorGravity:I

    .line 2158
    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->keyline:I

    .line 2164
    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    .line 2173
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mLastChildRect:Landroid/graphics/Rect;

    .line 2219
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 4
    .param p1, "p"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .prologue
    const/4 v1, -0x1

    const/4 v0, 0x0

    .line 2214
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 2138
    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorResolved:Z

    .line 2145
    iput v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->gravity:I

    .line 2151
    iput v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->anchorGravity:I

    .line 2158
    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->keyline:I

    .line 2164
    iput v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    .line 2173
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mLastChildRect:Landroid/graphics/Rect;

    .line 2215
    return-void
.end method

.method private resolveAnchorView(Landroid/view/View;Landroid/support/design/widget/CoordinatorLayout;)V
    .registers 9
    .param p1, "forChild"    # Landroid/view/View;
    .param p2, "parent"    # Landroid/support/design/widget/CoordinatorLayout;

    .prologue
    const/4 v3, 0x0

    .line 2433
    iget v2, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    invoke-virtual {p2, v2}, Landroid/support/design/widget/CoordinatorLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    .line 2434
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    if-eqz v2, :cond_3d

    .line 2435
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    .line 2436
    .local v0, "directChild":Landroid/view/View;
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 2437
    .local v1, "p":Landroid/view/ViewParent;
    :goto_15
    if-eq v1, p2, :cond_3a

    if-eqz v1, :cond_3a

    .line 2439
    if-ne v1, p1, :cond_2e

    .line 2440
    invoke-virtual {p2}, Landroid/support/design/widget/CoordinatorLayout;->isInEditMode()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 2441
    iput-object v3, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorDirectChild:Landroid/view/View;

    iput-object v3, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    .line 2461
    .end local v0    # "directChild":Landroid/view/View;
    .end local v1    # "p":Landroid/view/ViewParent;
    :goto_25
    return-void

    .line 2444
    .restart local v0    # "directChild":Landroid/view/View;
    .restart local v1    # "p":Landroid/view/ViewParent;
    :cond_26
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Anchor must not be a descendant of the anchored view"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2447
    :cond_2e
    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_35

    move-object v0, v1

    .line 2448
    check-cast v0, Landroid/view/View;

    .line 2438
    :cond_35
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto :goto_15

    .line 2451
    :cond_3a
    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorDirectChild:Landroid/view/View;

    goto :goto_25

    .line 2453
    .end local v0    # "directChild":Landroid/view/View;
    .end local v1    # "p":Landroid/view/ViewParent;
    :cond_3d
    invoke-virtual {p2}, Landroid/support/design/widget/CoordinatorLayout;->isInEditMode()Z

    move-result v2

    if-eqz v2, :cond_48

    .line 2454
    iput-object v3, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorDirectChild:Landroid/view/View;

    iput-object v3, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    goto :goto_25

    .line 2457
    :cond_48
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not find CoordinatorLayout descendant view with id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Landroid/support/design/widget/CoordinatorLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v5, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to anchor view "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private verifyAnchorView(Landroid/view/View;Landroid/support/design/widget/CoordinatorLayout;)Z
    .registers 8
    .param p1, "forChild"    # Landroid/view/View;
    .param p2, "parent"    # Landroid/support/design/widget/CoordinatorLayout;

    .prologue
    const/4 v2, 0x0

    .line 2469
    iget-object v3, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v3

    iget v4, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    if-eq v3, v4, :cond_c

    .line 2486
    :goto_b
    return v2

    .line 2473
    :cond_c
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    .line 2474
    .local v0, "directChild":Landroid/view/View;
    iget-object v3, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 2475
    .local v1, "p":Landroid/view/ViewParent;
    :goto_14
    if-eq v1, p2, :cond_2c

    .line 2477
    if-eqz v1, :cond_1a

    if-ne v1, p1, :cond_20

    .line 2478
    :cond_1a
    const/4 v3, 0x0

    iput-object v3, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorDirectChild:Landroid/view/View;

    iput-object v3, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    goto :goto_b

    .line 2481
    :cond_20
    instance-of v3, v1, Landroid/view/View;

    if-eqz v3, :cond_27

    move-object v0, v1

    .line 2482
    check-cast v0, Landroid/view/View;

    .line 2476
    :cond_27
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto :goto_14

    .line 2485
    :cond_2c
    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorDirectChild:Landroid/view/View;

    .line 2486
    const/4 v2, 0x1

    goto :goto_b
.end method


# virtual methods
.method acceptNestedScroll(Z)V
    .registers 2
    .param p1, "accept"    # Z

    .prologue
    .line 2351
    iput-boolean p1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidAcceptNestedScroll:Z

    .line 2352
    return-void
.end method

.method checkAnchorChanged()Z
    .registers 3

    .prologue
    .line 2297
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    if-nez v0, :cond_b

    iget v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method dependsOn(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .registers 5
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "dependency"    # Landroid/view/View;

    .prologue
    .line 2379
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorDirectChild:Landroid/view/View;

    if-eq p3, v0, :cond_10

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->layoutDependsOn(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method didBlockInteraction()Z
    .registers 2

    .prologue
    .line 2308
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    if-nez v0, :cond_7

    .line 2309
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidBlockInteraction:Z

    .line 2311
    :cond_7
    iget-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidBlockInteraction:Z

    return v0
.end method

.method findAnchorView(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Landroid/view/View;
    .registers 6
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "forChild"    # Landroid/view/View;

    .prologue
    const/4 v0, 0x0

    .line 2403
    iget v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorId:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_b

    .line 2404
    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorDirectChild:Landroid/view/View;

    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    .line 2411
    :goto_a
    return-object v0

    .line 2408
    :cond_b
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    if-eqz v0, :cond_15

    invoke-direct {p0, p2, p1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->verifyAnchorView(Landroid/view/View;Landroid/support/design/widget/CoordinatorLayout;)Z

    move-result v0

    if-nez v0, :cond_18

    .line 2409
    :cond_15
    invoke-direct {p0, p2, p1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->resolveAnchorView(Landroid/view/View;Landroid/support/design/widget/CoordinatorLayout;)V

    .line 2411
    :cond_18
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    goto :goto_a
.end method

.method public getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .registers 2

    .prologue
    .line 2256
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    return-object v0
.end method

.method getChangedAfterNestedScroll()Z
    .registers 2

    .prologue
    .line 2359
    iget-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidChangeAfterNestedScroll:Z

    return v0
.end method

.method getLastChildRect()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 2289
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mLastChildRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method isBlockingInteractionBelow(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Z
    .registers 5
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;

    .prologue
    .line 2326
    iget-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidBlockInteraction:Z

    if-eqz v0, :cond_6

    .line 2327
    const/4 v0, 0x1

    .line 2330
    :goto_5
    return v0

    :cond_6
    iget-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidBlockInteraction:Z

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    if-eqz v0, :cond_16

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    invoke-virtual {v0, p1, p2}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->blocksInteractionBelow(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Z

    move-result v0

    :goto_12
    or-int/2addr v0, v1

    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidBlockInteraction:Z

    goto :goto_5

    :cond_16
    const/4 v0, 0x0

    goto :goto_12
.end method

.method isDirty(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Z
    .registers 4
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;

    .prologue
    .line 2425
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    invoke-virtual {v0, p1, p2}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->isDirty(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method isNestedScrollAccepted()Z
    .registers 2

    .prologue
    .line 2355
    iget-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidAcceptNestedScroll:Z

    return v0
.end method

.method resetChangedAfterNestedScroll()V
    .registers 2

    .prologue
    .line 2367
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidChangeAfterNestedScroll:Z

    .line 2368
    return-void
.end method

.method resetNestedScroll()V
    .registers 2

    .prologue
    .line 2347
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidAcceptNestedScroll:Z

    .line 2348
    return-void
.end method

.method resetTouchBehaviorTracking()V
    .registers 2

    .prologue
    .line 2343
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidBlockInteraction:Z

    .line 2344
    return-void
.end method

.method public setBehavior(Landroid/support/design/widget/CoordinatorLayout$Behavior;)V
    .registers 3
    .param p1, "behavior"    # Landroid/support/design/widget/CoordinatorLayout$Behavior;

    .prologue
    .line 2269
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    if-eq v0, p1, :cond_c

    .line 2270
    iput-object p1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    .line 2271
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorTag:Ljava/lang/Object;

    .line 2272
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorResolved:Z

    .line 2274
    :cond_c
    return-void
.end method

.method setChangedAfterNestedScroll(Z)V
    .registers 2
    .param p1, "changed"    # Z

    .prologue
    .line 2363
    iput-boolean p1, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mDidChangeAfterNestedScroll:Z

    .line 2364
    return-void
.end method

.method setLastChildRect(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "r"    # Landroid/graphics/Rect;

    .prologue
    .line 2281
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mLastChildRect:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 2282
    return-void
.end method
