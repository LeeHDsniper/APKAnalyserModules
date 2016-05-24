.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;
.super Lrx/Subscriber;
.source "BillingContentFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;->call(Lrx/Subscriber;)Lrx/Subscriber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;Lrx/Subscriber;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .registers 2

    .prologue
    .line 224
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_d

    .line 225
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 227
    :cond_d
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 231
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_d

    .line 232
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 234
    :cond_d
    return-void
.end method

.method public onNext(Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;)V
    .registers 6
    .param p1, "inventory"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    .prologue
    .line 238
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "adobeinventory: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 239
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_1e

    .line 240
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->getAllOwnedSkus()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 242
    :cond_1e
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 221
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;->onNext(Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;)V

    return-void
.end method
