.class abstract Lrx/internal/util/unsafe/ConcurrentCircularArrayQueueL0Pad;
.super Ljava/util/AbstractQueue;
.source "ConcurrentCircularArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractQueue",
        "<TE;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 24
    .local p0, "this":Lrx/internal/util/unsafe/ConcurrentCircularArrayQueueL0Pad;, "Lrx/internal/util/unsafe/ConcurrentCircularArrayQueueL0Pad<TE;>;"
    invoke-direct {p0}, Ljava/util/AbstractQueue;-><init>()V

    return-void
.end method
