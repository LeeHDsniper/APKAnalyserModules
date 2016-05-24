.class public Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "BehanceSDKCCLauncherActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private final BEHANCE_SDK_ASSET_BROWSER_LAUNCH_REQUEST_CODE:I

.field private cancelDownloadAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

.field private headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 57
    const-class v0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 51
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 60
    const/16 v0, 0x263a

    iput v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->BEHANCE_SDK_ASSET_BROWSER_LAUNCH_REQUEST_CODE:I

    return-void
.end method

.method private cancelDownload()V
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->cancelDownload()V

    .line 144
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->setResult(I)V

    .line 145
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->closeAlertDialog()V

    .line 146
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->closeActivity()V

    .line 148
    return-void
.end method

.method private closeActivity()V
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->removeDownloadListener()V

    .line 113
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->finish()V

    .line 115
    return-void
.end method

.method private closeAlertDialog()V
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->cancelDownloadAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    if-eqz v0, :cond_9

    .line 153
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->cancelDownloadAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->dismiss()V

    .line 155
    :cond_9
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 101
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 102
    const/16 v0, 0x263a

    if-ne p1, v0, :cond_12

    const/4 v0, -0x1

    if-ne p2, v0, :cond_12

    if-eqz p3, :cond_12

    .line 103
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    invoke-virtual {v0, p3}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadSelectedFiles(Landroid/content/Intent;)V

    .line 109
    :goto_11
    return-void

    .line 105
    :cond_12
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->setResult(I)V

    .line 106
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->closeActivity()V

    goto :goto_11
.end method

.method public onBackPressed()V
    .registers 5

    .prologue
    .line 119
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->isDownloadInProgress()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 120
    sget v0, Lcom/behance/sdk/R$string;->bsdk_cc_asset_browser_cancel_download_alert_dialog_title:I

    sget v1, Lcom/behance/sdk/R$string;->bsdk_cc_asset_browser_cancel_download_alert_dialog_text:I

    sget v2, Lcom/behance/sdk/R$string;->bsdk_generic_alert_dialog_ok_btn_label:I

    sget v3, Lcom/behance/sdk/R$string;->bsdk_generic_alert_dialog_cancel_btn_label:I

    invoke-static {p0, v0, v1, v2, v3}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->getInstance(Landroid/content/Context;IIII)Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->cancelDownloadAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    .line 125
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->cancelDownloadAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->cancelDownloadAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnNotOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->cancelDownloadAlertDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->show()V

    .line 129
    :cond_29
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 134
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 135
    .local v0, "viewId":I
    sget v1, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogOKBtn:I

    if-ne v0, v1, :cond_c

    .line 136
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->cancelDownload()V

    .line 140
    :cond_b
    :goto_b
    return-void

    .line 137
    :cond_c
    sget v1, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogNotOKBtn:I

    if-ne v0, v1, :cond_b

    .line 138
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->closeAlertDialog()V

    goto :goto_b
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 77
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 78
    sget v1, Lcom/behance/sdk/R$layout;->bsdk_activity_cc_asset_browser_launcher:I

    invoke-virtual {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->setContentView(I)V

    .line 79
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "HEADLESS_FRAGMENT_TAG_CC_BROWSER"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    iput-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    .line 81
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    if-nez v1, :cond_34

    .line 82
    new-instance v1, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    invoke-direct {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;-><init>()V

    iput-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    .line 83
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    const-string v3, "HEADLESS_FRAGMENT_TAG_CC_BROWSER"

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 85
    :cond_34
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    invoke-virtual {v1, p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->setDownloadListener(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$ICreativeCloudAssetDownloadListener;)V

    .line 87
    if-nez p1, :cond_44

    .line 89
    :try_start_3b
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->launchCCAssetBrowser(Landroid/app/Activity;Landroid/content/Intent;)V
    :try_end_44
    .catch Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException; {:try_start_3b .. :try_end_44} :catch_45

    .line 96
    :cond_44
    :goto_44
    return-void

    .line 90
    :catch_45
    move-exception v0

    .line 92
    .local v0, "e":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    sget-object v1, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v2, "Problem launching Creative Cloud Asset Browser"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v1, v0, v2, v3}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_44
.end method

.method public onDownloadComplete(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 161
    .local p1, "downloadedFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .local p2, "downloadError":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .local p3, "invalidFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 162
    .local v0, "output":Landroid/content/Intent;
    const-string v1, "ACTIVITY_CC_SUCCESSFULLY_DOWNLOADED_FILES"

    check-cast p1, Ljava/io/Serializable;

    .end local p1    # "downloadedFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 163
    const-string v1, "ACTIVITY_CC_DOWNLOAD_FAILED_FILES"

    check-cast p2, Ljava/io/Serializable;

    .end local p2    # "downloadError":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 164
    const-string v1, "ACTIVITY_CC_INVALID_FILES"

    check-cast p3, Ljava/io/Serializable;

    .end local p3    # "invalidFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 165
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->setResult(ILandroid/content/Intent;)V

    .line 166
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;->closeActivity()V

    .line 167
    return-void
.end method
