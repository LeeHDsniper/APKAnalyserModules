.class abstract Lrx/internal/util/unsafe/SpscArrayQueueL3Pad;
.super Lrx/internal/util/unsafe/SpscArrayQueueConsumerField;
.source "SpscArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/SpscArrayQueueConsumerField",
        "<TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "capacity"    # I

    .prologue
    .line 86
    .local p0, "this":Lrx/internal/util/unsafe/SpscArrayQueueL3Pad;, "Lrx/internal/util/unsafe/SpscArrayQueueL3Pad<TE;>;"
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/SpscArrayQueueConsumerField;-><init>(I)V

    .line 87
    return-void
.end method
