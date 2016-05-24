.class Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$3;
.super Ljava/lang/Object;
.source "AdobeBillingContentManager.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->startSetup()Lrx/Observable;
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
        "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .prologue
    .line 392
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 392
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$3;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;>;"
    const/4 v2, 0x1

    .line 395
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "startSetup: %s"

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 396
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 397
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 414
    :goto_1a
    return-void

    .line 401
    :cond_1b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfDisposed()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)V

    .line 403
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$900(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 404
    :try_start_27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mSetupDone:Z
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$1000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 405
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;-><init>()V

    invoke-virtual {p1, v0}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 406
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 413
    :goto_3a
    monitor-exit v1

    goto :goto_1a

    :catchall_3c
    move-exception v0

    monitor-exit v1
    :try_end_3e
    .catchall {:try_start_27 .. :try_end_3e} :catchall_3c

    throw v0

    .line 408
    :cond_3f
    :try_start_3f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedAuthManager()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    move-result-object v2

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$102(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .line 409
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;-><init>()V

    invoke-virtual {p1, v0}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 410
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 411
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    const/4 v2, 0x1

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mSetupDone:Z
    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$1002(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Z)Z
    :try_end_59
    .catchall {:try_start_3f .. :try_end_59} :catchall_3c

    goto :goto_3a
.end method
