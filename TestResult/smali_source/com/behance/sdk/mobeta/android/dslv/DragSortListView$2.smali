.class Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$2;
.super Landroid/database/DataSetObserver;
.source "DragSortListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;


# direct methods
.method constructor <init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 535
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$2;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method

.method private cancel()V
    .registers 3

    .prologue
    .line 537
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$2;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$100(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_e

    .line 538
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$2;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->cancelDrag()V

    .line 540
    :cond_e
    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 1

    .prologue
    .line 544
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$2;->cancel()V

    .line 545
    return-void
.end method

.method public onInvalidated()V
    .registers 1

    .prologue
    .line 549
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$2;->cancel()V

    .line 550
    return-void
.end method
