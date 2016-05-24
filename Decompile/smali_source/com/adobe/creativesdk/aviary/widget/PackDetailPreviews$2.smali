.class Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$2;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "PackDetailPreviews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 171
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$200(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 172
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$200(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    .line 174
    :cond_11
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 163
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    const/4 v1, 0x1

    # setter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerScrolled:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$102(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;Z)Z

    .line 164
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$200(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 165
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$200(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    .line 167
    :cond_17
    return-void
.end method
