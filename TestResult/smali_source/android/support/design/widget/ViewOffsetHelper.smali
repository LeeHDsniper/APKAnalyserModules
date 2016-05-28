.class Landroid/support/design/widget/ViewOffsetHelper;
.super Ljava/lang/Object;
.source "ViewOffsetHelper.java"


# instance fields
.field private mLayoutLeft:I

.field private mLayoutTop:I

.field private mOffsetLeft:I

.field private mOffsetTop:I

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Landroid/support/design/widget/ViewOffsetHelper;->mView:Landroid/view/View;

    .line 42
    return-void
.end method

.method private updateOffsets()V
    .registers 6

    .prologue
    .line 54
    iget-object v1, p0, Landroid/support/design/widget/ViewOffsetHelper;->mView:Landroid/view/View;

    iget v2, p0, Landroid/support/design/widget/ViewOffsetHelper;->mOffsetTop:I

    iget-object v3, p0, Landroid/support/design/widget/ViewOffsetHelper;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    iget v4, p0, Landroid/support/design/widget/ViewOffsetHelper;->mLayoutTop:I

    sub-int/2addr v3, v4

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->offsetTopAndBottom(Landroid/view/View;I)V

    .line 55
    iget-object v1, p0, Landroid/support/design/widget/ViewOffsetHelper;->mView:Landroid/view/View;

    iget v2, p0, Landroid/support/design/widget/ViewOffsetHelper;->mOffsetLeft:I

    iget-object v3, p0, Landroid/support/design/widget/ViewOffsetHelper;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v3

    iget v4, p0, Landroid/support/design/widget/ViewOffsetHelper;->mLayoutLeft:I

    sub-int/2addr v3, v4

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->offsetLeftAndRight(Landroid/view/View;I)V

    .line 58
    iget-object v1, p0, Landroid/support/design/widget/ViewOffsetHelper;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 59
    .local v0, "parent":Landroid/view/ViewParent;
    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_31

    .line 60
    check-cast v0, Landroid/view/View;

    .end local v0    # "parent":Landroid/view/ViewParent;
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 62
    :cond_31
    return-void
.end method


# virtual methods
.method public getTopAndBottomOffset()I
    .registers 2

    .prologue
    .line 95
    iget v0, p0, Landroid/support/design/widget/ViewOffsetHelper;->mOffsetTop:I

    return v0
.end method

.method public onViewLayout()V
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/ViewOffsetHelper;->mLayoutTop:I

    .line 47
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/ViewOffsetHelper;->mLayoutLeft:I

    .line 50
    invoke-direct {p0}, Landroid/support/design/widget/ViewOffsetHelper;->updateOffsets()V

    .line 51
    return-void
.end method

.method public setLeftAndRightOffset(I)Z
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 86
    iget v0, p0, Landroid/support/design/widget/ViewOffsetHelper;->mOffsetLeft:I

    if-eq v0, p1, :cond_b

    .line 87
    iput p1, p0, Landroid/support/design/widget/ViewOffsetHelper;->mOffsetLeft:I

    .line 88
    invoke-direct {p0}, Landroid/support/design/widget/ViewOffsetHelper;->updateOffsets()V

    .line 89
    const/4 v0, 0x1

    .line 91
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setTopAndBottomOffset(I)Z
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 71
    iget v0, p0, Landroid/support/design/widget/ViewOffsetHelper;->mOffsetTop:I

    if-eq v0, p1, :cond_b

    .line 72
    iput p1, p0, Landroid/support/design/widget/ViewOffsetHelper;->mOffsetTop:I

    .line 73
    invoke-direct {p0}, Landroid/support/design/widget/ViewOffsetHelper;->updateOffsets()V

    .line 74
    const/4 v0, 0x1

    .line 76
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
