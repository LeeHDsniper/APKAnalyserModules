.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$6;
.super Ljava/lang/Object;
.source "StoreListFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->onAskToLogin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    .prologue
    .line 350
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$6;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 353
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 354
    .local v0, "options":Landroid/os/Bundle;
    const-string v1, "uuid"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$6;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getUUID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    const-string v1, "from"

    const-string v2, "shop_list"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    const-string v1, "restore-all"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 357
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$6;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$6;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->requestLogin(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 358
    return-void
.end method
