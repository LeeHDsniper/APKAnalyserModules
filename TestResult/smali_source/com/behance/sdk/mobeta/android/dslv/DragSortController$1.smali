.class Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "DragSortController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/mobeta/android/dslv/DragSortController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;


# direct methods
.method constructor <init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    .prologue
    .line 445
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 11
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 450
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->mRemoveEnabled:Z
    invoke-static {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->access$000(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;)Z

    move-result v2

    if-eqz v2, :cond_3f

    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->mIsRemoving:Z
    invoke-static {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->access$100(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;)Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 451
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->mDslv:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    invoke-static {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->access$200(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;)Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getWidth()I

    move-result v1

    .line 452
    .local v1, "w":I
    div-int/lit8 v0, v1, 0x5

    .line 453
    .local v0, "minPos":I
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->mFlingSpeed:F
    invoke-static {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->access$300(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;)F

    move-result v2

    cmpl-float v2, p3, v2

    if-lez v2, :cond_40

    .line 454
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->mPositionX:I
    invoke-static {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->access$400(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;)I

    move-result v2

    neg-int v3, v0

    if-le v2, v3, :cond_3a

    .line 455
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->mDslv:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    invoke-static {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->access$200(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;)Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    move-result-object v2

    invoke-virtual {v2, v5, p3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->stopDragWithVelocity(ZF)Z

    .line 462
    :cond_3a
    :goto_3a
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    # setter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->mIsRemoving:Z
    invoke-static {v2, v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->access$102(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;Z)Z

    .line 464
    .end local v0    # "minPos":I
    .end local v1    # "w":I
    :cond_3f
    return v4

    .line 457
    .restart local v0    # "minPos":I
    .restart local v1    # "w":I
    :cond_40
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->mFlingSpeed:F
    invoke-static {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->access$300(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;)F

    move-result v2

    neg-float v2, v2

    cmpg-float v2, p3, v2

    if-gez v2, :cond_3a

    .line 458
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->mPositionX:I
    invoke-static {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->access$400(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;)I

    move-result v2

    if-ge v2, v0, :cond_3a

    .line 459
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortController$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortController;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->mDslv:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    invoke-static {v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortController;->access$200(Lcom/behance/sdk/mobeta/android/dslv/DragSortController;)Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    move-result-object v2

    invoke-virtual {v2, v5, p3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->stopDragWithVelocity(ZF)Z

    goto :goto_3a
.end method
