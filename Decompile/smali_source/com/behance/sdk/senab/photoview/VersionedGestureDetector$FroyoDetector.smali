.class Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector;
.super Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;
.source "VersionedGestureDetector.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x8
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FroyoDetector"
.end annotation


# instance fields
.field private final mDetector:Landroid/view/ScaleGestureDetector;

.field private final mScaleListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 253
    invoke-direct {p0, p1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;-><init>(Landroid/content/Context;)V

    .line 233
    new-instance v0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector$1;

    invoke-direct {v0, p0}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector$1;-><init>(Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector;)V

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector;->mScaleListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 254
    new-instance v0, Landroid/view/ScaleGestureDetector;

    iget-object v1, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector;->mScaleListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-direct {v0, p1, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector;->mDetector:Landroid/view/ScaleGestureDetector;

    .line 255
    return-void
.end method


# virtual methods
.method public isScaling()Z
    .registers 2

    .prologue
    .line 259
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector;->mDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 264
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector;->mDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 265
    invoke-super {p0, p1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
