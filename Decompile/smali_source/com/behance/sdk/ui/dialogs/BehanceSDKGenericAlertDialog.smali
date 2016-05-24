.class public Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;
.super Landroid/app/Dialog;
.source "BehanceSDKGenericAlertDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field private contentResourceId:I

.field private notOKBtnClickListener:Landroid/view/View$OnClickListener;

.field private notOKBtnLabelResourceId:I

.field private notOKButton:Landroid/widget/Button;

.field private okBtnClickListener:Landroid/view/View$OnClickListener;

.field private okBtnLabelResourceId:I

.field private okButton:Landroid/widget/Button;

.field private titleResourceId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 59
    return-void
.end method

.method public static getInstance(Landroid/content/Context;IIII)Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "titleResourceId"    # I
    .param p2, "contentResourceId"    # I
    .param p3, "okBtnLabelResourceId"    # I
    .param p4, "notOKBtnLabelResourceId"    # I

    .prologue
    .line 49
    new-instance v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;-><init>(Landroid/content/Context;)V

    .line 50
    .local v0, "dialog":Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;
    invoke-virtual {v0, p1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setTitleResourceId(I)V

    .line 51
    invoke-virtual {v0, p2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setContentResourceId(I)V

    .line 52
    invoke-virtual {v0, p3}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOkBtnLabelResourceId(I)V

    .line 53
    invoke-virtual {v0, p4}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setNotOKBtnLabelResourceId(I)V

    .line 54
    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 71
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 72
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->requestWindowFeature(I)Z

    .line 74
    sget v2, Lcom/behance/sdk/R$layout;->bsdk_dialog_generic_alert:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setContentView(I)V

    .line 76
    sget v2, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogTitleTxtView:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 77
    .local v1, "titleTextView":Landroid/widget/TextView;
    iget v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->titleResourceId:I

    if-lez v2, :cond_1d

    .line 78
    iget v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->titleResourceId:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 80
    :cond_1d
    sget v2, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogBodyTxtView:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 81
    .local v0, "contentTextView":Landroid/widget/TextView;
    iget v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->contentResourceId:I

    if-lez v2, :cond_2e

    .line 82
    iget v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->contentResourceId:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 85
    :cond_2e
    sget v2, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogNotOKBtn:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKButton:Landroid/widget/Button;

    .line 86
    iget v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKBtnLabelResourceId:I

    if-lez v2, :cond_43

    .line 87
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKButton:Landroid/widget/Button;

    iget v3, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKBtnLabelResourceId:I

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(I)V

    .line 89
    :cond_43
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKBtnClickListener:Landroid/view/View$OnClickListener;

    if-eqz v2, :cond_4e

    .line 90
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKButton:Landroid/widget/Button;

    iget-object v3, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKBtnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    :cond_4e
    sget v2, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogOKBtn:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okButton:Landroid/widget/Button;

    .line 93
    iget v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okBtnLabelResourceId:I

    if-lez v2, :cond_63

    .line 94
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okButton:Landroid/widget/Button;

    iget v3, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okBtnLabelResourceId:I

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(I)V

    .line 96
    :cond_63
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okBtnClickListener:Landroid/view/View$OnClickListener;

    if-eqz v2, :cond_6e

    .line 97
    iget-object v2, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okButton:Landroid/widget/Button;

    iget-object v3, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okBtnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    :cond_6e
    invoke-virtual {p0, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 100
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    const/4 v0, 0x0

    .line 120
    iput-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKBtnClickListener:Landroid/view/View$OnClickListener;

    .line 121
    iput-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okBtnClickListener:Landroid/view/View$OnClickListener;

    .line 122
    return-void
.end method

.method public setContentResourceId(I)V
    .registers 2
    .param p1, "contentResourceId"    # I

    .prologue
    .line 137
    iput p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->contentResourceId:I

    .line 138
    return-void
.end method

.method public setNotOKBtnLabelResourceId(I)V
    .registers 2
    .param p1, "notOKBtnLabelResourceId"    # I

    .prologue
    .line 153
    iput p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKBtnLabelResourceId:I

    .line 154
    return-void
.end method

.method public setOkBtnLabelResourceId(I)V
    .registers 2
    .param p1, "okBtnLabelResourceId"    # I

    .prologue
    .line 145
    iput p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okBtnLabelResourceId:I

    .line 146
    return-void
.end method

.method public setOnNotOKBtnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKButton:Landroid/widget/Button;

    if-eqz v0, :cond_a

    .line 112
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    :goto_9
    return-void

    .line 114
    :cond_a
    iput-object p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->notOKBtnClickListener:Landroid/view/View$OnClickListener;

    goto :goto_9
.end method

.method public setOnOKBtnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okButton:Landroid/widget/Button;

    if-eqz v0, :cond_a

    .line 104
    iget-object v0, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    :goto_9
    return-void

    .line 106
    :cond_a
    iput-object p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->okBtnClickListener:Landroid/view/View$OnClickListener;

    goto :goto_9
.end method

.method public setTitleResourceId(I)V
    .registers 2
    .param p1, "titleResourceId"    # I

    .prologue
    .line 129
    iput p1, p0, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->titleResourceId:I

    .line 130
    return-void
.end method
