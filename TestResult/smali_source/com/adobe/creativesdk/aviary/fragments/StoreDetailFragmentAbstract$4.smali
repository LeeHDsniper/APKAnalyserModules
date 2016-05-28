.class Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$4;
.super Ljava/lang/Object;
.source "StoreDetailFragmentAbstract.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->onServiceCreated(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
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
        "Landroid/content/Intent;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$4;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Landroid/content/Intent;)V
    .registers 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 185
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$4;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;

    const-string v0, "packId"

    const-wide/16 v2, -0x1

    .line 186
    invoke-virtual {p1, v0, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    const-string v0, "packType"

    .line 187
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "purchase"

    .line 188
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    .line 185
    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->onPurchaseSuccess(JLjava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 189
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 182
    check-cast p1, Landroid/content/Intent;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$4;->call(Landroid/content/Intent;)V

    return-void
.end method
