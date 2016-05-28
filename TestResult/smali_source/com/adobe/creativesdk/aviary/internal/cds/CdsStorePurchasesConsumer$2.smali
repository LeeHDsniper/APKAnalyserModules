.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$2;
.super Ljava/lang/Object;
.source "CdsStorePurchasesConsumer.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->queryAdobePurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Action1",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

.field final synthetic val$billingContentFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$2;->val$billingContentFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 65
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$2;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 7
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 68
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "[adobe] query purchases error: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mExceptions:Ljava/util/List;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 71
    :try_start_28
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 72
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$2;->val$billingContentFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->dispose()V

    .line 73
    monitor-exit v1

    .line 74
    return-void

    .line 73
    :catchall_38
    move-exception v0

    monitor-exit v1
    :try_end_3a
    .catchall {:try_start_28 .. :try_end_3a} :catchall_38

    throw v0
.end method
