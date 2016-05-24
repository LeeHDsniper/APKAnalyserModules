.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$1;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectDetailsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 182
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    invoke-virtual {v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 183
    .local v0, "context":Landroid/content/Context;
    instance-of v3, v0, Landroid/support/v4/app/FragmentActivity;

    if-eqz v3, :cond_30

    .line 184
    check-cast v0, Landroid/support/v4/app/FragmentActivity;

    .end local v0    # "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 185
    .local v1, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    new-instance v2, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;

    invoke-direct {v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;-><init>()V

    .line 186
    .local v2, "instance":Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;
    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->setSelectableFieldCount(I)V

    .line 187
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedField:Ljava/util/List;
    invoke-static {v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->setSelectedCreativeField(Ljava/util/List;)V

    .line 188
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;
    invoke-static {v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;)V

    .line 189
    const-string v3, "FRAGMENT_TAG_CREATIVE_FIELDS_FILTER_DIALOG"

    invoke-virtual {v2, v1, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 191
    .end local v1    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    .end local v2    # "instance":Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;
    :cond_30
    return-void
.end method
