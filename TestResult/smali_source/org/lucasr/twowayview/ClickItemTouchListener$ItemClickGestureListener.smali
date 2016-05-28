.class Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ClickItemTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/ClickItemTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ItemClickGestureListener"
.end annotation


# instance fields
.field private final mHostView:Landroid/support/v7/widget/RecyclerView;

.field private mTargetChild:Landroid/view/View;

.field final synthetic this$0:Lorg/lucasr/twowayview/ClickItemTouchListener;


# direct methods
.method public constructor <init>(Lorg/lucasr/twowayview/ClickItemTouchListener;Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p2, "hostView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 79
    iput-object p1, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->this$0:Lorg/lucasr/twowayview/ClickItemTouchListener;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 80
    iput-object p2, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    .line 81
    return-void
.end method


# virtual methods
.method public dispatchSingleTapUpIfNeeded(Landroid/view/MotionEvent;)V
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 88
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    if-eqz v0, :cond_7

    .line 89
    invoke-virtual {p0, p1}, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    .line 91
    :cond_7
    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 95
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v0, v2

    .line 96
    .local v0, "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v1, v2

    .line 98
    .local v1, "y":I
    iget-object v2, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    int-to-float v3, v0

    int-to-float v4, v1

    invoke-virtual {v2, v3, v4}, Landroid/support/v7/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    .line 99
    iget-object v2, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    if-eqz v2, :cond_1a

    const/4 v2, 0x1

    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x0

    goto :goto_19
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 140
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    if-nez v0, :cond_5

    .line 152
    :cond_4
    :goto_4
    return-void

    .line 144
    :cond_5
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    move-result v3

    .line 145
    .local v3, "position":I
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v4

    .line 146
    .local v4, "id":J
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->this$0:Lorg/lucasr/twowayview/ClickItemTouchListener;

    iget-object v1, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    invoke-virtual/range {v0 .. v5}, Lorg/lucasr/twowayview/ClickItemTouchListener;->performItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z

    move-result v6

    .line 148
    .local v6, "handled":Z
    if-eqz v6, :cond_4

    .line 149
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    goto :goto_4
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "event2"    # Landroid/view/MotionEvent;
    .param p3, "v"    # F
    .param p4, "v2"    # F

    .prologue
    const/4 v0, 0x0

    .line 128
    iget-object v1, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    if-eqz v1, :cond_e

    .line 129
    iget-object v1, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setPressed(Z)V

    .line 130
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    .line 132
    const/4 v0, 0x1

    .line 135
    :cond_e
    return v0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 104
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    if-eqz v0, :cond_a

    .line 105
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 107
    :cond_a
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 111
    const/4 v6, 0x0

    .line 113
    .local v6, "handled":Z
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    if-eqz v0, :cond_2a

    .line 114
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 116
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    move-result v3

    .line 117
    .local v3, "position":I
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v4

    .line 118
    .local v4, "id":J
    iget-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->this$0:Lorg/lucasr/twowayview/ClickItemTouchListener;

    iget-object v1, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    invoke-virtual/range {v0 .. v5}, Lorg/lucasr/twowayview/ClickItemTouchListener;->performItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z

    move-result v6

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->mTargetChild:Landroid/view/View;

    .line 123
    .end local v3    # "position":I
    .end local v4    # "id":J
    :cond_2a
    return v6
.end method
