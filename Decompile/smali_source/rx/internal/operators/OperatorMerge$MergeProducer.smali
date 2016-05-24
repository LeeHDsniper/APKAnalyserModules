.class final Lrx/internal/operators/OperatorMerge$MergeProducer;
.super Ljava/lang/Object;
.source "OperatorMerge.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorMerge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MergeProducer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Producer;"
    }
.end annotation


# static fields
.field static final REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicLongFieldUpdater",
            "<",
            "Lrx/internal/operators/OperatorMerge$MergeProducer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final ms:Lrx/internal/operators/OperatorMerge$MergeSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorMerge$MergeSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field

.field private volatile requested:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 538
    const-class v0, Lrx/internal/operators/OperatorMerge$MergeProducer;

    const-string v1, "requested"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorMerge$MergeProducer;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMerge$MergeSubscriber",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 532
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeProducer;, "Lrx/internal/operators/OperatorMerge$MergeProducer<TT;>;"
    .local p1, "ms":Lrx/internal/operators/OperatorMerge$MergeSubscriber;, "Lrx/internal/operators/OperatorMerge$MergeSubscriber<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 536
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J

    .line 533
    iput-object p1, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->ms:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    .line 534
    return-void
.end method

.method static synthetic access$100(Lrx/internal/operators/OperatorMerge$MergeProducer;)J
    .registers 3
    .param p0, "x0"    # Lrx/internal/operators/OperatorMerge$MergeProducer;

    .prologue
    .line 528
    iget-wide v0, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J

    return-wide v0
.end method


# virtual methods
.method public request(J)V
    .registers 10
    .param p1, "n"    # J

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorMerge$MergeProducer;, "Lrx/internal/operators/OperatorMerge$MergeProducer<TT;>;"
    const-wide v4, 0x7fffffffffffffffL

    .line 542
    iget-wide v2, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J

    cmp-long v1, v2, v4

    if-nez v1, :cond_c

    .line 561
    :cond_b
    :goto_b
    return-void

    .line 545
    :cond_c
    cmp-long v1, p1, v4

    if-nez v1, :cond_13

    .line 546
    iput-wide v4, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->requested:J

    goto :goto_b

    .line 548
    :cond_13
    sget-object v1, Lrx/internal/operators/OperatorMerge$MergeProducer;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-static {v1, p0, p1, p2}, Lrx/internal/operators/BackpressureUtils;->getAndAddRequest(Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;Ljava/lang/Object;J)J

    .line 549
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->ms:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # invokes: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainQueuesIfNeeded()Z
    invoke-static {v1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$500(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 550
    const/4 v0, 0x0

    .line 551
    .local v0, "sendComplete":Z
    iget-object v2, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->ms:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    monitor-enter v2

    .line 552
    :try_start_24
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->ms:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # getter for: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->wip:I
    invoke-static {v1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$600(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)I

    move-result v1

    if-nez v1, :cond_41

    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->ms:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # getter for: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->scalarValueQueue:Lrx/internal/util/RxRingBuffer;
    invoke-static {v1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$700(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Lrx/internal/util/RxRingBuffer;

    move-result-object v1

    if-eqz v1, :cond_41

    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->ms:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # getter for: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->scalarValueQueue:Lrx/internal/util/RxRingBuffer;
    invoke-static {v1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$700(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)Lrx/internal/util/RxRingBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lrx/internal/util/RxRingBuffer;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_41

    .line 553
    const/4 v0, 0x1

    .line 555
    :cond_41
    monitor-exit v2
    :try_end_42
    .catchall {:try_start_24 .. :try_end_42} :catchall_4a

    .line 556
    if-eqz v0, :cond_b

    .line 557
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$MergeProducer;->ms:Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    # invokes: Lrx/internal/operators/OperatorMerge$MergeSubscriber;->drainAndComplete()V
    invoke-static {v1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;->access$800(Lrx/internal/operators/OperatorMerge$MergeSubscriber;)V

    goto :goto_b

    .line 555
    :catchall_4a
    move-exception v1

    :try_start_4b
    monitor-exit v2
    :try_end_4c
    .catchall {:try_start_4b .. :try_end_4c} :catchall_4a

    throw v1
.end method
