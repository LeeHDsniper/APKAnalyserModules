.class Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$6;
.super Ljava/lang/Object;
.source "BehanceSDKProfileLocationSelectionDialog.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


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
    .line 200
    iput-object p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$6;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 204
    const/4 v0, 0x2

    if-ne p2, v0, :cond_12

    .line 205
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$6;->this$0:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->searchForCities(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;->access$300(Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;Ljava/lang/String;)V

    .line 206
    const/4 v0, 0x1

    .line 208
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method
