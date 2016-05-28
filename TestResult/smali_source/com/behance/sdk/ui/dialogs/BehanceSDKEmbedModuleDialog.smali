.class public Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;
.super Landroid/app/Dialog;
.source "BehanceSDKEmbedModuleDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 42
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    new-instance v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;-><init>(Landroid/content/Context;)V

    .line 46
    .local v0, "dialogInstance":Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;
    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    .line 64
    .local v3, "viewID":I
    sget v4, Lcom/behance/sdk/R$id;->bsdkAddProjectEmbedContentDialogNotOKBtn:I

    if-ne v3, v4, :cond_c

    .line 65
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->dismiss()V

    .line 79
    :cond_b
    :goto_b
    return-void

    .line 66
    :cond_c
    sget v4, Lcom/behance/sdk/R$id;->bsdkAddProjectEmbedContentDialogOKBtn:I

    if-ne v3, v4, :cond_b

    .line 67
    sget v4, Lcom/behance/sdk/R$id;->bsdkAddProjectEmbedContentDialogContentTxt:I

    invoke-virtual {p0, v4}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 68
    .local v0, "embedContent":Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 70
    .local v1, "embedContentTxt":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x5

    if-lt v4, v5, :cond_37

    const-string v4, "<"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_37

    const-string v4, ">"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_52

    .line 71
    :cond_37
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/behance/sdk/R$string;->bsdk_add_project_embed_content_error:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_b

    .line 73
    :cond_52
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v2

    .line 74
    .local v2, "manager":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    new-instance v4, Lcom/behance/sdk/project/modules/EmbedModule;

    invoke-direct {v4, v1}, Lcom/behance/sdk/project/modules/EmbedModule;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->addModuleToCurrentProject(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 75
    invoke-virtual {p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->dismiss()V

    goto :goto_b
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 51
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 52
    invoke-virtual {p0, v3}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->requestWindowFeature(I)Z

    .line 53
    sget v2, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_publish_project_embed_content:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->setContentView(I)V

    .line 54
    invoke-virtual {p0, v3}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->setCancelable(Z)V

    .line 55
    sget v2, Lcom/behance/sdk/R$id;->bsdkAddProjectEmbedContentDialogNotOKBtn:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 56
    .local v0, "cancelButton":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    sget v2, Lcom/behance/sdk/R$id;->bsdkAddProjectEmbedContentDialogOKBtn:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 58
    .local v1, "okButton":Landroid/view/View;
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    return-void
.end method
