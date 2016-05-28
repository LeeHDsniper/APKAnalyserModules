.class Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;
.super Landroid/widget/BaseAdapter;
.source "DragSortListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AdapterWrapper"
.end annotation


# instance fields
.field private mAdapter:Landroid/widget/ListAdapter;

.field final synthetic this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;


# direct methods
.method public constructor <init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;Landroid/widget/ListAdapter;)V
    .registers 5
    .param p2, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 627
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .line 628
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 629
    iput-object p2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    .line 631
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    new-instance v1, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper$1;

    invoke-direct {v1, p0, p1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper$1;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 640
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 2

    .prologue
    .line 663
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v0

    return v0
.end method

.method public getAdapter()Landroid/widget/ListAdapter;
    .registers 2

    .prologue
    .line 643
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 658
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 653
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 648
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 673
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 10
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v5, 0x0

    .line 699
    if-eqz p2, :cond_2a

    move-object v2, p2

    .line 700
    check-cast v2, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;

    .line 701
    .local v2, "v":Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;
    invoke-virtual {v2, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 703
    .local v1, "oldChild":Landroid/view/View;
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-interface {v3, p1, v1, v4}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 704
    .local v0, "child":Landroid/view/View;
    if-eq v0, v1, :cond_1c

    .line 707
    if-eqz v1, :cond_19

    .line 708
    invoke-virtual {v2, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->removeViewAt(I)V

    .line 710
    :cond_19
    invoke-virtual {v2, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->addView(Landroid/view/View;)V

    .line 727
    .end local v1    # "oldChild":Landroid/view/View;
    :cond_1c
    :goto_1c
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeaderViewsCount()I

    move-result v4

    add-int/2addr v4, p1

    const/4 v5, 0x1

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->adjustItem(ILandroid/view/View;Z)V
    invoke-static {v3, v4, v2, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$200(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;ILandroid/view/View;Z)V

    .line 729
    return-object v2

    .line 713
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "v":Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;
    :cond_2a
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-interface {v3, p1, v4, v5}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 714
    .restart local v0    # "child":Landroid/view/View;
    instance-of v3, v0, Landroid/widget/Checkable;

    if-eqz v3, :cond_50

    .line 715
    new-instance v2, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemViewCheckable;

    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemViewCheckable;-><init>(Landroid/content/Context;)V

    .line 719
    .restart local v2    # "v":Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;
    :goto_42
    new-instance v3, Landroid/widget/AbsListView$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 722
    invoke-virtual {v2, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;->addView(Landroid/view/View;)V

    goto :goto_1c

    .line 717
    .end local v2    # "v":Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;
    :cond_50
    new-instance v2, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;

    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;-><init>(Landroid/content/Context;)V

    .restart local v2    # "v":Lcom/behance/sdk/mobeta/android/dslv/DragSortItemView;
    goto :goto_42
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 678
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public hasStableIds()Z
    .registers 2

    .prologue
    .line 683
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 688
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isEnabled(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 668
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v0

    return v0
.end method
