.class public interface abstract Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;
.super Ljava/lang/Object;
.source "ScrollerRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/ScrollerRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ScrollableView"
.end annotation


# virtual methods
.method public abstract getMaxX()I
.end method

.method public abstract getMinX()I
.end method

.method public abstract post(Ljava/lang/Runnable;)Z
.end method

.method public abstract removeCallbacks(Ljava/lang/Runnable;)Z
.end method

.method public abstract scrollIntoSlots()V
.end method

.method public abstract trackMotionScroll(I)V
.end method
