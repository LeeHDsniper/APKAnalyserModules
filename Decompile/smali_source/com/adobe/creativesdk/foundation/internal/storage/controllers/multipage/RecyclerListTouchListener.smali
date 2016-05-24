.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;
.super Ljava/lang/Object;
.source "RecyclerListTouchListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;
    }
.end annotation


# instance fields
.field mGestureDetector:Landroid/view/GestureDetector;

.field private mListener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;

.field mScaleGestureDetector:Landroid/view/ScaleGestureDetector;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->mListener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;

    .line 28
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->mGestureDetector:Landroid/view/GestureDetector;

    .line 35
    new-instance v0, Landroid/view/ScaleGestureDetector;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;)V

    invoke-direct {v0, p1, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->mListener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;

    return-object v0
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 58
    if-eqz p1, :cond_15

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->mListener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->mListener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;->performAction()V

    .line 63
    :cond_13
    :goto_13
    const/4 v0, 0x1

    return v0

    .line 60
    :cond_15
    if-eqz p1, :cond_13

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->mListener:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener$OnTouchListener;

    if-eqz v0, :cond_13

    .line 61
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/RecyclerListTouchListener;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_13
.end method
