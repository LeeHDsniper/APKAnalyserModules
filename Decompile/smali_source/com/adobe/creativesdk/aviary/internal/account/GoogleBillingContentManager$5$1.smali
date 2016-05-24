.class Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5$1;
.super Ljava/lang/Object;
.source "GoogleBillingContentManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;Lrx/Subscriber;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;

    .prologue
    .line 210
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIabPurchaseFinished(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V
    .registers 8
    .param p1, "result"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    .param p2, "info"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    .prologue
    const/4 v4, 0x0

    .line 213
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onIabPurchaseFinished: result=%s, info=%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v4

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 215
    if-eqz p1, :cond_2e

    if-eqz p2, :cond_2e

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 216
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "adding purchase to inventory"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 217
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$100(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->addPurchase(Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 220
    :cond_2e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5$1;->val$subscriber:Lrx/Subscriber;

    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 221
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 222
    return-void
.end method
