.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$14;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestPackDownload(J)Lrx/Observable;
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
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

.field final synthetic val$packid:J


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;J)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 428
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$14;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$14;->val$packid:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 428
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$14;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Ljava/lang/Integer;>;"
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 431
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "requestPackDownload: %d, %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$14;->val$packid:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 432
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 437
    :try_start_1d
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$14;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$14;->val$packid:J

    const/4 v6, 0x1

    invoke-static {v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->requestPackDownload(Landroid/content/Context;JZ)Ljava/lang/String;

    move-result-object v1

    .line 438
    .local v1, "requestResult":Ljava/lang/String;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "requestResult: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 439
    const/4 v0, 0x1

    .line 440
    .local v0, "newDownloadOption":I
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_3b
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_3b} :catch_4b

    move-result v3

    if-eqz v3, :cond_40

    .line 441
    const/16 v0, 0x10

    .line 447
    .end local v1    # "requestResult":Ljava/lang/String;
    :cond_40
    :goto_40
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v3}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 448
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 449
    return-void

    .line 443
    .end local v0    # "newDownloadOption":I
    :catch_4b
    move-exception v2

    .line 444
    .local v2, "t":Ljava/lang/Throwable;
    const/16 v0, 0x10

    .restart local v0    # "newDownloadOption":I
    goto :goto_40
.end method
