.class public final Luk/co/senab/photoview/gestures/VersionedGestureDetector;
.super Ljava/lang/Object;
.source "VersionedGestureDetector.java"


# direct methods
.method public static newInstance(Landroid/content/Context;Luk/co/senab/photoview/gestures/OnGestureListener;)Luk/co/senab/photoview/gestures/GestureDetector;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "listener"    # Luk/co/senab/photoview/gestures/OnGestureListener;

    .prologue
    .line 26
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 29
    .local v1, "sdkVersion":I
    const/4 v2, 0x5

    if-ge v1, v2, :cond_e

    .line 30
    new-instance v0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;

    invoke-direct {v0, p0}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;-><init>(Landroid/content/Context;)V

    .line 37
    .local v0, "detector":Luk/co/senab/photoview/gestures/GestureDetector;
    :goto_a
    invoke-interface {v0, p1}, Luk/co/senab/photoview/gestures/GestureDetector;->setOnGestureListener(Luk/co/senab/photoview/gestures/OnGestureListener;)V

    .line 39
    return-object v0

    .line 31
    .end local v0    # "detector":Luk/co/senab/photoview/gestures/GestureDetector;
    :cond_e
    const/16 v2, 0x8

    if-ge v1, v2, :cond_18

    .line 32
    new-instance v0, Luk/co/senab/photoview/gestures/EclairGestureDetector;

    invoke-direct {v0, p0}, Luk/co/senab/photoview/gestures/EclairGestureDetector;-><init>(Landroid/content/Context;)V

    .line 33
    .restart local v0    # "detector":Luk/co/senab/photoview/gestures/GestureDetector;
    goto :goto_a

    .line 34
    .end local v0    # "detector":Luk/co/senab/photoview/gestures/GestureDetector;
    :cond_18
    new-instance v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;

    invoke-direct {v0, p0}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;-><init>(Landroid/content/Context;)V

    .restart local v0    # "detector":Luk/co/senab/photoview/gestures/GestureDetector;
    goto :goto_a
.end method
