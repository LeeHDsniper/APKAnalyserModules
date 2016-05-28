.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;
.super Ljava/lang/Object;
.source "PackDetailLayout.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->restorePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V
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
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

.field final synthetic val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

.field final synthetic val$original:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

.field final synthetic val$packId:J


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;JLcom/adobe/creativesdk/aviary/widget/IAPBuyButton;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 762
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->val$packId:J

    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->val$original:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 762
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 6
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 766
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "restore::onError"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 767
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 769
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->val$packId:J

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_35

    .line 770
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 772
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    if-eqz v0, :cond_35

    .line 773
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->val$original:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;->val$packId:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 776
    :cond_35
    return-void
.end method
