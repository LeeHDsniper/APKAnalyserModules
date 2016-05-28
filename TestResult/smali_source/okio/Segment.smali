.class final Lokio/Segment;
.super Ljava/lang/Object;
.source "Segment.java"


# instance fields
.field final data:[B

.field limit:I

.field next:Lokio/Segment;

.field pos:I

.field prev:Lokio/Segment;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/16 v0, 0x800

    new-array v0, v0, [B

    iput-object v0, p0, Lokio/Segment;->data:[B

    return-void
.end method


# virtual methods
.method public compact()V
    .registers 4

    .prologue
    .line 111
    iget-object v0, p0, Lokio/Segment;->prev:Lokio/Segment;

    if-ne v0, p0, :cond_a

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 112
    :cond_a
    iget-object v0, p0, Lokio/Segment;->prev:Lokio/Segment;

    iget v0, v0, Lokio/Segment;->limit:I

    iget-object v1, p0, Lokio/Segment;->prev:Lokio/Segment;

    iget v1, v1, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    iget v1, p0, Lokio/Segment;->limit:I

    iget v2, p0, Lokio/Segment;->pos:I

    sub-int/2addr v1, v2

    add-int/2addr v0, v1

    const/16 v1, 0x800

    if-le v0, v1, :cond_1e

    .line 116
    :goto_1d
    return-void

    .line 113
    :cond_1e
    iget-object v0, p0, Lokio/Segment;->prev:Lokio/Segment;

    iget v1, p0, Lokio/Segment;->limit:I

    iget v2, p0, Lokio/Segment;->pos:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Lokio/Segment;->writeTo(Lokio/Segment;I)V

    .line 114
    invoke-virtual {p0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 115
    sget-object v0, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v0, p0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_1d
.end method

.method public pop()Lokio/Segment;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 53
    iget-object v2, p0, Lokio/Segment;->next:Lokio/Segment;

    if-eq v2, p0, :cond_18

    iget-object v0, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 54
    .local v0, "result":Lokio/Segment;
    :goto_7
    iget-object v2, p0, Lokio/Segment;->prev:Lokio/Segment;

    iget-object v3, p0, Lokio/Segment;->next:Lokio/Segment;

    iput-object v3, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 55
    iget-object v2, p0, Lokio/Segment;->next:Lokio/Segment;

    iget-object v3, p0, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v3, v2, Lokio/Segment;->prev:Lokio/Segment;

    .line 56
    iput-object v1, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 57
    iput-object v1, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 58
    return-object v0

    .end local v0    # "result":Lokio/Segment;
    :cond_18
    move-object v0, v1

    .line 53
    goto :goto_7
.end method

.method public push(Lokio/Segment;)Lokio/Segment;
    .registers 3
    .param p1, "segment"    # Lokio/Segment;

    .prologue
    .line 66
    iput-object p0, p1, Lokio/Segment;->prev:Lokio/Segment;

    .line 67
    iget-object v0, p0, Lokio/Segment;->next:Lokio/Segment;

    iput-object v0, p1, Lokio/Segment;->next:Lokio/Segment;

    .line 68
    iget-object v0, p0, Lokio/Segment;->next:Lokio/Segment;

    iput-object p1, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 69
    iput-object p1, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 70
    return-object p1
.end method

.method public split(I)Lokio/Segment;
    .registers 10
    .param p1, "byteCount"    # I

    .prologue
    .line 82
    move v0, p1

    .line 83
    .local v0, "aSize":I
    iget v4, p0, Lokio/Segment;->limit:I

    iget v5, p0, Lokio/Segment;->pos:I

    sub-int/2addr v4, v5

    sub-int v2, v4, p1

    .line 84
    .local v2, "bSize":I
    if-lez v0, :cond_c

    if-gtz v2, :cond_12

    :cond_c
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 87
    :cond_12
    if-ge v0, v2, :cond_35

    .line 89
    sget-object v4, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v4}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v3

    .line 90
    .local v3, "before":Lokio/Segment;
    iget-object v4, p0, Lokio/Segment;->data:[B

    iget v5, p0, Lokio/Segment;->pos:I

    iget-object v6, v3, Lokio/Segment;->data:[B

    iget v7, v3, Lokio/Segment;->pos:I

    invoke-static {v4, v5, v6, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    iget v4, p0, Lokio/Segment;->pos:I

    add-int/2addr v4, v0

    iput v4, p0, Lokio/Segment;->pos:I

    .line 92
    iget v4, v3, Lokio/Segment;->limit:I

    add-int/2addr v4, v0

    iput v4, v3, Lokio/Segment;->limit:I

    .line 93
    iget-object v4, p0, Lokio/Segment;->prev:Lokio/Segment;

    invoke-virtual {v4, v3}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    .line 102
    .end local v3    # "before":Lokio/Segment;
    :goto_34
    return-object v3

    .line 97
    :cond_35
    sget-object v4, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v4}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v1

    .line 98
    .local v1, "after":Lokio/Segment;
    iget-object v4, p0, Lokio/Segment;->data:[B

    iget v5, p0, Lokio/Segment;->pos:I

    add-int/2addr v5, v0

    iget-object v6, v1, Lokio/Segment;->data:[B

    iget v7, v1, Lokio/Segment;->pos:I

    invoke-static {v4, v5, v6, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    iget v4, p0, Lokio/Segment;->limit:I

    sub-int/2addr v4, v2

    iput v4, p0, Lokio/Segment;->limit:I

    .line 100
    iget v4, v1, Lokio/Segment;->limit:I

    add-int/2addr v4, v2

    iput v4, v1, Lokio/Segment;->limit:I

    .line 101
    invoke-virtual {p0, v1}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-object v3, p0

    .line 102
    goto :goto_34
.end method

.method public writeTo(Lokio/Segment;I)V
    .registers 9
    .param p1, "sink"    # Lokio/Segment;
    .param p2, "byteCount"    # I

    .prologue
    const/16 v2, 0x800

    const/4 v5, 0x0

    .line 122
    iget v0, p1, Lokio/Segment;->limit:I

    iget v1, p1, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    add-int/2addr v0, p2

    if-le v0, v2, :cond_11

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 124
    :cond_11
    iget v0, p1, Lokio/Segment;->limit:I

    add-int/2addr v0, p2

    if-le v0, v2, :cond_2d

    .line 126
    iget-object v0, p1, Lokio/Segment;->data:[B

    iget v1, p1, Lokio/Segment;->pos:I

    iget-object v2, p1, Lokio/Segment;->data:[B

    iget v3, p1, Lokio/Segment;->limit:I

    iget v4, p1, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    invoke-static {v0, v1, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    iget v0, p1, Lokio/Segment;->limit:I

    iget v1, p1, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    iput v0, p1, Lokio/Segment;->limit:I

    .line 128
    iput v5, p1, Lokio/Segment;->pos:I

    .line 131
    :cond_2d
    iget-object v0, p0, Lokio/Segment;->data:[B

    iget v1, p0, Lokio/Segment;->pos:I

    iget-object v2, p1, Lokio/Segment;->data:[B

    iget v3, p1, Lokio/Segment;->limit:I

    invoke-static {v0, v1, v2, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 132
    iget v0, p1, Lokio/Segment;->limit:I

    add-int/2addr v0, p2

    iput v0, p1, Lokio/Segment;->limit:I

    .line 133
    iget v0, p0, Lokio/Segment;->pos:I

    add-int/2addr v0, p2

    iput v0, p0, Lokio/Segment;->pos:I

    .line 134
    return-void
.end method
