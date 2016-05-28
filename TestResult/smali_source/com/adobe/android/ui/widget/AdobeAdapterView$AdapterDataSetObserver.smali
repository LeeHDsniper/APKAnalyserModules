.class Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;
.super Landroid/database/DataSetObserver;
.source "AdobeAdapterView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/AdobeAdapterView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AdapterDataSetObserver"
.end annotation


# instance fields
.field private mInstanceState:Landroid/os/Parcelable;

.field final synthetic this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;


# direct methods
.method constructor <init>(Lcom/adobe/android/ui/widget/AdobeAdapterView;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/android/ui/widget/AdobeAdapterView;

    .prologue
    .line 624
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>.AdapterDataSetObserver;"
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 625
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 3

    .prologue
    .line 629
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>.AdapterDataSetObserver;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mDataChanged:Z

    .line 630
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iget v1, v1, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mItemCount:I

    iput v1, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldItemCount:I

    .line 631
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/Adapter;->getCount()I

    move-result v1

    iput v1, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mItemCount:I

    .line 635
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/Adapter;->hasStableIds()Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iget v0, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldItemCount:I

    if-nez v0, :cond_4c

    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iget v0, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mItemCount:I

    if-lez v0, :cond_4c

    .line 637
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    # invokes: Lcom/adobe/android/ui/widget/AdobeAdapterView;->onRestoreInstanceState(Landroid/os/Parcelable;)V
    invoke-static {v0, v1}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->access$100(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/os/Parcelable;)V

    .line 638
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    .line 642
    :goto_41
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->checkFocus()V

    .line 643
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->requestLayout()V

    .line 644
    return-void

    .line 640
    :cond_4c
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->rememberSyncState()V

    goto :goto_41
.end method

.method public onInvalidated()V
    .registers 7

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>.AdapterDataSetObserver;"
    const-wide/high16 v4, -0x8000000000000000L

    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 648
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mDataChanged:Z

    .line 650
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/Adapter;->hasStableIds()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 654
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    # invokes: Lcom/adobe/android/ui/widget/AdobeAdapterView;->onSaveInstanceState()Landroid/os/Parcelable;
    invoke-static {v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->access$200(Lcom/adobe/android/ui/widget/AdobeAdapterView;)Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->mInstanceState:Landroid/os/Parcelable;

    .line 658
    :cond_1d
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iget v1, v1, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mItemCount:I

    iput v1, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mOldItemCount:I

    .line 659
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iput v3, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mItemCount:I

    .line 660
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iput v2, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedPosition:I

    .line 661
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iput-wide v4, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mSelectedRowId:J

    .line 662
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iput v2, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedPosition:I

    .line 663
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iput-wide v4, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNextSelectedRowId:J

    .line 664
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iput-boolean v3, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mNeedSync:Z

    .line 666
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->checkFocus()V

    .line 667
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$AdapterDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->requestLayout()V

    .line 668
    return-void
.end method
