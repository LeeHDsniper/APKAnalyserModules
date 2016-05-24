.class Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$1;
.super Ljava/lang/Object;
.source "PackDetailPreviews.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;
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
    .line 77
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 80
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "onDown"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 81
    const/4 v0, 0x1

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 6
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 103
    const/4 v0, 0x0

    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 99
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 6
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 95
    const/4 v0, 0x0

    return v0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .registers 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 85
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 89
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "onSingleTapUp"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 90
    const/4 v0, 0x1

    return v0
.end method
