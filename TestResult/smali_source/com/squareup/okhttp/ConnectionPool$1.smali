.class Lcom/squareup/okhttp/ConnectionPool$1;
.super Ljava/lang/Object;
.source "ConnectionPool.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/ConnectionPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/ConnectionPool;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/ConnectionPool;)V
    .registers 2

    .prologue
    .line 85
    iput-object p1, p0, Lcom/squareup/okhttp/ConnectionPool$1;->this$0:Lcom/squareup/okhttp/ConnectionPool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    .prologue
    const/4 v10, 0x2

    .line 87
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 88
    .local v2, "expiredConnections":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Connection;>;"
    const/4 v5, 0x0

    .line 89
    .local v5, "idleConnectionCount":I
    iget-object v7, p0, Lcom/squareup/okhttp/ConnectionPool$1;->this$0:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v7

    .line 90
    :try_start_a
    iget-object v6, p0, Lcom/squareup/okhttp/ConnectionPool$1;->this$0:Lcom/squareup/okhttp/ConnectionPool;

    # getter for: Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;
    invoke-static {v6}, Lcom/squareup/okhttp/ConnectionPool;->access$000(Lcom/squareup/okhttp/ConnectionPool;)Ljava/util/LinkedList;

    move-result-object v6

    iget-object v8, p0, Lcom/squareup/okhttp/ConnectionPool$1;->this$0:Lcom/squareup/okhttp/ConnectionPool;

    # getter for: Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;
    invoke-static {v8}, Lcom/squareup/okhttp/ConnectionPool;->access$000(Lcom/squareup/okhttp/ConnectionPool;)Ljava/util/LinkedList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/util/LinkedList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v3

    .line 91
    .local v3, "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/squareup/okhttp/Connection;>;"
    :cond_1e
    :goto_1e
    invoke-interface {v3}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v6

    if-eqz v6, :cond_48

    .line 92
    invoke-interface {v3}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Connection;

    .line 93
    .local v0, "connection":Lcom/squareup/okhttp/Connection;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->isAlive()Z

    move-result v6

    if-eqz v6, :cond_3c

    iget-object v6, p0, Lcom/squareup/okhttp/ConnectionPool$1;->this$0:Lcom/squareup/okhttp/ConnectionPool;

    # getter for: Lcom/squareup/okhttp/ConnectionPool;->keepAliveDurationNs:J
    invoke-static {v6}, Lcom/squareup/okhttp/ConnectionPool;->access$100(Lcom/squareup/okhttp/ConnectionPool;)J

    move-result-wide v8

    invoke-virtual {v0, v8, v9}, Lcom/squareup/okhttp/Connection;->isExpired(J)Z

    move-result v6

    if-eqz v6, :cond_7f

    .line 94
    :cond_3c
    invoke-interface {v3}, Ljava/util/ListIterator;->remove()V

    .line 95
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-ne v6, v10, :cond_1e

    .line 102
    .end local v0    # "connection":Lcom/squareup/okhttp/Connection;
    :cond_48
    iget-object v6, p0, Lcom/squareup/okhttp/ConnectionPool$1;->this$0:Lcom/squareup/okhttp/ConnectionPool;

    # getter for: Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;
    invoke-static {v6}, Lcom/squareup/okhttp/ConnectionPool;->access$000(Lcom/squareup/okhttp/ConnectionPool;)Ljava/util/LinkedList;

    move-result-object v6

    iget-object v8, p0, Lcom/squareup/okhttp/ConnectionPool$1;->this$0:Lcom/squareup/okhttp/ConnectionPool;

    # getter for: Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;
    invoke-static {v8}, Lcom/squareup/okhttp/ConnectionPool;->access$000(Lcom/squareup/okhttp/ConnectionPool;)Ljava/util/LinkedList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/util/LinkedList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v3

    .line 103
    :cond_5c
    :goto_5c
    invoke-interface {v3}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v6

    if-eqz v6, :cond_88

    iget-object v6, p0, Lcom/squareup/okhttp/ConnectionPool$1;->this$0:Lcom/squareup/okhttp/ConnectionPool;

    # getter for: Lcom/squareup/okhttp/ConnectionPool;->maxIdleConnections:I
    invoke-static {v6}, Lcom/squareup/okhttp/ConnectionPool;->access$200(Lcom/squareup/okhttp/ConnectionPool;)I

    move-result v6

    if-le v5, v6, :cond_88

    .line 104
    invoke-interface {v3}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Connection;

    .line 105
    .restart local v0    # "connection":Lcom/squareup/okhttp/Connection;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->isIdle()Z

    move-result v6

    if-eqz v6, :cond_5c

    .line 106
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    invoke-interface {v3}, Ljava/util/ListIterator;->remove()V

    .line 108
    add-int/lit8 v5, v5, -0x1

    goto :goto_5c

    .line 97
    :cond_7f
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->isIdle()Z

    move-result v6

    if-eqz v6, :cond_1e

    .line 98
    add-int/lit8 v5, v5, 0x1

    goto :goto_1e

    .line 111
    .end local v0    # "connection":Lcom/squareup/okhttp/Connection;
    :cond_88
    monitor-exit v7
    :try_end_89
    .catchall {:try_start_a .. :try_end_89} :catchall_a1

    .line 112
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_8d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/squareup/okhttp/Connection;

    .line 113
    .local v1, "expiredConnection":Lcom/squareup/okhttp/Connection;
    invoke-virtual {v1}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v6

    invoke-static {v6}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    goto :goto_8d

    .line 111
    .end local v1    # "expiredConnection":Lcom/squareup/okhttp/Connection;
    .end local v3    # "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/squareup/okhttp/Connection;>;"
    .end local v4    # "i$":Ljava/util/Iterator;
    :catchall_a1
    move-exception v6

    :try_start_a2
    monitor-exit v7
    :try_end_a3
    .catchall {:try_start_a2 .. :try_end_a3} :catchall_a1

    throw v6

    .line 115
    .restart local v3    # "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/squareup/okhttp/Connection;>;"
    .restart local v4    # "i$":Ljava/util/Iterator;
    :cond_a4
    return-void
.end method
