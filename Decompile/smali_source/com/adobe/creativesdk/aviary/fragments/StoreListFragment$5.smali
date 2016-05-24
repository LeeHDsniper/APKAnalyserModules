.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$5;
.super Ljava/lang/Object;
.source "StoreListFragment.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->restorePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V
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
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

.field final synthetic val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

.field final synthetic val$packId:J


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;J)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    .prologue
    .line 297
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$5;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$5;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$5;->val$packId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Long;)V
    .registers 6
    .param p1, "aLong"    # Ljava/lang/Long;

    .prologue
    .line 300
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$5;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    if-eqz v0, :cond_11

    .line 301
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$5;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOADING:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 302
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v1

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$5;->val$packId:J

    .line 301
    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 304
    :cond_11
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 297
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$5;->call(Ljava/lang/Long;)V

    return-void
.end method
