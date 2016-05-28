.class Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;
.super Ljava/lang/Object;
.source "AdobeAccountConnection.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->tryConnect()Lrx/Observable;
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
        "Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;",
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
    .line 86
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 86
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;>;"
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 89
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "connect.start: %s"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 90
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 92
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnected:Z
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$100(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Z

    move-result v2

    if-eqz v2, :cond_4f

    .line 93
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "already connected..."

    new-array v4, v6, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 94
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->connectionSubject:Lrx/subjects/PublishSubject;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$300(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lrx/subjects/PublishSubject;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v3

    invoke-virtual {v2, v3}, Lrx/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 96
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_4e

    .line 97
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v2

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 98
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 170
    :cond_4e
    :goto_4e
    return-void

    .line 104
    :cond_4f
    :try_start_4f
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mSemaphore:Ljava/util/concurrent/Semaphore;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Ljava/util/concurrent/Semaphore;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 106
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mDisposed:Z
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$500(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Z

    move-result v2

    if-eqz v2, :cond_8f

    .line 107
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_70

    .line 108
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Already disposed"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 110
    :cond_70
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->connectionSubject:Lrx/subjects/PublishSubject;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$300(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lrx/subjects/PublishSubject;

    move-result-object v2

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Already disposed"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lrx/subjects/PublishSubject;->onError(Ljava/lang/Throwable;)V

    .line 111
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mSemaphore:Ljava/util/concurrent/Semaphore;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Ljava/util/concurrent/Semaphore;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V
    :try_end_89
    .catch Ljava/lang/InterruptedException; {:try_start_4f .. :try_end_89} :catch_8a

    goto :goto_4e

    .line 167
    :catch_8a
    move-exception v0

    .line 168
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_4e

    .line 115
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_8f
    :try_start_8f
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnecting:Z
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$600(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Z

    move-result v2

    if-eqz v2, :cond_ac

    .line 116
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "already trying to connect..."

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 117
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mSemaphore:Ljava/util/concurrent/Semaphore;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Ljava/util/concurrent/Semaphore;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_4e

    .line 121
    :cond_ac
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v2

    if-eqz v2, :cond_f9

    .line 122
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "already connected. Return current connection"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 123
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->connectionSubject:Lrx/subjects/PublishSubject;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$300(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lrx/subjects/PublishSubject;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v3

    invoke-virtual {v2, v3}, Lrx/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 124
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_e0

    .line 125
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v2

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 126
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 128
    :cond_e0
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mSemaphore:Ljava/util/concurrent/Semaphore;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Ljava/util/concurrent/Semaphore;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 129
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "connect.end"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_4e

    .line 133
    :cond_f9
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    const/4 v3, 0x1

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnecting:Z
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$602(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Z)Z

    .line 134
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;

    invoke-direct {v3, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;Lrx/Subscriber;)V

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mServiceConnection:Landroid/content/ServiceConnection;
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$702(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Landroid/content/ServiceConnection;)Landroid/content/ServiceConnection;

    .line 163
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->context:Landroid/content/Context;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->createAccountManagerIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    .line 164
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->context:Landroid/content/Context;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mServiceConnection:Landroid/content/ServiceConnection;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$700(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Landroid/content/ServiceConnection;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 166
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "connect.end"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_131
    .catch Ljava/lang/InterruptedException; {:try_start_8f .. :try_end_131} :catch_8a

    goto/16 :goto_4e
.end method
