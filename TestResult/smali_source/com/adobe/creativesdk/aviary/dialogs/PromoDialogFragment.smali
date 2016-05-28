.class public Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "PromoDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field closeButton:Landroid/widget/Button;

.field private final logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field mProgress:Landroid/widget/ProgressBar;

.field mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

.field private options:Landroid/os/Bundle;

.field packIdentifier:Ljava/lang/String;

.field showOutroOnly:Z

.field signInButton:Landroid/widget/Button;

.field signUpButton:Landroid/widget/Button;

.field text1:Landroid/widget/TextView;

.field title2:Landroid/widget/TextView;

.field viewFlipper:Landroid/widget/ViewSwitcher;

.field whereFrom:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 40
    const-string v0, "PromoActivity"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;Ljava/lang/Throwable;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;
    .param p1, "x1"    # Ljava/lang/Throwable;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->onSetupError(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static newInstance(ZLandroid/os/Bundle;)Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;
    .registers 5
    .param p0, "showOutroOnly"    # Z
    .param p1, "options"    # Landroid/os/Bundle;

    .prologue
    .line 68
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 69
    .local v0, "arguments":Landroid/os/Bundle;
    const-string v2, "showOutroOnly"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 70
    const-string v2, "options"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 71
    new-instance v1, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;-><init>()V

    .line 72
    .local v1, "fragment":Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 73
    return-object v1
.end method

.method private onSetupError(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    const/4 v2, 0x0

    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Failed to setup"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 194
    if-eqz p1, :cond_1d

    .line 195
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 199
    :goto_19
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->dismiss()V

    .line 200
    return-void

    .line 197
    :cond_1d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string v1, "Woops, an error occurred, please try again later!"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_19
.end method

.method public static showInActivity(Landroid/support/v4/app/FragmentActivity;ZLandroid/os/Bundle;)V
    .registers 8
    .param p0, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p1, "showOutroOnly"    # Z
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 57
    invoke-static {p1, p2}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->newInstance(ZLandroid/os/Bundle;)Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;

    move-result-object v0

    .line 58
    .local v0, "fragment":Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;
    invoke-virtual {p0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    .line 59
    .local v2, "transaction":Landroid/support/v4/app/FragmentTransaction;
    sget v3, Lcom/aviary/android/feather/sdk/R$anim;->abc_slide_in_top:I

    sget v4, Lcom/aviary/android/feather/sdk/R$anim;->abc_slide_out_top:I

    invoke-virtual {v2, v3, v4}, Landroid/support/v4/app/FragmentTransaction;->setCustomAnimations(II)Landroid/support/v4/app/FragmentTransaction;

    .line 60
    invoke-virtual {p0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    const-string v4, "dialog"

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 61
    .local v1, "prev":Landroid/support/v4/app/Fragment;
    if-eqz v1, :cond_22

    .line 62
    invoke-virtual {v2, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 64
    :cond_22
    const-string v3, "dialog"

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 65
    return-void
.end method

.method private showIntroMessage()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 225
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->updateIntroMessage()V

    .line 226
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->viewFlipper:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0, v1}, Landroid/widget/ViewSwitcher;->setDisplayedChild(I)V

    .line 227
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->viewFlipper:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0, v1}, Landroid/widget/ViewSwitcher;->setVisibility(I)V

    .line 228
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 229
    return-void
.end method

.method private showOutroMessage()V
    .registers 3

    .prologue
    .line 218
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->updateOutroMessage()V

    .line 219
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->viewFlipper:Landroid/widget/ViewSwitcher;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ViewSwitcher;->setDisplayedChild(I)V

    .line 220
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->viewFlipper:Landroid/widget/ViewSwitcher;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ViewSwitcher;->setVisibility(I)V

    .line 221
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 222
    return-void
.end method

.method private updateIntroMessage()V
    .registers 8

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 203
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->text1:Landroid/widget/TextView;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_promo_text1:I

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->updateMessage(Landroid/widget/TextView;I)V

    .line 205
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->packIdentifier:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_36

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->whereFrom:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_36

    .line 206
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v1, "adobeid_message: opened"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "from"

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->whereFrom:Ljava/lang/String;

    aput-object v3, v2, v5

    const-string v3, "pack"

    aput-object v3, v2, v6

    const/4 v3, 0x3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->packIdentifier:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    .line 210
    :cond_35
    :goto_35
    return-void

    .line 207
    :cond_36
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->whereFrom:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_35

    .line 208
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v1, "adobeid_message: opened"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "from"

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->whereFrom:Ljava/lang/String;

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_35
.end method

.method private updateMessage(Landroid/widget/TextView;I)V
    .registers 5
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "resID"    # I

    .prologue
    .line 232
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 233
    .local v0, "textMessage":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 234
    new-instance v1, Landroid/text/method/ScrollingMovementMethod;

    invoke-direct {v1}, Landroid/text/method/ScrollingMovementMethod;-><init>()V

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 235
    return-void
.end method

.method private updateOutroMessage()V
    .registers 3

    .prologue
    .line 213
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->title2:Landroid/widget/TextView;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_promo_title2:I

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->updateMessage(Landroid/widget/TextView;I)V

    .line 214
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v1, "adobeid_confirmation: initiated"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 215
    return-void
.end method


# virtual methods
.method getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    .registers 2

    .prologue
    .line 153
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    return-object v0
.end method

.method isContentServiceConnected()Z
    .registers 2

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;->isContentServiceConnected()Z

    move-result v0

    return v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 78
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 79
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    .line 80
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 7
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 162
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 164
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->packIdentifier:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 165
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v1, "adobeid_message: cancelled"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "pack"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->packIdentifier:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    .line 169
    :goto_1f
    return-void

    .line 167
    :cond_20
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v1, "adobeid_message: cancelled"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    goto :goto_1f
.end method

.method public onClick(Landroid/view/View;)V
    .registers 11
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 239
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 241
    .local v0, "id":I
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    if-ne v0, v1, :cond_4e

    .line 242
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->options:Landroid/os/Bundle;

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->requestLogin(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 244
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->packIdentifier:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3c

    .line 245
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v2, "adobeid_message: succeeded"

    new-array v3, v4, [Ljava/lang/String;

    const-string v4, "action"

    aput-object v4, v3, v5

    const-string v4, "signin"

    aput-object v4, v3, v6

    const-string v4, "pack"

    aput-object v4, v3, v7

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->packIdentifier:Ljava/lang/String;

    aput-object v4, v3, v8

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    .line 265
    :cond_3b
    :goto_3b
    return-void

    .line 247
    :cond_3c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v2, "adobeid_message: succeeded"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "action"

    aput-object v4, v3, v5

    const-string v4, "signin"

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_3b

    .line 250
    :cond_4e
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    if-ne v0, v1, :cond_93

    .line 251
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->options:Landroid/os/Bundle;

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->requestSignUp(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 253
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->packIdentifier:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_81

    .line 254
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v2, "adobeid_message: succeeded"

    new-array v3, v4, [Ljava/lang/String;

    const-string v4, "action"

    aput-object v4, v3, v5

    const-string v4, "signup"

    aput-object v4, v3, v6

    const-string v4, "pack"

    aput-object v4, v3, v7

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->packIdentifier:Ljava/lang/String;

    aput-object v4, v3, v8

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_3b

    .line 256
    :cond_81
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v2, "adobeid_message: succeeded"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "action"

    aput-object v4, v3, v5

    const-string v4, "signup"

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_3b

    .line 261
    :cond_93
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button3:I

    if-ne v0, v1, :cond_3b

    .line 263
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->dismiss()V

    goto :goto_3b
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 84
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 86
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 87
    .local v0, "extras":Landroid/os/Bundle;
    const-string v1, "options"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->options:Landroid/os/Bundle;

    .line 93
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->options:Landroid/os/Bundle;

    const-string v2, "from"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->whereFrom:Ljava/lang/String;

    .line 94
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->whereFrom:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 95
    const-string v1, "message"

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->whereFrom:Ljava/lang/String;

    .line 98
    :cond_25
    const-string v1, "showOutroOnly"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->showOutroOnly:Z

    .line 99
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->options:Landroid/os/Bundle;

    const-string v2, "identifier"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->packIdentifier:Ljava/lang/String;

    .line 101
    const/4 v1, 0x2

    sget v2, Lcom/aviary/android/feather/sdk/R$style;->AdobeImageBaseTheme_Promo:I

    invoke-virtual {p0, v1, v2}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->setStyle(II)V

    .line 102
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 107
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_promo_dialog:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .registers 1

    .prologue
    .line 173
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroyView()V

    .line 174
    return-void
.end method

.method public onSetupDone(Landroid/util/Pair;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;>;"
    const/4 v3, 0x0

    .line 177
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onSetupFinished: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 179
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$3;-><init>(Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;)V

    invoke-virtual {v0, p0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->subscribeToUserStatusChange(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    .line 187
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 188
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->viewFlipper:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0, v3}, Landroid/widget/ViewSwitcher;->setVisibility(I)V

    .line 189
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->showIntroMessage()V

    .line 190
    return-void
.end method

.method public onUserAuthenticated(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V
    .registers 7
    .param p1, "userStatus"    # Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    .prologue
    const/4 v4, 0x0

    .line 268
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onUserAuthenticated(%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 270
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getType()Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;->LOGOUT:Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    if-ne v1, v2, :cond_19

    .line 271
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->showIntroMessage()V

    .line 282
    :goto_18
    return-void

    .line 273
    :cond_19
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->isSuccess()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 274
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->showOutroMessage()V

    goto :goto_18

    .line 276
    :cond_23
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->showIntroMessage()V

    .line 278
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getErrorMessage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 279
    .local v0, "message":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_18
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 112
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/DialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 113
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->text:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->text1:Landroid/widget/TextView;

    .line 114
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->text2:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->title2:Landroid/widget/TextView;

    .line 115
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->signInButton:Landroid/widget/Button;

    .line 116
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->signUpButton:Landroid/widget/Button;

    .line 117
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->button3:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->closeButton:Landroid/widget/Button;

    .line 118
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->view_switcher:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ViewSwitcher;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->viewFlipper:Landroid/widget/ViewSwitcher;

    .line 119
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->progress:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->mProgress:Landroid/widget/ProgressBar;

    .line 121
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->signInButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->signUpButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->closeButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->showOutroOnly:Z

    if-eqz v0, :cond_60

    .line 127
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->showOutroMessage()V

    .line 150
    :goto_5f
    return-void

    .line 129
    :cond_60
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->isContentServiceConnected()Z

    move-result v0

    if-eqz v0, :cond_80

    .line 131
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->startSetup()Lrx/Observable;

    move-result-object v0

    invoke-static {p0, v0}, Lrx/android/app/AppObservable;->bindSupportFragment(Landroid/support/v4/app/Fragment;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$1;-><init>(Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;)V

    new-instance v2, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$2;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$2;-><init>(Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;)V

    .line 132
    invoke-virtual {v0, v1, v2}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;

    goto :goto_5f

    .line 146
    :cond_80
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "content service not connected"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_5f
.end method
