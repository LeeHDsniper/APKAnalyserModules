.class abstract Lrx/internal/util/unsafe/MpmcArrayQueueL1Pad;
.super Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue;
.source "MpmcArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue",
        "<TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "capacity"    # I

    .prologue
    .line 26
    .local p0, "this":Lrx/internal/util/unsafe/MpmcArrayQueueL1Pad;, "Lrx/internal/util/unsafe/MpmcArrayQueueL1Pad<TE;>;"
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue;-><init>(I)V

    .line 27
    return-void
.end method
