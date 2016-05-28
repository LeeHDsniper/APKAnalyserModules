.class Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$2;
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
    .line 159
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$2;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Landroid/content/Intent;)V
    .registers 8
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$2;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;

    const-string v1, "packId"

    const-wide/16 v2, -0x1

    .line 163
    invoke-virtual {p1, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    const-string v1, "packType"

    .line 164
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "purchased"

    const/4 v5, 0x0

    .line 165
    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 162
    invoke-virtual {v0, v2, v3, v1, v4}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->onPackInstalled(JLjava/lang/String;I)V

    .line 166
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 159
    check-cast p1, Landroid/content/Intent;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$2;->call(Landroid/content/Intent;)V

    return-void
.end method
