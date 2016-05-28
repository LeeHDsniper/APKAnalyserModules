.class public Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;
.super Ljava/lang/Object;
.source "AdobeCSDKActionBarController.java"


# direct methods
.method public static changeTextColor(Landroid/view/View;I)V
    .registers 4
    .param p0, "current_view"    # Landroid/view/View;
    .param p1, "textColor"    # I

    .prologue
    .line 27
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$id;->actionbar_title:I

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 28
    .local v0, "titleText":Landroid/widget/TextView;
    if-eqz v0, :cond_d

    .line 29
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    :cond_d
    return-void
.end method

.method public static getTextView(Landroid/view/View;)Landroid/view/View;
    .registers 2
    .param p0, "current_view"    # Landroid/view/View;

    .prologue
    .line 35
    sget v0, Lcom/adobe/creativesdk/foundation/auth/R$id;->actionbar_title:I

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public static setTitle(Landroid/view/View;Ljava/lang/String;)V
    .registers 4
    .param p0, "current_view"    # Landroid/view/View;
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 13
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$id;->actionbar_title:I

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 14
    .local v0, "titleText":Landroid/widget/TextView;
    if-eqz v0, :cond_d

    .line 15
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    :cond_d
    return-void
.end method

.method public static setTitleWithColor(Landroid/view/View;Ljava/lang/String;I)V
    .registers 5
    .param p0, "current_view"    # Landroid/view/View;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "textColor"    # I

    .prologue
    .line 19
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$id;->actionbar_title:I

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 20
    .local v0, "titleText":Landroid/widget/TextView;
    if-eqz v0, :cond_10

    .line 21
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 22
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    :cond_10
    return-void
.end method
