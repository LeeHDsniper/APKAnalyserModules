.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestPurchase(Landroid/app/Activity;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Func1",
        "<",
        "Landroid/util/Pair;",
        "Lrx/Observable",
        "<",
        "Landroid/util/Pair",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
        "Ljava/lang/Integer;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

.field final synthetic val$identifier:Ljava/lang/String;

.field final synthetic val$packType:Ljava/lang/String;

.field final synthetic val$packid:J

.field final synthetic val$position:I

.field final synthetic val$price:Ljava/lang/String;

.field final synthetic val$trackerName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;JLjava/lang/String;)V
    .registers 9
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 362
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$identifier:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$trackerName:Ljava/lang/String;

    iput p4, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$position:I

    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$price:Ljava/lang/String;

    iput-wide p6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$packid:J

    iput-object p8, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$packType:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 362
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->call(Landroid/util/Pair;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call(Landroid/util/Pair;)Lrx/Observable;
    .registers 11
    .param p1, "result"    # Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair;",
            ")",
            "Lrx/Observable",
            "<",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 365
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "purchase.onNext: %s, thread: %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 367
    move-object v1, p1

    .line 368
    .local v1, "pair":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;>;"
    iget-object v0, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    .line 370
    .local v0, "iabResult":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v2

    .line 371
    .local v2, "profile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    if-eqz v2, :cond_7c

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v3

    .line 373
    .local v3, "userId":Ljava/lang/String;
    :goto_25
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$300(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$identifier:Ljava/lang/String;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$trackerName:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->isSuccess()Z

    move-result v7

    iget v8, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$position:I

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->trackEndPurchaseFlow(Ljava/lang/String;Ljava/lang/String;ZI)V

    .line 375
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->isSuccess()Z

    move-result v4

    if-eqz v4, :cond_7e

    .line 376
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iget-object v4, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$price:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->sendReceipt(Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v5, v4, v6, v3}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$400(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$packid:J

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$packType:Ljava/lang/String;

    iget-object v4, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    invoke-static {v5, v6, v7, v8, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyPackPurchased(Landroid/content/Context;JLjava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 378
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;->val$packid:J

    .line 379
    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestPackDownload(J)Lrx/Observable;
    invoke-static {v4, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$500(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;J)Lrx/Observable;

    move-result-object v4

    const-wide/16 v6, 0xc8

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 380
    invoke-virtual {v4, v6, v7, v5}, Lrx/Observable;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;

    move-result-object v4

    .line 381
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v5

    invoke-virtual {v4, v5}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v4

    new-instance v5, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10$1;

    invoke-direct {v5, p0, v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)V

    invoke-virtual {v4, v5}, Lrx/Observable;->map(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v4

    .line 391
    :goto_7b
    return-object v4

    .line 371
    .end local v3    # "userId":Ljava/lang/String;
    :cond_7c
    const/4 v3, 0x0

    goto :goto_25

    .line 391
    .restart local v3    # "userId":Ljava/lang/String;
    :cond_7e
    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v4

    invoke-static {v4}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v4

    goto :goto_7b
.end method
