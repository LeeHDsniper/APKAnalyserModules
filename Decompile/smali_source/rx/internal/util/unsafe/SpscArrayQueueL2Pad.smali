.class abstract Lrx/internal/util/unsafe/SpscArrayQueueL2Pad;
.super Lrx/internal/util/unsafe/SpscArrayQueueProducerFields;
.source "SpscArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/SpscArrayQueueProducerFields",
        "<TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "capacity"    # I

    .prologue
    .line 61
    .local p0, "this":Lrx/internal/util/unsafe/SpscArrayQueueL2Pad;, "Lrx/internal/util/unsafe/SpscArrayQueueL2Pad<TE;>;"
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/SpscArrayQueueProducerFields;-><init>(I)V

    .line 62
    return-void
.end method
