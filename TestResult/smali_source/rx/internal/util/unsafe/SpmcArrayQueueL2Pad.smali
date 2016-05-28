.class abstract Lrx/internal/util/unsafe/SpmcArrayQueueL2Pad;
.super Lrx/internal/util/unsafe/SpmcArrayQueueProducerField;
.source "SpmcArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/SpmcArrayQueueProducerField",
        "<TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "capacity"    # I

    .prologue
    .line 60
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueueL2Pad;, "Lrx/internal/util/unsafe/SpmcArrayQueueL2Pad<TE;>;"
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/SpmcArrayQueueProducerField;-><init>(I)V

    .line 61
    return-void
.end method
