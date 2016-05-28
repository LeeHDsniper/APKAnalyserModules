.class Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper$1;
.super Landroid/database/DataSetObserver;
.source "DragSortListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;Landroid/widget/ListAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

.field final synthetic val$this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;


# direct methods
.method constructor <init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V
    .registers 3
    .param p1, "this$1"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

    .prologue
    .line 631
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper$1;->this$1:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

    iput-object p2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper$1;->val$this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 2

    .prologue
    .line 633
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper$1;->this$1:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

    invoke-virtual {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->notifyDataSetChanged()V

    .line 634
    return-void
.end method

.method public onInvalidated()V
    .registers 2

    .prologue
    .line 637
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper$1;->this$1:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;

    invoke-virtual {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$AdapterWrapper;->notifyDataSetInvalidated()V

    .line 638
    return-void
.end method
