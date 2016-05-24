.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;
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
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

.field final synthetic val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

.field final synthetic val$original:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

.field final synthetic val$packId:J


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    .prologue
    .line 316
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;->val$original:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    iput-wide p4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;->val$packId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 316
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 6
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 320
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "restore::onError"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 321
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 322
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 324
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    if-eqz v0, :cond_29

    .line 325
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;->val$original:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;->val$packId:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 327
    :cond_29
    return-void
.end method
