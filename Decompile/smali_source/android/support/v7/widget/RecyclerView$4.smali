.class Landroid/support/v7/widget/RecyclerView$4;
.super Ljava/lang/Object;
.source "RecyclerView.java"

# interfaces
.implements Landroid/support/v7/widget/ChildHelper$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v7/widget/RecyclerView;->initChildrenHelper()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .registers 2

    .prologue
    .line 530
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;I)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I

    .prologue
    .line 538
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->addView(Landroid/view/View;I)V

    .line 539
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->dispatchChildAttached(Landroid/view/View;)V
    invoke-static {v0, p1}, Landroid/support/v7/widget/RecyclerView;->access$600(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)V

    .line 540
    return-void
.end method

.method public attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 8
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "layoutParams"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 578
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 579
    .local v0, "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v0, :cond_2e

    .line 580
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isTmpDetached()Z

    move-result v1

    if-nez v1, :cond_2b

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 581
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Called attach on a child which is not detached: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 587
    :cond_2b
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearTmpDetachFlag()V

    .line 589
    :cond_2e
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    invoke-static {v1, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;->access$800(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 590
    return-void
.end method

.method public detachViewFromParent(I)V
    .registers 7
    .param p1, "offset"    # I

    .prologue
    .line 594
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$4;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 595
    .local v1, "view":Landroid/view/View;
    if-eqz v1, :cond_36

    .line 596
    invoke-static {v1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 597
    .local v0, "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v0, :cond_36

    .line 598
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isTmpDetached()Z

    move-result v2

    if-eqz v2, :cond_31

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v2

    if-nez v2, :cond_31

    .line 599
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "called detach on an already detached child "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 605
    :cond_31
    const/16 v2, 0x100

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 608
    .end local v0    # "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_36
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->detachViewFromParent(I)V
    invoke-static {v2, p1}, Landroid/support/v7/widget/RecyclerView;->access$900(Landroid/support/v7/widget/RecyclerView;I)V

    .line 609
    return-void
.end method

.method public getChildAt(I)Landroid/view/View;
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 558
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getChildCount()I
    .registers 2

    .prologue
    .line 533
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    return v0
.end method

.method public getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 572
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public indexOfChild(Landroid/view/View;)I
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 544
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->indexOfChild(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public removeAllViews()V
    .registers 5

    .prologue
    .line 563
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$4;->getChildCount()I

    move-result v0

    .line 564
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v0, :cond_13

    .line 565
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/RecyclerView$4;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    # invokes: Landroid/support/v7/widget/RecyclerView;->dispatchChildDetached(Landroid/view/View;)V
    invoke-static {v2, v3}, Landroid/support/v7/widget/RecyclerView;->access$700(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)V

    .line 564
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 567
    :cond_13
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->removeAllViews()V

    .line 568
    return-void
.end method

.method public removeViewAt(I)V
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 549
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 550
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_d

    .line 551
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->dispatchChildDetached(Landroid/view/View;)V
    invoke-static {v1, v0}, Landroid/support/v7/widget/RecyclerView;->access$700(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)V

    .line 553
    :cond_d
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$4;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/RecyclerView;->removeViewAt(I)V

    .line 554
    return-void
.end method
