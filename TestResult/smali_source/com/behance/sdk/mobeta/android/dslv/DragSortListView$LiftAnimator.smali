.class Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;
.super Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$SmoothAnimator;
.source "DragSortListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LiftAnimator"
.end annotation


# instance fields
.field private mFinalDragDeltaY:F

.field private mInitDragDeltaY:F

.field final synthetic this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;


# virtual methods
.method public onStart()V
    .registers 2

    .prologue
    .line 1192
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaY:I
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->mInitDragDeltaY:F

    .line 1193
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeightHalf:I
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->mFinalDragDeltaY:F

    .line 1194
    return-void
.end method

.method public onUpdate(FF)V
    .registers 7
    .param p1, "frac"    # F
    .param p2, "smoothFrac"    # F

    .prologue
    .line 1198
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$100(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_d

    .line 1199
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->cancel()V

    .line 1206
    :goto_c
    return-void

    .line 1201
    :cond_d
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->mFinalDragDeltaY:F

    mul-float/2addr v1, p2

    const/high16 v2, 0x3f800000

    sub-float/2addr v2, p2

    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->mInitDragDeltaY:F

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    float-to-int v1, v1

    # setter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaY:I
    invoke-static {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$302(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I

    .line 1203
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v0

    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mY:I
    invoke-static {v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v1

    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragDeltaY:I
    invoke-static {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Point;->y:I

    .line 1204
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$LiftAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    const/4 v1, 0x1

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doDragFloatView(Z)V
    invoke-static {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$700(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;Z)V

    goto :goto_c
.end method
