.class Lcom/etsy/android/grid/ExtendableListView$PerformClick;
.super Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;
.source "ExtendableListView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/ExtendableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PerformClick"
.end annotation


# instance fields
.field mClickMotionPosition:I

.field final synthetic this$0:Lcom/etsy/android/grid/ExtendableListView;


# direct methods
.method private constructor <init>(Lcom/etsy/android/grid/ExtendableListView;)V
    .registers 3

    .prologue
    .line 2732
    iput-object p1, p0, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;-><init>(Lcom/etsy/android/grid/ExtendableListView;Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/etsy/android/grid/ExtendableListView;Lcom/etsy/android/grid/ExtendableListView$PerformClick;)V
    .registers 3

    .prologue
    .line 2732
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView$PerformClick;-><init>(Lcom/etsy/android/grid/ExtendableListView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    .line 2736
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # getter for: Lcom/etsy/android/grid/ExtendableListView;->mDataChanged:Z
    invoke-static {v3}, Lcom/etsy/android/grid/ExtendableListView;->access$15(Lcom/etsy/android/grid/ExtendableListView;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 2749
    :cond_8
    :goto_8
    return-void

    .line 2738
    :cond_9
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget-object v0, v3, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 2739
    .local v0, "adapter":Landroid/widget/ListAdapter;
    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->mClickMotionPosition:I

    .line 2740
    .local v1, "motionPosition":I
    if-eqz v0, :cond_8

    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # getter for: Lcom/etsy/android/grid/ExtendableListView;->mItemCount:I
    invoke-static {v3}, Lcom/etsy/android/grid/ExtendableListView;->access$5(Lcom/etsy/android/grid/ExtendableListView;)I

    move-result v3

    if-lez v3, :cond_8

    .line 2741
    const/4 v3, -0x1

    if-eq v1, v3, :cond_8

    .line 2742
    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_8

    invoke-virtual {p0}, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->sameWindow()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 2743
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v3, v1}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2745
    .local v2, "view":Landroid/view/View;
    if-eqz v2, :cond_8

    .line 2746
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget-object v4, p0, Lcom/etsy/android/grid/ExtendableListView$PerformClick;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget v4, v4, Lcom/etsy/android/grid/ExtendableListView;->mFirstPosition:I

    add-int/2addr v4, v1

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v6

    invoke-virtual {v3, v2, v4, v6, v7}, Lcom/etsy/android/grid/ExtendableListView;->performItemClick(Landroid/view/View;IJ)Z

    goto :goto_8
.end method
