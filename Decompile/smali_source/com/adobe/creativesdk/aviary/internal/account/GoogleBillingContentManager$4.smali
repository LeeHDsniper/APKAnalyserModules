.class Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$4;
.super Ljava/lang/Object;
.source "GoogleBillingContentManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->startSetupInternal(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Lrx/Subscriber;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    .prologue
    .line 175
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$4;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIabSetupFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)V
    .registers 6
    .param p1, "result"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    .prologue
    .line 178
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onIabSetupFinished: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 179
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # setter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mResult:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$402(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    .line 180
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$4;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_24

    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$4;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 182
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$4;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 184
    :cond_24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mSetupLock:Ljava/util/concurrent/Semaphore;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$500(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Ljava/util/concurrent/Semaphore;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 185
    return-void
.end method
