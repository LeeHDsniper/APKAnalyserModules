.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$5;
.super Ljava/lang/Object;
.source "StoreListFragmentAbstract.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->startSetup()V
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
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$5;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Landroid/content/Intent;)V
    .registers 8
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$5;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    const-string v1, "packId"

    const-wide/16 v2, -0x1

    .line 160
    invoke-virtual {p1, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    const-string v1, "packType"

    .line 161
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "purchased"

    const/4 v5, 0x0

    .line 162
    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 159
    invoke-virtual {v0, v2, v3, v1, v4}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onPackInstalled(JLjava/lang/String;I)V

    .line 163
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 156
    check-cast p1, Landroid/content/Intent;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$5;->call(Landroid/content/Intent;)V

    return-void
.end method
