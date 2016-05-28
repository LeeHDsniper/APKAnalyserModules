.class abstract Lrx/internal/util/unsafe/SpmcArrayQueueMidPad;
.super Lrx/internal/util/unsafe/SpmcArrayQueueConsumerField;
.source "SpmcArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/SpmcArrayQueueConsumerField",
        "<TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "capacity"    # I

    .prologue
    .line 94
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueueMidPad;, "Lrx/internal/util/unsafe/SpmcArrayQueueMidPad<TE;>;"
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/SpmcArrayQueueConsumerField;-><init>(I)V

    .line 95
    return-void
.end method
