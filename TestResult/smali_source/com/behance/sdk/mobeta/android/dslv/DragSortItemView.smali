.class public Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;
.super Landroid/view/ViewGroup;
.source "DragSortItemView.java"


# instance fields
.field private mGravity:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 26
    const/16 v0, 0x30

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->mGravity:I

    .line 32
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    return-void
.end method


# virtual methods
.method public getGravity()I
    .registers 2

    .prologue
    .line 44
    iget v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->mGravity:I

    return v0
.end method

.method protected onLayout(ZIIII)V
    .registers 11
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    const/4 v4, 0x0

    .line 49
    invoke-virtual {p0, v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 51
    .local v0, "child":Landroid/view/View;
    if-nez v0, :cond_8

    .line 60
    :goto_7
    return-void

    .line 55
    :cond_8
    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->mGravity:I

    const/16 v2, 0x30

    if-ne v1, v2, :cond_1a

    .line 56
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {v0, v4, v4, v1, v2}, Landroid/view/View;->layout(IIII)V

    goto :goto_7

    .line 58
    :cond_1a
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->getMeasuredHeight()I

    move-result v3

    invoke-virtual {v0, v4, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    goto :goto_7
.end method

.method protected onMeasure(II)V
    .registers 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v6, 0x0

    .line 68
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 69
    .local v1, "height":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 71
    .local v4, "width":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 73
    .local v2, "heightMode":I
    invoke-virtual {p0, v6}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 74
    .local v0, "child":Landroid/view/View;
    if-nez v0, :cond_17

    .line 75
    invoke-virtual {p0, v6, v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->setMeasuredDimension(II)V

    .line 96
    :goto_16
    return-void

    .line 79
    :cond_17
    invoke-virtual {v0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v5

    if-eqz v5, :cond_24

    .line 82
    invoke-static {v6, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 81
    invoke-virtual {p0, v0, p1, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->measureChild(Landroid/view/View;II)V

    .line 85
    :cond_24
    if-nez v2, :cond_30

    .line 86
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 88
    .local v3, "lp":Landroid/view/ViewGroup$LayoutParams;
    iget v5, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v5, :cond_34

    .line 89
    iget v1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 95
    .end local v3    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_30
    :goto_30
    invoke-virtual {p0, v4, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->setMeasuredDimension(II)V

    goto :goto_16

    .line 91
    .restart local v3    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_34
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    goto :goto_30
.end method

.method public setGravity(I)V
    .registers 2
    .param p1, "gravity"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->mGravity:I

    .line 41
    return-void
.end method
