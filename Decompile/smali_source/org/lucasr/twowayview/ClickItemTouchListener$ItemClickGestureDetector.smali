.class Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureDetector;
.super Landroid/support/v4/view/GestureDetectorCompat;
.source "ClickItemTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/ClickItemTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ItemClickGestureDetector"
.end annotation


# instance fields
.field private final mGestureListener:Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;

.field final synthetic this$0:Lorg/lucasr/twowayview/ClickItemTouchListener;


# direct methods
.method public constructor <init>(Lorg/lucasr/twowayview/ClickItemTouchListener;Landroid/content/Context;Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "listener"    # Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;

    .prologue
    .line 57
    iput-object p1, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureDetector;->this$0:Lorg/lucasr/twowayview/ClickItemTouchListener;

    .line 58
    invoke-direct {p0, p2, p3}, Landroid/support/v4/view/GestureDetectorCompat;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 59
    iput-object p3, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureDetector;->mGestureListener:Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;

    .line 60
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 64
    invoke-super {p0, p1}, Landroid/support/v4/view/GestureDetectorCompat;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 66
    .local v1, "handled":Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    and-int/lit16 v0, v2, 0xff

    .line 67
    .local v0, "action":I
    const/4 v2, 0x1

    if-ne v0, v2, :cond_12

    .line 68
    iget-object v2, p0, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureDetector;->mGestureListener:Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;

    invoke-virtual {v2, p1}, Lorg/lucasr/twowayview/ClickItemTouchListener$ItemClickGestureListener;->dispatchSingleTapUpIfNeeded(Landroid/view/MotionEvent;)V

    .line 71
    :cond_12
    return v1
.end method
