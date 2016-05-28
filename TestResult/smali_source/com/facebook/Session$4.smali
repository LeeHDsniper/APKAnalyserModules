.class Lcom/facebook/Session$4;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/Session;

.field private final synthetic val$exception:Ljava/lang/Exception;

.field private final synthetic val$newState:Lcom/facebook/SessionState;


# direct methods
.method constructor <init>(Lcom/facebook/Session;Lcom/facebook/SessionState;Ljava/lang/Exception;)V
    .registers 4

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/Session$4;->this$0:Lcom/facebook/Session;

    iput-object p2, p0, Lcom/facebook/Session$4;->val$newState:Lcom/facebook/SessionState;

    iput-object p3, p0, Lcom/facebook/Session$4;->val$exception:Ljava/lang/Exception;

    .line 1538
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/facebook/Session$4;)Lcom/facebook/Session;
    .registers 2

    .prologue
    .line 1538
    iget-object v0, p0, Lcom/facebook/Session$4;->this$0:Lcom/facebook/Session;

    return-object v0
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 1540
    iget-object v2, p0, Lcom/facebook/Session$4;->this$0:Lcom/facebook/Session;

    # getter for: Lcom/facebook/Session;->callbacks:Ljava/util/List;
    invoke-static {v2}, Lcom/facebook/Session;->access$12(Lcom/facebook/Session;)Ljava/util/List;

    move-result-object v3

    monitor-enter v3

    .line 1541
    :try_start_7
    iget-object v2, p0, Lcom/facebook/Session$4;->this$0:Lcom/facebook/Session;

    # getter for: Lcom/facebook/Session;->callbacks:Ljava/util/List;
    invoke-static {v2}, Lcom/facebook/Session;->access$12(Lcom/facebook/Session;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_19

    .line 1540
    monitor-exit v3

    .line 1552
    return-void

    .line 1541
    :cond_19
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/Session$StatusCallback;

    .line 1542
    .local v0, "callback":Lcom/facebook/Session$StatusCallback;
    new-instance v1, Lcom/facebook/Session$4$1;

    iget-object v4, p0, Lcom/facebook/Session$4;->val$newState:Lcom/facebook/SessionState;

    iget-object v5, p0, Lcom/facebook/Session$4;->val$exception:Ljava/lang/Exception;

    invoke-direct {v1, p0, v0, v4, v5}, Lcom/facebook/Session$4$1;-><init>(Lcom/facebook/Session$4;Lcom/facebook/Session$StatusCallback;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 1549
    .local v1, "closure":Ljava/lang/Runnable;
    iget-object v4, p0, Lcom/facebook/Session$4;->this$0:Lcom/facebook/Session;

    # getter for: Lcom/facebook/Session;->handler:Landroid/os/Handler;
    invoke-static {v4}, Lcom/facebook/Session;->access$13(Lcom/facebook/Session;)Landroid/os/Handler;

    move-result-object v4

    # invokes: Lcom/facebook/Session;->runWithHandlerOrExecutor(Landroid/os/Handler;Ljava/lang/Runnable;)V
    invoke-static {v4, v1}, Lcom/facebook/Session;->access$14(Landroid/os/Handler;Ljava/lang/Runnable;)V

    goto :goto_11

    .line 1540
    .end local v0    # "callback":Lcom/facebook/Session$StatusCallback;
    .end local v1    # "closure":Ljava/lang/Runnable;
    :catchall_32
    move-exception v2

    monitor-exit v3
    :try_end_34
    .catchall {:try_start_7 .. :try_end_34} :catchall_32

    throw v2
.end method
