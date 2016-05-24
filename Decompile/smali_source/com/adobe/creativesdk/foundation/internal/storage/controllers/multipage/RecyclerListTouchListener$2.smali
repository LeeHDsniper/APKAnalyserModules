.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$2;
.super Ljava/lang/Object;
.source "RecyclerListTouchListener.java"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 3
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->mListener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;->performAction()V

    .line 40
    const/4 v0, 0x1

    return v0
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .registers 3
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 45
    const/4 v0, 0x1

    return v0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .registers 2
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 51
    return-void
.end method
