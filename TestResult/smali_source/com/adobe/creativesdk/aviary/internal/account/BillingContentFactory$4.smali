.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/Observable$Operator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryPurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;)Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$Operator",
        "<",
        "Ljava/util/List",
        "<",
        "Ljava/lang/String;",
        ">;",
        "Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 217
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 217
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;->call(Lrx/Subscriber;)Lrx/Subscriber;

    move-result-object v0

    return-object v0
.end method

.method public call(Lrx/Subscriber;)Lrx/Subscriber;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lrx/Subscriber",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 221
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Ljava/util/List<Ljava/lang/String;>;>;"
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;Lrx/Subscriber;)V

    return-object v0
.end method
