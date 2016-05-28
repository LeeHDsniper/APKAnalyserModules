.class public Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "AdobeDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$EditTextWatcher;
    }
.end annotation


# instance fields
.field private _dialogStopped:Z

.field public _editText:Landroid/widget/EditText;

.field private _errorController:Landroid/widget/LinearLayout;

.field private _errorView:Landroid/widget/TextView;

.field private _negativeButton:Landroid/widget/TextView;

.field private _positiveButton:Landroid/widget/TextView;

.field private _positiveButtonEnabled:Z

.field private dialogTitle:Ljava/lang/String;

.field private editTextHint:Ljava/lang/String;

.field private isSingleLine:Z

.field private negativeButtonTitle:Ljava/lang/String;

.field private positiveButtonTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 37
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_dialogStopped:Z

    .line 38
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_positiveButtonEnabled:Z

    .line 44
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->isSingleLine:Z

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->handleEditTextBackground()V

    return-void
.end method

.method private handleEditTextBackground()V
    .registers 3

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_20

    .line 68
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    if-eqz v0, :cond_1f

    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$drawable;->edittext_background_with_text:I

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundResource(I)V

    .line 76
    :cond_1f
    :goto_1f
    return-void

    .line 73
    :cond_20
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    if-eqz v0, :cond_1f

    .line 74
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$drawable;->edittext_background:I

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundResource(I)V

    goto :goto_1f
.end method


# virtual methods
.method public disableNegativeButton()V
    .registers 3

    .prologue
    .line 227
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_negativeButton:Landroid/widget/TextView;

    if-eqz v0, :cond_a

    .line 228
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_negativeButton:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 229
    :cond_a
    return-void
.end method

.method public disablePositiveButton()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 210
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_positiveButtonEnabled:Z

    .line 211
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_positiveButton:Landroid/widget/TextView;

    if-eqz v0, :cond_c

    .line 212
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_positiveButton:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 213
    :cond_c
    return-void
.end method

.method public dismissKeyBoard()V
    .registers 4

    .prologue
    .line 240
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-nez v1, :cond_7

    .line 247
    :cond_6
    :goto_6
    return-void

    .line 242
    :cond_7
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 244
    .local v0, "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    if-eqz v0, :cond_6

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    if-eqz v1, :cond_6

    .line 246
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    goto :goto_6
.end method

.method public enableNegativeButton()V
    .registers 3

    .prologue
    .line 233
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_negativeButton:Landroid/widget/TextView;

    if-eqz v0, :cond_a

    .line 234
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_negativeButton:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 235
    :cond_a
    return-void
.end method

.method public enablePositiveButton()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 216
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_positiveButtonEnabled:Z

    .line 217
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_positiveButton:Landroid/widget/TextView;

    if-eqz v0, :cond_c

    .line 218
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_positiveButton:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 219
    :cond_c
    return-void
.end method

.method public getEnteredText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    if-eqz v0, :cond_f

    .line 204
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 206
    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public handleNegativeClick()V
    .registers 1

    .prologue
    .line 166
    return-void
.end method

.method public handlePositiveClick()V
    .registers 1

    .prologue
    .line 161
    return-void
.end method

.method public handleTextChanged()V
    .registers 1

    .prologue
    .line 200
    return-void
.end method

.method public hideErrorDialog()V
    .registers 3

    .prologue
    .line 195
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_errorController:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 196
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 155
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 156
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 80
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$layout;->adobe_common_dialog_fragment:I

    invoke-virtual {p1, v1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 81
    .local v0, "v":Landroid/view/View;
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$id;->adobe_generic_dialog_fragment_postive_button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_positiveButton:Landroid/widget/TextView;

    .line 82
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_positiveButton:Landroid/widget/TextView;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$id;->adobe_generic_dialog_fragment_negative_button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_negativeButton:Landroid/widget/TextView;

    .line 92
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_negativeButton:Landroid/widget/TextView;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$2;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$id;->adobe_generic_dialog_fragment_edit_text:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    .line 100
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$id;->adobe_generic_dialog_fragment_error_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_errorController:Landroid/widget/LinearLayout;

    .line 101
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$id;->adobe_generic_dialog_fragment_error_text:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_errorView:Landroid/widget/TextView;

    .line 102
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$EditTextWatcher;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$EditTextWatcher;-><init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 103
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->disablePositiveButton()V

    .line 105
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 121
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_positiveButton:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->positiveButtonTitle:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_negativeButton:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->negativeButtonTitle:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->editTextHint:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 124
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_editText:Landroid/widget/EditText;

    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->isSingleLine:Z

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 125
    return-object v0
.end method

.method public onStart()V
    .registers 15

    .prologue
    const/4 v13, 0x0

    const/16 v12, 0x12

    const/4 v11, 0x0

    .line 130
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStart()V

    .line 131
    new-instance v1, Landroid/text/SpannableString;

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->dialogTitle:Ljava/lang/String;

    invoke-direct {v1, v8}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 132
    .local v1, "dialogFragmentTitle":Landroid/text/SpannableString;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    invoke-static {v8}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v4

    .line 133
    .local v4, "font":Landroid/graphics/Typeface;
    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;

    invoke-direct {v7, v13, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 134
    .local v7, "typefaceSpan":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;
    invoke-virtual {v1}, Landroid/text/SpannableString;->length()I

    move-result v8

    invoke-virtual {v1, v7, v11, v8, v12}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 136
    new-instance v8, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    sget v10, Lcom/adobe/creativesdk/foundation/auth/R$color;->asset_browser_dark_text:I

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-direct {v8, v9}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v1}, Landroid/text/SpannableString;->length()I

    move-result v9

    invoke-virtual {v1, v8, v11, v9, v12}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 138
    new-instance v8, Landroid/text/style/StyleSpan;

    const/4 v9, 0x1

    invoke-direct {v8, v9}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v1}, Landroid/text/SpannableString;->length()I

    move-result v9

    invoke-virtual {v1, v8, v11, v9, v12}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 139
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v8

    invoke-virtual {v8, v1}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 140
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 141
    .local v0, "d":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const-string v9, "android:id/titleDivider"

    invoke-virtual {v8, v9, v13, v13}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 142
    .local v3, "dividerId":I
    invoke-virtual {v0, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 143
    .local v2, "divider":Landroid/view/View;
    if-nez v2, :cond_76

    .line 144
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 145
    .local v6, "res":Landroid/content/res/Resources;
    const-string v8, "titleDivider"

    const-string v9, "id"

    const-string v10, "android"

    invoke-virtual {v6, v8, v9, v10}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 146
    .local v5, "id":I
    invoke-virtual {v0, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 148
    .end local v5    # "id":I
    .end local v6    # "res":Landroid/content/res/Resources;
    :cond_76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v8

    sget v9, Lcom/adobe/creativesdk/foundation/auth/R$color;->creative_sdk_actionbar_background_color:I

    invoke-virtual {v8, v9}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 149
    if-eqz v2, :cond_92

    .line 150
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v9, Lcom/adobe/creativesdk/foundation/auth/R$color;->creative_sdk_actionbar_background_color:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-virtual {v2, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 151
    :cond_92
    return-void
.end method

.method public setDialogTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "dialogTitle"    # Ljava/lang/String;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->dialogTitle:Ljava/lang/String;

    .line 178
    return-void
.end method

.method public setEditTextHint(Ljava/lang/String;)V
    .registers 2
    .param p1, "hint"    # Ljava/lang/String;

    .prologue
    .line 181
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->editTextHint:Ljava/lang/String;

    .line 182
    return-void
.end method

.method public setEditTextSingleLine()V
    .registers 2

    .prologue
    .line 185
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->isSingleLine:Z

    .line 186
    return-void
.end method

.method public setNegativeButtonTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "negativeButtonTitle"    # Ljava/lang/String;

    .prologue
    .line 169
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->negativeButtonTitle:Ljava/lang/String;

    .line 170
    return-void
.end method

.method public setPositiveButtonTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "positiveButtonTitle"    # Ljava/lang/String;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->positiveButtonTitle:Ljava/lang/String;

    .line 174
    return-void
.end method

.method public showErrorDialog(Ljava/lang/String;)V
    .registers 4
    .param p1, "errorString"    # Ljava/lang/String;

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->disablePositiveButton()V

    .line 190
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_errorView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->_errorController:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 192
    return-void
.end method
