.class public Lorg/apache/http/impl/conn/tsccm/WaitingThread;
.super Ljava/lang/Object;
.source "WaitingThread.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private aborted:Z

.field private final cond:Ljava/util/concurrent/locks/Condition;

.field private final pool:Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;

.field private waiter:Ljava/lang/Thread;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/locks/Condition;Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;)V
    .registers 4
    .param p1, "cond"    # Ljava/util/concurrent/locks/Condition;
    .param p2, "pool"    # Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const-string v0, "Condition"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 78
    iput-object p1, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->cond:Ljava/util/concurrent/locks/Condition;

    .line 79
    iput-object p2, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->pool:Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;

    .line 80
    return-void
.end method


# virtual methods
.method public await(Ljava/util/Date;)Z
    .registers 6
    .param p1, "deadline"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 141
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->waiter:Ljava/lang/Thread;

    if-eqz v1, :cond_2e

    .line 142
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "A thread is already waiting on this object.\ncaller: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nwaiter: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->waiter:Ljava/lang/Thread;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 148
    :cond_2e
    iget-boolean v1, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->aborted:Z

    if-eqz v1, :cond_3a

    .line 149
    new-instance v1, Ljava/lang/InterruptedException;

    const-string v2, "Operation interrupted"

    invoke-direct {v1, v2}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 152
    :cond_3a
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->waiter:Ljava/lang/Thread;

    .line 154
    const/4 v0, 0x0

    .line 156
    .local v0, "success":Z
    if-eqz p1, :cond_59

    .line 157
    :try_start_43
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->cond:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1, p1}, Ljava/util/concurrent/locks/Condition;->awaitUntil(Ljava/util/Date;)Z

    move-result v0

    .line 162
    :goto_49
    iget-boolean v1, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->aborted:Z

    if-eqz v1, :cond_60

    .line 163
    new-instance v1, Ljava/lang/InterruptedException;

    const-string v2, "Operation interrupted"

    invoke-direct {v1, v2}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_55
    .catchall {:try_start_43 .. :try_end_55} :catchall_55

    .line 166
    :catchall_55
    move-exception v1

    iput-object v3, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->waiter:Ljava/lang/Thread;

    throw v1

    .line 159
    :cond_59
    :try_start_59
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->cond:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_5e
    .catchall {:try_start_59 .. :try_end_5e} :catchall_55

    .line 160
    const/4 v0, 0x1

    goto :goto_49

    .line 166
    :cond_60
    iput-object v3, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->waiter:Ljava/lang/Thread;

    .line 168
    return v0
.end method

.method public final getCondition()Ljava/util/concurrent/locks/Condition;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->cond:Ljava/util/concurrent/locks/Condition;

    return-object v0
.end method

.method public final getPool()Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->pool:Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;

    return-object v0
.end method

.method public final getThread()Ljava/lang/Thread;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->waiter:Ljava/lang/Thread;

    return-object v0
.end method

.method public interrupt()V
    .registers 2

    .prologue
    .line 193
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->aborted:Z

    .line 194
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->cond:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 195
    return-void
.end method

.method public wakeup()V
    .registers 3

    .prologue
    .line 182
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->waiter:Ljava/lang/Thread;

    if-nez v0, :cond_c

    .line 183
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Nobody waiting on this object."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 189
    :cond_c
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->cond:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 190
    return-void
.end method
