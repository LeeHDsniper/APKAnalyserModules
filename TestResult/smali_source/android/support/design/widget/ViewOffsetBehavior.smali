.class Landroid/support/design/widget/ViewOffsetBehavior;
.super Landroid/support/design/widget/CoordinatorLayout$Behavior;
.source "ViewOffsetBehavior.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Landroid/support/design/widget/CoordinatorLayout$Behavior",
        "<TV;>;"
    }
.end annotation


# instance fields
.field private mTempLeftRightOffset:I

.field private mTempTopBottomOffset:I

.field private mViewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;


# virtual methods
.method public getTopAndBottomOffset()I
    .registers 2

    .prologue
    .line 80
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mViewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mViewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    invoke-virtual {v0}, Landroid/support/design/widget/ViewOffsetHelper;->getTopAndBottomOffset()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .registers 7
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p3, "layoutDirection"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;I)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    .local p2, "child":Landroid/view/View;, "TV;"
    const/4 v2, 0x0

    .line 42
    invoke-virtual {p1, p2, p3}, Landroid/support/design/widget/CoordinatorLayout;->onLayoutChild(Landroid/view/View;I)V

    .line 44
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mViewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    if-nez v0, :cond_f

    .line 45
    new-instance v0, Landroid/support/design/widget/ViewOffsetHelper;

    invoke-direct {v0, p2}, Landroid/support/design/widget/ViewOffsetHelper;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mViewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    .line 47
    :cond_f
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mViewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    invoke-virtual {v0}, Landroid/support/design/widget/ViewOffsetHelper;->onViewLayout()V

    .line 49
    iget v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mTempTopBottomOffset:I

    if-eqz v0, :cond_21

    .line 50
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mViewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    iget v1, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mTempTopBottomOffset:I

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ViewOffsetHelper;->setTopAndBottomOffset(I)Z

    .line 51
    iput v2, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mTempTopBottomOffset:I

    .line 53
    :cond_21
    iget v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mTempLeftRightOffset:I

    if-eqz v0, :cond_2e

    .line 54
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mViewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    iget v1, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mTempLeftRightOffset:I

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ViewOffsetHelper;->setLeftAndRightOffset(I)Z

    .line 55
    iput v2, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mTempLeftRightOffset:I

    .line 58
    :cond_2e
    const/4 v0, 0x1

    return v0
.end method

.method public setTopAndBottomOffset(I)Z
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 62
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mViewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    if-eqz v0, :cond_b

    .line 63
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mViewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/ViewOffsetHelper;->setTopAndBottomOffset(I)Z

    move-result v0

    .line 67
    :goto_a
    return v0

    .line 65
    :cond_b
    iput p1, p0, Landroid/support/design/widget/ViewOffsetBehavior;->mTempTopBottomOffset:I

    .line 67
    const/4 v0, 0x0

    goto :goto_a
.end method
