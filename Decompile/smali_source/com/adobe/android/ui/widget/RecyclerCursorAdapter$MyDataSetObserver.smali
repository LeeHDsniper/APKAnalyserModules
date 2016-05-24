.class Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;
.super Landroid/database/DataSetObserver;
.source "RecyclerCursorAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyDataSetObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;


# direct methods
.method private constructor <init>(Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;)V
    .registers 2

    .prologue
    .line 355
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>.MyDataSetObserver;"
    iput-object p1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;
    .param p2, "x1"    # Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$1;

    .prologue
    .line 355
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>.MyDataSetObserver;"
    invoke-direct {p0, p1}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;-><init>(Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;)V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 3

    .prologue
    .line 358
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>.MyDataSetObserver;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataValid:Z

    .line 359
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->clearCaches()V

    .line 360
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->notifyDataSetChanged()V

    .line 361
    return-void
.end method

.method public onInvalidated()V
    .registers 4

    .prologue
    .local p0, "this":Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;, "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter<TT;>.MyDataSetObserver;"
    const/4 v2, 0x0

    .line 365
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;

    iput-boolean v2, v0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->mDataValid:Z

    .line 366
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->clearCaches()V

    .line 367
    iget-object v0, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;

    iget-object v1, p0, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter$MyDataSetObserver;->this$0:Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;

    invoke-virtual {v1}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->getItemCount()I

    move-result v1

    invoke-virtual {v0, v2, v1}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->notifyItemRangeRemoved(II)V

    .line 369
    return-void
.end method
