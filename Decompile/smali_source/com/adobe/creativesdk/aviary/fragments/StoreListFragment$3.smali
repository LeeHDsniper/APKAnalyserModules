.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$3;
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
        "Ljava/lang/Integer;",
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
    .line 307
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$3;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$3;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$3;->val$packId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Integer;)V
    .registers 8
    .param p1, "integer"    # Ljava/lang/Integer;

    .prologue
    .line 311
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->fromDownloadManagerStatus(I)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    move-result-object v0

    .line 312
    .local v0, "option":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    if-eqz v0, :cond_19

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$3;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    if-eqz v1, :cond_19

    .line 313
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$3;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v2

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$3;->val$packId:J

    invoke-virtual {v1, v2, v4, v5}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 315
    :cond_19
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 307
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$3;->call(Ljava/lang/Integer;)V

    return-void
.end method
