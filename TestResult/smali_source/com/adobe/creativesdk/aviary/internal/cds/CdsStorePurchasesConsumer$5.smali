.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$5;
.super Ljava/lang/Object;
.source "CdsStorePurchasesConsumer.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->queryGooglePurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

.field final synthetic val$billingContentFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$5;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$5;->val$billingContentFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 3

    .prologue
    .line 109
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$5;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$5;->val$billingContentFactory:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->queryAdobePurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 110
    return-void
.end method
