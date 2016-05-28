.class Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;
.super Landroid/database/DataSetObserver;
.source "ExtendableListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/ExtendableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AdapterDataSetObserver"
.end annotation


# instance fields
.field private mInstanceState:Landroid/os/Parcelable;

.field final synthetic this$0:Lcom/etsy/android/grid/ExtendableListView;


# direct methods
.method constructor <init>(Lcom/etsy/android/grid/ExtendableListView;)V
    .registers 3

    .prologue
    .line 2060
    iput-object p1, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 2062
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 3

    .prologue
    .line 2066
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->access$8(Lcom/etsy/android/grid/ExtendableListView;Z)V

    .line 2067
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # getter for: Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I
    invoke-static {v1}, Lcom/etsy/android/grid/ExtendableListView;->access$5(Lcom/etsy/android/grid/ExtendableListView;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->access$9(Lcom/etsy/android/grid/ExtendableListView;I)V

    .line 2068
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v1}, Lcom/etsy/android/grid/ExtendableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    invoke-static {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->access$10(Lcom/etsy/android/grid/ExtendableListView;I)V

    .line 2070
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # getter for: Lcom/etsy/android/grid/ExtendableListView;->mRecycleBin:Lcom/etsy/android/grid/ExtendableListView$RecycleBin;
    invoke-static {v0}, Lcom/etsy/android/grid/ExtendableListView;->access$11(Lcom/etsy/android/grid/ExtendableListView;)Lcom/etsy/android/grid/ExtendableListView$RecycleBin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->clearTransientStateViews()V

    .line 2074
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/ListAdapter;->hasStableIds()Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    if-eqz v0, :cond_5e

    .line 2075
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # getter for: Lcom/etsy/android/grid/ExtendableListView;->mOldItemCount:I
    invoke-static {v0}, Lcom/etsy/android/grid/ExtendableListView;->access$12(Lcom/etsy/android/grid/ExtendableListView;)I

    move-result v0

    if-nez v0, :cond_5e

    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # getter for: Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I
    invoke-static {v0}, Lcom/etsy/android/grid/ExtendableListView;->access$5(Lcom/etsy/android/grid/ExtendableListView;)I

    move-result v0

    if-lez v0, :cond_5e

    .line 2076
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    invoke-virtual {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 2077
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    .line 2083
    :goto_53
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->updateEmptyStatus()V
    invoke-static {v0}, Lcom/etsy/android/grid/ExtendableListView;->access$13(Lcom/etsy/android/grid/ExtendableListView;)V

    .line 2084
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView;->requestLayout()V

    .line 2085
    return-void

    .line 2080
    :cond_5e
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView;->rememberSyncState()V

    goto :goto_53
.end method

.method public onInvalidated()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 2089
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->access$8(Lcom/etsy/android/grid/ExtendableListView;Z)V

    .line 2091
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/ListAdapter;->hasStableIds()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 2094
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    .line 2098
    :cond_1b
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # getter for: Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I
    invoke-static {v1}, Lcom/etsy/android/grid/ExtendableListView;->access$5(Lcom/etsy/android/grid/ExtendableListView;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/etsy/android/grid/ExtendableListView;->access$9(Lcom/etsy/android/grid/ExtendableListView;I)V

    .line 2099
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-static {v0, v2}, Lcom/etsy/android/grid/ExtendableListView;->access$10(Lcom/etsy/android/grid/ExtendableListView;I)V

    .line 2100
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iput-boolean v2, v0, Lcom/etsy/android/grid/ExtendableListView;->mNeedSync:Z

    .line 2102
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->updateEmptyStatus()V
    invoke-static {v0}, Lcom/etsy/android/grid/ExtendableListView;->access$13(Lcom/etsy/android/grid/ExtendableListView;)V

    .line 2103
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$AdapterDataSetObserver;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView;->requestLayout()V

    .line 2104
    return-void
.end method
