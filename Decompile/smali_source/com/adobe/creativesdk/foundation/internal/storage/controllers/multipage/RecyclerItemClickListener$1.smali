.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "RecyclerItemClickListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;-><init>(Landroid/content/Context;Landroid/support/v7/widget/RecyclerView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$OnItemClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;

.field final synthetic val$recyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$1;->val$recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 33
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$1;->val$recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object v0

    .line 35
    .local v0, "childView":Landroid/view/View;
    if-eqz v0, :cond_27

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;->mListener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$OnItemClickListener;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$OnItemClickListener;

    move-result-object v1

    if-eqz v1, :cond_27

    .line 36
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;->mListener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$OnItemClickListener;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$OnItemClickListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$1;->val$recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    move-result v2

    invoke-interface {v1, v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerItemClickListener$OnItemClickListener;->onItemLongClick(Landroid/view/View;I)V

    .line 38
    :cond_27
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 28
    const/4 v0, 0x1

    return v0
.end method
