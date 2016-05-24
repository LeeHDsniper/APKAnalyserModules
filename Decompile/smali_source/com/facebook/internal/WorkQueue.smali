.class Lcom/facebook/internal/WorkQueue;
.super Ljava/lang/Object;
.source "WorkQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/internal/WorkQueue$WorkNode;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;

.field private final maxConcurrent:I

.field private runningCount:I

.field private runningJobs:Lcom/facebook/internal/WorkQueue$WorkNode;

.field private final workLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    const-class v0, Lcom/facebook/internal/WorkQueue;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/facebook/internal/WorkQueue;->$assertionsDisabled:Z

    .line 24
    return-void

    .line 23
    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 36
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/facebook/internal/WorkQueue;-><init>(I)V

    .line 37
    return-void
.end method

.method constructor <init>(I)V
    .registers 3
    .param p1, "maxConcurrent"    # I

    .prologue
    .line 40
    invoke-static {}, Lcom/facebook/Settings;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/facebook/internal/WorkQueue;-><init>(ILjava/util/concurrent/Executor;)V

    .line 41
    return-void
.end method

.method constructor <init>(ILjava/util/concurrent/Executor;)V
    .registers 4
    .param p1, "maxConcurrent"    # I
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/internal/WorkQueue;->workLock:Ljava/lang/Object;

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/internal/WorkQueue;->runningJobs:Lcom/facebook/internal/WorkQueue$WorkNode;

    .line 33
    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/internal/WorkQueue;->runningCount:I

    .line 44
    iput p1, p0, Lcom/facebook/internal/WorkQueue;->maxConcurrent:I

    .line 45
    iput-object p2, p0, Lcom/facebook/internal/WorkQueue;->executor:Ljava/util/concurrent/Executor;

    .line 46
    return-void
.end method
