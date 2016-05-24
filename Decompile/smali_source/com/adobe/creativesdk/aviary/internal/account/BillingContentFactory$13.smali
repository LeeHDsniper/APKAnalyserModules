.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestRestore(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Func1",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
        "Lrx/Observable",
        "<",
        "Ljava/lang/Integer;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

.field final synthetic val$identifier:Ljava/lang/String;

.field final synthetic val$packid:J

.field final synthetic val$whereFrom:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Ljava/lang/String;Ljava/lang/String;J)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 404
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->val$identifier:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->val$whereFrom:Ljava/lang/String;

    iput-wide p4, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->val$packid:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 404
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->call(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)Lrx/Observable;
    .registers 12
    .param p1, "option"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 407
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "call: %s"

    new-array v9, v5, [Ljava/lang/Object;

    aput-object p1, v9, v6

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 408
    iget-object v7, p1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-ne v7, v8, :cond_4f

    move v0, v5

    .line 409
    .local v0, "isError":Z
    :goto_14
    iget-object v7, p1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-eq v7, v8, :cond_20

    iget-object v7, p1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE_WITH_LOGIN:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-ne v7, v8, :cond_51

    :cond_20
    move v1, v5

    .line 411
    .local v1, "isFree":Z
    :goto_21
    iget-object v7, p1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->RESTORE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-ne v7, v8, :cond_53

    move v2, v5

    .line 413
    .local v2, "isRestore":Z
    :goto_28
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v3

    .line 414
    .local v3, "profile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    if-eqz v3, :cond_55

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v4

    .line 416
    .local v4, "userId":Ljava/lang/String;
    :goto_34
    if-nez v0, :cond_46

    .line 417
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->val$identifier:Ljava/lang/String;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->val$whereFrom:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->sendTracking(ZZLjava/lang/String;Ljava/lang/String;)V
    invoke-static {v5, v1, v2, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$600(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;ZZLjava/lang/String;Ljava/lang/String;)V

    .line 418
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->val$identifier:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->sendReceipt(Ljava/lang/String;ZZLjava/lang/String;)V
    invoke-static {v5, v6, v1, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$700(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Ljava/lang/String;ZZLjava/lang/String;)V

    .line 420
    :cond_46
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;->val$packid:J

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestPackDownload(J)Lrx/Observable;
    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$500(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;J)Lrx/Observable;

    move-result-object v5

    return-object v5

    .end local v0    # "isError":Z
    .end local v1    # "isFree":Z
    .end local v2    # "isRestore":Z
    .end local v3    # "profile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    .end local v4    # "userId":Ljava/lang/String;
    :cond_4f
    move v0, v6

    .line 408
    goto :goto_14

    .restart local v0    # "isError":Z
    :cond_51
    move v1, v6

    .line 409
    goto :goto_21

    .restart local v1    # "isFree":Z
    :cond_53
    move v2, v6

    .line 411
    goto :goto_28

    .line 414
    .restart local v2    # "isRestore":Z
    .restart local v3    # "profile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    :cond_55
    const/4 v4, 0x0

    goto :goto_34
.end method
