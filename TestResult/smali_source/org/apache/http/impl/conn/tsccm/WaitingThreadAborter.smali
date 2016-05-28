.class public Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;
.super Ljava/lang/Object;
.source "WaitingThreadAborter.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private aborted:Z

.field private waitingThread:Lorg/apache/http/impl/conn/tsccm/WaitingThread;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abort()V
    .registers 2

    .prologue
    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;->aborted:Z

    .line 50
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;->waitingThread:Lorg/apache/http/impl/conn/tsccm/WaitingThread;

    if-eqz v0, :cond_c

    .line 51
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;->waitingThread:Lorg/apache/http/impl/conn/tsccm/WaitingThread;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->interrupt()V

    .line 54
    :cond_c
    return-void
.end method

.method public setWaitingThread(Lorg/apache/http/impl/conn/tsccm/WaitingThread;)V
    .registers 3
    .param p1, "waitingThread"    # Lorg/apache/http/impl/conn/tsccm/WaitingThread;

    .prologue
    .line 63
    iput-object p1, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;->waitingThread:Lorg/apache/http/impl/conn/tsccm/WaitingThread;

    .line 64
    iget-boolean v0, p0, Lorg/apache/http/impl/conn/tsccm/WaitingThreadAborter;->aborted:Z

    if-eqz v0, :cond_9

    .line 65
    invoke-virtual {p1}, Lorg/apache/http/impl/conn/tsccm/WaitingThread;->interrupt()V

    .line 67
    :cond_9
    return-void
.end method
