.class public Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;
.super Landroid/app/Dialog;
.source "BehanceSDKNewWIPTitleDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;
    }
.end annotation


# instance fields
.field private callbacks:Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;

.field private wipTitleEditText:Landroid/widget/EditText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 51
    return-void
.end method

.method public static getInstance(Landroid/content/Context;Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;)Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "callbacks"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;

    .prologue
    .line 44
    new-instance v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;-><init>(Landroid/content/Context;)V

    .line 45
    .local v0, "dialogInstance":Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;
    invoke-virtual {v0, p1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->setCallbacks(Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;)V

    .line 46
    return-object v0
.end method

.method private handleOKButtonClick()V
    .registers 3

    .prologue
    .line 78
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->wipTitleEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 79
    .local v0, "wipTitle":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_20

    .line 80
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->callbacks:Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;

    if-eqz v1, :cond_1d

    .line 81
    iget-object v1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->callbacks:Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;

    invoke-interface {v1, v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;->onNewWIPTitleDialogOKBtnClicked(Ljava/lang/String;)V

    .line 83
    :cond_1d
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->dismiss()V

    .line 85
    :cond_20
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 69
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 70
    .local v0, "viewID":I
    sget v1, Lcom/behance/sdk/R$id;->bsdkNewWIPTitleDialogNotOKBtn:I

    if-ne v0, v1, :cond_c

    .line 71
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->dismiss()V

    .line 75
    :cond_b
    :goto_b
    return-void

    .line 72
    :cond_c
    sget v1, Lcom/behance/sdk/R$id;->bsdkNewWIPTitleDialogOKBtn:I

    if-ne v0, v1, :cond_b

    .line 73
    invoke-direct {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->handleOKButtonClick()V

    goto :goto_b
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 55
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 56
    invoke-virtual {p0, v3}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->requestWindowFeature(I)Z

    .line 57
    sget v2, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_new_wip_title:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->setContentView(I)V

    .line 58
    invoke-virtual {p0, v3}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->setCancelable(Z)V

    .line 59
    sget v2, Lcom/behance/sdk/R$id;->bsdkNewWIPTitleDialogContentEditTxt:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->wipTitleEditText:Landroid/widget/EditText;

    .line 61
    sget v2, Lcom/behance/sdk/R$id;->bsdkNewWIPTitleDialogNotOKBtn:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 62
    .local v0, "cancelButton":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    sget v2, Lcom/behance/sdk/R$id;->bsdkNewWIPTitleDialogOKBtn:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 64
    .local v1, "okButton":Landroid/view/View;
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    return-void
.end method

.method public setCallbacks(Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;)V
    .registers 2
    .param p1, "callbacks"    # Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->callbacks:Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;

    .line 93
    return-void
.end method
