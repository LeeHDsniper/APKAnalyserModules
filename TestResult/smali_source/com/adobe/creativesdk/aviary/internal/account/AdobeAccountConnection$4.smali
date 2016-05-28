.class Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;
.super Ljava/lang/Object;
.source "AdobeAccountConnection.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->dispose()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 179
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 179
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Ljava/lang/Object;>;"
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 182
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "dispose.start: %s"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 185
    :try_start_15
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mSemaphore:Ljava/util/concurrent/Semaphore;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Ljava/util/concurrent/Semaphore;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 187
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mDisposed:Z
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$500(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 188
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mSemaphore:Ljava/util/concurrent/Semaphore;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Ljava/util/concurrent/Semaphore;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 189
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_3f

    .line 190
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Already disposed"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 218
    :cond_3f
    :goto_3f
    return-void

    .line 195
    :cond_40
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mServiceConnection:Landroid/content/ServiceConnection;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$700(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Landroid/content/ServiceConnection;
    :try_end_45
    .catch Ljava/lang/InterruptedException; {:try_start_15 .. :try_end_45} :catch_92

    move-result-object v2

    if-eqz v2, :cond_5d

    .line 197
    :try_start_48
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->context:Landroid/content/Context;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mServiceConnection:Landroid/content/ServiceConnection;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$700(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Landroid/content/ServiceConnection;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 198
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    const/4 v3, 0x0

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mServiceConnection:Landroid/content/ServiceConnection;
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$702(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Landroid/content/ServiceConnection;)Landroid/content/ServiceConnection;
    :try_end_5d
    .catch Ljava/lang/Throwable; {:try_start_48 .. :try_end_5d} :catch_8d
    .catch Ljava/lang/InterruptedException; {:try_start_48 .. :try_end_5d} :catch_92

    .line 204
    :cond_5d
    :goto_5d
    :try_start_5d
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    const/4 v3, 0x1

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mDisposed:Z
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$502(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Z)Z

    .line 205
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    const/4 v3, 0x0

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->context:Landroid/content/Context;
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$802(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Landroid/content/Context;)Landroid/content/Context;

    .line 206
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mSemaphore:Ljava/util/concurrent/Semaphore;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Ljava/util/concurrent/Semaphore;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 208
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-eqz v2, :cond_7f

    .line 209
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 210
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V
    :try_end_7f
    .catch Ljava/lang/InterruptedException; {:try_start_5d .. :try_end_7f} :catch_92

    .line 217
    :cond_7f
    :goto_7f
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "dispose.end"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3f

    .line 199
    :catch_8d
    move-exception v1

    .line 200
    .local v1, "t":Ljava/lang/Throwable;
    :try_start_8e
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_91
    .catch Ljava/lang/InterruptedException; {:try_start_8e .. :try_end_91} :catch_92

    goto :goto_5d

    .line 213
    .end local v1    # "t":Ljava/lang/Throwable;
    :catch_92
    move-exception v0

    .line 214
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_7f
.end method
