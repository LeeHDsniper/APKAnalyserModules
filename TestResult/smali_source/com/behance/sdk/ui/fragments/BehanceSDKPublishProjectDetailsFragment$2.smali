.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$2;
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
    .line 197
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 201
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    invoke-virtual {v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 202
    .local v0, "context":Landroid/content/Context;
    instance-of v3, v0, Landroid/support/v4/app/FragmentActivity;

    if-eqz v3, :cond_2c

    .line 203
    check-cast v0, Landroid/support/v4/app/FragmentActivity;

    .end local v0    # "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 204
    .local v1, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    new-instance v2, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;

    invoke-direct {v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;-><init>()V

    .line 205
    .local v2, "instance":Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    invoke-static {v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->access$200(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;->setSelectedCopyright(Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V

    .line 206
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;
    invoke-static {v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog$Callbacks;)V

    .line 207
    const-string v3, "FRAGMENT_TAG_COPYRIGHT_SETTINGS_DIALOG"

    invoke-virtual {v2, v1, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 209
    .end local v1    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    .end local v2    # "instance":Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;
    :cond_2c
    return-void
.end method
