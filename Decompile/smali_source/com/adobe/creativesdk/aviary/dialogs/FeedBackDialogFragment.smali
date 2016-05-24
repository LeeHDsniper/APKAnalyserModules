.class public Lcom/adobe/creativesdk/aviary/dialogs/FeedBackDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "FeedBackDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 41
    .local v0, "id":I
    sget v2, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    if-ne v0, v2, :cond_1c

    .line 42
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 43
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "http://support.aviary.com/"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 44
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/dialogs/FeedBackDialogFragment;->startActivity(Landroid/content/Intent;)V

    .line 48
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_1b
    return-void

    .line 46
    :cond_1c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/FeedBackDialogFragment;->dismiss()V

    goto :goto_1b
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 21
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 22
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/dialogs/FeedBackDialogFragment;->setStyle(II)V

    .line 23
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 28
    sget v2, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_feedback_dialog:I

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 29
    .local v1, "view":Landroid/view/View;
    sget v2, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    const v2, 0x1020014

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 32
    .local v0, "textView":Landroid/widget/TextView;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/aviary/android/feather/sdk/R$string;->feather_version:I

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/dialogs/FeedBackDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "4.1.1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    return-object v1
.end method
