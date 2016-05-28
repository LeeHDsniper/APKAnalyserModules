.class Lit/sephiroth/android/library/tooltip/TooltipView;
.super Landroid/view/ViewGroup;
.source "TooltipView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;,
        Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;
    }
.end annotation


# instance fields
.field private final activateDelay:J

.field activateRunnable:Ljava/lang/Runnable;

.field private final closeCallback:Lit/sephiroth/android/library/tooltip/TooltipManager$onTooltipClosingCallback;

.field private closeListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;

.field private final closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

.field private final drawRect:Landroid/graphics/Rect;

.field private final fadeDuration:J

.field gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

.field private final hideArrow:Z

.field hideRunnable:Ljava/lang/Runnable;

.field private mActivated:Z

.field private mAttached:Z

.field private final mDrawable:Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;

.field private mInitialized:Z

.field mShowAnimation:Lcom/nineoldandroids/animation/Animator;

.field mShowing:Z

.field private mTextView:Landroid/widget/TextView;

.field private mView:Landroid/view/View;

.field private final maxWidth:I

.field private padding:I

.field private final point:Landroid/graphics/Point;

.field private final restrict:Z

.field private final showDelay:J

.field private final showDuration:J

.field private final targetView:Landroid/view/View;

.field private final tempRect:Landroid/graphics/Rect;

.field private text:Ljava/lang/CharSequence;

.field private final textResId:I

.field private final toolTipId:I

.field private tooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

.field private final topRule:I

.field private final viewRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "builder"    # Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    .prologue
    const/4 v5, 0x0

    .line 67
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 199
    new-instance v1, Lit/sephiroth/android/library/tooltip/TooltipView$2;

    invoke-direct {v1, p0}, Lit/sephiroth/android/library/tooltip/TooltipView$2;-><init>(Lit/sephiroth/android/library/tooltip/TooltipView;)V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->activateRunnable:Ljava/lang/Runnable;

    .line 207
    new-instance v1, Lit/sephiroth/android/library/tooltip/TooltipView$3;

    invoke-direct {v1, p0}, Lit/sephiroth/android/library/tooltip/TooltipView$3;-><init>(Lit/sephiroth/android/library/tooltip/TooltipView;)V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->hideRunnable:Ljava/lang/Runnable;

    .line 69
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget-object v2, Lit/sephiroth/android/library/tooltip/R$styleable;->TooltipLayout:[I

    iget v3, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->defStyleAttr:I

    iget v4, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->defStyleRes:I

    invoke-virtual {v1, v5, v2, v3, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 70
    .local v0, "theme":Landroid/content/res/TypedArray;
    sget v1, Lit/sephiroth/android/library/tooltip/R$styleable;->TooltipLayout_ttlm_padding:I

    const/16 v2, 0x1e

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    .line 71
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 73
    iget v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->id:I

    iput v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->toolTipId:I

    .line 74
    iget-object v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->text:Ljava/lang/CharSequence;

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->text:Ljava/lang/CharSequence;

    .line 75
    iget-object v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    .line 76
    iget v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->textResId:I

    iput v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->textResId:I

    .line 77
    iget v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->maxWidth:I

    iput v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->maxWidth:I

    .line 78
    iget v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->actionbarSize:I

    iput v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->topRule:I

    .line 79
    iget-object v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    .line 80
    iget-wide v2, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->showDuration:J

    iput-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->showDuration:J

    .line 81
    iget-wide v2, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->showDelay:J

    iput-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->showDelay:J

    .line 82
    iget-boolean v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->hideArrow:Z

    iput-boolean v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->hideArrow:Z

    .line 83
    iget-wide v2, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->activateDelay:J

    iput-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->activateDelay:J

    .line 84
    iget-object v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->view:Landroid/view/View;

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->targetView:Landroid/view/View;

    .line 85
    iget-boolean v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->restrictToScreenEdges:Z

    iput-boolean v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->restrict:Z

    .line 86
    iget-wide v2, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->fadeDuration:J

    iput-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->fadeDuration:J

    .line 87
    iget-object v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->closeCallback:Lit/sephiroth/android/library/tooltip/TooltipManager$onTooltipClosingCallback;

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closeCallback:Lit/sephiroth/android/library/tooltip/TooltipManager$onTooltipClosingCallback;

    .line 89
    iget-object v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->point:Landroid/graphics/Point;

    if-eqz v1, :cond_a4

    .line 90
    new-instance v1, Landroid/graphics/Point;

    iget-object v2, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->point:Landroid/graphics/Point;

    invoke-direct {v1, v2}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->point:Landroid/graphics/Point;

    .line 91
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->point:Landroid/graphics/Point;

    iget v2, v1, Landroid/graphics/Point;->y:I

    iget v3, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->topRule:I

    add-int/2addr v2, v3

    iput v2, v1, Landroid/graphics/Point;->y:I

    .line 97
    :goto_7f
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    .line 98
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    .line 99
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tempRect:Landroid/graphics/Rect;

    .line 101
    iget-boolean v1, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->isCustomView:Z

    if-nez v1, :cond_a7

    .line 102
    new-instance v1, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;

    invoke-direct {v1, p1, p2}, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;-><init>(Landroid/content/Context;Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;)V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mDrawable:Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;

    .line 108
    :goto_9f
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->setVisibility(I)V

    .line 109
    return-void

    .line 94
    :cond_a4
    iput-object v5, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->point:Landroid/graphics/Point;

    goto :goto_7f

    .line 105
    :cond_a7
    iput-object v5, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mDrawable:Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;

    goto :goto_9f
.end method

.method static synthetic access$000(Lit/sephiroth/android/library/tooltip/TooltipView;)Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;
    .registers 2
    .param p0, "x0"    # Lit/sephiroth/android/library/tooltip/TooltipView;

    .prologue
    .line 31
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    return-object v0
.end method

.method static synthetic access$100(Lit/sephiroth/android/library/tooltip/TooltipView;)J
    .registers 3
    .param p0, "x0"    # Lit/sephiroth/android/library/tooltip/TooltipView;

    .prologue
    .line 31
    iget-wide v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->activateDelay:J

    return-wide v0
.end method

.method static synthetic access$202(Lit/sephiroth/android/library/tooltip/TooltipView;Z)Z
    .registers 2
    .param p0, "x0"    # Lit/sephiroth/android/library/tooltip/TooltipView;
    .param p1, "x1"    # Z

    .prologue
    .line 31
    iput-boolean p1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mActivated:Z

    return p1
.end method

.method static synthetic access$300(Lit/sephiroth/android/library/tooltip/TooltipView;ZZ)V
    .registers 3
    .param p0, "x0"    # Lit/sephiroth/android/library/tooltip/TooltipView;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lit/sephiroth/android/library/tooltip/TooltipView;->onClose(ZZ)V

    return-void
.end method

.method static synthetic access$400(Lit/sephiroth/android/library/tooltip/TooltipView;)V
    .registers 1
    .param p0, "x0"    # Lit/sephiroth/android/library/tooltip/TooltipView;

    .prologue
    .line 31
    invoke-direct {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->fireOnHideCompleted()V

    return-void
.end method

.method private calculatePositions(Ljava/util/List;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "gravities":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;>;"
    const/4 v8, 0x0

    .line 424
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->isAttached()Z

    move-result v7

    if-nez v7, :cond_8

    .line 631
    :cond_7
    :goto_7
    return-void

    .line 429
    :cond_8
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    const/4 v9, 0x1

    if-ge v7, v9, :cond_1e

    .line 430
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    if-eqz v7, :cond_18

    .line 431
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    invoke-interface {v7, p0}, Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;->onShowFailed(Lit/sephiroth/android/library/tooltip/TooltipView;)V

    .line 433
    :cond_18
    const/16 v7, 0x8

    invoke-virtual {p0, v7}, Lit/sephiroth/android/library/tooltip/TooltipView;->setVisibility(I)V

    goto :goto_7

    .line 437
    :cond_1e
    invoke-interface {p1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    .line 441
    .local v0, "gravity":Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;
    invoke-interface {p1, v8}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 443
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 444
    .local v3, "screenRect":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getContext()Landroid/content/Context;

    move-result-object v7

    check-cast v7, Landroid/app/Activity;

    invoke-virtual {v7}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v6

    .line 445
    .local v6, "window":Landroid/view/Window;
    invoke-virtual {v6}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 447
    iget v4, v3, Landroid/graphics/Rect;->top:I

    .line 453
    .local v4, "statusbarHeight":I
    iget v7, v3, Landroid/graphics/Rect;->top:I

    iget v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->topRule:I

    add-int/2addr v7, v9

    iput v7, v3, Landroid/graphics/Rect;->top:I

    .line 456
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->targetView:Landroid/view/View;

    if-eqz v7, :cond_c1

    .line 457
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->targetView:Landroid/view/View;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v7, v9}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 463
    :goto_51
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v5

    .line 464
    .local v5, "width":I
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 467
    .local v1, "height":I
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 470
    .local v2, "point":Landroid/graphics/Point;
    sget-object v7, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->BOTTOM:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v0, v7, :cond_172

    .line 471
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v9}, Landroid/graphics/Rect;->centerX()I

    move-result v9

    div-int/lit8 v10, v5, 0x2

    sub-int/2addr v9, v10

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    iget-object v11, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v11}, Landroid/graphics/Rect;->centerX()I

    move-result v11

    div-int/lit8 v12, v5, 0x2

    add-int/2addr v11, v12

    iget-object v12, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v12, v12, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v12, v1

    invoke-virtual {v7, v9, v10, v11, v12}, Landroid/graphics/Rect;->set(IIII)V

    .line 476
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerX()I

    move-result v7

    iput v7, v2, Landroid/graphics/Point;->x:I

    .line 477
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    iput v7, v2, Landroid/graphics/Point;->y:I

    .line 479
    iget-boolean v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->restrict:Z

    if-eqz v7, :cond_101

    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v7}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v7

    if-nez v7, :cond_101

    .line 480
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iget v9, v3, Landroid/graphics/Rect;->right:I

    if-le v7, v9, :cond_da

    .line 481
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->right:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->right:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v9, v8}, Landroid/graphics/Rect;->offset(II)V

    .line 486
    :cond_b4
    :goto_b4
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    iget v9, v3, Landroid/graphics/Rect;->bottom:I

    if-le v7, v9, :cond_ed

    .line 488
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->calculatePositions(Ljava/util/List;)V

    goto/16 :goto_7

    .line 460
    .end local v1    # "height":I
    .end local v2    # "point":Landroid/graphics/Point;
    .end local v5    # "width":I
    :cond_c1
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->point:Landroid/graphics/Point;

    iget v9, v9, Landroid/graphics/Point;->x:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    add-int/2addr v10, v4

    iget-object v11, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->point:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    iget-object v12, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->point:Landroid/graphics/Point;

    iget v12, v12, Landroid/graphics/Point;->y:I

    add-int/2addr v12, v4

    invoke-virtual {v7, v9, v10, v11, v12}, Landroid/graphics/Rect;->set(IIII)V

    goto/16 :goto_51

    .line 483
    .restart local v1    # "height":I
    .restart local v2    # "point":Landroid/graphics/Point;
    .restart local v5    # "width":I
    :cond_da
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    iget v9, v3, Landroid/graphics/Rect;->left:I

    if-ge v7, v9, :cond_b4

    .line 484
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->left:I

    neg-int v9, v9

    invoke-virtual {v7, v9, v8}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_b4

    .line 490
    :cond_ed
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    iget v9, v3, Landroid/graphics/Rect;->top:I

    if-ge v7, v9, :cond_101

    .line 491
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->top:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->top:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Rect;->offset(II)V

    .line 598
    :cond_101
    :goto_101
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->left:I

    int-to-float v9, v9

    invoke-static {v7, v9}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    .line 599
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    int-to-float v9, v9

    invoke-static {v7, v9}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationY(Landroid/view/View;F)V

    .line 601
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mDrawable:Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;

    if-eqz v7, :cond_7

    .line 603
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tempRect:Landroid/graphics/Rect;

    invoke-virtual {v7, v9}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 605
    iget v7, v2, Landroid/graphics/Point;->x:I

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tempRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->left:I

    sub-int/2addr v7, v9

    iput v7, v2, Landroid/graphics/Point;->x:I

    .line 606
    iget v7, v2, Landroid/graphics/Point;->y:I

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tempRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    sub-int/2addr v7, v9

    iput v7, v2, Landroid/graphics/Point;->y:I

    .line 611
    sget-boolean v7, Lcom/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    if-eqz v7, :cond_148

    .line 612
    iget v7, v2, Landroid/graphics/Point;->x:I

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->left:I

    sub-int/2addr v7, v9

    iput v7, v2, Landroid/graphics/Point;->x:I

    .line 613
    iget v7, v2, Landroid/graphics/Point;->y:I

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    sub-int/2addr v7, v9

    iput v7, v2, Landroid/graphics/Point;->y:I

    .line 616
    :cond_148
    iget-boolean v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->hideArrow:Z

    if-nez v7, :cond_15d

    .line 617
    sget-object v7, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->LEFT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-eq v0, v7, :cond_154

    sget-object v7, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->RIGHT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v0, v7, :cond_3b2

    .line 618
    :cond_154
    iget v7, v2, Landroid/graphics/Point;->y:I

    iget v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    div-int/lit8 v9, v9, 0x2

    sub-int/2addr v7, v9

    iput v7, v2, Landroid/graphics/Point;->y:I

    .line 625
    :cond_15d
    :goto_15d
    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mDrawable:Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;

    iget-boolean v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->hideArrow:Z

    if-eqz v7, :cond_3c5

    move v7, v8

    :goto_164
    invoke-virtual {v9, v0, v7}, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->setAnchor(Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;I)V

    .line 627
    iget-boolean v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->hideArrow:Z

    if-nez v7, :cond_7

    .line 628
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mDrawable:Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;

    invoke-virtual {v7, v2}, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->setDestinationPoint(Landroid/graphics/Point;)V

    goto/16 :goto_7

    .line 495
    :cond_172
    sget-object v7, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->TOP:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v0, v7, :cond_1fa

    .line 496
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v9}, Landroid/graphics/Rect;->centerX()I

    move-result v9

    div-int/lit8 v10, v5, 0x2

    sub-int/2addr v9, v10

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->top:I

    sub-int/2addr v10, v1

    iget-object v11, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v11}, Landroid/graphics/Rect;->centerX()I

    move-result v11

    div-int/lit8 v12, v5, 0x2

    add-int/2addr v11, v12

    iget-object v12, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v12, v12, Landroid/graphics/Rect;->top:I

    invoke-virtual {v7, v9, v10, v11, v12}, Landroid/graphics/Rect;->set(IIII)V

    .line 501
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerX()I

    move-result v7

    iput v7, v2, Landroid/graphics/Point;->x:I

    .line 502
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    iput v7, v2, Landroid/graphics/Point;->y:I

    .line 504
    iget-boolean v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->restrict:Z

    if-eqz v7, :cond_101

    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v7}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v7

    if-nez v7, :cond_101

    .line 505
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iget v9, v3, Landroid/graphics/Rect;->right:I

    if-le v7, v9, :cond_1d1

    .line 506
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->right:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->right:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v9, v8}, Landroid/graphics/Rect;->offset(II)V

    .line 511
    :cond_1c4
    :goto_1c4
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    iget v9, v3, Landroid/graphics/Rect;->top:I

    if-ge v7, v9, :cond_1e4

    .line 513
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->calculatePositions(Ljava/util/List;)V

    goto/16 :goto_7

    .line 508
    :cond_1d1
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    iget v9, v3, Landroid/graphics/Rect;->left:I

    if-ge v7, v9, :cond_1c4

    .line 509
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->left:I

    neg-int v9, v9

    invoke-virtual {v7, v9, v8}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_1c4

    .line 515
    :cond_1e4
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    iget v9, v3, Landroid/graphics/Rect;->bottom:I

    if-le v7, v9, :cond_101

    .line 516
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->bottom:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Rect;->offset(II)V

    goto/16 :goto_101

    .line 520
    :cond_1fa
    sget-object v7, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->RIGHT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v0, v7, :cond_284

    .line 521
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->right:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v10}, Landroid/graphics/Rect;->centerY()I

    move-result v10

    div-int/lit8 v11, v1, 0x2

    sub-int/2addr v10, v11

    iget-object v11, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v11, v11, Landroid/graphics/Rect;->right:I

    add-int/2addr v11, v5

    iget-object v12, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v12}, Landroid/graphics/Rect;->centerY()I

    move-result v12

    div-int/lit8 v13, v1, 0x2

    add-int/2addr v12, v13

    invoke-virtual {v7, v9, v10, v11, v12}, Landroid/graphics/Rect;->set(IIII)V

    .line 526
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iput v7, v2, Landroid/graphics/Point;->x:I

    .line 527
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerY()I

    move-result v7

    iput v7, v2, Landroid/graphics/Point;->y:I

    .line 529
    iget-boolean v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->restrict:Z

    if-eqz v7, :cond_101

    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v7}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v7

    if-nez v7, :cond_101

    .line 530
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    iget v9, v3, Landroid/graphics/Rect;->bottom:I

    if-le v7, v9, :cond_259

    .line 531
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->bottom:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Rect;->offset(II)V

    .line 536
    :cond_24c
    :goto_24c
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iget v9, v3, Landroid/graphics/Rect;->right:I

    if-le v7, v9, :cond_26e

    .line 538
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->calculatePositions(Ljava/util/List;)V

    goto/16 :goto_7

    .line 533
    :cond_259
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    iget v9, v3, Landroid/graphics/Rect;->top:I

    if-ge v7, v9, :cond_24c

    .line 534
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->top:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->top:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_24c

    .line 540
    :cond_26e
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    iget v9, v3, Landroid/graphics/Rect;->left:I

    if-ge v7, v9, :cond_101

    .line 541
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->left:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->left:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v9, v8}, Landroid/graphics/Rect;->offset(II)V

    goto/16 :goto_101

    .line 545
    :cond_284
    sget-object v7, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->LEFT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v0, v7, :cond_312

    .line 546
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->left:I

    sub-int/2addr v9, v5

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v10}, Landroid/graphics/Rect;->centerY()I

    move-result v10

    div-int/lit8 v11, v1, 0x2

    sub-int/2addr v10, v11

    iget-object v11, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v11, v11, Landroid/graphics/Rect;->left:I

    iget-object v12, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v12}, Landroid/graphics/Rect;->centerY()I

    move-result v12

    div-int/lit8 v13, v1, 0x2

    add-int/2addr v12, v13

    invoke-virtual {v7, v9, v10, v11, v12}, Landroid/graphics/Rect;->set(IIII)V

    .line 551
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    iput v7, v2, Landroid/graphics/Point;->x:I

    .line 552
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerY()I

    move-result v7

    iput v7, v2, Landroid/graphics/Point;->y:I

    .line 554
    iget-boolean v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->restrict:Z

    if-eqz v7, :cond_101

    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v7}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v7

    if-nez v7, :cond_101

    .line 555
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    iget v9, v3, Landroid/graphics/Rect;->bottom:I

    if-le v7, v9, :cond_2e7

    .line 556
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->bottom:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Rect;->offset(II)V

    .line 561
    :cond_2d6
    :goto_2d6
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    iget v9, v3, Landroid/graphics/Rect;->left:I

    if-ge v7, v9, :cond_2fc

    .line 563
    sget-object v7, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->RIGHT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    iput-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    .line 564
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->calculatePositions(Ljava/util/List;)V

    goto/16 :goto_7

    .line 558
    :cond_2e7
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    iget v9, v3, Landroid/graphics/Rect;->top:I

    if-ge v7, v9, :cond_2d6

    .line 559
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->top:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->top:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_2d6

    .line 566
    :cond_2fc
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iget v9, v3, Landroid/graphics/Rect;->right:I

    if-le v7, v9, :cond_101

    .line 567
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->right:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->right:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v9, v8}, Landroid/graphics/Rect;->offset(II)V

    goto/16 :goto_101

    .line 570
    :cond_312
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    sget-object v9, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->CENTER:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v7, v9, :cond_101

    .line 571
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget-object v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v9}, Landroid/graphics/Rect;->centerX()I

    move-result v9

    div-int/lit8 v10, v5, 0x2

    sub-int/2addr v9, v10

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v10}, Landroid/graphics/Rect;->centerY()I

    move-result v10

    div-int/lit8 v11, v1, 0x2

    sub-int/2addr v10, v11

    iget-object v11, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v11}, Landroid/graphics/Rect;->centerX()I

    move-result v11

    div-int/lit8 v12, v5, 0x2

    sub-int/2addr v11, v12

    iget-object v12, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v12}, Landroid/graphics/Rect;->centerY()I

    move-result v12

    div-int/lit8 v13, v1, 0x2

    add-int/2addr v12, v13

    invoke-virtual {v7, v9, v10, v11, v12}, Landroid/graphics/Rect;->set(IIII)V

    .line 576
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerX()I

    move-result v7

    iput v7, v2, Landroid/graphics/Point;->x:I

    .line 577
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerY()I

    move-result v7

    iput v7, v2, Landroid/graphics/Point;->y:I

    .line 579
    iget-boolean v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->restrict:Z

    if-eqz v7, :cond_101

    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v7}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v7

    if-nez v7, :cond_101

    .line 580
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    iget v9, v3, Landroid/graphics/Rect;->bottom:I

    if-le v7, v9, :cond_387

    .line 581
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->bottom:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Rect;->offset(II)V

    .line 586
    :cond_371
    :goto_371
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iget v9, v3, Landroid/graphics/Rect;->right:I

    if-le v7, v9, :cond_39c

    .line 587
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->right:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->right:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v9, v8}, Landroid/graphics/Rect;->offset(II)V

    goto/16 :goto_101

    .line 583
    :cond_387
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    iget v9, v3, Landroid/graphics/Rect;->top:I

    if-ge v7, v9, :cond_371

    .line 584
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->top:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->top:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_371

    .line 589
    :cond_39c
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    iget v9, v3, Landroid/graphics/Rect;->left:I

    if-ge v7, v9, :cond_101

    .line 590
    iget-object v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v9, v3, Landroid/graphics/Rect;->left:I

    iget-object v10, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->left:I

    sub-int/2addr v9, v10

    invoke-virtual {v7, v9, v8}, Landroid/graphics/Rect;->offset(II)V

    goto/16 :goto_101

    .line 620
    :cond_3b2
    sget-object v7, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->TOP:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-eq v0, v7, :cond_3ba

    sget-object v7, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->BOTTOM:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v0, v7, :cond_15d

    .line 621
    :cond_3ba
    iget v7, v2, Landroid/graphics/Point;->x:I

    iget v9, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    div-int/lit8 v9, v9, 0x2

    sub-int/2addr v7, v9

    iput v7, v2, Landroid/graphics/Point;->x:I

    goto/16 :goto_15d

    .line 625
    :cond_3c5
    iget v7, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    div-int/lit8 v7, v7, 0x2

    goto/16 :goto_164
.end method

.method private fireOnHideCompleted()V
    .registers 2

    .prologue
    .line 302
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    if-eqz v0, :cond_9

    .line 303
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    invoke-interface {v0, p0}, Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;->onHideCompleted(Lit/sephiroth/android/library/tooltip/TooltipView;)V

    .line 305
    :cond_9
    return-void
.end method

.method private initializeView()V
    .registers 7

    .prologue
    const/4 v2, -0x2

    .line 394
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->isAttached()Z

    move-result v1

    if-eqz v1, :cond_b

    iget-boolean v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mInitialized:Z

    if-eqz v1, :cond_c

    .line 421
    :cond_b
    :goto_b
    return-void

    .line 395
    :cond_c
    const/4 v1, 0x1

    iput-boolean v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mInitialized:Z

    .line 399
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 401
    .local v0, "params":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iget v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->textResId:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    .line 402
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 404
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mDrawable:Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;

    if-eqz v1, :cond_4e

    .line 405
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mDrawable:Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 406
    iget-boolean v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->hideArrow:Z

    if-eqz v1, :cond_7a

    .line 407
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    iget v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    div-int/lit8 v2, v2, 0x2

    iget v3, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    div-int/lit8 v3, v3, 0x2

    iget v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    div-int/lit8 v4, v4, 0x2

    iget v5, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    div-int/lit8 v5, v5, 0x2

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 414
    :cond_4e
    :goto_4e
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    const v2, 0x1020014

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mTextView:Landroid/widget/TextView;

    .line 415
    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->text:Ljava/lang/CharSequence;

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 416
    iget v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->maxWidth:I

    const/4 v2, -0x1

    if-le v1, v2, :cond_74

    .line 417
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mTextView:Landroid/widget/TextView;

    iget v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->maxWidth:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 420
    :cond_74
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->addView(Landroid/view/View;)V

    goto :goto_b

    .line 410
    :cond_7a
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mView:Landroid/view/View;

    iget v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    iget v3, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    iget v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    iget v5, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->padding:I

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_4e
.end method

.method private onClose(ZZ)V
    .registers 5
    .param p1, "fromUser"    # Z
    .param p2, "containsTouch"    # Z

    .prologue
    .line 705
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-nez v0, :cond_7

    .line 717
    :cond_6
    :goto_6
    return-void

    .line 706
    :cond_7
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 708
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->hideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 710
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closeListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;

    if-eqz v0, :cond_1f

    .line 711
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closeListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;

    invoke-interface {v0, p0}, Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;->onClose(Lit/sephiroth/android/library/tooltip/TooltipView;)V

    .line 714
    :cond_1f
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closeCallback:Lit/sephiroth/android/library/tooltip/TooltipManager$onTooltipClosingCallback;

    if-eqz v0, :cond_6

    .line 715
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closeCallback:Lit/sephiroth/android/library/tooltip/TooltipManager$onTooltipClosingCallback;

    iget v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->toolTipId:I

    invoke-interface {v0, v1, p1, p2}, Lit/sephiroth/android/library/tooltip/TooltipManager$onTooltipClosingCallback;->onClosing(IZZ)V

    goto :goto_6
.end method


# virtual methods
.method protected fadeIn()V
    .registers 7

    .prologue
    const-wide/16 v4, 0x0

    .line 136
    iget-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowing:Z

    if-eqz v0, :cond_7

    .line 197
    :cond_6
    :goto_6
    return-void

    .line 138
    :cond_7
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    if-eqz v0, :cond_10

    .line 139
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    .line 144
    :cond_10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowing:Z

    .line 146
    iget-wide v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->fadeDuration:J

    cmp-long v0, v0, v4

    if-lez v0, :cond_65

    .line 147
    const-string v0, "alpha"

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_78

    invoke-static {p0, v0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    .line 148
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    iget-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->fadeDuration:J

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 149
    iget-wide v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->showDelay:J

    cmp-long v0, v0, v4

    if-lez v0, :cond_3b

    .line 150
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    iget-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->showDelay:J

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/Animator;->setStartDelay(J)V

    .line 152
    :cond_3b
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    new-instance v1, Lit/sephiroth/android/library/tooltip/TooltipView$1;

    invoke-direct {v1, p0}, Lit/sephiroth/android/library/tooltip/TooltipView$1;-><init>(Lit/sephiroth/android/library/tooltip/TooltipView;)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/Animator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 183
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 193
    :cond_4a
    :goto_4a
    iget-wide v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->showDuration:J

    cmp-long v0, v0, v4

    if-lez v0, :cond_6

    .line 194
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->hideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 195
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->hideRunnable:Ljava/lang/Runnable;

    iget-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->showDuration:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_6

    .line 186
    :cond_65
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/tooltip/TooltipView;->setVisibility(I)V

    .line 187
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    invoke-interface {v0, p0}, Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;->onShowCompleted(Lit/sephiroth/android/library/tooltip/TooltipView;)V

    .line 188
    iget-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mActivated:Z

    if-nez v0, :cond_4a

    .line 189
    iget-wide v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->activateDelay:J

    invoke-virtual {p0, v0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->postActivate(J)V

    goto :goto_4a

    .line 147
    :array_78
    .array-data 4
        0x0
        0x3f800000
    .end array-data
.end method

.method protected fadeOut(Z)V
    .registers 9
    .param p1, "remove"    # Z

    .prologue
    const/4 v6, 0x0

    .line 246
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->isAttached()Z

    move-result v1

    if-eqz v1, :cond_b

    iget-boolean v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowing:Z

    if-nez v1, :cond_c

    .line 299
    :cond_b
    :goto_b
    return-void

    .line 249
    :cond_c
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    if-eqz v1, :cond_15

    .line 250
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    .line 253
    :cond_15
    iput-boolean v6, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowing:Z

    .line 255
    iget-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->fadeDuration:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_4b

    .line 256
    invoke-static {p0}, Lcom/nineoldandroids/view/ViewHelper;->getAlpha(Landroid/view/View;)F

    move-result v0

    .line 257
    .local v0, "alpha":F
    const-string v1, "alpha"

    const/4 v2, 0x2

    new-array v2, v2, [F

    aput v0, v2, v6

    const/4 v3, 0x1

    const/4 v4, 0x0

    aput v4, v2, v3

    invoke-static {p0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    .line 258
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    iget-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->fadeDuration:J

    invoke-virtual {v1, v2, v3}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 259
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    new-instance v2, Lit/sephiroth/android/library/tooltip/TooltipView$4;

    invoke-direct {v2, p0, p1}, Lit/sephiroth/android/library/tooltip/TooltipView$4;-><init>(Lit/sephiroth/android/library/tooltip/TooltipView;Z)V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/Animator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 291
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/Animator;->start()V

    goto :goto_b

    .line 294
    .end local v0    # "alpha":F
    :cond_4b
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->setVisibility(I)V

    .line 295
    if-eqz p1, :cond_b

    .line 296
    invoke-direct {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->fireOnHideCompleted()V

    goto :goto_b
.end method

.method getTooltipId()I
    .registers 2

    .prologue
    .line 112
    iget v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->toolTipId:I

    return v0
.end method

.method public hide(Z)V
    .registers 3
    .param p1, "remove"    # Z

    .prologue
    .line 128
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->isAttached()Z

    move-result v0

    if-nez v0, :cond_7

    .line 130
    :goto_6
    return-void

    .line 129
    :cond_7
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->fadeOut(Z)V

    goto :goto_6
.end method

.method public isAttached()Z
    .registers 2

    .prologue
    .line 651
    iget-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mAttached:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 380
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 381
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mAttached:Z

    .line 383
    invoke-direct {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->initializeView()V

    .line 384
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 389
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 390
    const/4 v0, 0x0

    iput-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mAttached:Z

    .line 391
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 15
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/4 v8, 0x0

    .line 313
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getChildCount()I

    move-result v1

    .line 315
    .local v1, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    if-ge v3, v1, :cond_2a

    .line 316
    invoke-virtual {p0, v3}, Lit/sephiroth/android/library/tooltip/TooltipView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 317
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_27

    .line 318
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/view/View;->layout(IIII)V

    .line 315
    :cond_27
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 322
    .end local v0    # "child":Landroid/view/View;
    :cond_2a
    if-eqz p1, :cond_5d

    .line 324
    new-instance v2, Ljava/util/ArrayList;

    const/4 v4, 0x5

    new-array v4, v4, [Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    sget-object v5, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->LEFT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    aput-object v5, v4, v8

    const/4 v5, 0x1

    sget-object v6, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->RIGHT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    sget-object v6, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->TOP:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    sget-object v6, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->BOTTOM:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    sget-object v6, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->CENTER:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    aput-object v6, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 330
    .local v2, "gravities":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;>;"
    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    invoke-interface {v2, v4}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 331
    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    invoke-interface {v2, v8, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 332
    invoke-direct {p0, v2}, Lit/sephiroth/android/library/tooltip/TooltipView;->calculatePositions(Ljava/util/List;)V

    .line 334
    .end local v2    # "gravities":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;>;"
    :cond_5d
    return-void
.end method

.method protected onMeasure(II)V
    .registers 16
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 339
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 341
    const/4 v8, -0x1

    .line 342
    .local v8, "myWidth":I
    const/4 v7, -0x1

    .line 344
    .local v7, "myHeight":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v9

    .line 345
    .local v9, "widthMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    .line 346
    .local v4, "heightMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v10

    .line 347
    .local v10, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    .line 350
    .local v5, "heightSize":I
    if-eqz v9, :cond_18

    .line 351
    move v8, v10

    .line 354
    :cond_18
    if-eqz v4, :cond_1b

    .line 355
    move v7, v5

    .line 363
    :cond_1b
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getChildCount()I

    move-result v3

    .line 365
    .local v3, "count":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_20
    if-ge v6, v3, :cond_40

    .line 366
    invoke-virtual {p0, v6}, Lit/sephiroth/android/library/tooltip/TooltipView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 367
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v11

    const/16 v12, 0x8

    if-eq v11, v12, :cond_3d

    .line 368
    const/high16 v11, -0x80000000

    invoke-static {v8, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 369
    .local v2, "childWidthMeasureSpec":I
    const/high16 v11, -0x80000000

    invoke-static {v7, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 370
    .local v1, "childHeightMeasureSpec":I
    invoke-virtual {v0, v2, v1}, Landroid/view/View;->measure(II)V

    .line 365
    .end local v1    # "childHeightMeasureSpec":I
    .end local v2    # "childWidthMeasureSpec":I
    :cond_3d
    add-int/lit8 v6, v6, 0x1

    goto :goto_20

    .line 374
    .end local v0    # "child":Landroid/view/View;
    :cond_40
    invoke-virtual {p0, v8, v7}, Lit/sephiroth/android/library/tooltip/TooltipView;->setMeasuredDimension(II)V

    .line 375
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 664
    iget-boolean v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mAttached:Z

    if-eqz v4, :cond_10

    iget-boolean v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowing:Z

    if-eqz v4, :cond_10

    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->isShown()Z

    move-result v4

    if-nez v4, :cond_12

    :cond_10
    move v2, v3

    .line 699
    :cond_11
    :goto_11
    return v2

    .line 668
    :cond_12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 670
    .local v0, "action":I
    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    sget-object v5, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchOutside:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    if-eq v4, v5, :cond_2e

    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    sget-object v5, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchInside:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    if-eq v4, v5, :cond_2e

    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    sget-object v5, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchInsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    if-eq v4, v5, :cond_2e

    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    sget-object v5, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchOutsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    if-ne v4, v5, :cond_6c

    .line 676
    :cond_2e
    iget-boolean v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mActivated:Z

    if-eqz v4, :cond_11

    .line 681
    if-nez v0, :cond_6c

    .line 683
    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->drawRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Rect;->contains(II)Z

    move-result v1

    .line 685
    .local v1, "containsTouch":Z
    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    sget-object v5, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchInside:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    if-eq v4, v5, :cond_50

    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    sget-object v5, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchInsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    if-ne v4, v5, :cond_5e

    .line 686
    :cond_50
    if-eqz v1, :cond_56

    .line 687
    invoke-direct {p0, v2, v2}, Lit/sephiroth/android/library/tooltip/TooltipView;->onClose(ZZ)V

    goto :goto_11

    .line 690
    :cond_56
    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    sget-object v5, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchInsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    if-eq v4, v5, :cond_11

    move v2, v3

    goto :goto_11

    .line 693
    :cond_5e
    invoke-direct {p0, v2, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->onClose(ZZ)V

    .line 694
    iget-object v4, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    sget-object v5, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchOutsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    if-eq v4, v5, :cond_69

    if-eqz v1, :cond_6a

    :cond_69
    move v3, v2

    :cond_6a
    move v2, v3

    goto :goto_11

    .end local v1    # "containsTouch":Z
    :cond_6c
    move v2, v3

    .line 699
    goto :goto_11
.end method

.method postActivate(J)V
    .registers 6
    .param p1, "ms"    # J

    .prologue
    .line 220
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_12

    .line 221
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 222
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->activateRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0, p1, p2}, Lit/sephiroth/android/library/tooltip/TooltipView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 228
    :cond_11
    :goto_11
    return-void

    .line 226
    :cond_12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mActivated:Z

    goto :goto_11
.end method

.method removeFromParent()V
    .registers 4

    .prologue
    .line 232
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 233
    .local v0, "parent":Landroid/view/ViewParent;
    if-eqz v0, :cond_2b

    .line 234
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getHandler()Landroid/os/Handler;

    move-result-object v1

    if-eqz v1, :cond_15

    .line 235
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->getHandler()Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->hideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 237
    :cond_15
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "parent":Landroid/view/ViewParent;
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 239
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    if-eqz v1, :cond_2b

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/Animator;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 240
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    .line 243
    :cond_2b
    return-void
.end method

.method setOnCloseListener(Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;)V
    .registers 2
    .param p1, "listener"    # Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;

    .prologue
    .line 723
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->closeListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;

    .line 724
    return-void
.end method

.method setOnToolTipListener(Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;)V
    .registers 2
    .param p1, "listener"    # Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    .prologue
    .line 727
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipView;->tooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    .line 728
    return-void
.end method

.method public show()V
    .registers 2

    .prologue
    .line 118
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->isAttached()Z

    move-result v0

    if-nez v0, :cond_7

    .line 123
    :goto_6
    return-void

    .line 122
    :cond_7
    invoke-virtual {p0}, Lit/sephiroth/android/library/tooltip/TooltipView;->fadeIn()V

    goto :goto_6
.end method
