.class abstract Lorg/lucasr/twowayview/ClickItemTouchListener;
.super Ljava/lang/Object;
.source "ClickItemTouchListener.java"

# interfaces
.implements Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;,
        Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureDetector;
    }
.end annotation


# instance fields
.field private final mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .registers 5
    .param p1, "hostView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureDetector;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;

    invoke-direct {v2, p0, p1}, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;-><init>(Lorg/lucasr/twowayview/ClickItemTouchListener;Landroid/support/v7/widget/RecyclerView;)V

    invoke-direct {v0, p0, v1, v2}, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureDetector;-><init>(Lorg/lucasr/twowayview/ClickItemTouchListener;Landroid/content/Context;Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;)V

    iput-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    .line 21
    return-void
.end method

.method private hasAdapter(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 3
    .param p1, "hostView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 32
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private isAttachedToWindow(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 4
    .param p1, "hostView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 24
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 25
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->isAttachedToWindow()Z

    move-result v0

    .line 27
    :goto_a
    return v0

    :cond_b
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_13

    const/4 v0, 0x1

    goto :goto_a

    :cond_13
    const/4 v0, 0x0

    goto :goto_a
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x0

    .line 37
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/ClickItemTouchListener;->isAttachedToWindow(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/ClickItemTouchListener;->hasAdapter(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 42
    :cond_d
    :goto_d
    return v1

    .line 41
    :cond_e
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    invoke-virtual {v0, p2}, Landroid/support/v4/view/GestureDetectorCompat;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_d
.end method

.method public onRequestDisallowInterceptTouchEvent(Z)V
    .registers 2
    .param p1, "disallowIntercept"    # Z

    .prologue
    .line 157
    return-void
.end method

.method public onTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 49
    return-void
.end method

.method abstract performItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z
.end method

.method abstract performItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z
.end method
