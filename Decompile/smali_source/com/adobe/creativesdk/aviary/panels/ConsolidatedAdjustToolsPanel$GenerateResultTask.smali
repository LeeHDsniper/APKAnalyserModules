.class Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "ConsolidatedAdjustToolsPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GenerateResultTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field mProgress:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    .prologue
    .line 495
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 496
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 495
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .registers 7
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 509
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "GenerateResultTask::doInBackground"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-boolean v4, v4, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mIsRendering:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 511
    :cond_17
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mIsRendering:Z

    if-nez v0, :cond_17

    .line 514
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 495
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->doPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected doPostExecute(Ljava/lang/Void;)V
    .registers 4
    .param p1, "result"    # Ljava/lang/Void;

    .prologue
    .line 519
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "GenerateResultTask::PostExecute"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 521
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 528
    :goto_19
    return-void

    .line 524
    :cond_1a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 525
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 527
    :cond_27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onComplete(Landroid/graphics/Bitmap;)V

    goto :goto_19
.end method

.method protected doPreExecute()V
    .registers 4

    .prologue
    .line 500
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_loading_title:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 501
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_effect_loading_message:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 502
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 503
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 504
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 505
    return-void
.end method
