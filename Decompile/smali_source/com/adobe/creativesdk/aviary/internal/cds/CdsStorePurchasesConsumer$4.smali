.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$4;
.super Ljava/lang/Object;
.source "CdsStorePurchasesConsumer.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->queryGooglePurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
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
    .line 99
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$4;->val$billingContentFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 99
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$4;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 7
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 102
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "[google] query purchases error: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mExceptions:Ljava/util/List;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$4;->val$billingContentFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->queryAdobePurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 105
    return-void
.end method
