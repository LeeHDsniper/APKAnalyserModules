.class Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog$1;
.super Ljava/lang/Object;
.source "BehanceSDKCopyrightSettingsDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;->dismiss()V

    .line 77
    return-void
.end method
