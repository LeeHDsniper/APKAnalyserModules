.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$9;
.super Ljava/lang/Object;
.source "PackDetailLayout.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->purchasePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
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
        "Landroid/util/Pair",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
        "Ljava/lang/Integer;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 699
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$9;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Landroid/util/Pair;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Ljava/lang/Integer;>;"
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 702
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "purchasePackItem.onNext: %s, %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    aput-object v3, v2, v4

    iget-object v3, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    aput-object v3, v2, v5

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 703
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "thread: %s"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 705
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->isFailure()Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 706
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->getResponse()I

    move-result v0

    const/16 v1, -0x3ed

    if-eq v0, v1, :cond_4f

    .line 707
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$9;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 713
    :cond_4e
    :goto_4e
    return-void

    .line 709
    :cond_4f
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "purchase failed: %s"

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_4e
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 699
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$9;->call(Landroid/util/Pair;)V

    return-void
.end method
