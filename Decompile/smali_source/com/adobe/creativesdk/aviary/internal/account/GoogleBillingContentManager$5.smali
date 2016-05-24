.class Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;
.super Ljava/lang/Object;
.source "GoogleBillingContentManager.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->launchPurchaseFlow(Landroid/app/Activity;ILjava/lang/String;)Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Landroid/util/Pair",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$requestCode:I

.field final synthetic val$sku:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Ljava/lang/String;Landroid/app/Activity;I)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    .prologue
    .line 200
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->val$sku:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->val$activity:Landroid/app/Activity;

    iput p4, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->val$requestCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 200
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 203
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Landroid/util/Pair<Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;>;>;"
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "launchPurchaseFlow: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->val$sku:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 204
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfNonUiThread()V

    .line 205
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->isAvailable()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 206
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;

    const/16 v2, -0x3f0

    const-string v3, "Unknow Error"

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(ILjava/lang/String;)V

    invoke-virtual {p1, v1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 229
    :goto_2a
    return-void

    .line 209
    :cond_2b
    :try_start_2b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->val$activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->val$sku:Ljava/lang/String;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;->val$requestCode:I

    new-instance v5, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5$1;

    invoke-direct {v5, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;Lrx/Subscriber;)V

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabPurchaseFinishedListener;)V
    :try_end_3f
    .catch Ljava/lang/IllegalStateException; {:try_start_2b .. :try_end_3f} :catch_40

    goto :goto_2a

    .line 224
    :catch_40
    move-exception v0

    .line 225
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 226
    invoke-virtual {p1, v0}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_2a
.end method
