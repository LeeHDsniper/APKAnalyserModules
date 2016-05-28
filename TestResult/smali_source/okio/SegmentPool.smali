.class final Lokio/SegmentPool;
.super Ljava/lang/Object;
.source "SegmentPool.java"


# static fields
.field static final INSTANCE:Lokio/SegmentPool;


# instance fields
.field byteCount:J

.field private next:Lokio/Segment;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    new-instance v0, Lokio/SegmentPool;

    invoke-direct {v0}, Lokio/SegmentPool;-><init>()V

    sput-object v0, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method


# virtual methods
.method recycle(Lokio/Segment;)V
    .registers 8
    .param p1, "segment"    # Lokio/Segment;

    .prologue
    const-wide/16 v4, 0x800

    .line 52
    iget-object v0, p1, Lokio/Segment;->next:Lokio/Segment;

    if-nez v0, :cond_a

    iget-object v0, p1, Lokio/Segment;->prev:Lokio/Segment;

    if-eqz v0, :cond_10

    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 53
    :cond_10
    monitor-enter p0

    .line 54
    :try_start_11
    iget-wide v0, p0, Lokio/SegmentPool;->byteCount:J

    add-long/2addr v0, v4

    const-wide/32 v2, 0x10000

    cmp-long v0, v0, v2

    if-lez v0, :cond_1d

    monitor-exit p0

    .line 60
    :goto_1c
    return-void

    .line 55
    :cond_1d
    iget-wide v0, p0, Lokio/SegmentPool;->byteCount:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lokio/SegmentPool;->byteCount:J

    .line 56
    iget-object v0, p0, Lokio/SegmentPool;->next:Lokio/Segment;

    iput-object v0, p1, Lokio/Segment;->next:Lokio/Segment;

    .line 57
    const/4 v0, 0x0

    iput v0, p1, Lokio/Segment;->limit:I

    iput v0, p1, Lokio/Segment;->pos:I

    .line 58
    iput-object p1, p0, Lokio/SegmentPool;->next:Lokio/Segment;

    .line 59
    monitor-exit p0

    goto :goto_1c

    :catchall_2f
    move-exception v0

    monitor-exit p0
    :try_end_31
    .catchall {:try_start_11 .. :try_end_31} :catchall_2f

    throw v0
.end method

.method take()Lokio/Segment;
    .registers 7

    .prologue
    .line 39
    monitor-enter p0

    .line 40
    :try_start_1
    iget-object v1, p0, Lokio/SegmentPool;->next:Lokio/Segment;

    if-eqz v1, :cond_17

    .line 41
    iget-object v0, p0, Lokio/SegmentPool;->next:Lokio/Segment;

    .line 42
    .local v0, "result":Lokio/Segment;
    iget-object v1, v0, Lokio/Segment;->next:Lokio/Segment;

    iput-object v1, p0, Lokio/SegmentPool;->next:Lokio/Segment;

    .line 43
    const/4 v1, 0x0

    iput-object v1, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 44
    iget-wide v2, p0, Lokio/SegmentPool;->byteCount:J

    const-wide/16 v4, 0x800

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lokio/SegmentPool;->byteCount:J

    .line 45
    monitor-exit p0

    .line 48
    .end local v0    # "result":Lokio/Segment;
    :goto_16
    return-object v0

    .line 47
    :cond_17
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_1e

    .line 48
    new-instance v0, Lokio/Segment;

    invoke-direct {v0}, Lokio/Segment;-><init>()V

    goto :goto_16

    .line 47
    :catchall_1e
    move-exception v1

    :try_start_1f
    monitor-exit p0
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_1e

    throw v1
.end method
