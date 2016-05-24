.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;
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
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

.field final synthetic val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

.field final synthetic val$packId:J


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;J)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 743
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;->val$packId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Long;)V
    .registers 6
    .param p1, "aLong"    # Ljava/lang/Long;

    .prologue
    .line 746
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    if-eqz v0, :cond_1d

    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;->val$packId:J

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_1d

    .line 747
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;->val$buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOADING:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 748
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v1

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;->val$packId:J

    .line 747
    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 750
    :cond_1d
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 743
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;->call(Ljava/lang/Long;)V

    return-void
.end method
