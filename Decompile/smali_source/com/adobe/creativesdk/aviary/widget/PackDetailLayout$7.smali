.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;
.super Ljava/lang/Object;
.source "PackDetailLayout.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->determinePackOption(J)V
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
        "Ljava/util/Map",
        "<",
        "Ljava/lang/Long;",
        "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

.field final synthetic val$packId:J


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;J)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 504
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;->val$packId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 504
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;->call(Ljava/util/Map;)V

    return-void
.end method

.method public call(Ljava/util/Map;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 508
    .local p1, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;>;"
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;->val$packId:J

    cmp-long v1, v2, v4

    if-eqz v1, :cond_d

    .line 519
    :goto_c
    return-void

    .line 512
    :cond_d
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .line 514
    .local v0, "finalResult":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    if-nez v0, :cond_26

    .line 515
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .end local v0    # "finalResult":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)V

    .line 517
    .restart local v0    # "finalResult":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    :cond_26
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v2

    invoke-virtual {v1, v0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 518
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->ensureButtonsVisible()V
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->access$000(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V

    goto :goto_c
.end method
