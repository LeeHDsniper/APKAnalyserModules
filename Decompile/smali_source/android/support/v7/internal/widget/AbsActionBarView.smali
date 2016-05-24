.class abstract Landroid/support/v7/internal/widget/AbsActionBarView;
.super Landroid/view/ViewGroup;
.source "AbsActionBarView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;
    }
.end annotation


# static fields
.field private static final sAlphaInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field protected mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

.field protected mContentHeight:I

.field protected mMenuView:Landroid/support/v7/widget/ActionMenuView;

.field protected final mPopupContext:Landroid/content/Context;

.field protected mSplitActionBar:Z

.field protected mSplitView:Landroid/view/ViewGroup;

.field protected mSplitWhenNarrow:Z

.field protected final mVisAnimListener:Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

.field protected mVisibilityAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    sput-object v0, Landroid/support/v7/internal/widget/AbsActionBarView;->sAlphaInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/internal/widget/AbsActionBarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 61
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/internal/widget/AbsActionBarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 62
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 65
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    new-instance v1, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    invoke-direct {v1, p0}, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;-><init>(Landroid/support/v7/internal/widget/AbsActionBarView;)V

    iput-object v1, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisAnimListener:Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    .line 67
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 68
    .local v0, "tv":Landroid/util/TypedValue;
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget v2, Landroid/support/v7/appcompat/R$attr;->actionBarPopupTheme:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_2a

    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v1, :cond_2a

    .line 70
    new-instance v1, Landroid/view/ContextThemeWrapper;

    iget v2, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-direct {v1, p1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mPopupContext:Landroid/content/Context;

    .line 74
    :goto_29
    return-void

    .line 72
    :cond_2a
    iput-object p1, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mPopupContext:Landroid/content/Context;

    goto :goto_29
.end method

.method protected static next(IIZ)I
    .registers 4
    .param p0, "x"    # I
    .param p1, "val"    # I
    .param p2, "isRtl"    # Z

    .prologue
    .line 238
    if-eqz p2, :cond_5

    sub-int v0, p0, p1

    :goto_4
    return v0

    :cond_5
    add-int v0, p0, p1

    goto :goto_4
.end method


# virtual methods
.method public animateToVisibility(I)V
    .registers 10
    .param p1, "visibility"    # I

    .prologue
    const/high16 v5, 0x3f800000

    const-wide/16 v6, 0xc8

    const/4 v4, 0x0

    .line 134
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisibilityAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    if-eqz v3, :cond_e

    .line 135
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisibilityAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->cancel()V

    .line 137
    :cond_e
    if-nez p1, :cond_71

    .line 138
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/AbsActionBarView;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_26

    .line 139
    invoke-static {p0, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 140
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mSplitView:Landroid/view/ViewGroup;

    if-eqz v3, :cond_26

    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v3, :cond_26

    .line 141
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-static {v3, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 144
    :cond_26
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 145
    .local v0, "anim":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 146
    sget-object v3, Landroid/support/v7/internal/widget/AbsActionBarView;->sAlphaInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 147
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mSplitView:Landroid/view/ViewGroup;

    if-eqz v3, :cond_64

    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v3, :cond_64

    .line 148
    new-instance v1, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    invoke-direct {v1}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;-><init>()V

    .line 149
    .local v1, "set":Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 150
    .local v2, "splitAnim":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    invoke-virtual {v2, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 151
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisAnimListener:Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    invoke-virtual {v3, v0, p1}, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->withFinalVisibility(Landroid/support/v4/view/ViewPropertyAnimatorCompat;I)Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 152
    invoke-virtual {v1, v0}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->play(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->play(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 153
    invoke-virtual {v1}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->start()V

    .line 174
    .end local v1    # "set":Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;
    .end local v2    # "splitAnim":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    :goto_63
    return-void

    .line 155
    :cond_64
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisAnimListener:Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    invoke-virtual {v3, v0, p1}, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->withFinalVisibility(Landroid/support/v4/view/ViewPropertyAnimatorCompat;I)Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 156
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_63

    .line 159
    .end local v0    # "anim":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    :cond_71
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 160
    .restart local v0    # "anim":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 161
    sget-object v3, Landroid/support/v7/internal/widget/AbsActionBarView;->sAlphaInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 162
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mSplitView:Landroid/view/ViewGroup;

    if-eqz v3, :cond_af

    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v3, :cond_af

    .line 163
    new-instance v1, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    invoke-direct {v1}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;-><init>()V

    .line 164
    .restart local v1    # "set":Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 165
    .restart local v2    # "splitAnim":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    invoke-virtual {v2, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 166
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisAnimListener:Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    invoke-virtual {v3, v0, p1}, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->withFinalVisibility(Landroid/support/v4/view/ViewPropertyAnimatorCompat;I)Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 167
    invoke-virtual {v1, v0}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->play(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->play(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 168
    invoke-virtual {v1}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->start()V

    goto :goto_63

    .line 170
    .end local v1    # "set":Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;
    .end local v2    # "splitAnim":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    :cond_af
    iget-object v3, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisAnimListener:Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    invoke-virtual {v3, v0, p1}, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->withFinalVisibility(Landroid/support/v4/view/ViewPropertyAnimatorCompat;I)Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 171
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_63
.end method

.method public getAnimatedVisibility()I
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisibilityAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    if-eqz v0, :cond_9

    .line 128
    iget-object v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisAnimListener:Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;

    iget v0, v0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->mFinalVisibility:I

    .line 130
    :goto_8
    return v0

    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/AbsActionBarView;->getVisibility()I

    move-result v0

    goto :goto_8
.end method

.method public getContentHeight()I
    .registers 2

    .prologue
    .line 116
    iget v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mContentHeight:I

    return v0
.end method

.method protected measureChildView(Landroid/view/View;III)I
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "availableWidth"    # I
    .param p3, "childSpecHeight"    # I
    .param p4, "spacing"    # I

    .prologue
    .line 228
    const/high16 v0, -0x80000000

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p1, v0, p3}, Landroid/view/View;->measure(II)V

    .line 231
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    sub-int/2addr p2, v0

    .line 232
    sub-int/2addr p2, p4

    .line 234
    const/4 v0, 0x0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 8
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    const/4 v5, 0x0

    .line 78
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x8

    if-lt v1, v2, :cond_a

    .line 79
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 84
    :cond_a
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/AbsActionBarView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    sget-object v3, Landroid/support/v7/appcompat/R$styleable;->ActionBar:[I

    sget v4, Landroid/support/v7/appcompat/R$attr;->actionBarStyle:I

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 86
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/v7/appcompat/R$styleable;->ActionBar_height:I

    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/support/v7/internal/widget/AbsActionBarView;->setContentHeight(I)V

    .line 87
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 89
    iget-object v1, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v1, :cond_2c

    .line 90
    iget-object v1, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/ActionMenuPresenter;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 92
    :cond_2c
    return-void
.end method

.method protected positionChild(Landroid/view/View;IIIZ)I
    .registers 11
    .param p1, "child"    # Landroid/view/View;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "contentHeight"    # I
    .param p5, "reverse"    # Z

    .prologue
    .line 242
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    .line 243
    .local v2, "childWidth":I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 244
    .local v0, "childHeight":I
    sub-int v3, p4, v0

    div-int/lit8 v3, v3, 0x2

    add-int v1, p3, v3

    .line 246
    .local v1, "childTop":I
    if-eqz p5, :cond_1b

    .line 247
    sub-int v3, p2, v2

    add-int v4, v1, v0

    invoke-virtual {p1, v3, v1, p2, v4}, Landroid/view/View;->layout(IIII)V

    .line 252
    :goto_17
    if-eqz p5, :cond_1a

    neg-int v2, v2

    .end local v2    # "childWidth":I
    :cond_1a
    return v2

    .line 249
    .restart local v2    # "childWidth":I
    :cond_1b
    add-int v3, p2, v2

    add-int v4, v1, v0

    invoke-virtual {p1, p2, v1, v3, v4}, Landroid/view/View;->layout(IIII)V

    goto :goto_17
.end method

.method public setContentHeight(I)V
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 111
    iput p1, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mContentHeight:I

    .line 112
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/AbsActionBarView;->requestLayout()V

    .line 113
    return-void
.end method

.method public setSplitToolbar(Z)V
    .registers 2
    .param p1, "split"    # Z

    .prologue
    .line 99
    iput-boolean p1, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mSplitActionBar:Z

    .line 100
    return-void
.end method

.method public setSplitView(Landroid/view/ViewGroup;)V
    .registers 2
    .param p1, "splitView"    # Landroid/view/ViewGroup;

    .prologue
    .line 120
    iput-object p1, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mSplitView:Landroid/view/ViewGroup;

    .line 121
    return-void
.end method

.method public setSplitWhenNarrow(Z)V
    .registers 2
    .param p1, "splitWhenNarrow"    # Z

    .prologue
    .line 107
    iput-boolean p1, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mSplitWhenNarrow:Z

    .line 108
    return-void
.end method

.method public showOverflowMenu()Z
    .registers 2

    .prologue
    .line 177
    iget-object v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_b

    .line 178
    iget-object v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->showOverflowMenu()Z

    move-result v0

    .line 180
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
