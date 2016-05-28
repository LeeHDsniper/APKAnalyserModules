.class public abstract Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
.super Ljava/lang/Object;
.source "VersionedGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector;,
        Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;,
        Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;,
        Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;
    }
.end annotation


# instance fields
.field mListener:Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 226
    return-void
.end method

.method public static newInstance(Landroid/content/Context;Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;)Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "listener"    # Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;

    .prologue
    .line 34
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 35
    .local v1, "sdkVersion":I
    const/4 v0, 0x0

    .line 37
    .local v0, "detector":Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
    const/4 v2, 0x5

    if-ge v1, v2, :cond_e

    .line 38
    new-instance v0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;

    .end local v0    # "detector":Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
    invoke-direct {v0, p0}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;-><init>(Landroid/content/Context;)V

    .line 45
    .restart local v0    # "detector":Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
    :goto_b
    iput-object p1, v0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;->mListener:Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;

    .line 47
    return-object v0

    .line 39
    :cond_e
    const/16 v2, 0x8

    if-ge v1, v2, :cond_18

    .line 40
    new-instance v0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;

    .end local v0    # "detector":Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
    invoke-direct {v0, p0}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;-><init>(Landroid/content/Context;)V

    .restart local v0    # "detector":Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
    goto :goto_b

    .line 42
    :cond_18
    new-instance v0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector;

    .end local v0    # "detector":Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
    invoke-direct {v0, p0}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$FroyoDetector;-><init>(Landroid/content/Context;)V

    .restart local v0    # "detector":Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
    goto :goto_b
.end method


# virtual methods
.method public abstract isScaling()Z
.end method

.method public abstract onTouchEvent(Landroid/view/MotionEvent;)Z
.end method
