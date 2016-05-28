.class public Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonErrorViewFragment;
.super Landroid/support/v4/app/Fragment;
.source "AdobeCommonErrorViewFragment.java"


# instance fields
.field _fragmentContainer:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonErrorViewFragment;->_fragmentContainer:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 35
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$layout;->adobe_common_errorview:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 36
    .local v0, "rootView":Landroid/view/View;
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonErrorViewFragment;->_fragmentContainer:Landroid/view/ViewGroup;

    .line 37
    return-object v0
.end method

.method public setMessage(Ljava/lang/String;)V
    .registers 6
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 41
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonErrorViewFragment;->_fragmentContainer:Landroid/view/ViewGroup;

    if-eqz v1, :cond_1a

    .line 42
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonErrorViewFragment;->_fragmentContainer:Landroid/view/ViewGroup;

    sget v2, Lcom/adobe/creativesdk/foundation/auth/R$id;->adobe_common_view_error_message:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 43
    .local v0, "textview":Landroid/widget/TextView;
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->setText([CII)V

    .line 45
    .end local v0    # "textview":Landroid/widget/TextView;
    :cond_1a
    return-void
.end method
