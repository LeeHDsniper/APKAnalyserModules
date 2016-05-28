.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3$1;
.super Lrx/Subscriber;
.source "BillingContentFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3;->call(Lrx/Subscriber;)Lrx/Subscriber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3;Lrx/Subscriber;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3;

    .prologue
    .line 190
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_d

    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 196
    :cond_d
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_d

    .line 201
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 203
    :cond_d
    return-void
.end method

.method public onNext(Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;)V
    .registers 4
    .param p1, "inventory"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_11

    .line 208
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->getAllOwnedSkus()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 210
    :cond_11
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 190
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3$1;->onNext(Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;)V

    return-void
.end method
