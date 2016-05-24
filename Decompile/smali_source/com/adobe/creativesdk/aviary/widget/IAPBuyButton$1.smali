.class Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;
.super Ljava/lang/Object;
.source "IAPBuyButton.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 41
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-wide v2, v1, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mPackId:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-lez v1, :cond_42

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_42

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mOption:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    if-eqz v1, :cond_42

    .line 42
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-wide v2, v2, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mPackId:J

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackOptionDownloadStatus(Landroid/content/Context;J)Landroid/util/Pair;

    move-result-object v0

    .line 43
    .local v0, "result":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;Ljava/lang/String;>;"
    if-eqz v0, :cond_42

    .line 44
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_42

    .line 45
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-direct {v3, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)V

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-wide v4, v1, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mPackId:J

    invoke-virtual {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 49
    .end local v0    # "result":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;Ljava/lang/String;>;"
    :cond_42
    return-void
.end method
