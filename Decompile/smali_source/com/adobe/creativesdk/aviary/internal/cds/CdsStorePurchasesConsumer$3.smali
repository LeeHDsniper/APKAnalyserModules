.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$3;
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
        "Ljava/util/List",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 86
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$3;->call(Ljava/util/List;)V

    return-void
.end method

.method public call(Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "strings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 92
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "[google] query purchases result: %d"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/Object;

    if-eqz p1, :cond_25

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    :goto_10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v1

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 94
    if-eqz p1, :cond_24

    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mPurchases:Ljava/util/LinkedHashSet;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;)Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->addAll(Ljava/util/Collection;)Z

    .line 97
    :cond_24
    return-void

    :cond_25
    move v0, v1

    .line 92
    goto :goto_10
.end method
