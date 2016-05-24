.class Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$1;
.super Ljava/lang/Object;
.source "BehanceSDKProfileLocationSelectionDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$1;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$1;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->dismiss()V

    .line 98
    return-void
.end method
